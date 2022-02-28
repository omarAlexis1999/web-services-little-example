package com.cmc.fase2.test;

import java.util.ArrayList;

import com.cmc.fase2.entities.Autor;
import com.cmc.fase2.exceptions.ServiceException;
import com.cmc.fase2.services.AutorServices;

public class Test4 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AutorServices as = new AutorServices();
		
		ArrayList<Autor> lista;
		try {
			lista = as.getAll();
			System.out.println(lista);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		
	}
}
