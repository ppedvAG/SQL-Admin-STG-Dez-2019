create database sn_nwind_311207
on  (name=Northwind,
 filename='D:\nwindsn.mdf')
as snapshot of nordwind


create database sn_ma_db2_61207
on
(name=ma_db2, filename='d:\sn_madb2.mdf'),
(name=stamm, filename='d:\sn_stamm.ndf'),
(name=umsatzdaten, filename='d:\umsatzdaten.ndf')
as snapshot of ma_Db2

-- master verwenden
use master
restore database ma_db2 from 
	database_snapshot='sn_ma_db2_61207'