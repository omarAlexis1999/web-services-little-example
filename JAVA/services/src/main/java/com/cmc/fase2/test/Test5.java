package com.cmc.fase2.test;

import com.cmc.fase2.entities.Autor;
import com.cmc.fase2.exceptions.ServiceException;
import com.cmc.fase2.services.AutorServices;

public class Test5 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AutorServices as = new AutorServices();
		
		Autor autor;
		try {
			autor = as.findByCode(7);
			System.out.println(autor);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		
	}
}
