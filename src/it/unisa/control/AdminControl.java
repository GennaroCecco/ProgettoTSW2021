package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.unisa.model.dao.*;
import it.unisa.model.bean.*;

public class AdminControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ProdottoDAO modelProd = new ProdottoDAO();
	private static final ComponiDAO modelComponi = new ComponiDAO();
	
	//credenziali per accedere alla sezione admin: email= pcworld.infoitalia@gmail.com password=Tsw12345@
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean stato=true;
		UserBean user = (UserBean) request.getSession().getAttribute("admin");
		if(user != null) {
			if(user.isValid()) {
				ArrayList<ProdottoBean> prodotti = new ArrayList<ProdottoBean>();
				try {
					prodotti = (ArrayList<ProdottoBean>) modelProd.doRetrieveAll();
				} catch (SQLException e) {
					System.out.println("Errore Admin Control:"+e.getMessage());
					e.printStackTrace();
				}
				
				if(prodotti!=null && prodotti.size()>0) {
					request.setAttribute("prodotti", prodotti);
				}
				
				
				
				String op= (String)request.getParameter("op");
				if(op!=null) {
					if(op.equalsIgnoreCase("modProd")) {
						int id = Integer.parseInt(request.getParameter("id"));
						try {
							stato=false;
							ProdottoBean bean = modelProd.doRetrieveByKey(id);
							request.setAttribute("bean", bean);
							RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/ModificaAdmin.jsp");
							dispatcher.forward(request, response);
						} catch (SQLException e) {
							System.out.println("Errore Admin Control: "+e.getMessage());
							e.printStackTrace();
						}
						
					}
					else if(op.equalsIgnoreCase("dettordini")) {
						int id = Integer.parseInt(request.getParameter("idOrdine"));
						ArrayList<ComponiBean> componi = new ArrayList<ComponiBean>();
						try {
							componi=modelComponi.doRetrieveByKey(id);
							if(componi!=null) {
								request.setAttribute("componi", componi);
							}
						} catch (SQLException e) {
							System.out.println("Errore Admin Control:"+e.getMessage());
							e.printStackTrace();
						}
					}
				}	
			}
		}
		else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error/errorpage.html");
			request.setAttribute("utente", user);
			dispatcher.forward(request, response);
			return;
		}
		if(stato) {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/Admin.jsp");
		dispatcher.forward(request, response);
		}
	

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
