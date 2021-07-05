package it.unisa.model.dao;
import it.unisa.model.bean.*;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
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
		String insertSQL = "Insert into "+ TABLE_NAME +" (Tipologia,Nome,Descrizione,Prezzo,Quantita_Disponibile,IVA,Image)"
				+ " values(?,?,?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(insertSQL);
			
			prS.setString(1, prodotto.getTipologia());
			prS.setString(2,prodotto.getNome());
			prS.setString(3, prodotto.getDescrizione());
			prS.setDouble(4, prodotto.getPrezzo());
			prS.setInt(5, prodotto.getQuantita());
			prS.setDouble(6, prodotto.getIva());
			prS.setString(7, prodotto.getPath());
			
			prS.executeUpdate();
			
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
	public ProdottoBean doRetrieveByKey(int code) throws SQLException, IOException {
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
	                bean.setQuantita(result.getInt("Quantita_Disponibile"));
	                bean.setIva(result.getDouble("IVA"));
	                bean.setPath(result.getString("Image"));
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
	public ArrayList<ProdottoBean> doRetrieveAll() throws SQLException {
		Connection con = null;
		PreparedStatement prS = null;
		ResultSet result;
		ArrayList<ProdottoBean> prodotti = new ArrayList<ProdottoBean>();
		
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
		bean.setQuantita(result.getInt("Quantita_Disponibile"));
		bean.setIva(result.getDouble("IVA"));
		bean.setPath(result.getString("Image"));
		
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
	public void refreshQuantitaTot(int id, int quanti) throws SQLException{
		Connection con = null;
		PreparedStatement prS = null;
		
		String update = "UPDATE articolo SET Quantita_Disponibile = Quantita_Disponibile- ? WHERE ID = ? ";
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(update);
			prS.setInt(1, quanti);
			prS.setInt(2, id);
			
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
	public void refreshQuantita(int id, int quanti) throws SQLException{
		Connection con = null;
		PreparedStatement prS = null;
		
		String update = "UPDATE articolo SET Quantita_Disponibile = ? WHERE ID = ? ";
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(update);
			prS.setInt(1, quanti);
			prS.setInt(2, id);
			
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
	public ArrayList<ProdottoBean> searchForName(String nome) throws SQLException {
		Connection con = null;
		PreparedStatement prS = null;
		ResultSet result = null;
		ArrayList<ProdottoBean> prod = new ArrayList<ProdottoBean>();
		String search = "Select * from articolo where Tipologia = ?";
		
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(search);
			prS.setString(1, nome);
			
			result = prS.executeQuery();
			
			while(result.next()) {
				ProdottoBean bean = new ProdottoBean();
				bean.setIdProdotto(result.getInt("ID"));
				bean.setNome(result.getString("Nome"));
				bean.setTipologia(result.getString("Tipologia"));
				bean.setDescrizione(result.getString("Descrizione"));
				bean.setPrezzo(result.getDouble("Prezzo"));
				bean.setQuantita(result.getInt("Quantita_Disponibile"));
				bean.setIva(result.getDouble("IVA"));
				prod.add(bean);
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
		return prod;
	}
	
	
	public void refreshDescrizione(int id, String dz) throws SQLException{
        Connection con = null;
        PreparedStatement prS = null;

        String update = "UPDATE articolo SET Descrizione =  ? WHERE ID = ? ";
        try {
            con = ds.getConnection();
            prS = con.prepareStatement(update);
            prS.setString(1, dz);
            prS.setInt(2, id);

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
public void refreshNome(int id, String nm) throws SQLException{
        Connection con = null;
        PreparedStatement prS = null;

        String update = "UPDATE articolo SET Nome = ? WHERE ID = ? ";
        try {
            con = ds.getConnection();
            prS = con.prepareStatement(update);
            prS.setString(1, nm);
            prS.setInt(2, id);

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
public void refreshPrezzo(int id, double pr) throws SQLException{
        Connection con = null;
        PreparedStatement prS = null;

        String update = "UPDATE articolo SET Prezzo = ? WHERE ID = ? ";
        try {
            con = ds.getConnection();
            prS = con.prepareStatement(update);
            prS.setDouble(1, pr);
            prS.setInt(2, id);

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

public void refreshTipologia(int id,String tipologia) throws SQLException {
    Connection con = null;
    PreparedStatement prS = null;

    String updateSQL = "Update articolo set Tipologia = ? Where ID = ?";

    try {
        con = ds.getConnection();
        prS = con.prepareStatement(updateSQL);

        prS.setString(1, tipologia);
        prS.setInt(2, id);

        prS.executeUpdate();
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

public void refreshIVA(int id,double IVA) throws SQLException {
    Connection con = null;
    PreparedStatement prS = null;

    String updateSQL = "Update articolo set IVA = ? Where ID = ?";

    try {
        con = ds.getConnection();
        prS = con.prepareStatement(updateSQL);

        prS.setDouble(1, IVA);
        prS.setInt(2, id);

        prS.executeUpdate();
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
	public ArrayList<ProdottoBean> retrieveByType(String type,String like) throws SQLException{
		Connection con = null;
		PreparedStatement prS = null;
		ResultSet result;
		ArrayList<ProdottoBean>prodotti = new ArrayList<ProdottoBean>();
		String selectSQL = "select * from "+ TABLE_NAME+" where tipologia = ?";
		String searchSQLCompletely = "Select * from "+TABLE_NAME+" where tipologia = ? and descrizione like ?";

		try {
			con = ds.getConnection();
			if(like==null) {
			prS = con.prepareStatement(selectSQL);
			prS.setString(1, type);
			result = prS.executeQuery();
				while(result.next()) {
					ProdottoBean bean = new ProdottoBean();
					bean.setIdProdotto(result.getInt("ID"));
					bean.setTipologia(result.getString("Tipologia"));
					bean.setNome(result.getString("Nome"));
					bean.setDescrizione(result.getString("Descrizione"));
					bean.setPrezzo(result.getDouble("Prezzo"));
					bean.setQuantita(result.getInt("Quantita_Disponibile"));
					bean.setIva(result.getDouble("IVA"));
					bean.setPath(result.getString("Image"));
					prodotti.add(bean);
				}
			}else {
				like = "%"+like+"%";
				prS = con.prepareStatement(searchSQLCompletely);
				prS.setString(1, type);
				prS.setString(2, like);
				result = prS.executeQuery();
				while(result.next()) {
					ProdottoBean bean = new ProdottoBean();
					bean.setIdProdotto(result.getInt("ID"));
					bean.setTipologia(result.getString("Tipologia"));
					bean.setNome(result.getString("Nome"));
					bean.setDescrizione(result.getString("Descrizione"));
					bean.setPrezzo(result.getDouble("Prezzo"));
					bean.setQuantita(result.getInt("Quantita_Disponibile"));
					bean.setIva(result.getDouble("IVA"));
					bean.setPath(result.getString("Image"));
					prodotti.add(bean);
				}
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
		return prodotti;
	}
	
	public ArrayList<ProdottoBean> search(String like) throws SQLException{
		Connection con = null;
		PreparedStatement prS = null;
		ResultSet result;
		ArrayList<ProdottoBean>prodotti = new ArrayList<ProdottoBean>();
		String searchSQL = "Select * from "+TABLE_NAME+" where descrizione like ? || Tipologia like ? ||Nome like ?";
		try {
			con = ds.getConnection();
			prS = con.prepareStatement(searchSQL);
			like = "%"+like+"%";
			prS.setString(1, like);
			prS.setString(2, like);
			prS.setString(3, like);
			result = prS.executeQuery();
			while(result.next()) {
				ProdottoBean bean = new ProdottoBean();
				bean.setIdProdotto(result.getInt("ID"));
				bean.setTipologia(result.getString("Tipologia"));
				bean.setNome(result.getString("Nome"));
				bean.setDescrizione(result.getString("Descrizione"));
				bean.setPrezzo(result.getDouble("Prezzo"));
				bean.setQuantita(result.getInt("Quantita_Disponibile"));
				bean.setIva(result.getDouble("IVA"));
				bean.setPath(result.getString("Image"));
				prodotti.add(bean);
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
		return prodotti;
	}
}
