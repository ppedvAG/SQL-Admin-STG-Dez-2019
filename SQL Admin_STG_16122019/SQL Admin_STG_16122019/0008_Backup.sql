/*

V ollsicherung
D ifferentielle 
T ransaktkionsprotokollsicherung

V
	T
	T
	T
D
	T
	T
	T
D
	T
	T
	T Heute 10 Uhr

V  D TTT


V:  checkpoint (aus dem Log in Datei)
	Sicherung der Dateien (Pfade und Gr��e)
	Sicherung der Daten ins Backup

D: �nderung seit V
	alle ge�nderten Bl�cke

T: sichert wie ien Makro alle Anweisung , die �nderungen beinhalten



---Was ist der schnellste Restore: V
-- so oft wie m�glich

-- wie lange dauert der Restore eines T?
--solange die TX dauerten
--folglich sollte man : wenige Ts 


--Allerdings abh�ngig von Recoverymodel

--Einfach
I, UP, DEL, BULK (rudiment�r)... nach einer Zeit werden die TX
aus dem LOG autom gel�scht

--> keine Sicherung des LOG 
--Testumgebungen


--Massenprotokolliert
--wie einfach, aber es wird nix gel�scht
--nur das Backup Log entfernt TX
--theor. ist ein Restore auf Sek m�glich, aber nur dann wenn...
--kein BULK stattfand
--auch IX


--Full
--alles exakt protokolliert
--auf Sek restore
--IX


--jede neue DB ist auf Full.. wg Model DB

--im laufenden Betrieb


--
*/
--VOLL
BACKUP DATABASE [Northwind] TO  DISK = N'C:\_SQLBACKUPS\Northwind.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'Northwind VOLL', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--DIFF
BACKUP DATABASE [Northwind] TO  DISK = N'C:\_SQLBACKUPS\Northwind.bak' 
WITH  DIFFERENTIAL , 
NOFORMAT, NOINIT,  NAME = N'Northwind DIFF', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--LOG
BACKUP LOG [Northwind] TO  DISK = N'C:\_SQLBACKUPS\Northwind.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'Northwind TLOG', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO



--- V TTT D TTT D TTT

--Restoref�lle



--DB ok.. Daten falsch

--letzte Sicherung 11:00
--jetzt 11:32.. Restore w�rde Verlust von 32 min bedeuten

--Restore der DB unter anderen Namen:
--aus northwind2 Daten via insert oder update oder delete oder merge 




--ebenfalls f�r Fall 2 : historische Daten sehen wollen


----auf anderen Server wie Fall 1..allerdings per Datenbankne.. rechte Maus..
--aber evtl Probleme: PFade.. uUgriffsrechte
--welche Dinge werden nicht mitgeliefert: Jobs der DB (msdb), Logins (master)

restore database northwind


--Fragmentsicherung wird nicht geleert, da Kopiesicherung


--was wenn ich w�sste

--Snapshot
--DB haben Dateien..  ..mdf   .ldf  ..ndf
--alle Datendateien m�ssen involviert in Snapshot sein
--  c:\_SQLDBs\nwind.mdf --> Alias.. Logischen Namen



-- Create the database snapshot
CREATE DATABASE NamederSNapshotDB 
ON
	( NAME =LogischerNamederDetei, 
	 FILENAME = 'PfadundNamederSNDatei' )
AS SNAPSHOT OF OrgDB;
GO

--Snapshot von Northwind
create database sn_northwind_1400
ON
	(Name = Northwind, Filename = 'C:\_SQLDBS\sn_northwind_1400.mdf')
AS
	Snapshot of northwind

--Snapshot hat zu Beginn 128kb auf HDD, obwohl 8 MB angezeigt werden


--Kann man von einem SN ein backup machen?.. Neee
--Kann man einen restore eines SN machen? .. Neeeeeee
--Kann man ein Backup der OrgDB machen? .. Na freilich!
--Kann man einen Restore der OrgDB machen, wenn SN..!  N�...

--Folglich: alle SN m�ssen gel�scht werfden, wenn ein ordentlicher Restore kommt

--Kann man den SN f�r einen Restore der OrgDB verwenden? .. Ja et jeht!
--
--Wie

Restore database northwind
from database_Snapshot = 'sn_northwind_1400'

--man darf die SN nicht verwenden
--auch die OrgDB darf nicht verwendet werden

---wer isst von meinem Teller
--spid
select * from sysprocesses where dbid = db_id('northwind')

select * from sysprocesses where dbid = db_id('sn_northwind_1400')


--User runterkicken vor Restore...
USE [master]
ALTER DATABASE [Northwind] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
RESTORE DATABASE [Northwind] FROM  DISK = N'C:\_SQLBACKUPS\Northwind.bak' WITH  FILE = 14,  NOUNLOAD,  REPLACE,  STATS = 5
ALTER DATABASE [Northwind] SET MULTI_USER
GO

---------------

--Was wenn nur noch Dateien da sind..


--

use Northwind;

create table t1 (id int identity, spx char(4100))


insert into t1 select 'XY'
GO 20000

delete from t1 where id < 10000
































