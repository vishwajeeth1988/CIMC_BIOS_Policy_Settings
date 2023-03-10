##################################################################################################################
# Program to check the various parameters in BIOS policy of a domain and disable them according to best practices#
##################################################################################################################
##############################################
# Clearing Previous CLI and Importing modules#
##############################################
Clear
Import-Module Cisco.IMC

#######################################################################
# Connecting to UCSM from a CSV file                                  #
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

    #####################
    #Getting BIOS policy#
    #####################
   
Write-host "Collecting BIOS policy infromation for:"$cimcip

$a1  =Get-ImcBiosBootDev 
$a2  =Get-ImcBiosBootDevGrp 
$a3  =Get-ImcBiosBootDevPrecision 
$a4  =Get-ImcBiosBootMode
$a5  =Get-ImcBiosBOT
$a6  =Get-ImcBiosEnhancedIntelSpeedStep
$a7  =Get-ImcBiosExecuteDisabledBit
$a8  =Get-ImcBiosHyperThreading
$a9  =Get-ImcBiosIntelDirectedIO
$a10 =Get-ImcBiosLvDdrMode
$a11 =Get-ImcBiosNUMA
$a12 =Get-ImcBiosOSBootWatchdogTimerTimeoutPolicy
$a13 =Get-ImcBiosPassword
$a14 =Get-ImcBiosPlatformDefaults
$a15 =Get-ImcBiosProfile
$a16 =Get-ImcBiosProfileManagement
$a17 =Get-ImcBiosProfileToken
$a18 =Get-ImcBiosSettings
$a19 =Get-ImcBiosTurboBoost
$a20 =Get-ImcBiosUnit
$a21 =Get-ImcBiosVfAdjacentCacheLinePrefetch
$a22 =Get-ImcBiosVfAltitude
$a23 =Get-ImcBiosVfASPMSupport
$a24 =Get-ImcBiosVfAssertNMIOnPERR
$a25 =Get-ImcBiosVfAssertNMIOnSERR
$a26 =Get-ImcBiosVfAutoCCState
$a27 =Get-ImcBiosVfAutonumousCstateEnable
$a28 =Get-ImcBiosVfBootOptionNumRetry
$a29 =Get-ImcBiosVfBootOptionReCoolDown
$a30 =Get-ImcBiosVfBootOptionRetry
$a31 =Get-ImcBiosVfBootPerformanceMode
$a32 =Get-ImcBiosVfCDNEnable
$a33 =Get-ImcBiosVfCDNSupport
$a34 =Get-ImcBiosVfCkeLowPolicy
$a35 =Get-ImcBiosVfClosedLoopThermThrotl
$a36 =Get-ImcBiosVfCmciEnable
$a37 =Get-ImcBiosVfConfigTDP
$a38 =Get-ImcBiosVfConsoleRedirection
$a39 =Get-ImcBiosVfCoreMultiProcessing
$a40 =Get-ImcBiosVfCPUEnergyPerformance
$a41 =Get-ImcBiosVfCPUFrequencyFloor
$a42 =Get-ImcBiosVfCPUPerformance
$a43 =Get-ImcBiosVfCPUPowerManagement
$a44 =Get-ImcBiosVfDCUPrefetch
$a45 =Get-ImcBiosVfDemandScrub
$a46 =Get-ImcBiosVfDirectCacheAccess
$a47 =Get-ImcBiosVfDRAMClockThrottling
$a48 =Get-ImcBiosVfDramRefreshRate
$a49 =Get-ImcBiosVfEnergyEfficientTurbo
$a50 =Get-ImcBiosVfEngPerfTuning
$a51 =Get-ImcBiosVfEPPProfile
$a52 =Get-ImcBiosVfExtendedAPIC
$a53 =Get-ImcBiosVfFRB2Enable
$a54 =Get-ImcBiosVfHardwarePrefetch
$a55 =Get-ImcBiosVfHWPMEnable
$a56 =Get-ImcBiosVfIMCInterleave
$a57 =Get-ImcBiosVfIntelVirtualizationTechnology
$a58 =Get-ImcBiosVfIohErrorEn
$a59 =Get-ImcBiosVfIOHResource
$a60 =Get-ImcBiosVfIPV6PXE
$a61 =Get-ImcBiosVfKTIPrefetch
$a62 =Get-ImcBiosVfLegacyUSBSupport
$a63 =Get-ImcBiosVfLLCPrefetch
$a64 =Get-ImcBiosVfLOMPortOptionROM
$a65 =Get-ImcBiosVfMemoryInterleave
$a66 =Get-ImcBiosVfMemoryMappedIOAbove4GB
$a67 =Get-ImcBiosVfMirroringMode
$a68 =Get-ImcBiosVfMMCFGBase
$a69 =Get-ImcBiosVfOnboardNIC
$a70 =Get-ImcBiosVfOnboardStorage
$a71 =Get-ImcBiosVfOnboardStorageSWStack
$a72 =Get-ImcBiosVfOSBootWatchdogTimer
$a73 =Get-ImcBiosVfOSBootWatchdogTimerTimeout
$a74 =Get-ImcBiosVfOutOfBandMgmtPort
$a75 =Get-ImcBiosVfPackageCStateLimit
$a76 =Get-ImcBiosVfPatrolScrub
$a77 =Get-ImcBiosVfPatrolScrubDuration
$a78 =Get-ImcBiosVfPchUsb30Mode
$a79 =Get-ImcBiosVfPCIeSSDHotPlugSupport
$a80 =Get-ImcBiosVfPCIOptionROMs
$a81 =Get-ImcBiosVfPciRomClp
$a82 =Get-ImcBiosVfPCISlotOptionROMEnable
$a83 =Get-ImcBiosVfPOSTErrorPause
$a84 =Get-ImcBiosVfPowerOnPasswordSupport 
$a85 =Get-ImcBiosVfProcessorC1E
$a86 =Get-ImcBiosVfProcessorC3Report
$a87 =Get-ImcBiosVfProcessorC6Report
$a88 =Get-ImcBiosVfProcessorCState
$a89 =Get-ImcBiosVfPSata
$a90 =Get-ImcBiosVfPStateCoordType
$a91 =Get-ImcBiosVfPwrPerfTuning
$a92 =Get-ImcBiosVfQPIConfig
$a93 =Get-ImcBiosVfQpiSnoopMode
$a94 =Get-ImcBiosVfResumeOnACPowerLoss
$a95 =Get-ImcBiosVfSataModeSelect
$a96 =Get-ImcBiosVfSelectMemoryRASConfiguration
$a97 =Get-ImcBiosVfSerialPortAEnable
$a98 =Get-ImcBiosVfSinglePCTLEnable
$a99 =Get-ImcBiosVfSparingMode
$a100=Get-ImcBiosVfSrIov
$a101=Get-ImcBiosVfSubNumaClustering
$a102=Get-ImcBiosVfTPMControl
$a103=Get-ImcBiosVfTPMSupport
$a104=Get-ImcBiosVfUCSMBootOrderRuleControl
$a105=Get-ImcBiosVfUSBBootConfig
$a106=Get-ImcBiosVfUSBEmulation
$a107=Get-ImcBiosVfUSBPortsConfig
$a108=Get-ImcBiosVfUsbXhciSupport
$a109=Get-ImcBiosVfVgaPriority
$a110=Get-ImcBiosVfWorkLoadConfig
$a111=Get-ImcBiosVfXPTPrefetch


 
                   
$output = New-Object psobject -Property @{
'CIMC Ip'  =$cimcip
'BootDev'=$a1 
'BootDevGrp'=$a2  
'BootDevPrecision'=$a3  
'BootMode'=$a4  
'BOT'=$a5  
'EnhancedIntelSpeedStep'=$a6  
'ExecuteDisabledBit'=$a7  
'HyperThreading'=$a8  
'IntelDirectedIO'=$a9  
'LvDdrMode'=$a10 
'NUMA'=$a11 
'OSBootWatchdogTimerTimeoutPolicy'=$a12 
'Password'=$a13 
'PlatformDefaults'=$a14 
'Profile'=$a15 
'ProfileManagement'=$a16 
'ProfileToken'=$a17 
'Settings'=$a18 
'TurboBoost'=$a19 
'Unit'=$a20 
'VfAdjacentCacheLinePrefetch'=$a21 
'VfAltitude'=$a22 
'VfASPMSupport'=$a23 
'VfAssertNMIOnPERR'=$a24 
'VfAssertNMIOnSERR'=$a25 
'VfAutoCCState'=$a26 
'VfAutonumousCstateEnable'=$a27 
'VfBootOptionNumRetry'=$a28 
'VfBootOptionReCoolDown'=$a29 
'VfBootOptionRetry'=$a30 
'VfBootPerformanceMode'=$a31 
'VfCDNEnable'=$a32 
'VfCDNSupport'=$a33 
'VfCkeLowPolicy'=$a34 
'VfClosedLoopThermThrotl'=$a35 
'VfCmciEnable'=$a36 
'VfConfigTDP'=$a37 
'VfConsoleRedirection'=$a38 
'VfCoreMultiProcessing'=$a39 
'VfCPUEnergyPerformance'=$a40 
'VfCPUFrequencyFloor'=$a41 
'VfCPUPerformance'=$a42 
'VfCPUPowerManagement'=$a43 
'VfDCUPrefetch'=$a44 
'VfDemandScrub'=$a45 
'VfDirectCacheAccess'=$a46 
'VfDRAMClockThrottling'=$a47 
'VfDramRefreshRate'=$a48 
'VfEnergyEfficientTurbo'=$a49 
'VfEngPerfTuning'=$a50 
'VfEPPProfile'=$a51 
'VfExtendedAPIC'=$a52 
'VfFRB2Enable'=$a53 
'VfHardwarePrefetch'=$a54 
'VfHWPMEnable'=$a55 
'VfIMCInterleave'=$a56 
'VfIntelVirtualizationTechnology'=$a57 
'VfIohErrorEn'=$a58 
'VfIOHResource'=$a59 
'VfIPV6PXE'=$a60 
'VfKTIPrefetch'=$a61 
'VfLegacyUSBSupport'=$a62 
'VfLLCPrefetch'=$a63 
'VfLOMPortOptionROM'=$a64 
'VfMemoryInterleave'=$a65 
'VfMemoryMappedIOAbove4GB'=$a66 
'VfMirroringMode'=$a67 
'VfMMCFGBase'=$a68 
'VfOnboardNIC'=$a69 
'VfOnboardStorage'=$a70 
'VfOnboardStorageSWStack'=$a71 
'VfOSBootWatchdogTimer'=$a72 
'VfOSBootWatchdogTimerTimeout'=$a73 
'VfOutOfBandMgmtPort'=$a74 
'VfPackageCStateLimit'=$a75 
'VfPatrolScrub'=$a76 
'VfPatrolScrubDuration'=$a77 
'VfPchUsb30Mode'=$a78 
'VfPCIeSSDHotPlugSupport'=$a79 
'VfPCIOptionROMs'=$a80 
'VfPciRomClp'=$a81 
'VfPCISlotOptionROMEnable'=$a82 
'VfPOSTErrorPause'=$a83 
'VfPowerOnPasswordSupport'=$a84 
'VfProcessorC1E'=$a85 
'VfProcessorC3Report'=$a86 
'VfProcessorC6Report'=$a87 
'VfProcessorCState'=$a88 
'VfPSata'=$a89 
'VfPStateCoordType'=$a90 
'VfPwrPerfTuning'=$a91 
'VfQPIConfig'=$a92 
'VfQpiSnoopMode'=$a93 
'VfResumeOnACPowerLoss'=$a94 
'VfSataModeSelect'=$a95 
'VfSelectMemoryRASConfiguration'=$a96 
'VfSerialPortAEnable'=$a97 
'VfSinglePCTLEnable'=$a98 
'VfSparingMode'=$a99 
'VfSrIov'=$a100
'VfSubNumaClustering'=$a101
'VfTPMControl'=$a102
'VfTPMSupport'=$a103
'VfUCSMBootOrderRuleControl'=$a104
'VfUSBBootConfig'=$a105
'VfUSBEmulation'=$a106
'VfUSBPortsConfig'=$a107
'VfUsbXhciSupport'=$a108
'VfVgaPriority'=$a109
'VfWorkLoadConfig'=$a110
'VfXPTPrefetch'=$a111

        } 

        ###############################
        #Output Exporting to CSV File#
        ###############################

     
   $output| ConvertTo-json  |Out-File "C:\Users\vmadalik\Downloads\Jsonoutput.json"        
   
    
###################
#Disconnecting UCS#
###################
write-host "Job Complete and Disconnecting Ip:" $cimcip
Disconnect-Imc

 }