# Get-ADReplicationFailure
# Retrieves replication failures for a domain controller.
# Helpful for diagnosing Active Directory replication issues.

# Retrieve replication failures for a domain controller
Get-ADReplicationFailure -Target "DC-here"

#  Check all replication failures for all DCs in a domain
Get-ADDomainController -Filter * | ForEach-Object {
    Get-ADReplicationFailure -Target $_.Name
}


