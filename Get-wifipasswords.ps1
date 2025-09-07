# List all Wi-Fi profiles and show their passwords
$profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object {
    ($_ -split ":")[1].Trim()
}

foreach ($profile in $profiles) {
    Write-Output "Profile: $profile"
    netsh wlan show profile name="$profile" key=clear | Select-String "Key Content"
    Write-Output ""
}
