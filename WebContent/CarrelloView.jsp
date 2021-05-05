<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Carrello carrello = (Carrello) request.getAttribute("carrello");
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<head>
<meta charset="UTF-8">
<title>PCWorld</title>
</head>
<body>
	<%if(carrello != null && carrello.getAllItem().size()>0){ %>
	<h2>Carrello</h2>
	<a href="./catalogo">Home</a>
	<table border="1">
		<tr>
			<th>Nome</th>
			<th>Quantità</th>
			<th>Prezzo Totale</th>
			<th>Operazione</th>
		</tr>
		<%
			List<ProdottoCarrello> prodcarr = carrello.getAllItem();
			for(ProdottoCarrello bean: prodcarr){
				ProdottoBean beancart = bean.getProdotto();
			
		%>
		
		<tr>
			<td><%=beancart.getNome()%> </td>
			<form action="./carrello" method="get">
			<td><input type="number" name ="num" min="1" max="<%=beancart.getQuantita()%>" placeholder="<%=bean.getNumProdotto()%>">
			<input type="hidden" name="id" value="<%=beancart.getIdProdotto() %>">
			<input type="hidden" name="op" value="cambiaQ">
			<input type="submit" value="Aggiorna Quantità">
			</td>
			</form>
			<td><%=bean.getPrezzoTotale() %></td>
			<td><a href="./carrello?op=cancC&id=<%=bean.getProdottoID() %>">Rimuovi dal carrello </a> </td>
		</tr>
		<%} %>
	</table>
		<form action="./carrello" method="get">
			<input type="submit" name="op" value="Checkout">
		</form>
	<%}else{ %>
		<h2>Il carrello è vuoto</h2>
		<%} %>
	
</body>
</html>