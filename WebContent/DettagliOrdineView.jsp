<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	ArrayList<?> componi = (ArrayList<?>) request.getAttribute("componi");
    	ProdottoDAO model = new ProdottoDAO();
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*,it.unisa.model.dao.*"%>

<head>
<meta charset="UTF-8">
<title>PCWorld:Dettagli Ordine</title>
</head>
<body>
<%@include file="jsp/header.jsp" %>
<br>
	<table border="1">
		<tr>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Quantità Selezionata</th>
			<th></th>
		</tr>
		<%
			if(componi!=null && componi.size()!=0){
				for(int i=0;i<componi.size();i++){
					ComponiBean bean= (ComponiBean) componi.get(i);
					int id = bean.getIdArticolo();
					int quantita = bean.getQuantita();
					ProdottoBean prod = model.doRetrieveByKey(id);
		%>
		<tr>
			<td><%=prod.getNome() %> </td>
			<td><%=prod.getDescrizione() %> </td>
			<td><%=quantita %> </td>
		</tr>
		<% 
				}
			}
		%>		

	</table>
<br>
<%@include file="jsp/footer.jsp" %>
</body>
</html>