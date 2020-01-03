USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'Andreas SQL Chef', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'andreasr@sql.local'
GO


--Problem.. automatisierter Versand der Emails geht nicht

--Mailprofil im Agent aktivieren


---Agent neu starten

--unter SQL 2016
--Security!

--bei Fehler oder Erfolg oder immer



--Aufträge... Errors


--Fehler haben Ebenen:

--15 DAU, 16 DAU, 14 Security, 
--17


select * from kunden


select * from sysmessages
