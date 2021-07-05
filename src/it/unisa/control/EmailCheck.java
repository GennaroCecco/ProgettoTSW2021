package it.unisa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.unisa.model.dao.UserDAO;
import it.unisa.model.bean.UserBean;



public class EmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final UserDAO model = new UserDAO();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean user;
		String email = request.getParameter("email");
	
		
		try {
			user = model.doRetrievebyemail(email);
			if(user!=null && user.isValid()) {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.print("Email già presente <br>");
			}
			
			
		} catch (SQLException e) {
			System.out.println("Errore EmailCheck: "+e.getMessage());
		}
		
		
		
		
		
	}

}
