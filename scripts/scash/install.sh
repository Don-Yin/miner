#!/bin/sh

# Universal scash miner installer
# Usage: curl -fsSL https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.sh | sh
# Or with solo flag: curl -fsSL https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.sh | sh -s -- --solo

# Parse arguments
POOL_TYPE="share"
for arg in "$@"; do
    case $arg in
        --solo)
            POOL_TYPE="solo"
            shift
            ;;
    esac
done

# Detect platform
detect_platform() {
    case "$(uname -s)" in
        Linux*)
            echo "linux"
            ;;
        Darwin*)
            echo "macos"
            ;;
        MINGW*|MSYS*|CYGWIN*)
            echo "windows"
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

PLATFORM=$(detect_platform)

echo "detected platform: $PLATFORM"
echo "pool type: $POOL_TYPE"

# Run platform-specific installer
case "$PLATFORM" in
    linux)
        echo "downloading linux installer..."
        curl -fsSL "https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/setup-linux-${POOL_TYPE}.sh" | sh
        ;;
    macos)
        echo "setting up macos miner..."
        if ! command -v git >/dev/null 2>&1; then
            echo "error: git is required but not installed"
            echo "please install git first: https://git-scm.com/download/mac"
            exit 1
        fi
        if ! command -v docker >/dev/null 2>&1; then
            echo "error: docker is required but not installed"
            echo "please install docker desktop: https://www.docker.com/products/docker-desktop"
            exit 1
        fi
        if [ -d miner ]; then
            (cd miner && git pull)
        else
            git clone https://github.com/Don-Yin/miner.git
        fi
        docker-compose -f "miner/docker-compose.macos.${POOL_TYPE}.yml" up -d --build
        ;;
    windows)
        echo "error: windows detected - please run the appropriate powershell command:"
        echo ""
        if [ "$POOL_TYPE" = "solo" ]; then
            echo "  iex (iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/setup-windows-solo.ps1).Content"
        else
            echo "  iex (iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/setup-windows-share.ps1).Content"
        fi
        exit 1
        ;;
    *)
        echo "error: unsupported platform"
        exit 1
        ;;
esac

echo ""
echo "installation complete!"
echo "pool type: $POOL_TYPE (port $([ "$POOL_TYPE" = "solo" ] && echo "1111" || echo "8888"))"

