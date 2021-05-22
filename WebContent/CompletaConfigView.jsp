<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   	 	UserBean utente = (UserBean) request.getSession().getAttribute("Utente");
    		
    	
    %>
    
    
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*"%>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>PCWorld:Completamento</title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
<div class="content">

	<form action="./inserimento" method="post">
	<fieldset>
    		<legend>Dati carta</legend>
    		<label for="codS">Codice Segreto: </label><br>
    		<input type="number" id="codS" name="codS" autofocus required><br>
    		
    		<label for="numCarta">Numero Carta: </label><br>
			<input type="text" id="numCarta" name="numCarta" autofocus required><br>
    		
    		<label for="data">Data: (per il giorno inserisci 01)</label><br>
    		<input type="date" id="data" name="data" required><br>
    		
    		<label for="Circuito">Circuito: </label><br>
    		<input type="text" id="Circuito" name="Circuito" autofocus required><br>
	</fieldset>
	<fieldset>
			<legend>Dati Spedizione</legend>
			<input type="hidden" name="id" value="<%=utente.getIdUtente()%>">
			<label for="citta">Città: </label><br>
    		<input type="text" id="citta" name="citta" autofocus required><br>

    		<label for="via">Via: </label><br>
    		<input type="text" id="via" name="via" autofocus required><br>

    		<label for="NCivico">Numero civico: </label><br>
   	 		<input type="text" id="NCivico" name="NCivico" autofocus required><br>

    		<label for="piano">Piano: </label><br>
    		<input type="text" id="piano" name="piano" autofocus><br>

    		<label for="interno">Interno: </label><br>
    		<input type="text" id="interno" name="interno" autofocus ><br>

    		<label for="scala">Scala: </label><br>
    		<input type="text" id="scala" name="scala" autofocus><br>
	</fieldset>
	<input type="submit" value="Completa Registrazione">
	</form>
</div>
<br>
<%@include file="topdown/footer.jsp" %>
</body>
</html>