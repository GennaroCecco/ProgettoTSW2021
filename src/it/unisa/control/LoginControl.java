
package it.unisa.control;
import it.unisa.model.dao.*;
import it.unisa.model.bean.*;
import java.io.IOException;
import java.io.PrintWriter;

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
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				UserBean user = model.doRetrieveUtente(email, password);
				if (user!=null) {
					if(user.getRuolo().equalsIgnoreCase("utente") && user.isValid()) {
						
						HttpSession sessione = request.getSession(true);
						sessione.setAttribute("Utente", user);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/catalogo");
						dispatcher.forward(request, response);
						return;
					}
					else if (user.getRuolo().equalsIgnoreCase("admin") && user.isValid()){
						HttpSession sessione = request.getSession(true);
						sessione.setAttribute("admin", user);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/Admin.jsp");
						dispatcher.forward(request, response);
						return;
					}
				}
				else {
						String Alert = "Email o Password errata";
						request.setAttribute("Alert", Alert);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginView.jsp");
						dispatcher.forward(request, response);
						return;
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
