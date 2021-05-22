<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	UserBean user = (UserBean) request.getSession().getAttribute("Utente");
    	IndirizzoBean indi = (IndirizzoBean) request.getAttribute("indirizzo");
    	CartaBean carta = (CartaBean) request.getAttribute("carta");
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*"%>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Ciao <%=user.getNome() %></title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
<div class="content">
	<table class="table" border="1">
		<tr>
			<th>Nome</th>
			<th>Cognome</th>
			<th>Città</th>
			<th>Numero Carta</th>
		</tr>
		<tr>
			<td><%=user.getNome() %></td>
			<td><%=user.getCognome() %></td>
			<%if(indi!=null && carta!=null){ %>
			<td><%=indi.getCitta() %></td>
			<td><%=carta.getNumeroCarta() %></td>
			<%} %>
		</tr>		
	</table>
	<br>
		<a href="./logout">Esci </a><br>
		<a href="./ordini">Vai ai tuoi Ordini</a><br>
		<a href="./catalogo">Vai al Catalogo</a><br>
		<%if(user.getNumeroCarta()==null){ %>
			<a href="CompletaConfigView.jsp">Completa Registrazione</a><br>
		<%} %>
</div>
<br>
<%@include file="topdown/footer.jsp" %>
</body>
</html>