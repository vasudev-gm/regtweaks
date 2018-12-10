## How do I activate Office 2019 via telephone?

Visit the [Self Service for Mobile Web Portal](https://microsoft.gointeract.io/interact/index?interaction=1461173234028-3884f8602eccbe259104553afa8415434b4581-05d1&accountId=microsoft&appkey=196de13c-e946-4531-98f6-2719ec8405ce&Language=English&CountryCode=US&CountryLanguage=EN&Click%20To%20Call%20Caller%20Id=+34678336575&startedFromSmsToken=5mKSRIk&token=ugyRTu&tdsourcetag=s_pctim_aiomsg) and follow the iinstructions.


## How to check Office Activation?

Windows x64 and Office 32-bit 

```bash
CD %SystemDrive%\Program Files (x86)\Microsoft Office\Office16
```
 

Windows x86 and Office 32-bit

```bash
CD %SystemDrive%\Program Files\Microsoft Office\Office16
```
 

Windows x64 and Office 64-bit

```bash
CD %SystemDrive%\Program Files\Microsoft Office\Office16
```
 

Then check Office activation status

```bash
cscript ospp.vbs /dstatus
```


## How do I delte or add a key?

```bash
cscript “C:\Program Files\Microsoft Office\Office16\ospp.vbs” /unpkey:OLD KEY (5DIGIT) (ENTER)
```

```bash
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /inpkey:NEW KEY (ENTER)
```
