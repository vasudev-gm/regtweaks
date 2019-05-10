### PowerShell script to convert registry .reg files recursively

The final GUI will have an "auto-converter" feature which allows you to automatically convert all _broken_ (wrongly encoded file(s)) to a [desired output format](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-content?view=powershell-6). Until then I provide an easy way to manually convert the files recursively.


### Manual converting the files via PowerShell script

The script(s) I provide searches for all registry (.reg) files in a folder and converting them automatically. Only UTF-8/16 is supported, the default line ending is [enforced by Git to CRLF](https://github.com/CHEF-KOCH/regtweaks/blob/master/.gitattributes#L33).


#### Example usage

Let's assume we have some registry (.reg) files which are mixed, e.g. some are in _UTF-8 with BOM_ and some are _without BOM_.


| Converts from to | Script | Description |
| :------------- | :-------------: | ------------- |
| UTF-16 to UTF-8 with BOM | `UTF-8 with BOM.ps1`  | Put the script into the same dir as the files you like to convert and right-click on it and press "Run with PowerShell" which then automatically searches for all .reg files and also checks all sub-dirs, it will convert all files to UTF-8 without BOM. |
| UTF-16 without BOM | `UTF-8 without BOM.ps1`  | //  |
| Project Defaults (UTF-16) | `Project Default UTF-16 without BOM.ps1` | // |


**The converting process will take a while depending how many files you have in the folder/sub-folders!**