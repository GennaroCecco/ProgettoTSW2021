<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
	ArrayList<?> utenti = (ArrayList<?>) request.getAttribute("utenti");
    ComponiDAO model = new ComponiDAO();
    
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*,it.unisa.model.dao.*"%>

<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Admin-OrdiniGenaral</title>
</head>
<body>
<%@include file="../topdown/headerAdmin.jsp" %>
<br>
	<div class="UtentiAdmin">
		<%
			if(utenti!=null && utenti.size()!=0){
				for(int i=0;i<utenti.size();i++){
					UserBean user = (UserBean) utenti.get(i);
		%>
		<div class="UtenteAdmin">
			<h3 style="text-align: center;"><%=user.getNome()%> <%=user.getCognome() %><br>
			ID: #<%=user.getIdUtente() %></h3>
			<img src="./img/userComm.png" style="display: inline-block;" width="200px" height="200px">		
			<div></div>
			<div class="iconInfo">
				<a href="./ordiniAdmin?op=view&id=<%=user.getIdUtente()%>">
					<button><img src="img/icona-info.png" class="image"></button>
				</a>
			</div>
			
		</div>
		<% 
				}
			}else{
		%>
		
		<h3>Non ci sono Ordini</h3>
	
	<% }%>
	</div>
</body>
</html>