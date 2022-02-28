
EXEC cmc..sp_libro
	@i_operacion 	= 'U',
	@i_isbn			= '2222255555',
	@i_titulo		= 'Matematicas Advanced',
	@i_genero		= 'O',
	@i_autor		= 4,
	@i_precio_venta	= 22.5

EXEC cmc..sp_libro
	@i_operacion 	= 'U',
	@i_isbn			= '2222277777',
	@i_titulo		= 'Algebra Lineal',
	@i_genero		= 'H',
	@i_autor		= 10,
	@i_precio_venta	= 35.6