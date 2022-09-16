function f1 {
    Write-Host (Get-Date)
}
f1

$result = f1


function f1 {
(Get-Date)
}
f1

$result = f1

new-aduser xyz -passthru
#dsinternals powershell module

if (-not (Get-Module -ListAvailable -Name dsInternals)) {

    Write-Error ' the module does not exist on the server'
}

$passworresutl = get-adreplaccount -all -server dc01 | test-adreplpasswordquality

$passwordgroup = $passworresult.duplicatepasswordgroup | Where-Object { $_ -ne 'contoso\passworduser1' }
$users = $passwordgroup | | Where-Object { $_ -ne 'contoso\passworduser1'
}
$users | ForEach-Object { $_ -split '\\')[1] } 

| set-ADuser -identity $USERNAME -changepaswordlogon $true

}
}

get-userwiththesamepassword -paswordusername pasworduser1

get-ADReplaccount -samAccount krbtgt -server dc01
#markdown
#krbtgt get account command
