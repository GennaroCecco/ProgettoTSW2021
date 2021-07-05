<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	UserBean user = (UserBean) request.getSession().getAttribute("Utente");
    	IndirizzoBean indi = (IndirizzoBean) request.getAttribute("indirizzo");
    	CartaBean carta = (CartaBean) request.getAttribute("carta");
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*"%>
<head>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="script/countElem.js"></script>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Ciao <%=user.getNome() %></title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
<div class="content">
<%if(user.getNumeroCarta()!=null){ %>
	<div class="wrapper">
		<div class="left">
			<img src="./img/UserBlank.png" width="250" height="250">
			<h3><%=user.getNome() %> <%=user.getCognome() %></h3>
		</div>
		<div class="right">
			<div class="info">
				<h3>I miei dati</h3>
				<div class="info_data">
					<div class="data">
						<h4>Email</h4>
						<p><%=user.getEmail() %></p>
					</div>
					<div class="data">
						<h4>Città</h4>
						<p><%=indi.getCitta() %></p>
					</div>
					<div class="data">
						<h4>Via</h4>
						<p><%=indi.getVia() %> <%=indi.getNumeroCivico() %></p>
					</div>
					<div class="data">
						<h4>Numero Carta</h4>
						<p><%=carta.getNumeroCarta()%></p>
					</div>
					<div class="data">
						<h4>Circuito</h4>
						<p><%=carta.getCircuito()%></p>
					</div>
				</div>			
			</div>
			<div class="operazioni">
				<h3>Operazioni</h3>
				<div class="operazioni_data">
					
					<div class="data">
						<h4><a href="./ordini">Vai ai tuoi Ordini</a><br></h4>
						
					</div>
					<div class="data">
						<h4><a href="./logout">Logout</a></h4>
						
					</div>
		</div>
	</div>	
	</div>
	</div>
<%}else{ %>
	<div class="wrapper">
		<div class="left">
			<img src="./img/UserBlank.png" width="250" height="250">
			<h3><%=user.getNome() %> <%=user.getCognome() %></h3>
		</div>
		<div class="right">
			<div class="info">
				<h3>I miei dati</h3>
				<div class="info_data">
					<div class="data">
						<h4>Email</h4>
						<p><%=user.getEmail() %></p>
					</div>
					<div class="data">
						<h4>Città</h4>
						<p>Nessuna Città Inserita</p>
					</div>
					<div class="data">
						<h4>Via</h4>
						<p>Nessuna Via Inserita</p>
					</div>
					<div class="data">
						<h4>Numero Carta</h4>
						<p>Nessun Numero di Carta Inserito</p>
					</div>
					<div class="data">
						<h4>Circuito</h4>
						<p>Nessun Circuito Inserito</p>
					</div>
				</div>			
			</div>
			<div class="operazioni">
				<h3>Operazioni</h3>
				<div class="operazioni_data">
					<div class="data">
						<h4><a href="CompletaConfigView.jsp">Completa Registrazione</a></h4>
					</div>
					<div class="data">
						<h4><a href="./logout">Logout</a></h4>
						
					</div>
		</div>
	</div>	
	</div>
	</div>
	<%} %>
</div>
<br>
<%@include file="topdown/footer.jsp" %>
</body>
</html>