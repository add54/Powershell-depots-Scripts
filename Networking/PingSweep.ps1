WorkFlow PingSweep{
    $computers = @()
    For ($i = 1; $i -le 254; $i++){$computers += "192.168.0.$i"}
    ForEach -Parallel ($computer in $computers){
        If(Test-NetConnection -computerName $computer -InformationLevel Quiet -WarningAction SilentlyContinue){
            Write-Output -InputObject "$computer,ONLINE"
        }else{
            Write-Output -InputObject "$computer,OFFLINE"
        }
    }
}

PingSweep | ForEach-Object {
    $ip = $_.Split(",")[0]
    $status = $_.Split(",")[1]
    If($status -eq 'ONLINE'){
        Write-Host "$ip" -ForegroundColor Green
    }Else{
        Write-Host "$ip" -ForegroundColor Red
    }
}