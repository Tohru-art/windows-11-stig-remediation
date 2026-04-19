# Windows 11 DISA STIG Remediation Scripts

PowerShell scripts that remediate DISA Security Technical Implementation Guide 
(STIG) findings on Windows 11 systems. Built during my Cyber Security Analyst 
Internship at Log(N) Pacific.

## About

The [Defense Information Systems Agency (DISA)](https://public.cyber.mil/stigs/) 
publishes STIGs as the configuration baseline for hardening systems used in 
Department of Defense environments. These scripts automate remediation of 
specific Windows 11 STIG findings identified via Tenable compliance scans.

## STIGs Implemented

| STIG ID | Title | Severity |
|---------|-------|----------|
| WN11-CC-000315 | Windows Installer "Always install with elevated privileges" must be disabled | CAT I |
| WN11-CC-000185 | Default autorun behavior must prevent autorun commands | CAT I |
| WN11-CC-000090 | Group Policy objects must be reprocessed even if unchanged | CAT II |
| WN11-CC-000110 | Printing over HTTP must be prevented | CAT II |
| WN11-CC-000197 | Microsoft consumer experiences must be turned off | CAT II |
| WN11-CC-000204 | Enhanced diagnostic data must be limited | CAT II |
| WN11-CC-000326 | PowerShell script block logging must be enabled | CAT II |
| WN11-CC-000385 | Windows Ink Workspace must be disallowed above the lock screen | CAT II |

## Methodology

1. Run an authenticated Tenable Policy Compliance Scan against the Windows 11 
   target using the DISA Windows 11 STIG v2r6 audit file
2. Identify failed findings from scan results
3. Research each STIG using [stigaview.com](https://stigaview.com)
4. Develop a PowerShell remediation script targeting the specific registry value
5. Apply the script on the target system as Administrator
6. Re-scan to verify the finding has moved from Failed to Passed

## Usage

```powershell
# Run as Administrator
.\WN11-CC-000315.ps1
```

Each script sets a specific registry value required by the corresponding STIG. 
The script is idempotent — safe to run multiple times.

## Verification

After running a script, verify compliance by either:
- Re-running a Tenable STIG scan
- Manually checking the registry value with `Get-ItemProperty`

## Environment Tested

- **OS:** Windows 11 Pro 25H2
- **PowerShell:** 5.1
- **Scanner:** Tenable Vulnerability Management
- **STIG Version:** DISA Microsoft Windows 11 STIG v2r6

## Author

**Will-Garlens Pierre** — Cyber Security Analyst Intern at Log(N) Pacific
- LinkedIn: [will-garlens-pierre](https://linkedin.com/in/will-garlens-pierre/)
- GitHub: [Tohru-art](https://github.com/Tohru-art)
