package it.unisa.model;
import java.sql.SQLException;
import java.util.*;
public class Carrello {
	private ArrayList<ProdottoCarrello> carrello;
	
	public Carrello() {
		this.carrello = new ArrayList<ProdottoCarrello>();
	}
	
	public List<ProdottoCarrello> getAllItem(){
		return carrello;
	}
	
	public void addItem(int idProdotto) {
		ProdottoCarrello item;
		ProdottoDAO model = new ProdottoDAO();
		for(int i=0; i<carrello.size();i++) {
			item = carrello.get(i);
			if(item.getProdottoID() == idProdotto) {
				item.incrementaNumProdotto();
				return;
			}
		}
		try {
			ProdottoCarrello newItem = new ProdottoCarrello(model.doRetrieveByKey(idProdotto));
			carrello.add(newItem);
		}catch(SQLException e){
			System.out.println("Errore :"+e.getMessage());
		}
	}
	
	public void setNumeroProdotto(int id, int n) {
		ProdottoCarrello item;
		ProdottoDAO model = new ProdottoDAO();
		for(int i=0;i<carrello.size();i++) {
			item = (ProdottoCarrello) carrello.get(i);
			if(item.getProdottoID()==id) {
				if(n<=0) {
					carrello.remove(i);
				}
				else {
					item.setNumProdotto(n);
				}
				return;
			}
		}
		try {
			ProdottoCarrello newItem = new ProdottoCarrello(model.doRetrieveByKey(id));
			carrello.add(newItem);
		}catch(SQLException e) {
			System.out.println("Errore: "+e.getMessage());
		}
		
	}
	public void deleteItem(int id) {
		ProdottoCarrello item;
		for(int i=0;i<carrello.size();i++) {
			item = carrello.get(i);
			if(item.getProdottoID() == id) {
				carrello.remove(i);
			}
		}
	}
	public void deleteAll() {
		carrello.clear();
	}
	
	
}
