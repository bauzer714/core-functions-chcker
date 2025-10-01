#This file is for pwsh
function DoUpdateIfNeccessary
{
    $checkEveryDays = 14;
    $lastUpdateFolder=$env:APPDATA + "\" + $env:USERNAME;
    $lastUpdateFile="$lastUpdateFolder\ohmyposh_last_update_check"
    #Get last update check time
    if (Test-Path $lastUpdateFile)
    {
        $lastRun = (Get-ItemProperty $lastUpdateFile).LastWriteTime;
    }
    else
    {
        Write-Host "Last update check file doesn't exist, using a very old date to force to check" -ForegroundColor Yellow
        $lastRun = Get-Date "12/31/200 00:00 AM"
    }

    if ((Get-Date) -gt $lastRun.AddDays($checkEveryDays))
    {
        Write-Host "Performing the oh-my-posh upgrade check" -ForegroundColor Green
        winget upgrade JanDeDobbeleer.OhMyPosh --source winget --scope user --force

        if (-not (Test-Path -Path $lastUpdateFolder))
        {
            [Void](New-Item -ItemType Directory -Path $lastUpdateFolder -Force)
            Write-Host "Destination Folder didn't exist, creating" -ForegroundColor Yellow
        }
        Out-File $lastUpdateFile
        Write-Host "oh-my-posh update check completed" -ForegroundColor Green
    }
    else
    {
        Write-Host "Skipping the oh-my-posh upgrade check" -ForegroundColor Magenta
    }
}

DoUpdateIfNeccessary
oh-my-posh init pwsh --eval | Invoke-Expression
