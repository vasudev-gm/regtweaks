## Windows Terminal Preview (BETA!)


### Requirements
* Windows 10 1903 18362+
* The new `msix` Format is only available for 1903+ that's the reason for the minimum requirement!


### Manual method
1. Right-click on `CascadiaPackage_2019.5.6.0_x86_x64_arm64.cer` and install the certificate.
2. Double-click on `CascadiaPackage_2019.5.6.0_x86_x64_arm64.msixbundle` to install the bundle.
3. Install `Add-AppDevPackage.ps1` via right-click _Run with PowerShell_.


### Automatic method
1. Use the Install.bat.


## Troubleshooting

1. Enable [Developer Settings](https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development) Mode before you install the package!
2. In case you get the error that the certificate could not be installed you can start the `Add-AppDevPackage.ps1` script directly.