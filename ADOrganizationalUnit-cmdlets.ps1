# Get all OUs in a domain.
Get-ADOrganizationalUnit -Filter *

# Get OUs with a specific name
Get-ADOrganizationalUnit -Filter 'Name -like "*IT*"'

# Get OUs and display their Distinguished Names
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName

# Create a new OU at the root of the domain
New-ADOrganizationalUnit -Name "MIS" -Path "DC=domain,DC=com"

# Create a nested OU
New-ADOrganizationalUnit -Name "West Coast" -Path "OU=IT,DC=domain,DC=com"

# Create an OU with protection from accidental deletion
New-ADOrganizationalUnit -Name "IT" -Path "DC=domain,DC=com" -ProtectedFromAccidentalDeletion $true


