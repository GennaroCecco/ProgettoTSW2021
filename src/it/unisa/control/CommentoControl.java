package it.unisa.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.bean.UserBean;
import it.unisa.model.bean.ValutazioneBean;
import it.unisa.model.dao.ValutazioneDAO;


public class CommentoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ValutazioneDAO model = new ValutazioneDAO();
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean user = (UserBean) request.getSession().getAttribute("Utente");
		PrintWriter out = response.getWriter();
		ValutazioneBean val = new ValutazioneBean();
		response.setContentType("text/hmtl");
		if(user !=null && user.isValid()) {
			String com = request.getParameter("commento");
			int id = Integer.parseInt(request.getParameter("prod"));
			val.setIdUtente(user.getIdUtente());
			val.setIdArticolo(id);
			val.setCommento(com);
			Date data = new Date(System.currentTimeMillis());
			val.setData(data);
			try {
				model.doSave(val);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
			String result = "1";
			out.print(result);
		}else {
			out.print("0");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
