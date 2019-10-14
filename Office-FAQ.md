## Office Service Pack Direct Download Links

| Version | Service Pack Version | Size in MB | Link |
| ------------- | ------------- | ------------- | ------------- |
| Office 2013 | SP 1 | 644.0 MB | [x86](https://www.microsoft.com/en-us/download/details.aspx?id=42017)
|  | SP 1 | 774.0 MB | [x64](https://www.microsoft.com/en-us/download/details.aspx?id=42006)
| Office 2010 | SP 2 | 639.0 MB | [x86](https://www.microsoft.com/en-us/download/details.aspx?id=39667)
|  | SP 2 | 630.0 MB | [x64](https://www.microsoft.com/en-us/download/details.aspx?id=39647)
| Office 2007 | SP 3 | 351.0 MB | [x64](https://www.microsoft.com/en-us/download/details.aspx?id=27838)
| Office 2003 | SP 3 | 118.0 MB | [x64](https://www.microsoft.com/en-us/download/details.aspx?id=8)

## How long can I use MS Office without activation?

If case you installed the 30-day trial copy of `Office 365`, you will be able to use Office for `30 days` without any issues. `Office 2016 or Office 2019` allows you to use it `5 days` as "extended trial period". 


## How do I activate Office 2019 via telephone?

Visit the [Self Service for Mobile Web Portal](https://microsoft.gointeract.io/interact/index?interaction=1461173234028-3884f8602eccbe259104553afa8415434b4581-05d1&accountId=microsoft&appkey=196de13c-e946-4531-98f6-2719ec8405ce&Language=English&CountryCode=US&CountryLanguage=EN&Click%20To%20Call%20Caller%20Id=+34678336575&startedFromSmsToken=5mKSRIk&token=ugyRTu&tdsourcetag=s_pctim_aiomsg) and follow the instructions.


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

### Resources
- [Microsoft Office 365/2019/2016 Activation Troubleshooter utility (download.microsoft.com)](https://aka.ms/diag_officeact) 
