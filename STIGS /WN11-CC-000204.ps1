<#
.SYNOPSIS
    This PowerShell script ensures that enhanced diagnostic data is limited to the minimum required to support Windows Analytics.

.NOTES
    Author          : Will-Garlens Pierre
    LinkedIn        : linkedin.com/in/will-garlens-pierre/
    GitHub          : github.com/Tohru-art
    Date Created    : 2026-04-19
    Last Modified   : 2026-04-19
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000204
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000204/

.TESTED ON
    Date(s) Tested  : 2026-04-19
    Tested By       : Will-Garlens Pierre
    Systems Tested  : Windows 11 Pro 25H2
    PowerShell Ver. : 5.1

.USAGE
    Run this script as Administrator on the target Windows 11 system.
    Example syntax:
    PS C:\> .\WN11-CC-000204.ps1
#>

$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$name = "LimitEnhancedDiagnosticDataWindowsAnalytics"
$value = 1

if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}
Set-ItemProperty -Path $path -Name $name -Value $value -Type DWord

Write-Host "WN11-CC-000204 remediation applied. $name set to $value."
