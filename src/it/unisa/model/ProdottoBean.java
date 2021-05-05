package it.unisa.model;

public class ProdottoBean {
	private int idProdotto;
	private String nome;
	private String descrizione;
	private int quantita;
	private double prezzo;
	
	public ProdottoBean() {
		this.idProdotto = -1;
		this.nome = "";
		this.descrizione = "";
		this.quantita = -1;
		this.prezzo = -1;
	}
	
	public int getIdProdotto() {
		return idProdotto;
	}
	
	public String getNome() {
		return nome;
	}
	
	public String getDescrizione() {
		return descrizione;
	}
	
	public int getQuantita() {
		return quantita;
	}
	
	public double getPrezzo() {
		return prezzo;
	}
	
	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

}
