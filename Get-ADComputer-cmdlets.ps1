# The Active Directory module for PowerShell and proper permissions are required.

# Retrieves information about computer accounts in Active Directory.
Get-ADComputer -Filter * -Property Name, OperatingSystem

# Lists all computers and displays their names and operating systems.
Get-ADComputer -Filter 'Name -like "PC-*"' -SearchBase "OU=Computers,DC=domain,DC=com"

# Deletes a computer account from Active Directory.
Remove-ADComputer -Identity "PC-123" -Confirm:$false
