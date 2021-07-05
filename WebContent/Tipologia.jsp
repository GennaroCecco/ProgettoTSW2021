<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.ProdottoBean,it.unisa.model.dao.ProdottoDAO,java.sql.*"%>
<head>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="script/countElem.js"></script>
<script type="text/javascript" src="script/AddCart.js"></script>


<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Tipologia</title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
<div class="content">
		<div class="prodotti">
	<% 
		if(prodotti != null && prodotti.size() != 0){
			Iterator<?> it = prodotti.iterator();
			while (it.hasNext()) {
				ProdottoBean bean = (ProdottoBean) it.next();
				
	%>
	<div class="product">
		<fieldset>
		<p><%=bean.getNome()%></p>
		<img src="<%=bean.getPath()%>" style="display: inline-block;" width="256px" height="256px">
		€<%=bean.getPrezzo()%>
		<%if(bean.getQuantita()!=0){ %>
			<div class="iconInfo"><a href="./dettagli?tipologia=<%=bean.getTipologia()%>&id=<%=bean.getIdProdotto() %>"><button><img src="img/icona-info.png" class="image"></button></a></div>
            <div class="iconCart"><button id= "add" onclick="addTocart(<%=bean.getIdProdotto()%>),increment()"><img src="img/icon-cart.png" class="image"></button></div>
		<%}else{ %>
			<div class="iconInfo"><a href="./dettagli?tipologia=<%=bean.getTipologia()%>&id=<%=bean.getIdProdotto() %>"><button><img src="img/icona-info.png" class="image"></button></a></div>
			<%} %>
		</fieldset>
	</div>
	<% 
			}
			}else{
	%>
		<div>Non ci sono prodotti</div>
	<% 
			}
	%>
	</div>
	</div>
<br>
<%@include file="topdown/footer.jsp" %>
</body>
</html>