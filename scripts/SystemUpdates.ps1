# SystemUpdates.ps1

# Import the Update Session COM object
$UpdateSession = New-Object -ComObject Microsoft.Update.Session

# Create an UpdateSearcher object
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()

# Search for updates
$SearchResult = $UpdateSearcher.Search("IsInstalled=0")

# Check if there are any updates to install
if ($SearchResult.Updates.Count -gt 0) {
    Write-Host "Found $($SearchResult.Updates.Count) updates. Installing..."

    # Create an UpdateCollection object to hold the updates
    $UpdatesToInstall = New-Object -ComObject Microsoft.Update.UpdateColl

    # Add each update to the collection
    foreach ($Update in $SearchResult.Updates) {
        $UpdatesToInstall.Add($Update) | Out-Null
    }

    # Create an UpdateInstaller object
    $UpdateInstaller = $UpdateSession.CreateUpdateInstaller()
    $UpdateInstaller.Updates = $UpdatesToInstall

    # Install the updates
    $InstallationResult = $UpdateInstaller.Install()

    # Check the result of the installation
    if ($InstallationResult.ResultCode -eq 2) {
        Write-Host "Updates installed successfully."
    }
    else {
        Write-Host "Failed to install updates. Result code: $($InstallationResult.ResultCode)"
    }
}
else {
    Write-Host "No updates found."
}
