<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Carrello carrello = (Carrello) request.getAttribute("carrello");
    	UserBean utente = (UserBean) request.getSession().getAttribute("Utente");
    	
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*"%>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Carrello</title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
<div class="content">

	<%if(carrello != null && carrello.getAllItem().size()>0){ %>
	<h2>Carrello</h2>
	<table class="table" border="1">
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
			<td><div class="iconRemove"><a href="./carrello?op=cancC&id=<%=bean.getProdottoID() %>"><img src="img/remove-from-cart.png"></a></div> </td>
		</tr>
		<%} %>
			
	</table>
	<br>
	<%if(utente!=null && utente.isValid()){%>
				<a href="./carrello?op=acquista">Acquista</a>
		<%}else{ %>
			<a href="login">Acquista</a>
		<%} %>
			
	<%}else{ %>
		<h2>Il carrello è vuoto</h2>
		<%} %>
		
</div>
	<br>
	<%@include file="topdown/footer.jsp" %>
</body>
</html>