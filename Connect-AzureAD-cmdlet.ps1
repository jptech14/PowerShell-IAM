# Connect-AzureAD / Connect-AzAccount cmdlets
# Authenticate to Azure AD or Azure.
# Required for running Azure-related scripts.

# Login and list Azure Subscriptions
Connect-AzAccount
Get-AzSubscription

# Verify your current subscription and tenant
Get-AzContext

# Basic Login
Connect-AzAccount

# Assign Role to a User
Connect-AzAccount
$user = Get-AzADUser -UserPrincipalName "bill.gates@microsoft.com"
New-AzRoleAssignment -ObjectId $user.Id -RoleDefinitionName "Reader" -Scope "/subscriptions/<sub-id>"

# Deploy a Resource Group Template
Connect-AzAccount
New-AzResourceGroupDeployment -ResourceGroupName "MyRG" -TemplateFile "azuredeploy.json"

# Switch Between Tenants or Subscriptions
Connect-AzAccount -Tenant "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
Set-AzContext -Subscription "Azure Subscriptions"

# Login with a Specific Tenant
Connect-AzureAD -TenantId "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

# Login with a Service Principal
Connect-AzureAD -ApplicationId "app-id-guid" -TenantId "tenant-id-guid" -CertificateThumbprint "thumbprint"

# Login with a Managed Identity
Connect-AzAccount -Identity

# Login with Device Authentication
Connect-AzAccount -UseDeviceAuthentication

