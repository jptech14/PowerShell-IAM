# AzureAD Module cmdlets
# Manage Azure AD users and groups.
Get-AzureADUser

# Filter by UPN.
Get-AzureADUser -ObjectId "user@domainhere.com"

# Search by display name.
Get-AzureADUser -SearchString "Bill"

# Adds a user (or other object) to an Azure AD group.
Add-AzureADGroupMember -ObjectId <GroupObjectId> -RefObjectId <UserObjectId>
$group = Get-AzureADGroup -SearchString "IT"
$user = Get-AzureADUser -SearchString "Bill Gates"
Add-AzureADGroupMember -ObjectId $group.ObjectId -RefObjectId $user.ObjectId
