function Get-UserWithSamePassword
{
    param(
        [Parameter(Mandatory)]
        [string]
        $PasswordUserName,

        [Parameter()]
        [string]
        $ComputerName = (Get-ADDomainController)
    )

    if (-not (Get-Module -ListAvailable -Name DSInternals))
    {
        Write-Error "The module 'DSInternals' does not exist on the server. Exiting..."
        return
    }

    try
    {
        $user = Get-ADUser -Identity $PasswordUserName
    }
    catch
    {
        Write-Error "The password user '$PasswordUserName' does not exist'"
        return
    }

    $passwordResult = Get-ADReplAccount -All -Server $ComputerName | Test-ADReplPasswordQuality
    
    $passwordGroup = $passwordResult.DuplicatePasswordGroups | Where-Object {
        $_.Contains("$($env:USERDOMAIN)\$PasswordUserName")
    }
    $users = $passwordGroup | Where-Object { $_ -ne "$($env:USERDOMAIN)\$PasswordUserName" }

    $i = 0
    $users | ForEach-Object {
        $userName = ($_ -split '\\')[1]
        Write-Host "Setting ChangePasswordAtLogon flag for user '$userName'"
        $i++
        Set-ADUser -Identity $userName -ChangePasswordAtLogon $true
    }

    [pscustomobject]@{
        UserAccountsChanged = $users
        UserAccountsChangedCount = $i
    }

}
