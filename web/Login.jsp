<%-- 
    Document   : Login
    Created on : 20 sept 2023, 23:46:16
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Sistema Escolar</title>
        <link rel="stylesheet" href="Recursos/css/bootstrap.css"/>
    </head>
    <body>      
        <div class="header1"><h1>Sistema Escolar 1.0</h1></div>           
        <div class="container1">
            <form class="form-group" method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=Login" id="formLogin">
                <div id="resultLogin"></div>
                <div><label>Usuario:</label></div>            
                <div><input class="form-control" type="text" name="tfUsuario" id="idtfUsuario"></div><br>
                <div><label>Contrase&ntilde;a:</label></div>
                <div><input class="form-control" type="password" name="tfContrasenia" id="idtfContrasenia" ></div><br>
                <div><input class="btn btn-primary" type="submit" value="Iniciar Sesi&oacute;n"></div>
            </form>    
        </div>        
    </body>
</html>
