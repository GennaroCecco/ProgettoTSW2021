<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	ArrayList<?> componi = (ArrayList<?>) request.getAttribute("componi");
   		 ProdottoDAO model = new ProdottoDAO();
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.dao.ProdottoDAO,java.text.DecimalFormat"%>

<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Admin-Dettagli Ordine</title>
</head>
<body>
<%@include file="../topdown/headerAdmin.jsp" %>
<br>
<div class="content">
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
			<div class="quant"><h4>Quantità acquistata:</h4><p><%=prodotto.getQuantita()%></p></div>
		</div>
	</div>
	<%}} else{ %>
		<h1>Non ci sono prodotti in quest'ordine!</h1>
	<%} %>
	</div>
</body>
</html>