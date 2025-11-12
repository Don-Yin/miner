```bash
# bash/zsh (linux/macos)
curl -fsSL https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.sh | sh              # shared (8888)
curl -fsSL https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.sh | sh -s -- --solo # solo (1111)

# cmd (windows)
powershell -Command "iex (iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.ps1).Content"                 # shared (8888)
powershell -Command "iex \"& { $(iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.ps1).Content } -Solo\"" # solo (1111)
```