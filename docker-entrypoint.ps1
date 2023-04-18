$CLEANUP_RATE = $env:CLEANUP_RATE

while ($true) {
    Write-Host "** Starting cleanup."

    . ./cleanup.ps1

    Write-Host "** Cleanup done."
    Write-Host "** Sleeping for: ${CLEANUP_RATE} seconds"
    Start-Sleep -Seconds $CLEANUP_RATE
}