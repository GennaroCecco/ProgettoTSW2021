<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	UserBean us = (UserBean) request.getSession().getAttribute("Utente");
    %>
<!DOCTYPE html>
<html>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="it.unisa.model.bean.UserBean"  %>
<head>

<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
</head>
<body>
<div class="header">
	<div class="logo">
		<a href="./catalogo">
			<img src="img/LOGO_DEFINITIVO_INVERTITO.png">
		</a>
	</div>
	<div class="carrello">
	<a href="carrello">
		<img src="img/shopping.png" align="right">
	</a>
	</div>
	<div class="utente">
<%if(us == null || !us.isValid()){ %>

	<a href="./LoginView.jsp">
		<img src="img/Utente.png" align="right">
	</a>
<%} %>
	</div>
	<div class="ciaoutente">
<%
	if(us!=null && us.isValid()){
%>
			<a href="login">
				Ciao <%=us.getNome() %>
			</a>
<%} %>
	</div>
	<div class="catalogov">
		<a href="login">Utente</a><br>
		<a href="carrello">Carrello</a>
	</div>
</div>
<div class="navmenu">
	<a href="catalogo">Home</a>
	<a href="./chooseType?tipologia=Monitor">Monitor</a>
	<a href="./chooseType?tipologia=Computer">Computer</a>
	<a href="./chooseType?tipologia=Webcam">Webcam</a>
</div>
</body>
</html>