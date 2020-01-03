SELECT Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.City, Customers.Country, Customers.ContactTitle, Orders.EmployeeID, Orders.OrderDate, Orders.Freight, Orders.ShipCity, Orders.ShipCountry, 
                  Employees.LastName, Employees.FirstName, Employees.BirthDate, [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, Products.UnitsInStock
INTO KU
FROM     Customers INNER JOIN
                  Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                  Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                  [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                  Products ON [Order Details].ProductID = Products.ProductID


--Spieltabelle auf 1 Mio pushen
insert into ku
select * from ku


select * into ku2 from ku

--Messen von Seiten , CPU und Dauer
set statistics io, time on

--mehr Aufwand als das anlegen der Tabelle?!
alter table ku2 add id int identity

select * from ku2 where id = 100 --56294 Seiten

select * from ku2 where city = 'Berlin' --wiesoo schätzt er und warum..?
--> um beste INdizes finden zu können: NBG bei rel wenigen Ergebnissen (Tipping Point.. kann auch mal 1% sein)
--> Bereiche : Grupp Index

select id from ku2 where freight = 0.02

--schlägt NCL IX auf ID vor
--CL IX auf Orderdate

select id, city from ku2 where id < 100

--DMVs zur Suche nach nicht verwendeten oder selten verwendeten Indizes
--> Seek optimale Suche.. SCAN komplette Suche durch alle Strukturen

select * from sys.dm_db_index_usage_stats where database_id = db_id('northwind')


select * from ku2 where freight < 2

select * from ku2 where city ='Berlin'

select country, sum(freight) from ku2 where orderdate < '31.8.1996' group by country

select lastname from ku2 where orderdate > '30.4.1998' or Firstname = 'Nancy'

select * from ku2 where id != 100 --56294

dbcc showcontig('ku2') --42183 vs 56294???????

--Wieso zeigt dbcc weniger Seiten an, als statistics io ausgibt
--> dbcc veraltet!,, besser so


--forward_record_counts! zusätzliche Seiten
select * from 
				sys.dm_db_index_physical_Stats
				(
				  db_id() 
				, object_id('ku2')
				, NULL, NULL 
				, 'detailed'
				)


--Problem mit forward record counts tritt nur bei HEAP auf.. daher CL IX
--und evtl - ´falls man diesen nicht haben möchte .. wieder löschen

select * from ku2 where ProductID = 10


--alle Spalten des Select als eingeschlossene Spalten
--alle Spalten des Where als INdex Spalten
--Selektivere Spalten zuerst: Stadt , Land
--AND IX mit 2 Spalten
--OR 2 Indizes

--IX Vorschlagswesen ist begrenzt:-) 

select country, sum(freight) from ku2 where orderdate < '31.8.1996' group by country

select lastname from ku2 where orderdate > '30.4.1998' or Firstname = 'Nancy'






--


