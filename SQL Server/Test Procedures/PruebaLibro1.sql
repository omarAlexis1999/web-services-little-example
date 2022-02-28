EXEC cmc..sp_libro
	@i_operacion 	= 'I',
	@i_isbn			= '2222255555',
	@i_titulo		= 'Matematicas AD',
	@i_genero		= 'O',
	@i_autor		= 1,
	@i_precio_venta	= 22.5

EXEC cmc..sp_libro
	@i_operacion 	= 'I',
	@i_isbn			= '2222277777',
	@i_titulo		= 'Algebra AD',
	@i_genero		= 'H',
	@i_autor		= 3,
	@i_precio_venta	= 35.6
	
EXEC cmc..sp_libro
	@i_operacion 	= 'I',
	@i_isbn			= '2222277777',
	@i_titulo		= 'Economia AD',
	@i_genero		= 'T',
	@i_autor		= 4,
	@i_precio_venta	= 20.3
	
EXEC cmc..sp_libro
	@i_operacion 	= 'I',
	@i_isbn			= '2222266666',
	@i_titulo		= 'Geografia AD',
	@i_genero		= 'T',
	@i_autor		= 4,
	@i_precio_venta	= 20.3

