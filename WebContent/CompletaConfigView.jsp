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
<link rel="icon" type="image/png" href="img/favicon.png" />
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="script/checkCampi.js"> </script>

<title>PCWorld:Completamento</title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
<div class="content">

	<form class="formCompleta" action="./inserimento" method="post" onsubmit="event.preventDefault();check2(this)">
	<div class="titoloCompleta">
	<img src="./img/completaAccount.png" style="float: left;">
		<h3>Completa la tua Registrazione</h3>
	</div>	
		<div class="dettagliUtenti">

			<input type="hidden" name="id" value="<%=utente.getIdUtente()%>">
	    		<div class="inputBox">
	    			<span class="dettagliSpan">Città</span>
			    	<input type="text" id="citta" name="citta" autofocus required onblur="checkCitta()"><br>
					<span id="resultCitta"> </span>
				</div>
				<div class="inputBox">
	    			<span class="dettagliSpan">Via</span>
				   	<input type="text" id="via" name="via" autofocus required onblur="checkVia()"><br>
					<span id="resultVia"> </span>
				</div>
				<div class="inputBox">
	    			<span class="dettagliSpan">Numero Civico</span>
					<input type="text" id="NCivico" name="NCivico" autofocus required maxlength="3" onblur="checkNumero()"><br>
					<span id="resultCivico"> </span>
				</div>
				<div class="inputBox">
	    			<span class="dettagliSpan">Piano</span>
				   	<input type="text" id="piano" name="piano" autofocus><br>
					<span id="resultPiano"> </span>
				</div>
				<div class="inputBox">
	    			<span class="dettagliSpan">Interno</span>
					<input type="text" id="interno" name="interno" autofocus ><br>
				</div>
				<div class="inputBox">
	    			<span class="dettagliSpan">Scala</span>   	
				   	<input type="text" id="scala" name="scala" autofocus><br>
				</div>
				<div class="inputBox">
	    			<span class="dettagliSpan">CVC</span>   	
			    	<input type="text" id="codS" name="codS" autofocus required maxlength="3"  onblur="checkCods()"><br>
					<span id="resultCodS"></span>  		
				</div>
				<div class="inputBox">
	    			<span class="dettagliSpan">Numero carta</span>		
					<input type="text" id="numCarta" name="numCarta" autofocus required maxlength="16" onblur="checkNumCarta()" ><br>
			    	<span id="resultNumCarta"> </span>
				</div>
				<div class="inputBox">
	    			<span class="dettagliSpan" >Scadenza Carta</span>    		
			    	<input type="date" id="data" name="data" required onblur="checkData()"><br>
			    	<span id="resultData"> </span>
				</div>
	    		<div class="inputBox">	
				    <span class="dettagliSpan">Circuito</span>	
					<select  id="Circuito" name="Circuito">
						<option id="Circuito" value="MasterCard">MasterCard</option>
						<option id="Circuito" value="Visa">Visa</option>
						<option id="Circuito" value="PayPal">PayPal</option>
					</select>
				</div>
			<input type="submit" id="send" value="Completa Registrazione">  	
		</div>
	</form>
</div>
<br>
<%@include file="topdown/footer.jsp" %>
</body>
</html>