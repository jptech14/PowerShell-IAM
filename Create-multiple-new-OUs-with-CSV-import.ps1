# Create multiple Organizational Units (OUs) in Active Directory from a single CSV file.
# Create a CSV file named OUs.csv in the following format:
# Name,Path
# Sales,DC=domain,DC=com
# Marketing,DC=domain,DC=com
# East Coast,OU=Sales,DC=domain,DC=com
# West Coast,OU=Sales,DC=domain,DC=com


#Import the CSV file
$ouList = Import-Csv -Path "C:\Path\To\OUs.csv"

foreach ($ou in $ouList) {
    $ouName = $ou.Name
    $ouPath = $ou.Path

    # Check if the OU already exists
    $existingOU = Get-ADOrganizationalUnit -Filter "Name -eq '$ouName'" -SearchBase $ouPath -ErrorAction SilentlyContinue

    if (-not $existingOU) {
        try {
            New-ADOrganizationalUnit -Name $ouName -Path $ouPath -ProtectedFromAccidentalDeletion $true
            Write-Host "Created OU: $ouName in $ouPath" -ForegroundColor Green
        } catch {
            Write-Host "Failed to create OU: $ouName in $ouPath. Error: $_" -ForegroundColor Red
        }
    } else {
        Write-Host "OU already exists: $ouName in $ouPath" -ForegroundColor Yellow
    }
}
