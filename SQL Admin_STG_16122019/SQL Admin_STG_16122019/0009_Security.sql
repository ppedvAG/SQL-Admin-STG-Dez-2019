--Security
USE [Northwind]
GO
CREATE SCHEMA [IT] AUTHORIZATION [dbo]
GO
USE [Northwind]
GO
CREATE SCHEMA [MA] AUTHORIZATION [dbo]
GO


--Schema wie Ordner
--dbo immer als Besitzer..

use northwind;
create table it.personal (itperso int)
create table it.projekte (itprojekte int)


create table ma.personal (maperso int)
create table ma.projekte (maprojekte int)

select * from orders

select * from personal --dbo.personal

--

select * from db.schema.tabelle

--Anwendungsrolle

use master

use northwind

select * from employees

exec sp_setapprole 'Gehaltsrolle', 'ppedv2019!'


--User und Login mappen
sp_help_revlogin


use whoamiDB
sp_change_Users_login 'Auto_fix', 'JAmesBond', 'JamesBond', 'ppedv2019!'

sp_change_Users_login 'update_one', 'JAmesBond', 'JamesBond'


--ContainedDB
--#tab sind in tempdb, haben aber Sprachsortierung der OrgDB

--Susi: MA Tante--> MA Schema

select * from orders

select * from personal --dbo.personal

--susi soll nun auf IT.Personal Zugriff haben

select * from it.personal
select * from it.projekte

--Vererbte Rechte sehen wir nicht..

--Susi soll Tabellen anlegen dürfen in MA

--Rechte auf DB und REchte im Schema

create table kst3 (makst int)

select * from ma.personal

--
create view ma.ang
as
select * from dbo.employees


select * from Ang --gehts oder gehts nicht--

--MA: dbo
--dbo: dbo

--daher sollte man nicht gedankenlos Leuten Rechte geben: PROZ, SICHT F()







