# AzureAD Module - Get-AzureADUser, Add-AzureADGroupMember
# Manage Azure AD users and groups.
# Cloud identity management.
# You must be connected to Azure AD by using the Connect-AzureAD command first.

Connect-AzureAD

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
