package it.unisa.model.bean;

import java.sql.Date;

public class CartaBean {
	private int codiceSegreto;
	private String numeroCarta;
	private Date dataScadenza;
	private String circuito;
	
	public CartaBean() {
		// TODO Auto-generated constructor stub
	}

	public String getCircuito() {
		return circuito;
	}
	public int getCodiceSegreto() {
		return codiceSegreto;
	}
	public Date getDataScadenza() {
		return dataScadenza;
	}
	public String getNumeroCarta() {
		return numeroCarta;
	}
	public void setCircuito(String circuito) {
		this.circuito = circuito;
	}
	public void setCodiceSegreto(int codiceSegreto) {
		this.codiceSegreto = codiceSegreto;
	}
	public void setDataScadenza(Date data) {
		this.dataScadenza = data;
	}
	public void setNumeroCarta(String numeroCarta) {
		this.numeroCarta = numeroCarta;
	}
	
}
