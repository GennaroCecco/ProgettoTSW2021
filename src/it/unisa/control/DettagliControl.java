package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import it.unisa.model.dao.ProdottoDAO;
import it.unisa.model.dao.UserDAO;
import it.unisa.model.dao.ValutazioneDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.unisa.model.*;
import it.unisa.model.bean.CommentoBean;
import it.unisa.model.bean.ProdottoBean;
import it.unisa.model.bean.UserBean;
import it.unisa.model.bean.ValutazioneBean;

public class DettagliControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProdottoDAO model = new ProdottoDAO();
	ValutazioneDAO modelVal = new ValutazioneDAO();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		ArrayList<ProdottoBean> prodotti = new ArrayList<ProdottoBean>();
		String tipologia = request.getParameter("tipologia");
		String like = null;
		try {
			prodotti = model.retrieveByType(tipologia, like);
			for (int i=0;i<prodotti.size();i++) {
				if (prodotti.get(i).getIdProdotto()==id) {
					prodotti.remove(i);
				}
				
			}
			for (int i=0;i<prodotti.size();i++) {
				if (prodotti.get(i).getQuantita()<=0) {
						prodotti.remove(i);
					}
				}
				ArrayList<CommentoBean> commenti= new ArrayList<CommentoBean>();
				commenti = modelVal.doRetrieveVal(id);
				request.setAttribute("prodotto", model.doRetrieveByKey(id));
			request.setAttribute("prodotti", prodotti);
			request.setAttribute("commenti", commenti);
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
