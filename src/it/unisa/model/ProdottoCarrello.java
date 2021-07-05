package it.unisa.model;
import it.unisa.model.bean.*;

public class ProdottoCarrello {
	private ProdottoBean prodotto;
	private int numProdotto = 1;
	
	public ProdottoCarrello(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}
	
	public ProdottoBean getProdotto() {
		return prodotto;
	}
	
	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}
	
	public int getProdottoID() {
		return this.prodotto.getIdProdotto();
	}
	
	public String getDescrizione() {
		return this.prodotto.getDescrizione();
	}
	
	public double getPrezzo() {
		return this.prodotto.getPrezzo();
	}
	
	public int getNumProdotto() {
		return numProdotto;
	}
	
	public void setNumProdotto(int n) {
		this.numProdotto = n;
	}
	
	public void incrementaNumProdotto() {
		setNumProdotto(getNumProdotto()+1);
	}
	
	public void cancellaProdotto() {
		setNumProdotto(0);
	}
	
	public double getPrezzoTotale() {
		return(getNumProdotto() * getPrezzo());
	}
}
