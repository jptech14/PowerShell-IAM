# Azure IAM PowerShell Cmdlets

This repository contains a collection of PowerShell cmdlets designed to simplify and automate Identity and Access Management (IAM) tasks in Microsoft Azure.
These scripts help administrators manage users, groups, roles, and access policies efficiently using Azure PowerShell and Microsoft Graph modules.

## Features

- Create and manage Azure AD users and groups
- Assign and remove Azure roles
- Manage Microsoft 365 licenses
- Audit user sign-ins and role assignments
- Automate access reviews and conditional access policies

## Modules Used

- `Az.Resources`
- `Microsoft.Graph` (recommended)
- `AzureAD` (legacy, deprecated)

## Example Cmdlets

- `New-AzADUser` – Create a new Azure AD user
- `Add-AzADGroupMember` – Add a user to a group
- `Get-AzRoleAssignment` – List role assignments
- `New-AzRoleAssignment` – Assign a role to a user or group

## References

- [Microsoft Graph PowerShell SDK](https://learn.microsoft.com/en-us[Azure Identity and Access Management](https://learn.microsoft. Install required modules:
   ```powershell
   Install-Module -Name Az -Scope CurrentUser
   Install-Module -Name Microsoft.Graph -Scope CurrentUser
   ```
