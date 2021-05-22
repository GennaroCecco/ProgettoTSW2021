package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import it.unisa.model.dao.ProdottoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.*;


public class CatalogoControl extends HttpServlet {
	private static final long serialVersionUID = 1656464L;
       static ProdottoDAO model = new ProdottoDAO();
    
    public CatalogoControl() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		Carrello carrello = (Carrello)request.getSession().getAttribute("carrello");
		if(carrello == null) {
			carrello = new Carrello();
			request.getSession().setAttribute("carrello", carrello);
		}
		if(op != null) {
			if(op.equalsIgnoreCase("aggC")) {
				int id = Integer.parseInt(request.getParameter("id"));
				carrello.addItem(id);
				
			}
		}
		
		try {
			request.removeAttribute("prodotti");
			request.setAttribute("prodotti", model.doRetrieveAll());
		}catch(SQLException e) {
			System.out.println("Errore: "+e.getMessage());
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CatalogoView.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
