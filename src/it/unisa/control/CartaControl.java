package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.bean.CartaBean;
import it.unisa.model.bean.UserBean;
import it.unisa.model.dao.PagamentoDAO;


public class CartaControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final PagamentoDAO model = new PagamentoDAO();  
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean user = (UserBean) request.getSession().getAttribute("Utente");
		try {
			CartaBean carta = model.doRetrieveCarta(user.getNumeroCarta());
			request.setAttribute("carta", carta);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserLoggedView.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
