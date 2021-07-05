<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />

<title>Admin: insert</title>
</head>
<body>
<%@include file="../topdown/headerAdmin.jsp" %>
<br>
	<h2 style="text-align: center;">Inserisci un nuovo prodotto</h2>
	<div class="insertProdotto">
		<form action="./insert" method="get" id="formInsert">
		
			<div class="insertImage">
				<input type="file" accept="image" id="url" name="image" style="display: none;">
				<img id="upload" width="250" height="250" style="margin: 0;padding: 0;display: none;">
				<img id="addProdotto" src="./img/AddIcon.png" width="100px" height="100" style="margin:30%;">
				<script type="text/javascript">
				$('#addProdotto').click(function(){ $('#url').trigger('click'); });
				const fileInput = document.getElementById('url');
				fileInput.onchange = () => {
				  const name = fileInput.files[0].name;
				  var path = "./Prodotti/"+name;
				  $("#upload").css("display", "block");
				  $("#upload").attr("src", path);
				  $("#addProdotto").css("display","none");
				}
				</script>
				
				
			</div>
			<div style="display:  inline-block; width: 100%;">
				<div class="flexInput">
					<div class="inputInsert">
						<p>Inserisci Tipologia</p>
						<input type="text" id= "tipo"name="tipologia">
					</div>
					<div class="inputInsert">
						<p>Inserisci Nome</p>
						<input type="text" id="nomeProd" name="nomeProd">
					</div>	
						
					<div class="inputInsert">
						<p>Inserisci Descrizione</p>
						<input type="text" id="descr" name="descrizione">
					</div>
						
					<div class="inputInsert">
						<p>Inserisci Prezzo</p>
						<input type="text" id="prezzo" name="prezzo">
					</div>
						
					<div class="inputInsert">
						<p>Inserisci Quantità</p>			
						<input type="text" id="quanti" name="quantita">
					</div>	
						
					<div class="inputInsert">
						<p>Inserisci IVA</p>
						<input type="text" id="iva" name="iva">
					</div>	
					<div class="btnInserisci">
						<input type="submit" value="Inserisci">
					</div>	
				</div>				
			</div>
				
	</form>
</div>
</body>
</html>