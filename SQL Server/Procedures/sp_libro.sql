if OBJECT_ID('sp_libro') is not null
begin 
	drop procedure sp_libro 
end


go

/*
 *Creado por: Omar Sanmartin 
 */
create procedure sp_libro(
	@i_operacion 		char(1),
	@i_isbn				char(10)	 = null,
	@i_titulo			varchar(200) = null,
	@i_genero			char(1) 	 = null,
	@i_autor			INT 		 = null,
	@i_precio_venta		MONEY 		 = null
)

AS

declare @w_verificar_isbn 			varchar(10)
declare @w_verificar_codigo_autor	int

if @i_operacion = 'I'
begin
	if @i_isbn is null
	begin
		raiserror('El isbn no puede ser null',11,5)
		return  1300
	end
	
	if @i_titulo is null
	begin
		raiserror('El titulo no puede ser null',11,5)
		return  1300
	END
	
	if @i_genero is null
	begin
		raiserror('El genero no puede ser null',11,5)
		return  1300
	END
	
	if @i_autor is null
	begin
		raiserror('El autor no puede ser null',11,5)
		return  1300
	END
	
	if @i_precio_venta is null
	begin
		raiserror('El precio venta no puede ser null',11,5)
		return  1300
	END
	
	
	SELECT @w_verificar_isbn = li_isbn FROM libro WHERE li_isbn=@i_isbn
	if @w_verificar_isbn is NOT NULL
	begin
		raiserror('El isbn esta repetido',11,5)
		return  1300
	END
	
	select @w_verificar_codigo_autor = au_codigo FROM autor WHERE au_codigo=@i_autor
	IF @w_verificar_codigo_autor IS NULL
	begin
		raiserror('El autor no existe',11,5)
		return  1300
	END
	
	
	BEGIN TRY
		insert into libro(
			li_isbn,	li_titulo,	li_genero,	li_autor,	li_precio_venta,	li_estado)
		values(
			@i_isbn,	@i_titulo,	@i_genero,	@i_autor,	@i_precio_venta,	'V')
	END TRY
	BEGIN CATCH
		raiserror('Error al insertar libro',11,5)
		return 4200
	END CATCH
	
end


if @i_operacion = 'U'
BEGIN
	
	if @i_isbn is null
	begin
		raiserror('El isbn no puede ser null',11,5)
		return  1300
	end
	
	if @i_autor is null
	begin
		raiserror('El codigo del autor no puede ser null',11,5)
		return  1300
	END
	
	select @w_verificar_codigo_autor = au_codigo FROM autor WHERE au_codigo=@i_autor
	IF @w_verificar_codigo_autor IS NULL
	begin
		raiserror('El autor no existe',11,5)
		return  1300
	END
	
	
	BEGIN TRY
		UPDATE libro
		SET
			li_titulo			= @i_titulo,	
			li_genero			= @i_genero,	
			li_autor			= @i_autor,
			li_precio_venta		= @i_precio_venta
		WHERE
			li_isbn				= @i_isbn
	END TRY
	BEGIN CATCH
		raiserror('Error al actualizar libro',11,5)
		return 4200
	END CATCH
	
END


if @i_operacion = 'D'
BEGIN
	if @i_isbn is null
	begin
		raiserror('El isbn no puede ser null',11,5)
		return  1300
	END
	
	BEGIN TRY
		update libro 
		set 
			li_estado 		= 'E'
		where 
			li_isbn 		= @i_isbn
	END TRY
	BEGIN CATCH
		raiserror('Error al eliminar libro',11,5)
		return 4200
	END CATCH
END

if @i_operacion = 'S'
BEGIN
	
	BEGIN TRY
		SELECT * 
		FROM libro 
		where 
			li_estado 		= 'V'
	END TRY
	BEGIN CATCH
		raiserror('Error al seleccionar todos los libros',11,5)
		return 4200
	END CATCH
END


if @i_operacion = 'T'
BEGIN
	if @i_isbn is null
	begin
		raiserror('El isbn no puede ser null',11,5)
		return  1300
	END
	
	BEGIN TRY
		SELECT * 
		FROM libro 
		where 
			li_isbn 		= @i_isbn
	END TRY
	BEGIN CATCH
		raiserror('Error seleccionar libro por isbn',11,5)
		return 4200
	END CATCH
END


if @i_operacion = 'R'
BEGIN
	if @i_autor is null
	begin
		raiserror('El codigo del autor no puede ser null',11,5)
		return  1300
	END
	
	BEGIN TRY
		SELECT * 
		FROM libro 
		where 
			li_autor 		= @i_autor
	END TRY
	BEGIN CATCH
		raiserror('Error al recupera libros por codigo del autor',11,5)
		return 4200
	END CATCH
END

return 0 /*ejecucion exitosa*/