**linux/macos:**
```bash
curl -fsSL https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.sh | sh              # shared (8888)
curl -fsSL https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.sh | sh -s -- --solo # solo (1111)
```

**windows - cmd (run as administrator):**
```cmd
powershell -ExecutionPolicy Bypass -Command "iex (iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/setup-windows-share.ps1).Content" # shared (8888)
powershell -ExecutionPolicy Bypass -Command "iex (iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/setup-windows-solo.ps1).Content"  # solo (1111)
```