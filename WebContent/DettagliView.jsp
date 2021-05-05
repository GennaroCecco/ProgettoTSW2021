<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <% 
    	ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
    
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="it.unisa.model.*"%>
<head>
<meta charset="ISO-8859-1">
<title>PCWorld</title>
</head>
<body>
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
	
</body>
</html>