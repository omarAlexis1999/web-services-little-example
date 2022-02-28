package com.cmc.fase2.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cmc.fase2.entities.Autor;
import com.cmc.fase2.exceptions.ServiceException;

public class AutorServices {
	
	public void insert(Autor autor) throws ServiceException{
		Connection con = ConnectionBDD.connect("localhost", 1460, "sa", "passwordHere","cmc");
		String sql = "EXEC sp_autor @i_nombre=?, @i_apellido=?, @i_operacion=?";
		if (con!=null) {
			try {
				PreparedStatement ps = con.prepareCall(sql);
				ps.setString(1,autor.getNombre());
				ps.setString(2,autor.getApellido());
				ps.setString(3,"I");
				ps.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new ServiceException("Error al insertar "+e.getMessage());
			}
		}
	}
	
	public void update(Autor autor) throws ServiceException{
		Connection con = ConnectionBDD.connect("localhost", 1460, "sa", "passwordHere","cmc");
		String sql = "EXEC sp_autor @i_operacion=?, @i_nombre=?,@i_apellido=?,@i_codigo=?";
		if (con!=null) {
			try {
				PreparedStatement ps = con.prepareCall(sql);
				ps.setString(1,"U");
				ps.setString(2,autor.getNombre());
				ps.setString(3,autor.getApellido());
				ps.setInt(4,autor.getCodigo());
				
				ps.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new ServiceException("Error al actualizar "+e.getMessage());
			}
		}
	}
	
	public void delete(Autor autor) throws ServiceException{
		Connection con = ConnectionBDD.connect("localhost", 1460, "sa", "passwordHere","cmc");
		String sql = "EXEC sp_autor @i_operacion=?,@i_codigo=?";
		if (con!=null) {
			try {
				PreparedStatement ps = con.prepareCall(sql);
				ps.setString(1,"D");
				ps.setInt(2,autor.getCodigo());
				
				ps.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new ServiceException("Error al eliminar "+e.getMessage());
			}
		}
	}
	
	public ArrayList<Autor> getAll() throws ServiceException{
		ArrayList<Autor> lista = new ArrayList<Autor>();
		Connection con = ConnectionBDD.connect("localhost",1460,"sa","passwordHere","cmc");
		String sql = "EXEC sp_autor @i_operacion=?";
		if (con!=null) {
			try {
				PreparedStatement ps = con.prepareCall(sql);
				ps.setString(1,"S");
				ResultSet rs = ps.executeQuery();
				Autor autor = null;
				while(rs.next()){
					autor = new Autor(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
					lista.add(autor);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new ServiceException("Error al obtener autores "+e.getMessage());
			}
		}
		return lista;
	}
	
	public Autor findByCode(int codigo) throws ServiceException{
		
		Connection con = ConnectionBDD.connect("localhost",1460,"sa","passwordHere","cmc");
		String sql = "EXEC sp_autor @i_operacion=?,@i_codigo=?";
		Autor autor = null;
		if (con!=null) {
			try {
				PreparedStatement ps = con.prepareCall(sql);
				ps.setString(1,"T");
				ps.setInt(2,codigo);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					autor = new Autor(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new ServiceException("Error al obtener autor por codigo "+e.getMessage());
			}
		}
		return autor;
	}
	
}
