<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>

<meta charset="UTF-8">
<title>Header:Admin</title>
</head>
<body>
<div class="headeradmin" id="headeradmin">

		<div class="logoadmin">
			<a href="admin">	
				<img src="./img/LOGO_DEFINITIVO_INVERTITO.png">
			</a>
		</div>
		<div class="benvenutoAdmin">
			<h3>Benvenuto Admin</h3>
		</div>
		<div class="iconAdmin">
			<img src="./img/Admin.png">
		</div>
					
		<div class="menuSmart">
			<button type="button" id="menuBtn" >Menù</button>
		</div>
		<div id="menu" style="display:none;" class="menuShowSmart">
	  		<a href="logoutAdmin">Esci</a>
	  		<a href="admin">Home</a>
	  		<a href="./admin?op=insert">Inserisci Prodotto</a>
		</div>	
	<script>
	var index=0;
    $(document).ready(function(){
          $("#menuBtn").click(function(){
        	  index++;
            $("#menu").slideToggle();
            $("#headeradmin").css("min-height","270px");
            setTimeout(function(){ if(index%2==0){
            	$("#headeradmin").css("min-height","130px");
            } }, 300);
            
           
          }); 
        });
</script>
</div>

<div class="navAdmin">
		<a href="logoutAdmin">Esci</a>
		
		<a href="admin">Home</a>
		
		<a href="./admin?op=insert">Inserisci Prodotto</a>
		<div class="dropdown">
			<a class="dropLink" id="ricerca">Ricerca ordini</a>
			<div class="dropdownRicerca">
			<ul>
				<li ><button id="apri" style="border: none;">Ricerca Ordini Per Nome</button></li>
				<li ><button type="button" id="apriData"style="border:none;color: #292929;">Ricerca Ordini Per Data</button></li>
			</ul>	
			</div>
		</div>	
			<div class="ricercaPerNome" id="ricercaPerNome">
				<form action="./ordiniAdmin" method="get" id="formRicercaNome" class="contenitoreForm">
					<label for="nomeUntente">Inserisci il nome dell'Utente</label><br>
					<input type="text" id="nomeUtente" name="nome"><br>
					<label for="cognomeUtente">Inserisci il cognome dell'uetnte</label><br>
					<input type="text" id="cognomeUtente" name="cognome"><br>
					<button type="submit"  class="btnCerca">Cerca</button>
					<input type="hidden" name="op" value="ricercaN">
					<button type="button"id="chiudi" class="btnChiudi">Chiudi</button>
				</form>
				
				
			</div>
			<script type="text/javascript">
					$('#apri').click(function () {
  							document.getElementById("ricercaPerNome").style.display = "block";
						})
					$('#chiudi').click(	
					function chiudiForm() {
  						document.getElementById("ricercaPerNome").style.display = "none";
					})
				</script>
		<div class="ricercaPerData" id="ricercaPerData">
			<form action="./ordiniAdmin" method="get" id="formRicercaData" class="contenitoreForm">
				<label for="data1">Inserisci intervallo data</label><br>
				<input type="date" id="data1" name="data1"><br>
				<input type="date" name="data2"><br>
				<button type="submit" class="btnCerca">Cerca</button>
				<input type="hidden" name="op" value="ricercaD">
				<button type="button"id="chiudiData" class="btnChiudi">Chiudi</button>
				
			</form>
		</div>
		<script type="text/javascript">
					$('#apriData').click(function () {
  							document.getElementById("ricercaPerData").style.display = "block";
						})
					$('#chiudiData').click(	
					function chiudiForm() {
  						document.getElementById("ricercaPerData").style.display = "none";
					})
				</script>
				
	
	</div>
	
</body>
</html>
