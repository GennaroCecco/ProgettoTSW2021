package it.unisa.model;
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
	private static final String TABLE_NAME = "prodotto";
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
	public void doSave(ProdottoBean product) throws SQLException {
		Connection con = null;
		PreparedStatement prS = null;
		String insertSQL = "Insert into "+ TABLE_NAME +" (Id_Prodotto,Nome,Descrizione,Quantità,Prezzo)"
				+ " values(?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(insertSQL);
			
			prS.setInt(1, product.getIdProdotto());
			prS.setString(2, product.getNome());
			prS.setString(3,product.getDescrizione());
			prS.setInt(4, product.getQuantita());
			prS.setDouble(5, product.getPrezzo());
			
			
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
		String deleteSQL = "delete from "+TABLE_NAME+ " WHERE Id_Prodotto=?";
		
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
	        String selectQuery= "Select * from "+ TABLE_NAME+ " WHERE Id_Prodotto = ?";
	        ProdottoBean bean = new ProdottoBean();

	        try {
	            con = ds.getConnection();
	            prS = con.prepareStatement(selectQuery);
	            prS.setInt(1, code);

	            result = prS.executeQuery();

	            while(result.next()) {
	                bean.setIdProdotto(result.getInt("Id_Prodotto"));
	                bean.setNome(result.getString("Nome"));
	                bean.setDescrizione(result.getString("Descrizione"));
	                bean.setQuantita(result.getInt("Quantità"));
	                bean.setPrezzo(result.getDouble("Prezzo"));
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
		bean.setIdProdotto(result.getInt("Id_Prodotto"));
		bean.setNome(result.getString("Nome"));
		bean.setDescrizione(result.getString("Descrizione"));
		bean.setQuantita(result.getInt("Quantità"));
		bean.setPrezzo(result.getDouble("Prezzo"));
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
