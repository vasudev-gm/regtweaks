### How do I check the current ReFS file system version?

`fsutil fsinfo refsinfo c:` checks if C: drive uses [ReFS](https://en.wikipedia.org/wiki/ReFS) and gives you a bunch of details about the refs.sys driver. If you haven't formatted your drive with ReFS it will return `A local REFS volume is required for this operation.`.


### How do I revert a Windows Defender Engine Upgrade?

`“%programdata%\microsoft\windows defender\platform\\mpcmdrun.exe” -revertplatform`

### How do I access my UEFI firmware settings?

Start an command prompt (CMD) with admin rights (Run as administrator) and type `shutdown /r /fw /t 0` which automatically reboots your PC and brings you right to the UEFI firmware setup menu.


### How do I list all installed Printers in my Network/PC?

Control Panel and click on the" Devices and Printers", you see the list under "Printers".
Alternative you can see it via PowerShell: `Get-Printer | Format-List`

### How do I do manually execute updates only below Build 1709?

Only Windows 10 Build 1709 and higher has a button for this, so let's do this via takeown and icacls. 

```bash
takeown /f "%WINDIR%\System32\UsoClient.exe" /a
icacls "%WINDIR%\System32\UsoClient.exe" /inheritance:r /remove "Adminstrator" "Authentificated Users"" "Users" "System"
```

This will show "Update access denied" in the event error viewer, which now allows you to take control over the update mechanism. 


### How to detect current firmware mode (BIOS or UEFI)?

Windows PE/Setup mode can automatically detect in which mode you currently are:

```
; PEFirmwareType
; 0x1 = BIOS
; 0x2 = UEFI

HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control
```

Windows own boot manager check then if you're os has the bootmgr or EFI folder. 
* `%SystemDrive%\bootmgr` = BIOS
* `\EFI\Microsoft\Boot\bootmgfw.efi` = UEFI


### How to switch from Insider to Slow Ring and vice versa?

```
; UIContentType (REG_SZ)
; can accept `Current` & 'Active'

; UIRing (REG_SZ)
; WIF = Fast and Skip Ahead
; WIS = Slow Ring
; RP = Release Preview

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection
```

* Fast ring + Skip Ahead = RS_PRERELEASE with inbox app updates from the Microsoft Store
* Fast Ring = Major Build releases, very few servicing builds.
* Slow Ring = Major Build with minor build fixes attached.
* Release Preview Ring = Major Build change at a release milestone and then a continued series of Servicing Builds until the next release milestone is reached.


### How to opt-in into Skip Ahead Ring Branch (manually)

```
; UIContentType (REG_SZ)
: needs to be set to "Active"

; UIRing (REG_SZ)
; needs to be set to WIF

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection
```

```
; ContentType (REG_SZ)
; needs to be set to "Skip"

; Ring (REG_SZ)
; needs to be set to "Skip"

; RingId (REG_DWORD)
: needs to be set to 10 

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability
```

After you're done settig the registry settings you can head over to Settings > Update and Security and click on “Check for Updates” to download the latest Skip Ahead build. You can optionally head to Settings > Update and Security > Windows Insider Program to check if your device now shows Skip Ahead as the preferred Ring.


#### How do I change and manage the protocols and cipher suites?

The official documentation about the registry entries are avbl. [here](https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/operations/manage-ssl-protocols-in-ad-fs). However, the defaults in Windows 10 are fine and I suggest to not touch them since it might break some websites/applications. I only recommend to touch these settings if you're a server owner (with MS Windows Server). 


#### How to force the update to Windows 10 manually?
In CMD or PowerSHell (with Admin rights) type in: `wuauclt.exe /updatenow`.


#### Is there a professional Windows Telemetry analysis available? 

Yes, there is. [Microsoft itself provides basic information](https://answers.microsoft.com/en-us/windows/forum/windows_10-performance/microsoft-compatibility-telemetry-what-is-it-and/7653b847-23f1-42c4-9390-ba2d35978e4e) regarding telemetry. However, this is very basic and not really an in-depth guidance. A more _helpful_ analysis can be found [here](https://www.privateinternetaccess.com/blog/2018/11/534-ways-that-windows-10-tracks-you-from-german-cyberintelligence/). 


#### How do I move from an Intel CPU+Mobo to AMD CPU+Mobo (or vice versa) without reinstalling Windows?

Start > Run > sysprep. Select "OOBE", tick "Generalize" (sysprep /generalize), and select "Shutdown". Then replace your motherboard. The next time Windows boots, it should act like it's the first time boot, and setup all your drivers from scratch. Keep in mind that Windows might wipe all external drivers, so you need the new ones + maybe others like graphics drivers. You also have to re-activate Windows except if you [link the key to your MS Account](https://www.windowscentral.com/how-link-your-windows-10-product-key-microsoft-account).

The alternative is to use [Macrium Reflect](https://www.macrium.com/reflectfree).


#### Can I use the MAK key to activate a "Retail" Windows version(s)?

Yes, you can.


#### Should I upgrade to Windows 10?

Those who aren’t concerned about if they have to upgrade are usually wondering if they should upgrade. So should you upgrade to Windows 10? Barring some compelling reason for not doing so (like you can’t get drivers for a piece of hardware your job depends on) there’s very little reason to not upgrade to Windows 10.


#### Do Windows 8.1 drivers work with Windows 10?

Most Windows 8.1 drivers should work fine with Windows 10, but depending what the driver is for, it may require a Windows 10 driver to function properly.


#### How long does it take to upgrade?

In most cases it takes maximum an hour, but it's depending on how old your PC is. For me it takes 10 minutes on a SSD and 9 with an M.2.


#### What are the differences between the different Windows 10 versions?

You can find a feature comparison from Microsoft [right here](http://www.microsoft.com/en-us/windows/windows-10-editions).


#### My computer seems really slow just after upgrading

Immediately after upgrading to Windows 10, the OS completes a number of tasks and optimizations. This may slow the system down for a period of time. Try waiting for an hour and rebooting the computer to see if the speed improves.


#### Will I lose my files by upgrading to Windows 10?

No, your Windows settings, personal files and most apps will remain. However it is highly recommended to backup important files before upgrading, just in case.


#### Where can I find drivers for Windows 10?

If Windows Update did not provide you with the necessary drivers, you should check the manufacturer's website. Even if your PC manufacturer does not have any Windows 10 drivers available, the individual component manufacturer's website may have one listed. Personally I use WSUS, Win-raid forum and Station-Drivers. 


#### Can I Downgrade Back To Windows 7 or 8 If I Hate Windows 10?

You can absolutely downgrade from Windows 10 back to the previous version of Windows 7 or Windows 8.1. You can even totally wipe your machine and reinstall your old version of Windows with the old key. But, and this is a very big but, you can only do so within the first 30 days.


#### Will My Old Apps And Peripherals Still Work?

I haven’t run into a single app that hasn’t worked yet. It's more a driver thing. UWP apps however are Windows 8+ exclusive.


#### How often does the LTSC update Windows 10 LTSB?

Windows 10 LTSB does receive the usual monthly security updates. The twice-annual feature upgrades delivered to other channels will not be offered to LTSB systems. Microsoft upgrades the LTSB "build" every two to three years. Those upgrades, however, are optional, or at least optional to some degree (more on that later). Each LTSB build is supported with security updates for a decade, the same 10-year lifespan Microsoft has designated and maintained for ages. The decade is split into two equal halves: "Mainstream" support for the first five years, "Extended" for the second. For Windows 10 Enterprise 2016 LTSB, Mainstream support ends in October 2021 and Extended stops in October 2026.


#### Does Windows 10 Report Back To Microsoft?

Windows has, for ages, reported back to Microsoft in various forms. The most obvious and enduring reporting is the basic Windows authentication process. There’s also the equally as old error reporting service that phones home when your programs crash and things fall apart so Microsoft can, ostensibly, prevent such problems in the future.


#### What is Windows 10 LTSB (now LTSC)?

LTSB is a specialized edition (for ATM's etc) of Windows 10 Enterprise that promises the longest intervals between feature upgrades of any version of the operating system. When Microsoft dropped multiple labels for Windows 10's release tracks, those now retired included "Current Branch" and the unwieldy "Current Branch for Business", for the single "Semi-Annual Channel" (SAC) it also debuted "Long-term Servicing Channel" (LTSC) to match.


#### LTSB/LTSC - what is missing?

LTSB does not include Edge nor any Microsoft Store (Universal Windows Platform aka UWP) apps, whether Redmond made or third-part, because the browser and those apps constantly change and need updating. The Cortana voice-activated digital assistant and access to the Microsoft Store is also missing.


#### Can I defer security updates if we're on LTSB?

Servicing tools such as Windows Server Update Services (WSUS) and System Center Configuration Manager (SCCM) let administrators delay the monthly security updates, which Microsoft calls "quality updates", just as they can postpone those same patches reaching machines running other versions of Window 10.


#### How long is LTSB supported?

Ten years is usually the answer you see to that one. But it would be, if not wrong, then misleading. Windows 10 Enterprise LTSB is guaranteed only five years of support - from the time of its release, not its installation - if the underlying license does not have SA attached. With SA, a specific LTSB edition is supported for the full 10 years.


#### How do I uninstall an App or a Program?

This is done through the Settings panel, follow the steps below to get there.

* Left click the Start button and select Settings
* Click on System and then Apps & Features from the menu on the left side.
* Either search or manually find the app or program you want to remove, left click it and select Uninstall
* **Alternatively** you can just search for Apps and features from the search bar to get to the same place.

The old way to uninstall programs through the Control Panel is also available. Universal Apps won't show up there, though.

#### How to create a Dual-Boot Windows 10 installation USB drive?

A good tutorial is avbl. [here](https://old.reddit.com/r/windowsinsiders/comments/3sombj/tutorial_how_to_create_a_dualboot_windows_10/).


#### Can I transfer my OEM license?

A OEM license is non transferable between motherboards. If you have a retail license you may or may not need to reactivate windows after the switch. And you may or may not need to call microsoft to do it.


#### How to use DISM command-line utility to repair a Windows 10 image?

I think [this guide here](https://www.windowscentral.com/how-use-dism-command-line-utility-repair-windows-10-image?utm_medium=slider&utm_campaign=navigation&utm_source=wp) explains it well.


#### Windows 1809 (2019) LTSB/LTSC doesn't include UWP apps does this means I can't install UWD drivers?!

You still can use the old legacy drivers (if provided) and even without official support you are able to install the driver with the device manager "have-a-disk" method but several functions aren't available. Keep in mind that LTSB/LTSB is not meant to be used as "normal" OS (for e.g. exactly this reason). 


#### How do I enable Windows Sandbox Feature and how does it work?!

Windows 10 1903 Build 18305 (or higher) is required to enable the internal Sandbox function. There is a techniqual explanation given [here]https://techcommunity.microsoft.com/t5/Windows-Kernel-Internals/Windows-Sandbox/ba-p/301849).


#### How do I enable Windows Defender Sandbox feature?!

Via command line, `setx /M MP_FORCE_USE_SANDBOX 1`. To disable it (default) use 0.


#### How do I upgrade Windows 10 Evaluation to Full version!?

Navigate to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion` and change the EditionID value data from EnterpriseEval to Enterprise. Next, change the value data of the ProductName value from Windows 10 Enterprise Evaluation to Windows 10 Enterprise. This does not work on LTSC.


### How do I remove my MS Account from Win 10 User-login?

Go to regedit: `HKEY_USERS\.DEFAULT\Software\Microsoft\IdentityCRL\StoredIdentities` there is an entry where you can delete the @(microsoft).com Key entry. Since Build 1809 there is a integrated option: Settings -> Accounts -> Your Info-> "Sign in with a local account instead" which can be choosed. 


## Official Reference Links
- [Upgrade to Windows 10: FAQ](https://support.microsoft.com/en-us/help/12435/windows-10-upgrade-faq#iconz-faq)
- [Windows lifecycle fact sheet](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet)
