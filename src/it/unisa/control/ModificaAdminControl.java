package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.dao.ProdottoDAO;


public class ModificaAdminControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ProdottoDAO modelProd = new ProdottoDAO();

    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		try {
			int id= Integer.parseInt(request.getParameter("id"));
			
			String tipologia = request.getParameter("tipologia");
			if(tipologia!=null && !tipologia.equalsIgnoreCase("")) {
				modelProd.refreshTipologia(id, tipologia);
			}
			String nome = request.getParameter("nome");
			if(nome!=null && !nome.equalsIgnoreCase("")) {
				modelProd.refreshNome(id, nome);
			}
			String descrizione = request.getParameter("descrizione");
			if(descrizione!=null && !descrizione.equalsIgnoreCase("")) {
				modelProd.refreshDescrizione(id, descrizione);
			}
			Double prezzo = Double.parseDouble(request.getParameter("prezzo"));
			if( prezzo>0 && prezzo!=null) {
				modelProd.refreshPrezzo(id, prezzo);
			}
			Integer quantita = Integer.parseInt(request.getParameter("quantita"));
			if(quantita>=0 && quantita!=null) {
				modelProd.refreshQuantita(id, quantita);
			}
			Double iva = Double.parseDouble(request.getParameter("iva"));
			if(iva>0 && iva<1 && iva!=null) {
				modelProd.refreshIVA(id, iva);
			}
		}
		catch(SQLException e) {
			System.out.println("Errore Admin Control:"+e.getMessage());
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
