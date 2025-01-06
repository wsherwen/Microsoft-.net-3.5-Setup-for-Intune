# Author: Warren Sherwen
# Last Edit: Warren Sherwen
# Verison: 1.0

Param(
[Parameter(Mandatory=$true)]
[ValidateSet("Install", "Uninstall")]
[String[]]
$Mode
)

# Defines the log file location.
	$Logfile = "$env:systemdrive\Temp\Logs\dotnet35.log"

	# LogWrite Function.
	Function LogWrite{
	   Param ([string]$logstring)
	   Add-content $Logfile -value $logstring
	   write-output $logstring
	}

	function Get-TimeStamp {
		return "[{0:dd/MM/yy} {0:HH:mm:ss}]" -f (Get-Date)
	}

	if (!(Test-Path "$env:systemdrive\Temp\Logs\"))
	{
	   mkdir $env:systemdrive\Temp\Logs
	   LogWrite "$(Get-TimeStamp): Microsoft Dot Net 3.5 install has started."
	   LogWrite "$(Get-TimeStamp): Log directory created."
	}
	else
	{
		LogWrite "$(Get-TimeStamp): Microsoft Dot Net 3.5 install has started."
		LogWrite "$(Get-TimeStamp): Log directory exists."
	}


If ($Mode -eq "Install") {
	LogWrite "$(Get-TimeStamp): Micorosoft Dot Net 3.5 is installing, detailed logs can be found at $env:systemdrive\Temp\Logs\net35.log."
	Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3" -All -LogLevel debug -LogPath "$env:systemdrive\Temp\Logs\net35.log" -NoRestart
	LogWrite "$(Get-TimeStamp): Micorosoft Dot Net 3.5 is installed, detailed logs can be found at $env:systemdrive\Temp\Logs\net35.log."
	LogWrite "$(Get-TimeStamp): Script is ending a restart is required, goodbye."
	exit 1641
}

If ($Mode -eq "Uninstall") {
	LogWrite "$(Get-TimeStamp): Micorosoft Dot Net 3.5 is uninstalling, detailed logs can be found at $env:systemdrive\Temp\Logs\net35.log."
	Disable-WindowsOptionalFeature -Online -FeatureName "NetFx3" -LogLevel debug -LogPath "$env:systemdrive\Temp\Logs\net35.log" -NoRestart
	LogWrite "$(Get-TimeStamp): Micorosoft Dot Net 3.5 is uninstalled, detailed logs can be found at $env:systemdrive\Temp\Logs\net35.log."
	LogWrite "$(Get-TimeStamp): Script is ending a restart is required, goodbye."
	exit 1641
}