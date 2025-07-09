# Get-MsolUser / Set-MsolUser - MSOnline Module
# Legacy Azure AD user management.
# Still used in some hybrid environments.

# Basic usage
Get-MsolUser

# Filter by UPN
Get-MsolUser -UserPrincipalName "user@domain.com"

# Find users with a specific domain
Get-MsolUser -DomainName "domain.com"

# Find users with a specific license
Get-MsolUser | Where-Object { $_.Licenses.AccountSkuId -match "ENTERPRISEPACK" }

# Set user display name
Set-MsolUser -UserPrincipalName "user@domain.com" -DisplayName "Bill Gates"

# Force password change at next login
Set-MsolUser -UserPrincipalName "user@domain.com" -ForceChangePassword $true

# Set usage location required for licensing
Set-MsolUser -UserPrincipalName "user@domain.com" -UsageLocation "US"
