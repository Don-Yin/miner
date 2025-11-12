# docker usage
docker-compose up -d

# linux
curl -fsSL https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/setup-linux.sh | sh

# windows (powershell)
iex (iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/setup-windows.ps1).Content

# windows (cmd.exe)
powershell -Command "iex (iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/setup-windows.ps1).Content"