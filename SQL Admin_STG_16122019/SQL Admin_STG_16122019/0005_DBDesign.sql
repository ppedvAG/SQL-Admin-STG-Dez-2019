--Design

/*
Normalisierung (1,2,3,4,5, BC)

vs Redundanz

Generalisierung

--Datentypen...

--152 mal Vergößerung... a 7 ms



--Kompression:

--T1  1 Mio Zeilen
--3000ms 500ms CPU
*/
set statistics io, time on

select * from t1
--30 Seiten
--CPU 150ms   Dauer 1,2 Sek

--CPU 400ms   Dauer 250ms
-->MAXDOP  evtl..

select * into t3 from t1

select * from t3 where id = 100





--




*/

use northwind;


delete from customers where customerid  = 'ALFKI'

