<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	UserBean user = (UserBean) request.getSession().getAttribute("Utente");
    %>
    
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*"%>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Login</title>

</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
	<div class="content">
	<%if(user==null){ %>
	<form action="./login" method="post">
		<label for="email">Inserisci email:</label><br>
		<input type="email" id="email" name="email" autofocus placeholder="example@email.com" required><br>
		<label for="password">Inserisci password:</label><br>
		<input type="password" id="password" name="password" autofocus placeholder="Example123@" required><br><br>
		<input type="submit" value="Accedi"> <a href="RegistrazioneView.jsp">Registrati</a>
	</form>

	<%}else{
			response.sendRedirect("UserLoggedView.jsp");
		}%>
	</div>	
<br>
<%@ include file="topdown/footer.jsp" %>
</body>
</html>