function checkNome(){
	var input = document.getElementsByName("nm")[0];
	var check = /^[A-Za-z]+$/;
	var esito;
	if(!input.value.match(check) && !input.value==""){
		$('#nm').css("border","1px solid red");
		$('#result1').css("display","inline");
		$('#result1').css("color","red");
		$('#result1').css("font-size","14px").html("Nome non valido<br>");
		esito= false;
	}
	else if(input.value.match(check) && !input.value==""){
		$('#nm').css("border","2px solid green");
		$('#result1').css("display","none");
		esito= true;
	}
	
	return esito;
}

function checkCognome(){
	var input = document.getElementsByName("cgm")[0];
	var check = /^[A-Za-z]+$/;
	var esito;
	if(!input.value.match(check) && !input.value==""){
		$('#cgm').css("border","1px solid red");
		$('#result2').css("display","inline");
		$('#result2').css("color","red");
		$('#result2').css("font-size","14px").html("Cognome non valido<br>");
		esito=false;
	}
	else if(input.value.match(check) && !input.value==""){
		$('#cgm').css("border","2px solid green");
		$('#result2').css("display","none");
		esito=true;
	}
	return esito;
}

function checkEmail(){
	var input = document.getElementsByName("email")[0];
	var check = /^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var esito;
	if(!input.value.match(check) && !input.value==""){
		$('#email').css("border","1px solid red");
		$('#result4').css("display","inline");
		$('#result4').css("color","red");
		$('#result4').css("font-size","14px").html("Email non valida<br>");
		esito = false;
	}
	else if(input.value.match(check) && !input.value==""){
		$('#result4').css("display","none");
		esito=true;
	}
	return esito;
}

function checkCods(){
	var input = document.getElementsByName("codS")[0];
	var check = /^[0-9]+$/;
	var esito;
	if(!input.value.match(check) && !input.value==""){
		$('#codS').css("border","1px solid red");
		$('#resultCodS').css("display","inline");
		$('#resultCodS').css("color","red");
		$('#resultCodS').css("font-size","14px").html("Il codice deve avere solo Numeri<br>");
		esito=false;
	}
	else if(input.value.match(check) && !input.value==""){
		$('#codS').css("border","2px solid green");
		$('#resultCodS').css("display","none");
		esito=true;
	}
	return esito;
}

function checkNumCarta(){
	var input = document.getElementsByName("numCarta")[0];
	var check = /^[0-9]+$/;
	var esito;
	if(!input.value.match(check) && !input.value==""){
		$('#numCarta').css("border","1px solid red");
		$('#resultNumCarta').css("display","inline");		
		$('#resultNumCarta').css("color","red");
		$('#resultNumCarta').css("font-size","14px").html("Il numero della carta deve contenere solo numeri<br>");
		esito = false;
	}	
	else if(input.value.match(check) && !input.value==""){		$('#numCarta').css("border","2px solid green");
		$('#resultNumCarta').css("display","none");
		esito = true;
	}
	return esito;
}

function checkData(){
	var input = document.getElementsByName("data")[0];
	var check = new Date();
	var res = check.toISOString().slice(0,10);
	var esito;
	if(input.value<res){
		$('#data').css("border","1px solid red");
		$('#resultData').css("display","inline");
		$('#resultData').css("color","red");
		$('#resultData').css("font-size","14px").html("La data di scadenza della tua carta non è valida<br>");
		esito=false;
	}
	else{
		$('#data').css("border","2px solid green");
		$('#resultData').css("display","none");
		esito=true;
	}
	return esito;
}

function checkCitta(){
	var input = document.getElementsByName("citta")[0];
	var check = /^[A-Za-z]+$/;
	var esito;
	if(!input.value.match(check) && !input.value==""){
		$('#citta').css("border","1px solid red");
		$('#resultCitta').css("display","inline");
		$('#resultCitta').css("color","red");
		$('#resultCitta').css("font-size","14px").html("Città non valida<br>");
		esito=false;
	}
	else if(input.value.match(check) && !input.value==""){		
		$('#citta').css("border","2px solid green");
		$('#resultCitta').css("display","none");
		esito= true;
	}
	return esito;
}

function checkVia(){
	var input = document.getElementsByName("via")[0];
	var check = /^[A-Za-z\s]+$/;
	var esito;
	if(!input.value.match(check) && !input.value==""){
		
		$('#via').css("border","1px solid red");
		$('#resultVia').css("display","inline");
		$('#resultVia').css("color","red");
		$('#resultVia').css("font-size","14px").html("Via non valida<br>");
		esito=false;
	}
	else if(input.value.match(check) && !input.value==""){	
		$('#via').css("border","2px solid green");
		$('#resultVia').css("display","none");
		esito = true;
	}
	return esito;
}

function checkNumero(){
	var input = document.getElementsByName("NCivico")[0];
	var check = /^[0-9]+$/;
	var esito;
	if(!input.value.match(check) && !input.value==""){
		$('#NCivico').css("border","1px solid red");
		$('#resultCivico').css("display","inline");
		$('#resultCivico').css("color","red");
		$('#resultCivico').css("font-size","14px").html("Il Numero Civico deve contenere solo Numeri<br>");
		esito= false;
	}
	else if(input.value.match(check) && !input.value==""){		
		$('#NCivico').css("border","2px solid green");
		$('#resultCivico').css("display","none");
		esito=true;
	}
	return esito;
}

function check(obj){
	var check = true;
	if(checkNome()==false) check=false;
	if(checkCognome()==false) check=false;
	if(checkEmail()==false) check=false;
	if(check)obj.submit();
}

function check2(obj){
	var check = true;
	if(checkCods()==false) check=false;
	if(checkNumCarta()==false) check=false;
	if(checkData()==false) check=false;
	if(checkCitta()==false) check=false;
	if(checkVia()==false) check=false;
	if(checkNumero()==false) check=false;
	if(check)obj.submit();
}
