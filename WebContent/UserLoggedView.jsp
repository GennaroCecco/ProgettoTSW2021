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
<meta charset="UTF-8">
<title>PCWorld:Area Utente</title>
</head>
<body>
<%@include file="jsp/header.jsp" %>
<br>
	
	<table border="1">
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
	<a href="./logout">Esci </a><br>
	<a href="./ordini">Vai ai tuoi Ordini</a><br>
	<%if(user.getNumeroCarta()==null){ %>
	<a href="CompletaConfigView.jsp">Completa Registrazione</a><br>
	<%} %>
<br>
<%@include file="jsp/footer.jsp" %>
</body>
</html>