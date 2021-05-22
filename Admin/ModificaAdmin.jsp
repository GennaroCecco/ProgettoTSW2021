<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ProdottoBean bean = (ProdottoBean) request.getAttribute("bean");
    	
    %>
    
<!DOCTYPE html>
<html>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,it.unisa.model.bean.*" %>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Admin-Modifica</title>
</head>
<body>
<%@include file="../topdown/headerAdmin.jsp" %>
<br>
<h2>Modifica Prodotto</h2><br>
<a href="./admin">Home Admin</a><br>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Tipologia</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Quantità Disponibile</th>
			<th>IVA</th>
		</tr>
		<tr>
			<form action="./modifica" method="get">
				<td><input type="number"name="id" value="<%=bean.getIdProdotto()%>"></td>
				<td><input type="text" name="tipologia" value="<%=bean.getTipologia() %>"></td>
				<td><input type="text" name="nome" value="<%=bean.getNome()%>"></td>
				<td><input type="text" name="descrizione" value="<%=bean.getDescrizione()%>"></td>
				<td><input type="text" name="prezzo" value="<%=bean.getPrezzo()%>"></td>
				<td><input type="text" name="quantita" value="<%=bean.getQuantita()%>"></td>
				<td><input type="text" name="iva" value="<%=bean.getIva()%>"></td>
				<br>
				<input type="submit" value="Modifica">
			</form>
		</tr>
		
	</table>

</body>
</html>