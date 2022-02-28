if exists(select 1 from sysobjects where name='autor')
 drop table autor
 
 go
 
 create table autor(
 	au_codigo int identity(1,1) primary key,
 	au_nombre VARCHAR(100) not null,
 	au_apellido VARCHAR(100) not null,
 	au_estado char(1) not null
 )