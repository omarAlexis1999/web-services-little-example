if exists(select 1 from sysobjects where name='libro')
 drop table libro
 
 go
 
 create table libro(
 	li_isbn CHAR(10) PRIMARY KEY,
 	li_titulo VARCHAR(200) not null,
 	li_genero CHAR(1) not null,
 	li_autor INT ,
 	li_precio_venta MONEY ,
	li_estado char(1) not NULL,
	CONSTRAINT fk_Autor FOREIGN KEY (li_autor) REFERENCES autor (au_codigo)
 )