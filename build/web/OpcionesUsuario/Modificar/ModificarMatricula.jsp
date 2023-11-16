<%-- 
    Document   : ModificarMatricula
    Created on : 15-Nov-2023, 11:38:36
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Matrícula</title>
    </head>
    <body>   
        <h1>Modificar matrícula</h1>
        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=ModificarMatricula">
            <div>
                <label>ID Matricula:</label>
                <input type="text" name="ID_Matricula" id="ID_Matricula" value="${param.ID_Matricula}" readonly /><br>
                <label>NIE:</label>
                <input type="text" name="nie" id="nie" value="${param.nie}" required /><br>
                <label>ID Grupo:</label>
                <input type="text" name="ID_Grupo" id="ID_Grupo" value="${param.ID_Grupo}" required /><br><br>
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar la matrícula?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarMatriculas">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
