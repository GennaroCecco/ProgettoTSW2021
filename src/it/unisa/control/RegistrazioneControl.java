package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import it.unisa.model.dao.*;
import it.unisa.model.bean.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class RegistrazioneControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private static final UserDAO modelUser = new UserDAO();
   
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			UserBean user = new UserBean();
			user.setNome(request.getParameter("nm"));
			user.setCognome(request.getParameter("cgm"));
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("psw"));
			modelUser.doSave(user);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);	
		}catch(SQLException e) {
			
			e.printStackTrace();
		}
	}

}
