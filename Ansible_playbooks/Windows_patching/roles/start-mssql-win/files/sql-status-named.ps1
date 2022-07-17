$db_service=get-service |where-object{$_.Name -like '*SQL$???*'}
$sub_service=(($db_service.Name).Substring(3)).split("$")
$result = $sub_service[1]
$result
$Server = $env:computername+"\"+$result
$database = 'master'
$Connection = New-Object System.Data.SQLClient.SQLConnection
$Connection.ConnectionString = "server=$($Server);database=$($Database);User ID=ibm_monitoring;Password=1bm_z1ysql;"
$Connection.Open()
$Command = New-Object System.Data.SQLClient.SQLCommand
$Command.Connection = $Connection
$Command.CommandText = 'SELECT name, state_desc as Database_status FROM sys.databases'
$Reader = $Command.ExecuteReader()
$Datatable = New-Object System.Data.DataTable
$Datatable.Load($Reader)
$Datatable
$Connection.Close()