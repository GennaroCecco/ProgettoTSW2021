package it.unisa.model.bean;

import java.sql.Date;

public class OrdineBean {
	private int idOrdine;
	private String stato;
	private Date data;
	private int idUtente;
	
	public OrdineBean() {
		
	}
	
	public Date getData() {
		return data;
	}
	public int getIdOrdine() {
		return idOrdine;
	}
	public int getIdUtente() {
		return idUtente;
	}
	public String getStato() {
		return stato;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}
	public void setStato(String stato) {
		this.stato = stato;
	}
}

