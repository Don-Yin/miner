# docker usage
docker-compose up -d

# oneliner command
([ -d miner ] && (cd miner && git pull) || git clone https://github.com/don-yin/miner.git) && cd miner && docker-compose up -d --build