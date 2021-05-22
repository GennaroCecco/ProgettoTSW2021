<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<?> prodotti = (ArrayList<?>) request.getAttribute("prodotti");
    	if(prodotti==null){
    		response.sendRedirect("./admin");
    		return;
    	}
    %>
    
    
<!DOCTYPE html>
<html>

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,it.unisa.model.bean.*" %>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Admin</title>
</head>
<body>
<%@include file="../topdown/headerAdmin.jsp" %>
<br>
<a href="logoutAdmin">Esci dall'area dell'aministratore</a>
<div class="content">
	<h2>Prodotti</h2>
	<table class="table" border="1">
		<tr>
			<th>ID</th>
			<th>Tipologia</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Quantità Disponibile</th>
			<th>IVA</th>
			<th>Operazione</th>
		</tr>
		<% 
		if(prodotti != null && prodotti.size() != 0){
			for(int i=0;i<prodotti.size();i++) {
				ProdottoBean bean = (ProdottoBean) prodotti.get(i);
				
	%>
	<tr>
		<td><%=bean.getIdProdotto()%></td>
		<td><%=bean.getTipologia()%></td>
		<td><%=bean.getNome()%></td>
		<td><%=bean.getDescrizione()%></td>
		<td>€<%=bean.getPrezzo()%></td>
		<td><%=bean.getQuantita()%></td>
		<td><%=bean.getIva()%></td>
		<td><div class="iconModify"><a href="./admin?op=modProd&id=<%=bean.getIdProdotto() %>"><img src="img/Modifica.png"></a></div></td>
		
		<%}} %>
	</table>
	<br>
	<h2>Inserisci un nuovo prodotto</h2><br>
	<form action="./insert" method="get">
		<label for="tipo">Inserisci Tipologia Prodotto</label><br>
			<input type="text" id= "tipo"name="tipologia"><br>
		<label for="nomeProd">Inserisci nome prodotto</label><br>
			<input type="text" id="nomeProd" name="nomeProd"><br>
		<label for="descr">Inserisci descrzione</label><br>
			<input type="text" id="descr" name="descrizione"><br>
		<label for="prezzo">Inserisci Prezzo</label><br>
			<input type="text" id="prezzo" name="prezzo"><br>
		<label for="quanti">Inserisci Quantità</label><br>
			<input type="text" id="quanti" name="quantita"><br>
		<label for="iva">Inserisci IVA</label><br>
			<input type="text" id="iva" name="iva"><br>
			
		<input type="submit" value="inserisci">
	</form>
	<br>
	
	<h2>Ricerca Ordini per Nominativo</h2><br>
	<form action="./ordiniAdmin" method="get">
		<label for="nomeUntente">Inserisci il nome dell'Utente</label><br>
		<input type="text" id="nomeUtente" name="nome"><br>
		<label for="cognomeUtente">Inserisci il cognome dell'uetnte</label><br>
		<input type="text" id="cognomeUtente" name="cognome"><br>
		<input type="submit" value="Cerca">
		<input type="hidden" name="op" value="ricercaN">
	</form>
	<br>
	<h2>Ricerca Ordini da data a data </h2><br>
	<form action="./ordiniAdmin" method="get">
		<label for="data1">Inserisci intervallo data</label><br>
		<input type="date" id="data1" name="data1"><br>
		<input type="date" name="data2"><br>
		<input type="submit" value="Cerca">
		<input type="hidden" name="op" value="ricercaD">
	</form>
</div>
</body>
</html>