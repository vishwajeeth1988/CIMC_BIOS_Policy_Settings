##################################################################################################################
# Program to check the various parameters in BIOS policy of a domain and disable them according to best practices#
##################################################################################################################
##############################################
# Clearing Previous CLI and Importing modules#
##############################################
Clear
Import-Module Cisco.IMC

#######################################################################
# Connecting to CIMC from a CSV file                                  #
#CSV file format is IP (Column1),username(Column2),password (Column3)#
#######################################################################
$csv = Import-csv "C:\Users\vmadalik\Downloads\cimclist.csv"

Foreach($row in $csv) 
{ 
$cimcip= $row.ip
$user =$row.username
$password = $row.password | ConvertTo-SecureString -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($user,$password)

Write-host "Connecting to Ip: $cimcip"
Connect-Imc $cimcip -Credential $cred

<#

Set-ImcBiosBootDevGrp  -
Set-ImcBiosBootDevPrecision -
Set-ImcBiosBootMode -
Set-ImcBiosBOT -
Set-ImcBiosEnhancedIntelSpeedStep -
Set-ImcBiosExecuteDisabledBit -
Set-ImcBiosHyperThreading -
Set-ImcBiosIntelDirectedIO -
Set-ImcBiosLvDdrMode -
Set-ImcBiosNUMA -
Set-ImcBiosOSBootWatchdogTimerTimeoutPolicy -
Set-ImcBiosPassword -
Set-ImcBiosPlatformDefaults -
Set-ImcBiosProfile -
Set-ImcBiosProfileManagement -
Set-ImcBiosProfileToken -
Set-ImcBiosSettings -
Set-ImcBiosTurboBoost -
Set-ImcBiosUnit -
Set-ImcBiosVfAdjacentCacheLinePrefetch -
Set-ImcBiosVfAltitude -
Set-ImcBiosVfASPMSupport -
Set-ImcBiosVfAssertNMIOnPERR -
Set-ImcBiosVfAssertNMIOnSERR -
Set-ImcBiosVfAutoCCState -
Set-ImcBiosVfAutonumousCstateEnable - 
Set-ImcBiosVfBootOptionNumRetry -
Set-ImcBiosVfBootOptionReCoolDown -
Set-ImcBiosVfBootOptionRetry -
Set-ImcBiosVfBootPerformanceMode -
Set-ImcBiosVfCDNEnable -
Set-ImcBiosVfCDNSupport -
Set-ImcBiosVfCkeLowPolicy -
Set-ImcBiosVfClosedLoopThermThrotl -
Set-ImcBiosVfCmciEnable -
Set-ImcBiosVfConfigTDP -
Set-ImcBiosVfConsoleRedirection -
Set-ImcBiosVfCoreMultiProcessing -
Set-ImcBiosVfCPUEnergyPerformance -
Set-ImcBiosVfCPUFrequencyFloor -
Set-ImcBiosVfCPUPerformance -
Set-ImcBiosVfCPUPowerManagement -
Set-ImcBiosVfDCUPrefetch -
Set-ImcBiosVfDemandScrub -
Set-ImcBiosVfDirectCacheAccess -
Set-ImcBiosVfDRAMClockThrottling -
Set-ImcBiosVfDramRefreshRate -
Set-ImcBiosVfEnergyEfficientTurbo -
Set-ImcBiosVfEngPerfTuning -
Set-ImcBiosVfEPPProfile -
Set-ImcBiosVfExtendedAPIC -
Set-ImcBiosVfFRB2Enable -
Set-ImcBiosVfHardwarePrefetch -
Set-ImcBiosVfHWPMEnable -
Set-ImcBiosVfIMCInterleave -
Set-ImcBiosVfIntelVirtualizationTechnology -
Set-ImcBiosVfIohErrorEn -
Set-ImcBiosVfIOHResource -
Set-ImcBiosVfIPV6PXE -
Set-ImcBiosVfKTIPrefetch -
Set-ImcBiosVfLegacyUSBSupport -
Set-ImcBiosVfLLCPrefetch -
Set-ImcBiosVfLOMPortOptionROM -
Set-ImcBiosVfMemoryInterleave -
Set-ImcBiosVfMemoryMappedIOAbove4GB -
Set-ImcBiosVfMirroringMode -
Set-ImcBiosVfMMCFGBase -
Set-ImcBiosVfOnboardNIC -
Set-ImcBiosVfOnboardStorage -
Set-ImcBiosVfOnboardStorageSWStack -
Set-ImcBiosVfOSBootWatchdogTimer -
Set-ImcBiosVfOSBootWatchdogTimerTimeout -
Set-ImcBiosVfOutOfBandMgmtPort -
Set-ImcBiosVfPackageCStateLimit -
Set-ImcBiosVfPatrolScrub -
Set-ImcBiosVfPatrolScrubDuration -
Set-ImcBiosVfPchUsb30Mode -
Set-ImcBiosVfPCIeSSDHotPlugSupport -
Set-ImcBiosVfPCIOptionROMs -
Set-ImcBiosVfPciRomClp -
Set-ImcBiosVfPCISlotOptionROMEnable -
Set-ImcBiosVfPOSTErrorPause -
Set-ImcBiosVfPowerOnPasswordSupport  -
Set-ImcBiosVfProcessorC1E -
Set-ImcBiosVfProcessorC3Report -
Set-ImcBiosVfProcessorC6Report - 
Set-ImcBiosVfProcessorCState -
Set-ImcBiosVfPSata -
Set-ImcBiosVfPStateCoordType -
Set-ImcBiosVfPwrPerfTuning -
Set-ImcBiosVfQPIConfig -
Set-ImcBiosVfQpiSnoopMode -
Set-ImcBiosVfResumeOnACPowerLoss -
Set-ImcBiosVfSataModeSelect -
Set-ImcBiosVfSelectMemoryRASConfiguration -
Set-ImcBiosVfSerialPortAEnable -
Set-ImcBiosVfSinglePCTLEnable -
Set-ImcBiosVfSparingMode -
Set-ImcBiosVfSrIov -
Set-ImcBiosVfSubNumaClustering -
Set-ImcBiosVfTPMControl -
Set-ImcBiosVfTPMSupport -
Set-ImcBiosVfUCSMBootOrderRuleControl -
Set-ImcBiosVfUSBBootConfig -
Set-ImcBiosVfUSBEmulation -
Set-ImcBiosVfUSBPortsConfig -
Set-ImcBiosVfUsbXhciSupport -
Set-ImcBiosVfVgaPriority -
Set-ImcBiosVfWorkLoadConfig -
Set-ImcBiosVfXPTPrefetch -
#>
###################
#Disconnecting UCS#
###################
write-host "Job Complete and Disconnecting Ip:" $cimcip
Disconnect-Imc