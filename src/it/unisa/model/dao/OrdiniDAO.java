package it.unisa.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import it.unisa.model.Carrello;
import it.unisa.model.ProdottoCarrello;
import it.unisa.model.bean.OrdineBean;
import it.unisa.model.bean.ProdottoBean;
import it.unisa.model.bean.UserBean;

public class OrdiniDAO {
	private static final String TABLE_NAME_Ordine = "ordine";
	
	private static DataSource ds;
	
	static {
		try {
			Context init = new InitialContext();
			Context env = (Context) init.lookup("java:comp/env");
			
			ds = (DataSource) env.lookup("jdbc/tsw");
		}catch(NamingException e) {
			System.out.println("Errore OrdiniDAO: "+ e.getMessage());
		}
	}

	public void doSave(OrdineBean ordine) throws SQLException {
		Connection con = null;
		PreparedStatement prSOrdine = null;
		
		String insertOrdineSQL = "insert into "+TABLE_NAME_Ordine+" (Stato,Data,ID_Utente)"
								+" values(?,?,?)";
		
		try {
			con = ds.getConnection();
			prSOrdine = con.prepareStatement(insertOrdineSQL);
			prSOrdine.setString(1, ordine.getStato());
			prSOrdine.setDate(2, ordine.getData());
			prSOrdine.setInt(3, ordine.getIdUtente());
			
			prSOrdine.executeUpdate();
		}finally {
			try {
				if(prSOrdine!=null) {
					prSOrdine.close();
				}
			}finally {
				if(con != null)
					con.close();
				
			}
		}
		
	}
	
	public OrdineBean doRetrieveByKey(int idUtente)throws SQLException {
		Connection con = null;
		PreparedStatement prSOrdine = null;
		ResultSet result;
		OrdineBean ordine = new OrdineBean();
		String selectSQL = "select * from "+TABLE_NAME_Ordine+" where ID_Utente = ?";
		
		try {
			con = ds.getConnection();
			prSOrdine = con.prepareStatement(selectSQL);
			prSOrdine.setInt(1,idUtente);
			result = prSOrdine.executeQuery();
			while(result.next()) {
				ordine.setIdOrdine(result.getInt("ID"));
				ordine.setData(result.getDate("Data"));
				ordine.setStato(result.getString("Stato"));
				ordine.setIdUtente(result.getInt("ID_Utente"));
				
			}
			
		}finally {
			try {
				if(prSOrdine!=null)
					prSOrdine.close();
				
			}finally {
				if(con!=null)
					con.close();
			}
		}
		return ordine;
	}
	
	public ArrayList<OrdineBean> doRetrieveAll(int idUtente) throws SQLException {
		Connection con = null;
		PreparedStatement prSOrdine = null;
		ResultSet result;
		ArrayList<OrdineBean> ordini = new ArrayList<OrdineBean>();
		String selectSQL = "select * from "+TABLE_NAME_Ordine+" where ID_Utente = ?";
		
		try {
			con = ds.getConnection();
			prSOrdine = con.prepareStatement(selectSQL);
			prSOrdine.setInt(1,idUtente);
			result = prSOrdine.executeQuery();
			while(result.next()) {
				OrdineBean ordine = new OrdineBean();
				ordine.setIdOrdine(result.getInt("ID"));
				ordine.setData(result.getDate("Data"));
				ordine.setStato(result.getString("Stato"));
				ordine.setIdUtente(result.getInt("ID_Utente"));
				ordini.add(ordine);
			}
			
		}finally {
			try {
				if(prSOrdine!=null)
					prSOrdine.close();
				
			}finally {
				if(con!=null)
					con.close();
			}
		}
		return ordini;
	}
	
}
