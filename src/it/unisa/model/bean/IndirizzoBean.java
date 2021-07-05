package it.unisa.model.bean;

public class IndirizzoBean {
	private int idIndirizzo;
	private String citta;
	private String via;
	private int numeroCivico;
	private int piano;
	private int interno;
	private String scala;
	
	public IndirizzoBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getIdIndirizzo() {
		return idIndirizzo;
	}
	
	public String getCitta() {
		return citta;
	}
	public int getInterno() {
		return interno;
	}
	public int getNumeroCivico() {
		return numeroCivico;
	}
	public int getPiano() {
		return piano;
	}
	public String getScala() {
		return scala;
	}
	public String getVia() {
		return via;
	}
	public void setIdIndirizzo(int idIndirizzo) {
		this.idIndirizzo = idIndirizzo;
	}
	public void setCitta(String citta) {
		this.citta = citta;
	}
	public void setInterno(int interno) {
		this.interno = interno;
	}
	public void setNumeroCivico(int numeroCivico) {
		this.numeroCivico = numeroCivico;
	}
	public void setPiano(int piano) {
		this.piano = piano;
	}
	public void setScala(String scala) {
		this.scala = scala;
	}
	public void setVia(String via) {
		this.via = via;
	}

}
