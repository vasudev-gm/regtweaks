The following _known issues_ are currently present in Windows 1903 (May Update '19). Before you submit any bug or feature request I simply expect that you read this document in order to get a short overview of what is broken and what can be manually fixed or needs an update (file changes). 

The overview is provided 'as it comes' and is not designed to explain every little _fart_, it's more designed to show quickly what are the 'urgent' things which are (as time of writing) considerably broken or needing a fix by Microsoft.


## Windows 10 Builds Overview

| Version |        Code name        |     Marketing name     | Build |
| :-----: | ----------------------- | ---------------------- | :---: |
|  1507   | Threshold 1 (TH1)       | Threshold 1            | 10240 |
|  1511   | Threshold 2 (TH2)       | November Update        | 10586 |
|  1607   | Redstone 1 (RS1)        | Anniversary Update     | 14393 |
|  1703   | Redstone 2 (RS2)        | Creators Update        | 15063 |
|  1709   | Redstone 3 (RS3)        | Fall Creators Update   | 16299 |
|  1803   | Redstone 4 (RS4)        | April 2018 Update      | 17134 |
|  1809   | Redstone 5 (RS5)        | October 2018 Update    | 17763 |
|  1903   | 19H1                    | May 2019 Update      | 18362.30 |
|  //   | 20H2                    | //     | //    |
|  //   | 20H3                    | //      | //   |

The list is checked against:
* Windows 10 1903 (May Update): `Windows 10 1903 Build 18362.30`
* Please don't ask for Home/Pro versions, I simply won't test them anymore.


### I can't upgrade my OS I get the "This PC can't update to Windows 10" error message
* Download the [AppRPS.zip](https://aka.ms/AppRPS) and extract the `appraiser.bat` (right-click on it and run it as admin).
* PowerShell will automatically search for possible problems and fix them.
* (**optional**) You could do mentioned method above manually, search for the `*_APPRAISER_HumanReadable.xml` file once you found the file, open it and search for `DT_ANY_FMC_BlockingApplication` which should be set to `true`.
* Repeat the process with a search for `LowerCaseLongPathUnexpanded`, this returns the path which might causes update problems, remove the path and re-start the update procedure. 


Problem | Description | Workaround | Fix | Additional Information 
--- | --- | --- | --- | --- | 
"This PC can't be upgraded to Windows 10" | "This PC can't be upgraded to Windows 10" error on a computer that has a USB device or SD card attached | A USB device or SD card that's inserted into the computer can cause this issue to occur. To work around this issue, remove the external media and restart the May 2019 Update installation. | // | [Microsoft Article](https://support.microsoft.com/en-us/help/4500988/windows-update-blocked-because-of-drive-reassignment/#!/en-us/help/4500988/windows-update-blocked-because-of-drive-reassignment) 



## How to I uninstall a specific KB?
Basically there are two methods, one explained [here](https://www.groovypost.com/howto/uninstall-a-windows-10-cumulative-update/) and in case you installed it as .cab file you can follow the [instructions given by MS](https://docs.microsoft.com/en-us/powershell/module/dism/remove-windowspackage?view=win10-ps).


## Install Language Packs on Build 1809 or higher

Language packs will still be avbl. via [seperated .iso files](https://www.microsoft.com/de-de/store/collections/localexperiencepacks?rtc=1).

1.) Mount the install.wim via:
`dism.exe /mount-wim /wimfile:C:\install.wim /index:1 /mountdir:C:\Mount`

2.) Mount the registry otherwise you're not able to integrate the new language via 
`Reg Load HKLM\TempImg C:\Mount\Windows\system32\config\SOFTWARE`

3.) Insert the following registry key:
`Reg Add HKLM\TempImg\Policies\Microsoft\Windows\Appx /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"`

4.) Unmount the registry:
`Reg unload HKLM\TempImg`

5.) Integrated the [LXP.Appx](https://docs.microsoft.com/en-us/powershell/module/dism/add-appxprovisionedpackage?view=win10-ps) for example: 
`Dism.exe /image:C:\Mount /add-provisionedappxpackage /packagepath:C:\LXP_APPX\Microsoft.LanguageExperiencePackde-DE_17761.1.1.0_neutral__8wekyb3d8bbwe.Appx /SkipLicense`

6.) Unmount the image
`Dism.exe /unmount-wim /mountdir:C:\Mount /commit`


## Spectre & Meltdown 

![Spectre and Meltdown on Intel Hardware](https://i.imgur.com/WPiOGpZ.png)

**Overview**:
* [V3a](https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability/download-the-whitepaper) (new "Meltdown" variant) (CVE-2018-3640: "Rogue System Register Read (RSRE)")
* [V4](https://software.intel.com/side-channel-security-support) ([CVE 2017-5715](https://www.neowin.net/news/spectre-variant-4-disclosed-mitigations-to-result-in-another-performance-hit)) (CVE-2018-3639: "Speculative Store Bypass (SSB)")
* [L1TF](https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00161.html) (CVE-2018-3620, CVE-2018-3646: "L1 Terminal Fault")

[Supported CPU's](https://support.microsoft.com/en-us/help/4100347/intel-microcode-updates-for-windows-10-version-1803-and-windows-server):

+ (106A5) Nehalem EP & Nehalem WS
+ (106E5) Lynnfield
+ (106E5) Lynnfield Xeon
+ (20655) Arrandale
+ (20655) Clarkdale
+ (206A7) Sandy Bridge
+ (206A7) Sandy Bridge Xeon E3
+ (206D7) Sandy Bridge Server EN/EP/EP4S
+ (206E6) Nehalem EX
+ (206F2) Westmere EX (EGL, WSM)
+ (306A9) Gladden
+ (306A9) Ivy Bridge
+ (306A9) Ivy Bridge Xeon E3
+ (306C3) Haswell (including H, S)
+ (306C3) Haswell Xeon E3
+ (306D4) Broadwell U/Y
+ (306E7) Ivy Bridge Server EX
+ (306F4) Haswell Server EX
+ (40651) Haswell ULT
+ (40661) Haswell Perf Halo
+ (40671) Broadwell H 43e
– (406E3) Skylake U/Y & Skylake U23e
+ (50654) Skylake D (Bakerville)
+ (50654) Skylake Server
+ (50654) Skylake W
+ (50654) Skylake X (Basin Falls)
+ (50662) Broadwell DE V1
+ (50663) Broadwell DE V2,V3
+ (50664) Broadwell DE Y0
+ (50665) Broadwell DE A1
+ (506C2) Broxton
+ (506C9) Apollo Lake D0
+ (506CA) Apollo Lake E0
– (506E3) Skylake H/S & Skylake Xeon E3
+ (506F1) Denverton (GLM)
+ (806EA) Coffee Lake U43e
+ (806EA) Kaby Lake Refresh U 4+2
+ (906E9) Kaby Lake G/S/X/G
+ (906E9) Kaby Lake Xeon E3

Old:
+ [14393+] (806E9) Kaby Lake U/Y & Kaby Lake U23e
+ [14393+] (906EA) Coffee Lake H (6+2) & Coffee Lake S (6+2)
+ [14393+] (906EA) Coffee Lake S (6+2) Xeon E
+ [14393+] (906EA) Coffee Lake S (4+2) Xeon E
+ [14393+] (906EA) Coffee Lake S (6+2) x/KBP
+ [14393+] (906EB) Coffee Lake S (4+2)

Patched .dll's:

* mcupdate_GenuineIntel.dll
* mcupdate_AuthenticAMD.dll

Windows has the ability to warm patch microcode on boot using the mcupdate_GenuineIntel.dll and mcupdate_AuthenticAMD.dll drivers (located at C:\Windows\System32) on boot, for Intel and AMD cpu's respectively.

## Activate the Meltdown + Spectre Patches via Registry manually (requires a reboot):

### Meltdown + Spectre Patches activation (Default under Windows 10)
* Meltdown-Fix: Activated (secure)
* Spectre-Fix: Activated (secure)
* Performance: Bad/Medium

```bash
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"FeatureSettingsOverride"=dword:00000000
"FeatureSettingsOverrideMask"=dword:00000003
```

### Deactivate only Spectre Patch
* Meltdown-Fix: Activated (secure)
* Spectre-Fix: Deactivated (secure)
* Performance: Medium

```bash
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"FeatureSettingsOverride"=dword:00000001
"FeatureSettingsOverrideMask"=dword:00000003
```

### Deactivate all Patches
* Meltdown-Fix: Deactivated (insecure)
* Spectre-Fix: Deactivated (insecure)
* Performance: High

```bash
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"FeatureSettingsOverride"=dword:00000003
"FeatureSettingsOverrideMask"=dword:00000003
```

[Speculation Control Validation PowerShell Script](https://gallery.technet.microsoft.com/scriptcenter/Speculation-Control-e36f0050) - Official MS PowerShell script to control the Registry toggles and check the current status.  


**Notice**:

On AMD systems you _can block the update_ via [wushowhide.diagcab](https://support.microsoft.com/de-de/help/3073930/how-to-temporarily-prevent-a-driver-update-from-reinstalling-in-window), since the update will effect your performance. But this is not recommended.  


### Intel Microcode Updates

[Intel Microcode Guidance 14. May 2019](https://www.intel.com/content/dam/www/public/us/en/documents/corporate-information/SA00233-microcode-update-guidance_05132019.pdf)

OS Version | KB | Patch | Updated
--- | --- | --- | --- 
Windows 10 1507 | [KB4091666](https://support.microsoft.com/en-us/help/4091666/kb4091666-intel-microcode-updates) | [Download](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4091666) v3 (Rev. 7) | 12. Mar. 2019 |
Windows 10 1511 | // | // | // |
Windows 10 1607 | [KB4091664](https://support.microsoft.com/en-us/help/4346087/kb4346087-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/search.aspx?q=4346087) v4 (Rev. 10) | 14. May 2019 |
Windows 10 1703 | [KB4091663](https://support.microsoft.com/en-us/help/4346086/kb4346086-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/search.aspx?q=4346086) v4 (Rev. 9) | 14. May 2019 |
Windows 10 1709 | [KB4090007](https://support.microsoft.com/en-us/help/4346085/kb4346085-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/search.aspx?q=4346085) v5 (Rev. 10) | 14. May 2019 |
Windows 10 1803 | [KB4100347](https://support.microsoft.com/en-us/help/4346084/kb4346084-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/Search.aspx?q=kb4346084) v3 (Rev. 7) | 09. Apr. 2019 |
Windows 10 1809 | [KB4465065](https://support.microsoft.com/en-us/help/4465065/kb4465065-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/Search.aspx?q=kb4465065) v3 (Rev. 4) | 09. Apr. 2019 |
Windows 10 1903 | [KB4497165](https://support.microsoft.com/en-us/help/4497165/kb4497165-intel-microcode-updates) | [Download](https://www.catalog.update.microsoft.com/Search.aspx?q=4497165) v1 (Rev. 1) | 14. May 2019 |


### Intel ZombieLoad

Official [security advisor](https://seclists.org/oss-sec/2019/q2/111) - disable Hyper-Threading. [Intel official list those holes as critical](https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00213.html).

OS Version | KB | Patch | Updated
--- | --- | --- | --- 
Windows 10 1507 | [KB4494454](https://support.microsoft.com/en-us/help/4494454/kb4494454-intel-microcode-updates) | Via WUS | 14. May 2019
Windows 10 1607 | [KB4494175](https://support.microsoft.com/en-us/help/4494175/kb4494175-intel-microcode-updates) | Via WUS | 14. May 2019
Windows 10 1703 | [KB4494453](https://support.microsoft.com/en-us/help/4494453/kb4494453-intel-microcode-updates) | Via WUS | 14. May 2019
Windows 10 1709 | [KB4494452](https://support.microsoft.com/en-us/help/4494452/kb4494452-intel-microcode-updates) | Via WUS | 14. May 2019
Windows 10 1803 | // | // | //
Windows 10 1809 | // | // | //
Windows 10 1903 | [KB4497165](https://support.microsoft.com/en-us/help/4497165/kb4497165-intel-microcode-updates) | Windows Insider Program | 14. May 2019



## Acknowledgments and References

* [Intel ZombieLoad](https://zombieloadattack.com/)
* [Windows 10 release information](https://www.microsoft.com/en-us/itpro/windows-10/release-information)
* [How to temporarily prevent a driver update from reinstalling in Windows 10](https://support.microsoft.com/en-us/help/3073930/how-to-temporarily-prevent-a-driver-update-from-reinstalling-in-window)
* [How to keep apps removed from Windows 10 from returning during an update](https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update#registry-keys-for-provisioned-apps)
* [When Microsoft patches security vulnerabilities and when not](https://www.microsoft.com/en-us/msrc/windows-security-servicing-criteria?rtc=2) - see also [MSRC (.pdf)](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE2A3xt)
* [Intel Microcode Update Guidance (.pdf)](https://newsroom.intel.com/wp-content/uploads/sites/11/2018/04/microcode-update-guidance.pdf)
