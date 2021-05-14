<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	UserBean user = (UserBean) request.getSession().getAttribute("Utente");
    %>
    
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*"%>
<head>
<meta charset="UTF-8">
<title>PCWorld:Login</title>

</head>
<body>
<%@ include file="jsp/header.jsp" %>
<br>
	<%if(user==null){ %>
	<form action="./login" method="get">
		<fieldset>
		<input type="email" name="email" autofocus placeholder="Inserisci Email" required><br>
		<input type="password" name="password" autofocus placeholder="Inserisci Password" required><br>
		<input type="submit" value="Accedi">
		</fieldset><br>
	</form>
	<a href="RegistrazioneView.jsp">Registrati </a>
	<%}else{
			response.sendRedirect("UserLoggedView.jsp");
		} %>
		

<br>
<%@ include file="jsp/footer.jsp" %>
</body>
</html>