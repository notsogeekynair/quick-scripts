(netsh wlan show profiles) |
ForEach-Object {
    $name = ($_ -split ":")[1].Trim()
    $key = netsh wlan show profile name="$name" key=clear | Select-String "Key Content"
    [PSCustomObject]@{
        SSID = $name
        Password = ($key -split ":")[1].Trim()
    }
} | Format-Table -AutoSize
Pause
