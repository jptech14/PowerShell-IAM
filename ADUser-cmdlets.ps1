# Get-ADUser / Set-ADUser / New-ADUser cmdlets
# Retrieve, modify, or create Active Directory user accounts.
# Automate user provisioning, updates, and deprovisioning.

# Get a user by username
Get-ADUser -Identity username

# Get all users in a specific OU
Get-ADUser -Filter * -SearchBase "OU=Department,DC=domain,DC=com"

# Get users with specific properties
Get-ADUser -Filter * -Properties DisplayName, EmailAddress | Select-Object DisplayName, EmailAddress

# Change a user's title
Set-ADUser -Identity username -Title "Job Title here"

# Update multiple properties
Set-ADUser -Identity username -Department "Department-here" -Office "State-here"

# Enable or disable an account
Enable-ADAccount -Identity username
Disable-ADAccount -Identity username

# Create a basic user
New-ADUser -Name "Bill Gates" -SamAccountName bgates -UserPrincipalName bgates@microsoft.com `
  -Path "OU=Department,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "Password-here" -AsPlainText -Force) `
  -Enabled $true

# Create a user with more attributes
New-ADUser -Name "User Name" -GivenName "Bill" -Surname "Gates" -DisplayName "Bill Gates" `
  -SamAccountName bgates-UserPrincipalName bgates@microsoft.com -EmailAddress "bgates@microsoft.com" `
  -Title "IT Specialist" -Department "IT" -Office "California" `
  -Path "OU=Department,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "password-here" -AsPlainText -Force) `
  -Enabled $true

# Export all users to CSV for Reporting and Auditing.
Get-ADUser -Filter * | Export-Csv

