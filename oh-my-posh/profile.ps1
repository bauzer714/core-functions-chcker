
Write-Host "Performing the oh-my-posh upgrade check" -ForegroundColor Green
        winget upgrade JanDeDobbeleer.OhMyPosh --source winget --scope user --force

oh-my-posh init pwsh --eval | Invoke-Expression
