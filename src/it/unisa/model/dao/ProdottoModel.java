package it.unisa.model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

public interface ProdottoModel<T> {
	
	public void doSave(T product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public T doRetrieveByKey(int code) throws SQLException, IOException;
	
	public Collection<T> doRetrieveAll() throws SQLException;

}
