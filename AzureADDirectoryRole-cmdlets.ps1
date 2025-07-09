# Get-AzureADDirectoryRole
# Assign directory roles in Azure AD
# Admin role delegation.

# List all active directory roles
Get-AzureADDirectoryRole

# Find a specific role by name
# Find users with the Global Administrator role
Get-AzureADDirectoryRole | Where-Object { $_.DisplayName -eq "Global Administrator" }

# Add a user to the Global Administrator role
# Get the role object
$role = Get-AzureADDirectoryRole | Where-Object { $_.DisplayName -eq "Global Administrator" }

# Get the user object
$user = Get-AzureADUser -ObjectId "user@domain.com"

# Add the user to the role
Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $user.ObjectId

# Add a service principal to a role
# Example for app permissions
$role = Get-AzureADDirectoryRole | Where-Object { $_.DisplayName -eq "Application Administrator" }
$sp = Get-AzureADServicePrincipal -SearchString "MyApp"
Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $sp.ObjectId

