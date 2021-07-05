<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	UserBean us = (UserBean) request.getSession().getAttribute("Utente");
		
    %>
<!DOCTYPE html>
<html>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="it.unisa.model.bean.UserBean"  %>
<%@page import="it.unisa.model.Carrello"  %>
<%@page import="it.unisa.model.ProdottoCarrello"  %>
<%@page import="java.util.*"  %>
<head>

<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="script/countElem.js"></script>
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>


<title>Header</title>
</head>
<body>
	
<div class="header" id="header">
	<div class="logo">
		<a href="./catalogo">
			<img src="img/LOGO_DEFINITIVO_INVERTITO.png">
		</a>
	</div>
	
	<div class="searchbox">
	 <form action="./chooseType" method="get">
   		 <div class="search">
     		 <input type="search" class="searchTerm" placeholder="Cosa cerchi?" name = "search">
     		 <button type="submit" class="searchButton">
      			 <img src="./img/Search.png">
    		 </button>
  		 </div>
	</form>
	</div>
	
	<div class="userCar">
	<div class="carrello">
	
		 <a href="carrello"><div id="cont" class="contatore"></div></a>
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
	
	<a href="carrello">
		
		<img src="img/shopping1.png" class="image" >
	</a>
	</div>
	<div class="utente" class="image">
<%if(us == null || !us.isValid()){ %>

	<a href="./LoginView.jsp">
		<img src="img/Utente.png" id="UserImage" class="image">
	</a>
<%} %>
	</div>
		<div class="ciaoutente">
<%
	if(us!=null && us.isValid()){
%>
			<a href="./infoUtente">Ciao <%=us.getNome()%></a>
<%} %>
	</div>
	</div>
	
	<div class="catalogov">
		<a href="./LoginView.jsp">Utente</a><br>
		<a href="carrello">Carrello</a>
	</div>
</div>

<div class="navmenu">
		<a href="catalogo">Home</a>
		<div class="dropdown">
			<a class="dropLink navmenuspacer">Catalogo</a>
			<ul class="dropdown-contenuto">
					<li><div class="dropdown2">
				<a class="dropLink2">Componenti</a>
						<ul class="dropdown-contenuto3">
							<li><a href="./chooseType?tipologia=Alimentatori">Alimentatori</a></li>
							<li><a href="./chooseType?tipologia=Case">Case</a></li>
							<li><a href="./chooseType?tipologia=CPU">CPU</a></li>
							<li><a href="./chooseType?tipologia=Dissipatori">Dissipatori</a></li>
							<li><a href="./chooseType?tipologia=Hard Disk">HDD</a></li>
							<li><a href="./chooseType?tipologia=Scheda Madre">MotherBoard</a></li>
							<li><a href="./chooseType?tipologia=RAM">Ram</a></li>
							<li><a href="./chooseType?tipologia=SSD">SSD</a></li>
						</ul>		
				</div></li>
				<li><div class="dropdown2">		
					<a class="dropLink2" href="./chooseType?tipologia=Computer">Computer</a>
						<ul class="dropdown-contenuto2">
							<li><a href="./chooseType?tipologia=Computer&like=i3">i3</a></li>
							<li><a href="./chooseType?tipologia=Computer&like=i5">i5</a></li>
							<li><a href="./chooseType?tipologia=Computer&like=i7">i7</a></li>
						</ul>	
				</div></li>
				<li><a href="./chooseType?tipologia=Monitor">Monitor</a></li>	
				<li><a href="./chooseType?tipologia=Webcam">Webcam</a></li>
			</ul>
		</div>
		<a href="./ChiSiamo.jsp" class="navmenuspacer">Chi siamo</a>
</div>
<div class="menuSmartUser">
	<img id ="btnOpenMenu"src="./img/MenuNav.png" width="30" height="30">
</div>
<div id="menu" style="display:none;" class="menuSmartUserView">
	  <a href="catalogo">Home</a>
	  <a id="btnCat">Catalogo</a>
			<div id="catShow" style="display: none;">
			<ul class="btnCatDiv">
					<li>
				<a id="componentiShow">Componenti</a>
					<div id="componentiShowDiv" style="display: none;">
						<ul class="ulComponenti">
							<li>•<a href="./chooseType?tipologia=Alimentatori">Alimentatori</a></li>
							<li>•<a href="./chooseType?tipologia=Case">Case</a></li>
							<li>•<a href="./chooseType?tipologia=CPU">CPU</a></li>
							<li>•<a href="./chooseType?tipologia=Dissipatori">Dissipatori</a></li>
							<li>•<a href="./chooseType?tipologia=Hard Disk">HDD</a></li>
							<li>•<a href="./chooseType?tipologia=Scheda Madre">MotherBoard</a></li>
							<li>•<a href="./chooseType?tipologia=RAM">Ram</a></li>
							<li>•<a href="./chooseType?tipologia=SSD">SSD</a></li>
						</ul>
						</div>		
				</li>
				<li>	
					<a id="computerShow">Computer</a>
					<div id="computerShowDiv" style="display: none;">
						<ul class="ulComputer">
							<li>•<a href="./chooseType?tipologia=Computer&like=i3">i3</a></li>
							<li>•<a href="./chooseType?tipologia=Computer&like=i5">i5</a></li>
							<li>•<a href="./chooseType?tipologia=Computer&like=i7">i7</a></li>
						</ul>	
						</div>
				</li>
				<li><a href="./chooseType?tipologia=Monitor">Monitor</a></li>	
				<li><a href="./chooseType?tipologia=Webcam">Webcam</a></li>
			</ul>
			</div>
	  <a href="./ChiSiamo.jsp" class="navmenuspacer">Chi siamo</a>
	  		
</div>			
		<script type="text/javascript">
			$('#btnOpenMenu').click(function(){
				 $("#menu").slideToggle();
			})
			$("#btnCat").click(function(){
					 $("#catShow").slideToggle();
				 })
			$('#componentiShow').click(function(){
				$('#componentiShowDiv').slideToggle();
			})
			$('#computerShow').click(function(){
				$('#computerShowDiv').slideToggle();
			})
			
			$(window).resize(function() {
				if ($(window).width() >= 480){
					$("#menu").css("display","none");
					return;
				}
			});
			
		</script>


</body>
</html>