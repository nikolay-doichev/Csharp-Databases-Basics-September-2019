sqlcmd -E -S NIKOLAY\SQLEXPRESS -d master -Q "BACKUP DATABASE [Hotel] TO DISK = N'D:\ALL_BACUP\MY_DATABASE.bak' WITH INIT , NOUNLOAD , NAME = N'my database backup', NOSKIP , STATS = 10, NOFORMAT" "

D:\\ALL_BACUP\MY_DATABASE.bak copy /Y D:\\AutoArhivDB\MY_DATABASE*.rar