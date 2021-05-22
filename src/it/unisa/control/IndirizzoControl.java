package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.bean.IndirizzoBean;
import it.unisa.model.bean.UserBean;
import it.unisa.model.dao.IndirizzoDAO;



public class IndirizzoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private static final IndirizzoDAO model = new IndirizzoDAO(); 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean user = (UserBean) request.getSession().getAttribute("Utente");
		try {
			IndirizzoBean indirizzo = model.doRetrieveIndirizzo(user);
			request.setAttribute("indirizzo", indirizzo);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carta");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
