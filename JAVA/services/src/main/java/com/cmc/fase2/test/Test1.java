package com.cmc.fase2.test;

import com.cmc.fase2.entities.Autor;
import com.cmc.fase2.exceptions.ServiceException;
import com.cmc.fase2.services.AutorServices;

public class Test1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AutorServices as = new AutorServices();
		
		try {
			as.insert(new Autor("Karla","Jimenez"));
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}
	}

}
