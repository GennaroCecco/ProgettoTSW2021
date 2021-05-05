package it.unisa.control;
import it.unisa.model.*;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.*;


public class CarrelloControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ProdottoDAO model = new ProdottoDAO();
    
    public CarrelloControl() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Carrello carrello = (Carrello)request.getSession().getAttribute("carrello");
		int id=0;
		boolean state=false;
		if(carrello == null) {
			carrello = new Carrello();
			request.getSession().setAttribute("carrello", carrello);
		}
		String op = request.getParameter("op");
		
		if(op != null) {
			
			if(op.equalsIgnoreCase("aggC")) {
				 id = Integer.parseInt(request.getParameter("id"));
				carrello.addItem(id);
			}
			else if(op.equalsIgnoreCase("cancC")) {
				 id = Integer.parseInt(request.getParameter("id"));
				carrello.deleteItem(id);
				}
			else if(op.equalsIgnoreCase("cambiaQ")) {
				id = Integer.parseInt(request.getParameter("id"));
				int num = Integer.parseInt(request.getParameter("num"));
				carrello.setNumeroProdotto(id, num);
			}
			else if(op.equalsIgnoreCase("Checkout")) {
				carrello.deleteAll();
				response.sendRedirect("Checkout.html");
				state=true;
			}
		}
		
		request.getSession().setAttribute("carrello", carrello);
		request.setAttribute("carrello", carrello);
		if(state == false) {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CarrelloView.jsp");
		dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
