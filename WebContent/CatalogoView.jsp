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
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*"%>


<head>
<link rel="stylesheet" href="css/style.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" type="image/png" href="img/favicon.png" />
	<title>PCWorld: Home</title>
</head>

<body>
	<%@include file="topdown/header.jsp" %>
	
	<div class="content">
	<h2>Prodotti</h2>
	
	
	<table class="table" border="1">
	
	<tr>
		<th>Codice</th>
		<th>Tipologia</th>
		<th>Nome</th>
		<th>Prezzo</th>
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
		<td><%=bean.getTipologia()%></td>
		<td><%=bean.getNome()%></td>
		<td>€<%=bean.getPrezzo()%></td>
		
		<td>
		
		<%if(bean.getQuantita()!=0){ %>
		
			<div class="iconInfo"><a href="./dettagli?id=<%=bean.getIdProdotto() %>"><img src="img/icona-info.png"></a></div>
			<div class="iconCart"><a href="./catalogo?op=aggC&id=<%=bean.getIdProdotto()%>"><img src="img/icon-cart.png" ></a></div>
				
		<%}else{ %>
			<div class="iconInfo"><a href="./dettagli?id=<%=bean.getIdProdotto() %>"><img src="img/icona-info.png" ></a></div>
			<%} %>
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
	</div>

	<br>
	<%@ include file="topdown/footer.jsp" %>
</body>

</html>