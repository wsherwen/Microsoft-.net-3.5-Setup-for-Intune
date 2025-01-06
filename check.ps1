$net35 = Get-WindowsOptionalFeature -Online -FeatureName netFx3


if ($net35.state = "Enabled") {
    Write-Host ".NET Framework 3.5 is installed"
    exit 0
} else {
    Write-Host ".NET Framework 3.5 is not installed"
    exit 1
}