<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	UserBean user = (UserBean) request.getSession().getAttribute("Utente");
    	String Alert = (String) request.getAttribute("Alert");
    %>
    
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.*"%>
<head>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="script/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="script/countElem.js"></script>
<script type="text/javascript" src="script/AddCart.js"></script>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Login</title>

</head>
<body>
<%@include file="topdown/header.jsp" %>
<br>
	 <div class="content">
    <div class="login">
    <div style="width: 100%; height: 900px;background: url(./img-banner/Background-login.jpg) no-repeat center center fixed;background-size: cover;"></div>

    <div class="loginblock">
    <form action="./login" method="post" id="form">
        <div>
        <h1>Effettua l'accesso</h1>
        <input type="email" id="email" name="email" autofocus placeholder="Inserisci email..." required><br>
        <br>
        <input type="password" id="password" name="password" autofocus placeholder="Inserisci password..." required><br><br>
        
        <%if (Alert != null && !Alert.equalsIgnoreCase("")) {
        	%>
        <span class="Errorelogin" id="login"><%=Alert %></span><br><br>
        <%} %>
        <input type="submit" value="Accedi" id="Accedi"><br>
        </div>
    <div>
    <br><hr>
    <p>Sei Nuovo? Registrati subito!</p>
    <a href="RegistrazioneView.jsp"><input type="button" value="Registrati"></a>
    </div>
    </form>
    </div>
        <%if(user!=null){
            response.sendRedirect("UserLoggedView.jsp");
        }%>
    </div>
    </div>
<br>
<%@ include file="topdown/footer.jsp" %>
</body>
</html>