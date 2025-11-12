# Universal scash miner installer for Windows
# Usage: iex (iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.ps1).Content
# Or with solo flag: iex "& { $(iwr -useb https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/install.ps1).Content } -Solo"

param(
    [switch]$Solo
)

$PoolType = if ($Solo) { "solo" } else { "share" }
$Port = if ($Solo) { "1111" } else { "8888" }

Write-Host "detected platform: windows"
Write-Host "pool type: $PoolType (port $Port)"
Write-Host ""

# Download and run the appropriate script
$scriptUrl = "https://raw.githubusercontent.com/Don-Yin/miner/main/scripts/scash/setup-windows-$PoolType.ps1"
Write-Host "downloading installer from $scriptUrl..."

try {
    $scriptContent = (Invoke-WebRequest -Uri $scriptUrl -UseBasicParsing).Content
    Invoke-Expression $scriptContent
}
catch {
    Write-Host "error: failed to download or execute installer" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "installation complete!" -ForegroundColor Green
Write-Host "pool type: $PoolType (port $Port)" -ForegroundColor Cyan

