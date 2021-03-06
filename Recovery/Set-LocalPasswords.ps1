function Set-LocalPasswords
{
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]$computer,
        [Parameter(Mandatory=$true)]
        [string]$password
    )
    process {
        $userList = Get-WmiObject -Class Win32_UserAccount -ComputerName $computer
        
        foreach ($user in $userList) {
            ([adsi]"WinNT://$computer/$user).SetPassword($password)
        }
    }
}