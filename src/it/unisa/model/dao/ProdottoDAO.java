package it.unisa.model.dao;
import it.unisa.model.bean.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProdottoDAO implements ProdottoModel<ProdottoBean>{
	private static final String TABLE_NAME = "articolo";
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
	
	
	@Override
	public void doSave(ProdottoBean prodotto) throws SQLException {
		Connection con = null;
		PreparedStatement prS = null;
		String insertSQL = "Insert into "+ TABLE_NAME +" (Tipologia,Nome,Descrizione,Prezzo,Quantità_Disponibile,IVA)"
				+ " values(?,?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(insertSQL);
			
			prS.setString(1, prodotto.getTipologia());
			prS.setString(2,prodotto.getDescrizione());
			prS.setInt(3, prodotto.getQuantita());
			prS.setDouble(4, prodotto.getPrezzo());
			prS.setInt(5, prodotto.getQuantita());
			prS.setDouble(6, prodotto.getIva());
			
			
		}finally {
			try {
				if(prS != null)
					prS.close();
				
			}finally {
				if(con != null)
					con.close();
				
			}
		}
		
	}
	
	@Override
	public boolean doDelete(int code) throws SQLException {
		Connection con = null;
		PreparedStatement prS = null;
		int result;
		String deleteSQL = "delete from "+TABLE_NAME+ " WHERE ID=?";
		
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(deleteSQL);
			prS.setInt(1, code);
			result = prS.executeUpdate();
				
		}finally {
			try {
				if(prS != null)
					prS.close();
			}finally {
				if(con != null)
					con.close();
			}
		}
		return (result != 0);
	}
	
	@Override
	public ProdottoBean doRetrieveByKey(int code) throws SQLException {
			ResultSet result;
	        Connection con = null;
	        PreparedStatement prS = null;
	        String selectQuery= "Select * from "+ TABLE_NAME+ " WHERE ID = ?";
	        ProdottoBean bean = new ProdottoBean();

	        try {
	            con = ds.getConnection();
	            prS = con.prepareStatement(selectQuery);
	            prS.setInt(1, code);

	            result = prS.executeQuery();

	            while(result.next()) {
	                bean.setIdProdotto(result.getInt("ID"));
	                bean.setTipologia(result.getString("Tipologia"));
	                bean.setNome(result.getString("Nome"));
	                bean.setDescrizione(result.getString("Descrizione"));
	                bean.setPrezzo(result.getDouble("Prezzo"));
	                bean.setQuantita(result.getInt("Quantità_Disponibile"));
	                bean.setIva(result.getDouble("IVA"));
	                
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
	        return bean;
	}

	@Override
	public Collection<ProdottoBean> doRetrieveAll() throws SQLException {
		Connection con = null;
		PreparedStatement prS = null;
		ResultSet result;
		Collection<ProdottoBean> prodotti = new ArrayList<ProdottoBean>();
		
		String SelectSQL = "Select * from " + TABLE_NAME;

		try {
		con = ds.getConnection();
		prS = con.prepareStatement(SelectSQL);
		result = prS.executeQuery();
		
		while(result.next()) {
			ProdottoBean bean = new ProdottoBean();
		bean.setIdProdotto(result.getInt("ID"));
		bean.setTipologia(result.getString("Tipologia"));
		bean.setNome(result.getString("Nome"));
		bean.setDescrizione(result.getString("Descrizione"));
		bean.setPrezzo(result.getDouble("Prezzo"));
		bean.setQuantita(result.getInt("Quantità_Disponibile"));
		bean.setIva(result.getDouble("IVA"));
		prodotti.add(bean);
		}
			}finally {
				try {
					if (prS != null)
						prS.close();
				}finally {
					if (con != null)
						con.close();
				}
			}
		return prodotti;
		}
}
