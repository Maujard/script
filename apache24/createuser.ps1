#create user  basic authent
#powershell -file .\apache24\createuser.ps1 -exe .\apache24\htpasswd.exe -csv ..\apache24\extra\WS_GAIA_Liste_Login_Appli_clientes.csv -filename ..\rff.Application.2.int.apache24.reverseProxy.main\configuration\htpasswd\.htpasswd
#.\apache24\htpasswd.exe  ..\rff.Application.2.int.apache24.reverseProxy.main\configuration\htpasswd\.htpasswd

param (
    [string]$exe =  $(throw "-exe is required."),
    [string]$csv =  $(throw "-csv is required."),
    [string]$filename =  $(throw "-filename is required.")
)

$users =Import-Csv  $csv -delimiter ";"
& $exe  -m -b -c $filename gaia gaia

Foreach ($user in $users)
{
     & $exe -m -b $filename $user.login $user.password
}
