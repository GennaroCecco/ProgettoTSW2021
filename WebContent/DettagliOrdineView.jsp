<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	ArrayList<?> componi = (ArrayList<?>) request.getAttribute("componi");
   		ProdottoDAO model = new ProdottoDAO();
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.dao.ProdottoDAO,java.text.DecimalFormat
"%>

<head>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="script/countElem.js"></script>
	<script type="text/javascript" src="script/AddCart.js"></script>

<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld:Dettagli Ordine</title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<div class="content">
	<div class="backordini"><h2><a href="./ordini">Torna ai tuoi ordini</a></h2></div>
		<%
            if(componi!=null && componi.size()!=0){
            	DecimalFormat df = new DecimalFormat("###.##");
                for(int i=0;i<componi.size();i++){
                	double tot=0;
                    ComponiBean prodotto= (ComponiBean) componi.get(i);
                    int id = prodotto.getIdArticolo();
                    int quantita = prodotto.getQuantita();
                    
                    tot=prodotto.getPrezzo()*quantita;
        %>
    <div class="dettagliOrdine">
		<img src="<%=prodotto.getPath()%>" style="display:inline-block; float:left; padding-left: 20px;" width="256px" height="256px">
		<div class="descrizioneOrdini"><h3>Descrizione</h3><%=prodotto.getDescrizione()%></div>
		<div class="infodescrizioneOrdini">
			<div class="prezzodescrizioneOrdini">€<%=df.format(tot)%></div>
			<%if(prodotto.getQuantita() == 0) {%>
			<h4>Quantità non disponibile</h4>
			<%}else if(prodotto.getQuantita()>=1){ %>
			<div class="iconCart" id="desc"><button id= "add" onclick="addTocart(<%=prodotto.getIdArticolo()%>),increment()"><img src="img/icon-cart.png" class="image"></button></div>
			<script type="text/javascript"> 
						function increment(){
								$.ajax({
									type: 'GET',
									url: 'cartCount',
									success: function(result){
										$('#cont').html(result);
									}
								})
						}
				</script>
			<div class="quant"><h4>Quantità acquistata:</h4><p><%=prodotto.getQuantita()%></p></div>
			<%} %>
		</div>
	</div>
	<%}} else{ %>
		<h1>Non ci sono prodotti in quest'ordine!</h1>
	<%} %>
	</div>
<br>
<%@include file="topdown/footer.jsp" %>
</body>
</html>