<#
.SYNOPSIS
    Lists all saved Wi-Fi profiles and their passwords on a Windows machine.

.DESCRIPTION
    Uses `netsh wlan` to enumerate Wi-Fi profiles and display saved passwords
    (Key Content) in clear text. Must be run with Administrator privileges.

.NOTES
    Author: Kevin Bradshaw
    Date:   2025-09-07
#>

# Get all saved Wi-Fi profiles
$profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object {
    ($_ -split ":")[1].Trim()
}

if (-not $profiles) {
    Write-Output "No Wi-Fi profiles found."
    return
}

# Loop through each profile and display the password
foreach ($profile in $profiles) {
    Write-Output ("=" * 60)
    Write-Output "Profile: $profile"
    $result = netsh wlan show profile name="$profile" key=clear | Select-String "Key Content"
    if ($result) {
        $result | ForEach-Object { $_.ToString().Trim() } | Write-Output
    } else {
        Write-Output "Key Content: <no password stored or not retrievable>"
    }
}
Write-Output ("=" * 60)
