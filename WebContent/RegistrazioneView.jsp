<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCWorld:Registrazione</title>
</head>
<body>
<%@include file="jsp/header.jsp" %>
<br>
	<form action="./registrazione" method="post">
		<fieldset>
			<legend>Dati Utente</legend>
			<label for="nm">Nome: </label><br>
			<input type="text" id="nm" name="nm" autofocus required><br>
			
			<label for="cgm">Cognome: </label><br>
			<input type="text" id="cgm" name="cgm" autofocus required><br>
			
			<label for="email">Email: </label><br>
			<input type="text" id="email" name="email" autofocus required><br>
			
			<label for="psw">Password: </label><br>
			<input type="password" id="psw" name="psw" autofocus required><br>
		</fieldset>
		
		<input type="submit" value="Registrati">
	</form>
<br>
<%@include file="jsp/footer.jsp" %>
</body>
</html>