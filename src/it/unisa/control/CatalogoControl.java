package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import it.unisa.model.dao.ProdottoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class CatalogoControl extends HttpServlet {
	private static final long serialVersionUID = 1656464L;
       static ProdottoDAO model = new ProdottoDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index = 0;
        if(request.getSession().getAttribute("index")==null)
        {
            request.getSession().setAttribute("index", index);
        }
        else index = (int) request.getSession().getAttribute("index");

			try {
				request.removeAttribute("prodotti");
				request.setAttribute("prodotti", model.doRetrieveAll());
			}catch(SQLException e) {
				System.out.println("Errore: "+e.getMessage());
			}
			  String action = request.getParameter("action");
			     if(action!=null) {
			  		int x = 0;
			        if(action.contentEquals("add"))
			        {
			            x = index++;
			            request.getSession().setAttribute("index", index++);
			        }
			        else if(action.contentEquals("sub"))
			        {
			            x = index--;
			            request.getSession().setAttribute("index", index--);
			        }
			        else if(action.contentEquals("set"))
			        {
			            x = Integer.parseInt(request.getParameter("index"));
			            index = x-1;
			            request.getSession().setAttribute("index", index);
			        }
			     }
			     
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CatalogoView.jsp");
		dispatcher.forward(request, response);
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
