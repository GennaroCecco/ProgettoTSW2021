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

public class DettagliControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProdottoDAO model = new ProdottoDAO();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		try {
			request.setAttribute("prodotto", model.doRetrieveByKey(id));
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
		if (carrello == null) {
			carrello = new Carrello();
			request.getSession().setAttribute("carrello", carrello);
		}
		String op = request.getParameter("op");
		if(op!=null) {
		if (op.equalsIgnoreCase("aggC")) {
			carrello.addItem(id);
		}
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DettagliView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
