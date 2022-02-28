
/*
 *Actualizar
EXEC cmc..sp_autor
	@i_operacion 	= 'U',
	@i_nombre 		= 'Alexis',
	@i_apellido 	= 'Salazar',
	@i_codigo		= 2
 */
 
 
/*
*Eliminar logico
 EXEC cmc..sp_autor
	@i_operacion 	= 'D',
	@i_codigo		= 2
*/


/*
*Buscar autores con estado activo
EXEC cmc..sp_autor
	@i_operacion 	= 'S'
*/


/*
*Seleccionar autor con codigo
EXEC cmc..sp_autor
	@i_operacion 	= 'T',
	@i_codigo		= 3
*/
	