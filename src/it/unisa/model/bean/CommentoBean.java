package it.unisa.model.bean;

import java.sql.Date;

public class CommentoBean {
	private String nome,cognome,commento;
	private Date data;

	public CommentoBean() {
	}
	public String getCognome() {
		return cognome;
	}
	public String getCommento() {
		return commento;
	}
	public Date getData() {
		return data;
	}
	public String getNome() {
		return nome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public void setCommento(String commento) {
		this.commento = commento;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
