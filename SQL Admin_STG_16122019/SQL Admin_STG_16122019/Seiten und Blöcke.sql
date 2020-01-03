--
Use Testdb2;
GO

create table t1 (id int identity, spx char(4100));
GO

--Wie groß darf ein Datensatz werden?
--text, image var...(max) 2 GB
create table t2 (id int identity, spx char(4100), spy varchar(4100));
GO


--1 Ds max 8060 bytes


--Wie werden DS gespeichert in SQL Server
--Seiten (max 700DS haben)
--1 Ds muss in eine Seite i.dR. passen
--1 Seite 8192 bytes bzw 8060 bytes Nutzlast

-- 8 Seiten am Stück = 1 Block


insert into t1 select 'XY'
GO 20000
--14 Sekunden...25..22..20..18

--Wie groß ist die Tabelle bzw DB jetzt
--20000*4kb ==> 80MB


--Messen von Verscheliess in Seiten

dbcc showcontig('t1')
--- Gescannte Seiten.............................: 20000000
--- Mittlere Seitendichte (voll).....................: 97.79%

--was kann man tun, wenn die Physik (Auslastung) nicht stimmt)

--Seitengrößen lassen sich nicht ändern
--Datentypen, DB Design (neue Tabelle)                       --> APP Redsign#
--Features: Kompression



Seite : 8192 bytes
Block: 8 Seiten am Stück
Nutzlast der Seite: 8060bytes

--1DS muss i.d.R in Seite passen

