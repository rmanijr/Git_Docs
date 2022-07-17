$services = get-wmiobject win32_service |where-object{$_.Name -like '*SAP???_??*' -and $_.state -eq "Running"} |Select-object Name,displayname,state,pathname
foreach($service in $services)
{
    $sub_service=(($service.Name).Substring(3)).split("_")
    $sid_name=$sub_service[0]
    $exepath=($service[0].pathname).split("")[0]
    $exepath=$exepath.substring(1,$exepath.lastIndexOf("\"))
    $nr = ($service.name).split("_")[1]
    $cmd=$exepath + "sapcontrol.exe"+" -nr $nr -function GetProcessList"
    write-output "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    write-output "Status of the SAP SID: $sid_name and Instance# $nr"
    write-output "==============================================="
    Invoke-expression $cmd
    
}