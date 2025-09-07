# Wi-Fi Password Extractor (Windows / PowerShell)

Lists all saved Wi-Fi profiles and their passwords on a Windows machine.  
For recovery/administration on devices you own or are authorized to manage.

> ⚠️ **Admin required:** Run PowerShell **as Administrator**.  
> 🛡️ **Ethics & legality:** Use responsibly. Do **not** run on systems you don’t own or administer.

---

## Requirements
- Windows 10/11
- PowerShell
- Administrative privileges

## Usage
1. Open **PowerShell** as **Administrator**.
2. Run:
   ```powershell
   Set-Location <path-to-repo>
   .\Get-WifiPasswords.ps1
