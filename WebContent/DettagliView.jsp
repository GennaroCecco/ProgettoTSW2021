<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
    
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="it.unisa.model.bean.*"%>
<head>
<meta charset="UTF-8">
<title>PCWorld</title>
</head>
<body>
<%@include file="jsp/header.jsp" %>
<br>
<h2>Dettagli</h2>
<a href="./catalogo">Home</a>

<%if(prodotto != null){ %>
	<table border="1">
		<tr>
		<th>IdProdotto</th>
		<th>Nome</th>
		<th>Descrizione</th>
		<th>Quantità Disponibile</th>
		<th>Prezzo</th>
		<th>Operazione</th>
		</tr>
	<tr>
		<td><%=prodotto.getIdProdotto() %> </td>
		<td><%=prodotto.getNome() %>  </td>
		<td><%=prodotto.getDescrizione() %>  </td>
		<td><%=prodotto.getQuantita() %>  </td>
		<td><%=prodotto.getPrezzo() %>  </td>
		<td><a href="./dettagli?op=aggC&id=<%=prodotto.getIdProdotto()%>">Aggiungi al carrello</a></td>
	
	</tr>
	</table>
	<% 
		}
	%>
	<br>
	<%@include file="jsp/footer.jsp" %>
</body>
</html>