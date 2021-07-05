package it.unisa.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import it.unisa.model.bean.CommentoBean;
import it.unisa.model.bean.ValutazioneBean;

public class ValutazioneDAO {
	private static final String TABLE = "Valutazione";
	private static DataSource ds;
	
	static {
		try {
			Context init = new InitialContext();
			Context env = (Context) init.lookup("java:comp/env");
			
			ds = (DataSource) env.lookup("jdbc/tsw");
		}catch(NamingException e) {
			System.out.println("Errore ComponiDAO: "+ e.getMessage());
		}
	}
	
	public void doSave(ValutazioneBean val) throws SQLException{
		Connection con = null;
		PreparedStatement prS = null;
		
		String insertSQL = "insert into "+TABLE+" (ID_Utente, ID_Articolo, Commento, Data)"
				+" values(?,?,?,?)";
		
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(insertSQL);
			
			prS.setInt(1, val.getIdUtente());
			prS.setInt(2, val.getIdArticolo());
			prS.setString(3,val.getCommento());
			prS.setDate(4, val.getData());
			
			prS.executeUpdate();
		}finally {
			try {
				if(prS!=null)
					prS.close();
				
			}finally {
				if(con!=null)
					con.close();
			}
		}
		
	}
	
	
	public ArrayList<ValutazioneBean> doRetrieveAll(int idArticolo) throws SQLException{
		Connection con = null;
		PreparedStatement prS = null;
		ResultSet result;
		ArrayList<ValutazioneBean> all = new ArrayList<ValutazioneBean>();
		
		
		String select = "select * from "+TABLE +" WHERE ID_Articolo = ?";
		
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(select);
			prS.setInt(1, idArticolo);
			
			result = prS.executeQuery();
			
			while(result.next()) {
				ValutazioneBean val = new ValutazioneBean();
				val.setIdArticolo(result.getInt("ID_Articolo"));
				val.setIdUtente(result.getInt("ID_Utente"));
				val.setCommento(result.getString("Commento"));
				val.setData(result.getDate("Data"));
				all.add(val);
			}
		}finally {
			try {
				if(prS!=null)
					prS.close();
				
			}finally {
				if(con!=null)
					con.close();
			}
		}
		return all;
	}
	
	public ArrayList<CommentoBean> doRetrieveVal(int id) throws SQLException{
		ResultSet result;
        Connection con = null;
        PreparedStatement prS = null;
        String select = "select Nome,Cognome,Data,Commento from Utente,Valutazione where ID_Articolo = ? and ID_Utente = ID ";
        ArrayList<CommentoBean> commenti= new ArrayList<CommentoBean>();
        try {
        	con = ds.getConnection();
        	prS = con.prepareStatement(select);
        	prS.setInt(1, id);
        	result = prS.executeQuery();
     
        		while(result.next()) {
        			CommentoBean com = new CommentoBean();
        			com.setNome(result.getString("Nome"));
        			com.setCognome(result.getString("Cognome"));
        			com.setData(result.getDate("Data"));
        			com.setCommento(result.getString("Commento"));
        			commenti.add(com);
        		}
        		
        	
        }finally {
        	try {
        		if(prS != null)
        			prS.close();
        		
        	}finally {
        		if(con != null)
        			con.close();
        	}
        }
        return commenti;
	}
}
