package com.cmc.fase2.test;

import com.cmc.fase2.entities.Autor;
import com.cmc.fase2.exceptions.ServiceException;
import com.cmc.fase2.services.AutorServices;

public class Test2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AutorServices as = new AutorServices();
		
		try {
			as.update(new Autor(7,"Dome Patricia","Jimenez Martinez"));
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

}
