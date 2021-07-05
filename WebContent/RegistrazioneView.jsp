<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="script/checkCampi.js"></script>
<script type="text/javascript" src="script/countElem.js"></script>

<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />

<title>PCWorld:Registrazione</title>
</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
<div class="content">
	<div class="container">
		<div class="registrazione-right">
			<div class="registrazione-right-Hello">
				<h1>Ciao!</h1>
				<p>Inserisci i tuoi dati e procedi con i tuoi ordini!</p>
				<p>Sei già registrato? <a href="LoginView.jsp">Accedi</a></p>
			</div>
		</div>
		
		<div class="registrazione-left">
			<div class="registrazione-left-input">
				<form action="./registrazione" method="post" name="formReg" onsubmit="event.preventDefault();check(this)">
			   		<div class="inputRegi">
			            <input type="text" id="nm" name="nm" autofocus required placeholder="Nome" onblur="checkNome()"><br>
			            <span id="result1"></span>
					</div>
					<div class="inputRegi">
			            <input type="text" id="cgm" name="cgm" autofocus required placeholder="Cognome" onblur="checkCognome()"><br>
			            <span id="result2"></span>
					</div>
					<div class="inputRegi">
			            <input type="text" id="email" name="email" autofocus required placeholder="Email" onblur="checkEmail()"><br>
			            <span id="result3"></span> <span id="result4"></span>
					</div>
					<div class="inputRegi">
			            <input type="password" id="psw" name="psw" autofocus required placeholder="Password"><br><br>
					</div>
					<div class="btnRegistrati" style="width: 80">
			       	 	<input type="button" id="bottone" value="Registrati" >
		    		</div>
		    	</form>
		    </div>
    	</div>
    </div>  
</div>
<br>
<%@include file="topdown/footer.jsp" %>
<!-- JQUERY -->
<script type="text/javascript">
$(document).ready(function(){
	$('#email').change(function(){
		var email = $('#email').val();
		$.ajax({
			type: 'POST',
			data: {email:email},
			url : 'emailCheck',
			success: function(result){
				if(result!=null && result!=""){
					$('#result3').css("display","inline");
					$('#result3').css("color","red");
					$('#result3').css("font-size","14px").html(result);
					$('#email').css("border","1px solid red");
				}else{
					$('#email').css("border","2px solid green");
					$('#bottone').prop("type","submit");
					$('#result3').css("display","none");
					
				}
			}

		})
	});
	
});
			</script>
	
<script type="text/javascript">

</script>

</body>
</html>