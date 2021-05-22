<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
    
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="it.unisa.model.bean.*"%>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Dettagli <%=prodotto.getDescrizione() %></title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
<div class="content">
	<h2>Dettagli</h2>
	
	<%if(prodotto != null){ %>
		<table class="table" border="1">
			<tr>
			<th>IdProdotto</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Quantità Disponibile</th>
			<th>Prezzo</th>
			<th>Operazione</th>
			</tr>
		<tr>
		<%if(prodotto.getQuantita() == 0) {%>
			<td><%=prodotto.getIdProdotto() %> </td>
			<td><%=prodotto.getNome() %>  </td>
			<td><%=prodotto.getDescrizione() %>  </td>
			<td>Non disponibile</td>
			<td>€<%=prodotto.getPrezzo() %>  </td>
		<%}else if(prodotto.getQuantita()>1){ %>
			<td><%=prodotto.getIdProdotto() %> </td>
	        <td><%=prodotto.getNome() %>  </td>
	        <td><%=prodotto.getDescrizione() %>  </td>
	        <td><%=prodotto.getQuantita() %>  </td>
	        <td>€<%=prodotto.getPrezzo() %>  </td>
	        <td><div class="iconCart"><a href="./dettagli?op=aggC&id=<%=prodotto.getIdProdotto()%>"><img src="img/icon-cart.png"></a></div></td>
		<%} %>
		</tr>
		</table>
		<% 
			}
		%>
</div>
	<br>
	<%@include file="topdown/footer.jsp" %>
</body>
</html>