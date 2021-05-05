package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

public interface ProdottoModel<T> {
	
	public void doSave(T product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public T doRetrieveByKey(int code) throws SQLException;
	
	public Collection<T> doRetrieveAll() throws SQLException;

}
