<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ProdottoBean bean = (ProdottoBean) request.getAttribute("bean");
    	
    %>
    
<!DOCTYPE html>
<html>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,it.unisa.model.bean.*" %>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Admin-Modifica</title>
</head>
<body>
<%@include file="../topdown/headerAdmin.jsp" %>
<br>
<h2 style="text-align: center;">Modifica Prodotto</h2><br>
	<div class="modificaAdmin">
	<div class="modificaAdminDettagli">
		<img src="<%=bean.getPath()%>" >
		
			<form action="./modifica" method="get">
				<div class="modificaInput">
					<span>ID:</span><br>
					<input type="number"name="id" value="<%=bean.getIdProdotto()%>">
				</div>	
				<div class="modificaInput">
					<span>Tipologia:</span><br>
					<input type="text" name="tipologia" value="<%=bean.getTipologia() %>">
				</div>
				<div class="modificaInput">	
					<span>Nome:</span><br>
					<input type="text" name="nome" value="<%=bean.getNome()%>">
				</div>
				<div class="modificaInput">	
					<span>Descrizione:</span><br>
					<input type="text" name="descrizione" value="<%=bean.getDescrizione()%>">
				</div>
				<div class="modificaInput">	
					<span>Prezzo:</span><br>
					<input type="text" name="prezzo" value="<%=bean.getPrezzo()%>">
				</div>
				<div class="modificaInput">	
					<span>Quantità:</span><br>
					<input type="text" name="quantita" value="<%=bean.getQuantita()%>">
				</div>
				<div class="modificaInput">	
					<span>Iva:</span><br>
					<input type="text" name="iva" value="<%=bean.getIva()%>">
				</div>	
					<input type="submit" value="Modifica" class="btnModifica">
			</form>
		</div>
	</div>
		

</body>
</html>