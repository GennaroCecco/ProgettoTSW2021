
package it.unisa.control;
import it.unisa.model.dao.*;
import it.unisa.model.bean.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private static UserDAO model = new UserDAO();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserBean user;
			user = (UserBean) request.getSession().getAttribute("Utente");
			if(user==null || !user.isValid()) {
				user = new UserBean();
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				user = model.doRetrieveUtente(email, password);
				if(user.isValid() && user.getRuolo().equalsIgnoreCase("utente")) {
					HttpSession sessione = request.getSession(true);
					sessione.setAttribute("Utente", user);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/indirizzo");
					dispatcher.forward(request, response);
				}
				else if(user.isValid() && user.getRuolo().equalsIgnoreCase("admin")) {
					HttpSession sessione = request.getSession(true);
					sessione.setAttribute("admin", user);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin");
					dispatcher.forward(request, response);
				}
				else {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginView.jsp");
					dispatcher.forward(request, response);
					
				}
			}
			else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/indirizzo");
			dispatcher.forward(request, response);
	}
			
			
		}catch(Throwable e) {
			System.out.println("Errore LoignControl: "+e.getMessage());
			e.printStackTrace();
		}
		
	
}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}
	
	

}
