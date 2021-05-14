<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	ArrayList<?> ordini = (ArrayList<?>) request.getAttribute("ordini");
    	ComponiDAO model = new ComponiDAO();
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*,it.unisa.model.dao.*"%>

<head>
<meta charset="UTF-8">
<title>PCWorld:Ordini</title>
</head>
<body>
<%@include file="jsp/header.jsp" %>
<br>
	<table border="1">
		<tr>
			<th>Numero Ordine</th>
			<th>Stato</th>
			<th>Data</th>
			<th>Prezzo</th>
			<th>Operazione</th>
		</tr>
		<%
			if(ordini!=null && ordini.size()!=0){
				
				for(int i=0;i<ordini.size();i++){
					double totale=0;
					OrdineBean ordine = (OrdineBean) ordini.get(i);
					ArrayList<ComponiBean>componi = model.doRetrieveByKey(ordine.getIdOrdine());
					for(int j=0;j<componi.size();j++){
						ComponiBean bean = (ComponiBean) componi.get(j);
						totale+=bean.getPrezzo()*bean.getQuantita();
					}
		%>
		<tr>
			<td><%=ordine.getIdOrdine() %> </td>
			<td><%=ordine.getStato() %> </td>
			<td><%=ordine.getData().toString() %> </td>
			<td><%=totale %></td>
			<td><a href="./dettagliOrdine?id=<%=ordine.getIdOrdine() %>"> Dettagli Ordine</a> </td>
		</tr>
		<% 
				}
			}else{
		%>
		<tr>
		<td colspan="6">Non ci sono Ordini</td>
	</tr>
	<% }%>
		

	</table>
<br>
<%@include file="jsp/footer.jsp" %>
</body>
</html>