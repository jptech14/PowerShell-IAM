# Get-ADDomainController
# Monitor AD health and replication.
# Troubleshooting and diagnostics.

# Retrieves information about domain controllers in the domain
Get-ADDomainController -Filter *

# Get a specific DC, change DC01 to the server name you need
Get-ADDomainController -Identity "DC01"

# Get DCs in a specific site
Get-ADDomainController -Filter {Site -eq "Default-First-Site-Name"}

# Check replication failures across all DCs
Get-ADDomainController -Filter * | ForEach-Object {
    Write-Host "Checking replication on $($_.Name)"
    Get-ADReplicationFailure -Target $_.Name
}
