package it.unisa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.Carrello;
import it.unisa.model.ProdottoCarrello;


public class ElemCarrelloCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Carrello cart = (Carrello) request.getSession().getAttribute("carrello");
		PrintWriter out = response.getWriter();
		if(cart==null || cart.getAllItem().size()==0) {
			response.setContentType("text/html");
			out.print(0);
		}else {
			response.setContentType("text/html");
			int tot= cart.getNumeroOggCarrello();
			 out.print(tot);
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
