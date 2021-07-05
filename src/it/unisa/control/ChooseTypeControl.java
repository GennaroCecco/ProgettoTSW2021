package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import it.unisa.model.dao.ProdottoDAO;
import it.unisa.model.bean.ProdottoBean;

public class ChooseTypeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private static final ProdottoDAO model = new ProdottoDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ProdottoBean> prodotti = new ArrayList<ProdottoBean>();
		String tipologia = request.getParameter("tipologia");
		String like = request.getParameter("like");
		String search = request.getParameter("search");
		
		try {
			if(tipologia!=null || like!=null) {
			prodotti = model.retrieveByType(tipologia,like);
			}
			else {
				prodotti = model.search(search);
			}
			if(prodotti!=null) {
				
				request.setAttribute("prodotti", prodotti);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Tipologia.jsp");
				dispatcher.forward(request, response);
				return;
			}
		} catch (SQLException e) {
			System.out.println("Errore in ChooseTypeContorl :"+e.getMessage());
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/catalogo");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
