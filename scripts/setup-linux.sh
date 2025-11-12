#!/bin/sh

# detect system type
detect_system() {
    if command -v opkg >/dev/null 2>&1; then
        echo "openwrt"
    elif command -v apk >/dev/null 2>&1; then
        echo "alpine"
    elif command -v apt-get >/dev/null 2>&1; then
        echo "debian"
    elif command -v dnf >/dev/null 2>&1; then
        echo "fedora"
    elif command -v yum >/dev/null 2>&1; then
        echo "rhel"
    else
        echo "unknown"
    fi
}

SYSTEM_TYPE=$(detect_system)

# auto-install git if not present
if ! command -v git >/dev/null 2>&1; then
    echo "git not found. installing..."
    
    case "$SYSTEM_TYPE" in
        openwrt)
            opkg update && opkg install git-http || opkg install git
            ;;
        alpine)
            apk add git
            ;;
        debian)
            apt-get update && apt-get install -y git
            ;;
        fedora)
            dnf install -y git
            ;;
        rhel)
            yum install -y git
            ;;
        *)
            echo "error: unsupported system type"
            exit 1
            ;;
    esac
    
    if ! command -v git >/dev/null 2>&1; then
        echo "error: git installation failed"
        exit 1
    fi
    echo "git installed successfully"
fi

# check if docker daemon is running, start it if not
if ! docker info >/dev/null 2>&1; then
    echo "starting docker daemon..."
    
    case "$SYSTEM_TYPE" in
        openwrt)
            /etc/init.d/dockerd start
            /etc/init.d/dockerd enable
            ;;
        alpine|debian|fedora|rhel)
            if command -v systemctl >/dev/null 2>&1; then
                systemctl start docker
                systemctl enable docker
            elif command -v service >/dev/null 2>&1; then
                service docker start
            else
                dockerd >/dev/null 2>&1 &
            fi
            ;;
        *)
            dockerd >/dev/null 2>&1 &
            ;;
    esac
    
    # wait for docker to start
    echo "waiting for docker to start..."
    for i in 1 2 3 4 5; do
        if docker info >/dev/null 2>&1; then
            echo "docker daemon started successfully"
            break
        fi
        sleep 2
    done
    
    if ! docker info >/dev/null 2>&1; then
        echo "error: docker daemon failed to start"
        exit 1
    fi
fi

# clone or update miner repository
if [ -d miner ]; then
    echo "updating miner repository..."
    cd miner && git pull
else
    echo "cloning miner repository..."
    git clone https://github.com/don-yin/miner.git
    cd miner
fi

# build and run docker containers
echo "building and starting containers..."
docker-compose up -d --build

