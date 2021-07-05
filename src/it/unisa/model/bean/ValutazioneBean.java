package it.unisa.model.bean;

import java.sql.Date;

public class ValutazioneBean {
	private int idUtente,idArticolo;
	private String commento;
	private Date data;
	
	public ValutazioneBean() {
		
	}
	
	public String getCommento() {
		return commento;
	}
	public Date getData() {
		return data;
	}
	public int getIdArticolo() {
		return idArticolo;
	}
	public int getIdUtente() {
		return idUtente;
	}
	public void setCommento(String commento) {
		this.commento = commento;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public void setIdArticolo(int idArticolo) {
		this.idArticolo = idArticolo;
	}
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}
	
}
