package com.cmc.fase2.rest;

import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.cmc.fase2.entities.Autor;
import com.cmc.fase2.exceptions.ServiceException;
import com.cmc.fase2.services.AutorServices;

import com.cmc.fase2.dtos.SearchCode;

@Path("/autor")
public class AutorRest {
	
	@Path("/insert")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response insert(Autor autor){
		AutorServices as = new AutorServices();
		
		try {
			as.insert(new Autor(autor.getNombre(),autor.getApellido()));
			return Response.status(200).build();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			return Response.status(201).entity(e.getMessage()).build();
		}catch (Exception e) {
			return Response.status(500).entity(e.getMessage()).build();
		}
	}
	
	@Path("/update")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response update(Autor autor){
		AutorServices as = new AutorServices();
		
		try {
			as.update(new Autor(autor.getCodigo(),autor.getNombre(),autor.getApellido()));
			return Response.status(200).build();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			return Response.status(201).entity(e.getMessage()).build();
		}catch (Exception e) {
			return Response.status(500).entity(e.getMessage()).build();
		}
	}
	
	@Path("/delete")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response delete(Autor autor){
		AutorServices as = new AutorServices();
		
		try {
			as.delete(autor);
			return Response.status(200).build();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			return Response.status(201).entity(e.getMessage()).build();
		}catch (Exception e) {
			return Response.status(500).entity(e.getMessage()).build();
		}
	}
	
	@Path("/search")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response search(){
		AutorServices as = new AutorServices();
		ArrayList<Autor> lista;
		try {
			lista = as.getAll();
			return Response.status(200).entity(lista).build();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			return Response.status(404).entity(e.getMessage()).build();
		}catch (Exception e) {
			return Response.status(500).entity(e.getMessage()).build();
		}
	}
	
	@Path("/find")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response find(SearchCode searchCode){
		AutorServices as = new AutorServices();
		Autor autor;
		try {
			autor = as.findByCode(searchCode.getCode());
			return Response.status(200).entity(autor).build();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			return Response.status(404).entity(e.getMessage()).build();
		}catch (Exception e) {
			return Response.status(500).entity(e.getMessage()).build();
		}
	}
}
