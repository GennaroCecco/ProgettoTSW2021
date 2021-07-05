<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
    	ArrayList<?> prodotti = (ArrayList<?>) request.getAttribute("prodotti");
   		ArrayList<?> comms = (ArrayList<?>) request.getAttribute("commenti");
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="it.unisa.model.bean.*, java.util.*"%>
<head>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="script/countElem.js"></script>
<script type="text/javascript" src="script/AddCart.js"></script>



<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Dettagli <%=prodotto.getDescrizione() %></title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<div class="content">
	<%if(prodotto != null){ %>
	<div class="dettagli">
		<div class="bloccodescrizione">
		<div class="descrizioneimage">
		<img src="<%=prodotto.getPath()%>" style="display: block; float:left; padding-left: 20px;" width="256px" height="256px" >
		</div>
		<div class="descrizione"><h3>Descrizione</h3><%=prodotto.getDescrizione()%></div>
		</div>
		<div class="infodescrizione">
			<div class="prezzodescrizione">€<%=prodotto.getPrezzo()%></div>
			<%if(prodotto.getQuantita() == 0) {%>
			<h4>Quantità non disponibile</h4>
			<%}else if(prodotto.getQuantita()>=1){ %>
			<div class="iconCart" id="desc"><button id= "add" onclick="addTocart(<%=prodotto.getIdProdotto()%>),increment()"><img src="img/icon-cart.png" class="image"></button></div>
			
			<div class="quant"><h4>Quantità scorte:</h4><p><%=prodotto.getQuantita() %></p></div>
			<div class="comProd"><a href="#commento">Lascia un commento</a></div>
			<%} %>
		</div>
	</div>
	<h2 style="float:left;display: block;width: 100%;">Consigliamo anche:</h2>
	<div class="prodotti">
	<% for (int i=0; i<prodotti.size();i++) {
		ProdottoBean bean = (ProdottoBean) prodotti.get(i);
		%>
	<div class="product">
		<h3><%=bean.getNome()%></h3>
		<img src="<%=bean.getPath()%>" style="display: inline-block;" width="256px" height="256px">
		<div class="prezzo">€<%=bean.getPrezzo()%></div>
		
		<%if(bean.getQuantita()!=0){ %>
		
			<div class="iconInfo"><a href="./dettagli?tipologia=<%=bean.getTipologia()%>&id=<%=bean.getIdProdotto() %>"><button><img src="img/icona-info.png" class="image"></button></a></div>
            <div class="iconCart"><button id= "add" onclick="addTocart(<%=bean.getIdProdotto()%>),increment()"><img src="img/icon-cart.png" class="image"></button></div>
			
		<%}else{ %>
			<div class="iconInfo"><a href="./dettagli?tipologia=<%=bean.getTipologia()%>&id=<%=bean.getIdProdotto() %>"><button><img src="img/icona-info.png" class="image"></button></a></div>
			<%} %>
	</div>
	<%}} %>
	
	</div>
	<h3>Teniamo al tuo parere. Lascia un commento oppure <a id="allcomm" href="#allCom">guarda cosa ne pensano gli utenti</a></h3>
	<div class="areaCom">
	<div class="popup" style="display:inline-block;margin-left:auto;margin-right:auto">
  			<span class="popupimg" id="myPopup"><img src="./img/Check.png"></span>
		</div>
		
		<div id="inserisciCom"style="display: inline;" class="inserisciCom">
		<textarea rows="5" cols="40"id="commento" maxlength="200" style="font-size: 20px;"></textarea>
		 <br>
		 <input type="button" onclick="sendCom()" value ="Invia">
		 </div><br>
		<span id="notLogin"></span>
		
		<script type="text/javascript">
			$('#allcomm').click(function(){
				$('#allCom').css("display","flex");
				$('#hideLink').css("display","block");
				$('#inserisciCom').css("display","none");
			})
		</script>
	</div>
	
	<script type="text/javascript">
		function sendCom(){
			var com = $("#commento").val();
			var idProd = <%=prodotto.getIdProdotto()%>;
			$.ajax({
				type: 'GET',
				data: {commento:com,prod:idProd},
				url: 'comControl',
				success: function(result){
					if(result==1){
						var popup = document.getElementById("myPopup");
						popup.classList.toggle("show");
						$('#commento').val('');
						setTimeout(function(){
							location.reload(true);
						},5000)
					}
					else if(result == 0){
						$('#notLogin').css("color","red").html("Esegui il login o Registrati");		
						$('#commento').val('');
						
					}
					
				}
				
			})
		}
	</script>

<div id="allCom" class="allCom">
<%if(comms.size()>0){ %>	
	<%for(int i=0;i<comms.size();i++){ 
		CommentoBean val = (CommentoBean) comms.get(i);%>
	
<div class="comsUtenti">
	<div class="areaCommento">
			<div class="imgComm"><img src="./img/userComm.png" width="60" height="60"></div>
			<h4>
			<%=val.getNome() %> 
			<%=val.getCognome() %></h4>
			<span><%=val.getData() %></span>
			<p><%=val.getCommento() %></p>
	</div>
</div>
	
		<%} %>
		
	<%}else{ %>
<p>Non ci sono Commenti </p>
<%} %>
</div>	

	<div id="hideLink" style="display: none;">	
		<a id="hide" href="">Nascondi</a>
	</div>	
	<script type="text/javascript"> 
		$('#hide').click(function(){
		$('#allCom').css("display","none");
	})
	</script>
</div>
<br>
<%@include file="topdown/footer.jsp" %>
</body>
</html>