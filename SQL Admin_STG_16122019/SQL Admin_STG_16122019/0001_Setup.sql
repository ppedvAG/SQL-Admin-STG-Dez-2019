--SETUP

--best practice

/*
Features: SQL Server mit Replikation und Volltextsuche
		  Clientkonnektivität	

SSMS extra runterladen ..alle 6 bis 8 Wochen Updates
..akt´: 18.4

Instanzen: Std oder benannt Instanz
--> benannte Instanz : Name --> Recher\Instanzname

--Dienstkonten: verwaltete Dienstkonten (lok Konten)
--evtl Volumewartungstask atkvieren: Ausnullen vermeiden

--Auth
gemischte Auth--> SA   Kennwort: ppedv2019!
--Tipp: den sa später deaktiveren 

--Pfade für die DBs (müssen vorher angelegt werden
	Regel: Trenne Log von Daten physikalisch (am besten pro DB)
	C:\_SQLDBS
	C:\_SQLBACKUP

Tempdb
--normalerweise eigene HDDs
--T1117  T1118 werden automatisch gesetzt

MAXDOP
default war früher 0 jetzt 8
--> 0

Arbeitsspeicher: betrifft nur den Datenpuffer
Gesamter RAM - ca 3,5 GB
Für das OS etwas übrig lassen!

Filestreaming: egal

--






*/