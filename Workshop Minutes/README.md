# Powershell Workshop Content

## Popular Modules

[ImportExcel](https://www.powershellgallery.com/packages/ImportExcel/7.8.1)

[AutomatedLab](https://automatedlab.org/)

## PowerShell Cording Patterns

### PassThru

```powershell
PassThru Pattern
$ou = New-ADOrganizationalUnit -Name CbeTest1 -ProtectedFromAccidentalDeletion $false -PassThru
New-ADUser -Name Test1 -Path $ou 
```


## Other stuff

### Regex to find IP addresses in `IPConfig.exe` output

Find the adapter’s IP addresses in the IPConfig text output using a regular expression:

```regex
IPv4 Address[\. :]+(?<IpAddress>[0-9\.]+)
```

---