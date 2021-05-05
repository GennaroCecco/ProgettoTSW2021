<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
if(prodotti == null){
	
	response.sendRedirect("./catalogo");
	return;
}
%>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>PCWorld</title>
</head>

<body>
	<h2>Prodotti</h2>
	<a href="./carrello">Carrello</a>
	
	<table border="1">
	<tr>
		<th>Codice</th>
		<th>Nome</th>
		<th>Operazione</th>
	</tr>
	
	<% 
		if(prodotti != null && prodotti.size() != 0){
			Iterator<?> it = prodotti.iterator();
			while (it.hasNext()) {
				ProdottoBean bean = (ProdottoBean) it.next();
				
	%>
	<tr>
		<td><%=bean.getIdProdotto()%></td>
		<td><%=bean.getNome()%></td>
		
		<td>
			<a href="./dettagli?id=<%=bean.getIdProdotto() %>">Dettagli</a><br>
				<a href="./catalogo?op=aggC&id=<%=bean.getIdProdotto()%>">Aggiungi al carrello</a>
				</td>
		
	</tr>
	<% 
			}
			}else{
	%>
	
	<tr>
		<td colspan="6">Non ci sono prodotti</td>
	</tr>
	
	<% 
			}
	%>
	</table>
	
</body>

</html>