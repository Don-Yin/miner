# docker usage
docker-compose up -d

# linux
([ -d miner ] && (cd miner && git pull) || git clone https://github.com/don-yin/miner.git) && cd miner && docker-compose up -d --build

# windows oneliner (powershell)
if (!(Test-Path "SRBMiner-Multi-3-0-2")) { Invoke-WebRequest -Uri "https://github.com/doktor83/SRBMiner-Multi/releases/download/3.0.2/SRBMiner-Multi-3-0-2-win64.zip" -OutFile "srbminer.zip"; Expand-Archive -Path "srbminer.zip" -DestinationPath "."; Remove-Item "srbminer.zip" }; cd SRBMiner-Multi-3-0-2; $worker = "windows-cpu-$($env:NUMBER_OF_PROCESSORS)"; .\SRBMiner-MULTI.exe --algorithm randomscash --pool scash.work:8888 --wallet scash1q8pjehs7k56xm04jsg77d7quhnx2y8s3dhkaynv --worker $worker --enable-large-pages

# windows oneliner (cmd.exe)
powershell -Command "if (!(Test-Path 'SRBMiner-Multi-3-0-2')) { Invoke-WebRequest -Uri 'https://github.com/doktor83/SRBMiner-Multi/releases/download/3.0.2/SRBMiner-Multi-3-0-2-win64.zip' -OutFile 'srbminer.zip'; Expand-Archive -Path 'srbminer.zip' -DestinationPath '.'; Remove-Item 'srbminer.zip' }; cd SRBMiner-Multi-3-0-2; $worker = 'windows-cpu-' + $env:NUMBER_OF_PROCESSORS; .\SRBMiner-MULTI.exe --algorithm randomscash --pool scash.work:8888 --wallet scash1q8pjehs7k56xm04jsg77d7quhnx2y8s3dhkaynv --worker $worker --enable-large-pages"