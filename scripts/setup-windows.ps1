# download and extract srbminer if not present
if (!(Test-Path "SRBMiner-Multi-3-0-2")) {
    Write-Host "downloading srbminer..."
    Invoke-WebRequest -Uri "https://github.com/doktor83/SRBMiner-Multi/releases/download/3.0.2/SRBMiner-Multi-3-0-2-win64.zip" -OutFile "srbminer.zip"
    Write-Host "extracting srbminer..."
    Expand-Archive -Path "srbminer.zip" -DestinationPath "."
    Remove-Item "srbminer.zip"
}

# start mining
cd SRBMiner-Multi-3-0-2
$worker = "windows-cpu-$($env:NUMBER_OF_PROCESSORS)"
Write-Host "starting miner with worker: $worker"
.\SRBMiner-MULTI.exe --algorithm randomscash --pool scash.work:8888 --wallet scash1q8pjehs7k56xm04jsg77d7quhnx2y8s3dhkaynv --worker $worker --enable-large-pages

