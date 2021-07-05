<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<?> prodotti = (ArrayList<?>) request.getAttribute("prodotti");
    	if(prodotti==null){
    		response.sendRedirect("admin");
    		return;
    	}
    	
    %>
    
    
<!DOCTYPE html>
<html>

<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,it.unisa.model.bean.*" %>
<head>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>

<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Admin</title>
</head>
<body>
<%@include file="../topdown/headerAdmin.jsp" %>
<br>
<div class="content">

	
	<%if(prodotti.size()!=0&&prodotti!=null){ %>
	<h2>Prodotti</h2>
	<div class="prodotti">
	<%for(int i=0;i<prodotti.size();i++){ 
		ProdottoBean bean =(ProdottoBean) prodotti.get(i);
	
		%>
	<div class="product">
		<h3><%=bean.getNome()%></h3>
		<img src="<%=bean.getPath()%>" style="display: inline-block;" width="256px" height="256px">
		<div class="prezzo">€<%=bean.getPrezzo()%></div>		
		<div class="iconDelete"><a href="./admin?op=elimina&id=<%=bean.getIdProdotto()%>"><button onclick="reload()"><img src="img/delete.png"></button></a></div>
		<div class="iconModify"><a href="./admin?op=modProd&id=<%=bean.getIdProdotto() %>"><button ><img src="img/Modifica.png" class="image"></button></a></div>
	</div>
	<%} %>
	</div>
	<%}else{ %>
	<h2>Non ci sono prodotti</h2>
	<%} %>
	</div>
</body>
</html>