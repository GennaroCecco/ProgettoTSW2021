<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<?> prod = (ArrayList<?>) request.getAttribute("prodotti");
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.ProdottoBean"%>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Tipologia</title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
<div class="content">
	<table class="table" border="1">
			<tr>
				<th>Nome</th>
				<th>Descrizione</th>
				<th>Quantità</th>
				<th>Prezzo</th>
				<th>Operazione</th>
			</tr>
			<%
				if(prod!=null && prod.size()>0){
					for(int i=0;i<prod.size();i++){
						ProdottoBean bean =(ProdottoBean) prod.get(i);
			%>
			<tr>
				
				<td><%=bean.getNome() %> </td>
				<td><%=bean.getDescrizione()%> </td>
				<%if(bean.getQuantita()!=0){ %>
				<td><%=bean.getQuantita() %> </td>
				<td>€<%=bean.getPrezzo() %></td>
				<td><div class="iconCart"><a href="./catalogo?op=aggC&id=<%=bean.getIdProdotto()%>"><img src="img/icon-cart.png"></a></div></td>
				<%}else{ %>
				<td>Non Disponibile</td>
				<td>€<%=bean.getPrezzo() %></td>
				<%} %>
			</tr>
			
			
			
			<%
					}
				}else{
			%>
				<h1>La ricerca non è andata a buon fine</h1>
				<%} %>
		</table>
	</div>
<br>
<%@include file="topdown/footer.jsp" %>
</body>
</html>