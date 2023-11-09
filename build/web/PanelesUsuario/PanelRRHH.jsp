<%-- 
    Document   : PanelRRHH
    Created on : Nov 3, 2023, 7:51:08 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de Recursos Humanos</title>
    </head>
    <body>
        <div><h1>Sistema Escolar 1.0</h1></div>
        <c:set var="usuario" value="${param.tfUsuario}" />
        <div><h3><strong>¡Bienvenido, <c:out value="${usuario}" />!</strong></h3></div>
        <div><h3>Men&uacute; de opciones</h3></div>
        <div>
            <%@include file="MenuRRHH.jsp" %>
        </div>
        <div>            
            <%@include file="Footer.html" %>
        </div>  
    </body>
</html>
