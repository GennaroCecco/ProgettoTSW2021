package it.unisa.model.bean;



public class ComponiBean {
	private int idArticolo;
	private int idOrdine;
	private double iva;
	private double prezzo;
	private int quantita;
	private String path,descrizione,tipologia;
	
	public ComponiBean() {
		
	}
	public int getIdArticolo() {
		return idArticolo;
	}
	public int getIdOrdine() {
		return idOrdine;
	}
	public double getIva() {
		return iva;
	}
	public double getPrezzo() {
		return prezzo;
	}
	 public int getQuantita() {
		return quantita;
	}
	
	 public void setIdArticolo(int idArticolo) {
		this.idArticolo = idArticolo;
	}
	 public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}
	 public void setIva(double iva) {
		this.iva = iva;
	}
	 public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	 public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	 public String getDescrizione() {
		return descrizione;
	}
	 public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	 public String getPath() {
		return path;
	}
	 public void setPath(String path) {
		this.path = path;
	}
	public String getTipologia() {
		return tipologia;
	}
	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}

}
