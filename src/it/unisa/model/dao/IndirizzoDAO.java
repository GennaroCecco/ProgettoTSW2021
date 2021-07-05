package it.unisa.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import it.unisa.model.bean.IndirizzoBean;
import it.unisa.model.bean.UserBean;

public class IndirizzoDAO {
	private static final String TABLE_NAME_Indirizzo = "Indirizzo";
	private static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			Context env = (Context) init.lookup("java:comp/env");
			
			ds = (DataSource) env.lookup("jdbc/tsw");
			
		}catch(NamingException e) {
			System.out.println("Errore: "+e.getMessage());
		}
	}
	
	public void doSave(IndirizzoBean indirizzo,UserBean user) throws SQLException{
		Connection con = null;
		PreparedStatement prSIndirizzo = null;
		
		String insertIndirizzoSQL = "insert into "+ TABLE_NAME_Indirizzo+" (ID,Citta,Via,Numero_Civico,Piano,Interno,Scala)"+
									" values(?,?,?,?,?,?,?)";
		try {
			con = ds.getConnection();
			prSIndirizzo = con.prepareStatement(insertIndirizzoSQL);
			prSIndirizzo.setInt(1,user.getIdUtente());
			prSIndirizzo.setString(2,indirizzo.getCitta());
			prSIndirizzo.setString(3,indirizzo.getVia());
			prSIndirizzo.setInt(4,indirizzo.getNumeroCivico());
			prSIndirizzo.setInt(5,indirizzo.getPiano());
			prSIndirizzo.setInt(6, indirizzo.getInterno());
			prSIndirizzo.setString(7, indirizzo.getScala());
			
			prSIndirizzo.executeUpdate();
			
		}finally {
			try {
				if(prSIndirizzo != null) {
					prSIndirizzo.close();
				}
			}finally {
				if(con != null) {
					con.close();
				}
				
			}
		}
		
	}
	public IndirizzoBean doRetrieveIndirizzo(UserBean user) throws SQLException{
		ResultSet result;
        Connection con = null;
        PreparedStatement prS = null;
        String selectQuery = "Select * from "+TABLE_NAME_Indirizzo+" WHERE ID = ?";
        IndirizzoBean indirizzo = new IndirizzoBean();
        try {
        	con = ds.getConnection();
        	prS = con.prepareStatement(selectQuery);
        	prS.setInt(1, user.getIdUtente());
        	result = prS.executeQuery();
        	while(result.next()) {
        		indirizzo.setIdIndirizzo(result.getInt("ID"));
        		indirizzo.setCitta(result.getString("Citta"));
        		indirizzo.setVia(result.getString("Via"));
        		indirizzo.setNumeroCivico(result.getInt("Numero_Civico"));
        		indirizzo.setPiano(result.getInt("Piano"));
        		indirizzo.setInterno(result.getInt("Interno"));
        		indirizzo.setScala(result.getString("Scala"));
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
        return indirizzo;
	}
	
}
