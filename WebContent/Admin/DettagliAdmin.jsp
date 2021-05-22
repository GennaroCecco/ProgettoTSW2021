<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	ArrayList<?> componi = (ArrayList<?>) request.getAttribute("componi");
   		 ProdottoDAO model = new ProdottoDAO();
    %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.bean.*,it.unisa.model.dao.ProdottoDAO"%>

<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="img/favicon.png" />
<title>PCWorld: Admin-Dettagli Ordine</title>
</head>
<body>
<%@include file="../topdown/headerAdmin.jsp" %>
<br>
	<table border="1">
        <tr>
            <th>Nome</th>
            <th>Descrizione</th>
            <th>Quantità Selezionata</th>
            <th>Prezzo</th>
        </tr>
        <%
            if(componi!=null && componi.size()!=0){
                for(int i=0;i<componi.size();i++){
                	double tot=0;
                    ComponiBean bean= (ComponiBean) componi.get(i);
                    int id = bean.getIdArticolo();
                    int quantita = bean.getQuantita();
                    ProdottoBean prod = model.doRetrieveByKey(id);
                    tot=bean.getPrezzo()*quantita;
        %>
        <tr>
            <td><%=prod.getNome() %> </td>
            <td><%=prod.getDescrizione() %> </td>
            <td><%=quantita %> </td>
             <td><%=tot %> </td>
        </tr>
        <% 
                }
            }
        %>

    </table>
	
</body>
</html>