<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	ArrayList<?> prodotti = (ArrayList<?>) request.getAttribute("prodotti");
	if(prodotti == null){
		response.sendRedirect("./catalogo");
		return;
	}
	
	int index = (int) request.getSession().getAttribute("index"); 
	
	%>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.dao.ProdottoDAO,java.sql.*"%>


<head>
<link rel="stylesheet" href="css/style.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" type="image/png" href="img/favicon.png" />
	<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="script/AddCart.js"></script>
	
	
	<title>PCWorld: Home</title>
</head>

<body>
	<%@include file="topdown/header.jsp" %>

	<div class="slideshow-container">
		<div class="sliderPreferences">
			<div class="mySlides fade">
				<img src="./img-banner/slidebanner1_new.jpg" height="400" width="100%">	
			</div>
					
			<div class="mySlides fade">
				<img src="./img-banner/slidebanner2_new.jpg" height="400" width="100%">
			</div>
					
			<div class="mySlides fade">
				<img src="./img-banner/slidebanner3_new.jpg" height="400" width="100%">
			</div>
		</div>
	<div style="text-align: center">
		<span class="dot"></span>
		<span class="dot"></span>
		<span class="dot"></span>
	</div>
	</div>
	<script>
		var slideIndex = 0;
		showSlides();
		
		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for(i=0;i<slides.length;i++){
				slides[i].style.display = "none";
			}
			slideIndex++;
			if(slideIndex >slides.length) {slideIndex = 1}
			for(i=0;i<dots.length;i++){
				dots[i].className = dots[i].className.replace(" active","");
			}
			slides[slideIndex-1].style.display = "block";
			dots[slideIndex-1].className += " active";
			setTimeout(showSlides, 10000); //cambio ogni 10 secondi
		}
	</script>
	<div class="content">
	<h2>Prodotti</h2>
	<div class="prodotti">
	<% 
	int tmp = prodotti.size()/10;
		if(prodotti != null && prodotti.size() != 0){
			
			for(int i=0 + index*10;i<index*10+10;i++) {
				if(i<prodotti.size()){
				ProdottoBean bean = (ProdottoBean) prodotti.get(i);
	%>
	<div class="product">
		<h3><%=bean.getNome()%></h3>
		<a href="./dettagli?tipologia=<%=bean.getTipologia()%>&id=<%=bean.getIdProdotto() %>">
			<img src="<%=bean.getPath()%>" style="display: inline-block;" width="256px" height="256px" onmouseover="bigImg(this)" onmouseleave="normalImg(this)">
		</a>
		<div class="prezzo">€<%=bean.getPrezzo()%></div>
		<script>
			function bigImg(x) {
			  x.style.height = "300px";
			  x.style.width = "300px";
			  x.style.border="1";
			}
			
			function normalImg(x) {
			  x.style.height = "256px";
			  x.style.width = "256px";
			}
			</script>
		<%if(bean.getQuantita()!=0){ %>
			<div class="iconInfo"><a href="./dettagli?tipologia=<%=bean.getTipologia()%>&id=<%=bean.getIdProdotto() %>"><button><img src="img/icona-info.png" class="image"></button></a></div>
            <div id="addDiv" class="iconCart"><button id= "add" onclick="addTocart(<%=bean.getIdProdotto()%>),increment()"><img src="img/icon-cart.png" class="image"></button></div>
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
		<%}else{ %>
			<div class="iconInfo"><a href="./dettagli?tipologia=<%=bean.getTipologia()%>&id=<%=bean.getIdProdotto() %>"><button><img src="img/icona-info.png" class="image"></button></a></div>
			<%} %>
	</div>
	
	<% 
			}
			}}else{
	%>
	<div>
		<div>Non ci sono prodotti</div>
	</div>
	<% 
			}
	%>
	</div>
	<div class="index">
		<%if(index>0){ %>
		<a href="./catalogo?action=sub"><button>← Indietro</button></a>
		<%}%>
		<a href="./catalogo?action=set&index=1"><button>1</button></a> 
		<a href="./catalogo?action=set&index=2"><button>2</button></a>
		<a href="./catalogo?action=set&index=3"><button>3</button></a> 
		<a href="./catalogo?action=set&index=4"><button>4</button></a>
		<a href="./catalogo?action=set&index=5"><button>5</button></a> 
		<a href="./catalogo?action=set&index=6"><button>6</button></a>
		
		<%if(index<5){ %>
		<a href="./catalogo?action=add"><button>Avanti →</button></a>
		<%}%>
	</div>
	
	<div class="indexSmart">
		<%if(index>0){ %>
		<a href="./catalogo?action=sub"><button>← Indietro</button></a>
		<%}%>
		<%if(index<5){ %>
		<a href="./catalogo?action=add"><button>Avanti →</button></a>
		<%}%>
	</div>
	</div>
	<br>
	<%@ include file="topdown/footer.jsp" %>
	
</body>

</html>