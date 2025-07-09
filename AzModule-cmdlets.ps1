# AzureAD Module cmdlets
# Manage Azure RBAC roles and assignments.

# Assign Reader Role to a User at Subscription Level
$User = Get-AzADUser -UserPrincipalName "user@example.com"
New-AzRoleAssignment -ObjectId $User.Id -RoleDefinitionName "Reader" -Scope "/subscriptions/<subscription-id>"

# Assign Contributor Role to a Group at Resource Group Level
$Group = Get-AzADGroup -DisplayName "IT Team"
New-AzRoleAssignment -ObjectId $Group.Id -RoleDefinitionName "Contributor" -ResourceGroupName "MyResourceGroup"

# Assign Role with a Condition -Advanced
New-AzRoleAssignment `
  -ObjectId $User.Id `
  -RoleDefinitionName "Storage Blob Data Reader" `
  -Scope "/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Storage/storageAccounts/<account>" `
  -Condition "resource.containerName == 'logs'" `
  -ConditionVersion "2.0"

