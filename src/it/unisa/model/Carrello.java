package it.unisa.model;
import it.unisa.model.dao.*;

import java.io.IOException;
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
	
	public void addItem(int idProdotto) throws IOException {
		ProdottoCarrello item;
		ProdottoDAO model = new ProdottoDAO();
		boolean esito=true;
		for(int i=0; i<carrello.size();i++) {
			item = carrello.get(i);
			if(item.getProdottoID() == idProdotto) {
				esito=false;
				if(item.getNumProdotto()<item.getProdotto().getQuantita()) {
					item.incrementaNumProdotto();
					return;
				}
			}
		}
		if(esito) {
			try {
				ProdottoCarrello newItem = new ProdottoCarrello(model.doRetrieveByKey(idProdotto));
				carrello.add(newItem);
			}catch(SQLException e){
				System.out.println("Errore Carrello :"+e.getMessage());
			}
		}
	}
	
	public void setNumeroProdotto(int id, int n) throws IOException {
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
			System.out.println("Errore Carrello: "+e.getMessage());
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
	public int getNumeroOggCarrello(){
		int tot = 0;
		for(int i=0;i<carrello.size();i++) {
			tot+=carrello.get(i).getNumProdotto();
		}
		return tot;
	}
	
	public ProdottoCarrello getProdId(int id){
		for(int i=0;i<carrello.size();i++) {
			if(id==carrello.get(i).getProdottoID()) {
				return carrello.get(i);
			}
		}
		return null;
	}
	
	
}
