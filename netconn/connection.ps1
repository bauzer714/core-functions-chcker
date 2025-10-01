 if ($true -eq (Test-Connection $global:nasHost -Quiet)) {
        Write-Log "Host established, at $global:nasHost"

        if ($true -eq (Test-Path $global:nasFolder)) {
            Write-Log "Connection Initialized Successfully"
            return;
        }

        Write-Log "Unable to connect to NAS folder, trying to login"
        net use $global:nasFolder /user:$user $pass

        if ($true -eq (Test-Path $global:nasFolder)) {
            Write-Log "Connection Initialized Successfully, after login"
            return;
        }
        Write-Log -Warning "Still unable to connect to NAS folder"
    } else {
        Write-Log -Warning "Unable to access the host at $global:nasHost"
    }
