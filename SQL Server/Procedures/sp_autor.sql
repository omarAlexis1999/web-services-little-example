if OBJECT_ID('sp_autor') is not null
begin 
	drop procedure sp_autor 
end


go

/*
 *Creado por: Omar Sanmartin 
 */
create procedure sp_autor(
	@i_codigo 			int 		 = null,
	@i_nombre 			varchar(100) = null,
	@i_apellido 		varchar(100) = null,
	@i_operacion 		char(1)
)

AS

declare @w_verificar_nombre_completo 	varchar(100)
declare @w_concatenar				 	varchar(100)
declare @w_verificar_nombre 			varchar(100)
declare @w_verificar_apellido 			varchar(100)


if @i_operacion = 'I'
begin
	if @i_nombre is null
	begin
		raiserror('El nombre no puede ser null',11,5)
		return  1300
	end
	
	if @i_apellido is null
	begin
		raiserror('El apellido no puede ser null',11,5)
		return  1300
	end
	
	SET @w_verificar_nombre_completo = @i_nombre+' '+@i_apellido
	
	
	SELECT @w_verificar_nombre = au_nombre FROM autor WHERE au_nombre=@i_nombre
	if @w_verificar_nombre is NULL
		SET @w_verificar_nombre = ' '
		
	SELECT @w_verificar_apellido = au_apellido FROM autor WHERE au_apellido=@i_apellido
	if @w_verificar_apellido is NULL
		SET @w_verificar_apellido = ' '
		
	SET @w_concatenar = @w_verificar_nombre+' '+@w_verificar_apellido
	
	IF @w_verificar_nombre_completo = @w_concatenar
	begin
		raiserror('El nombre y apellido del autor es repetido es repetido',11,1)
		return  1300
	end
	
	BEGIN TRY
		insert into autor(
			au_nombre, 	au_apellido,	au_estado)
		values(
			@i_nombre,	@i_apellido,	'V')
	END TRY
	BEGIN CATCH
		raiserror('Error al insertar',11,5)
		return 4200
	END CATCH
	
end


if @i_operacion = 'U'
BEGIN
	if @i_nombre is null
	begin
		raiserror('El nombre no puede ser null',11,5)
		return  1300
	end
	
	if @i_apellido is null
	begin
		raiserror('El apellido no puede ser null',11,5)
		return  1300
	END
	
	if @i_codigo is null
	begin
		raiserror('El codigo no puede ser null',11,5)
		return  1300
	END
	
	BEGIN TRY
		update autor 
		set 
			au_nombre 		= @i_nombre,
			au_apellido 	= @i_apellido
		where 
			au_codigo 		= @i_codigo
	END TRY
	BEGIN CATCH
		raiserror('Error al actualizar autor',11,5)
		return 4200
	END CATCH
	
END

if @i_operacion = 'D'
BEGIN
	if @i_codigo is null
	begin
		raiserror('El codigo no puede ser null',11,5)
		return  1300
	END
	
	BEGIN TRY
		update autor 
		set 
			au_estado 		= 'E'
		where 
			au_codigo 		= @i_codigo
	END TRY
	BEGIN CATCH
		raiserror('Error al eliminar autor',11,5)
		return 4200
	END CATCH
END

if @i_operacion = 'S'
BEGIN
	
	BEGIN TRY
		SELECT * 
		FROM autor 
		where 
			au_estado 		= 'V'
	END TRY
	BEGIN CATCH
		raiserror('Error al seleccionar todos los autores',11,5)
		return 4200
	END CATCH
END

if @i_operacion = 'T'
BEGIN
	if @i_codigo is null
	begin
		raiserror('El codigo no puede ser null',11,5)
		return  1300
	END
	
	BEGIN TRY
		SELECT * 
		FROM autor 
		where 
			au_codigo 		= @i_codigo
	END TRY
	BEGIN CATCH
		raiserror('Error seleccionar autor por codigo',11,5)
		return 4200
	END CATCH
END