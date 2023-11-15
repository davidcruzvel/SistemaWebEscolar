<%-- 
    Document   : EliminarMatricula
    Created on : 15-Nov-2023, 12:04:26
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Matrícula</title>
    </head>
    <body>
        <h1>Eliminar matrícula</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=EliminarMatricula">
            <div>
                <label>ID Matricula: ${param.ID_Matricula}</label><br>
                <label>NIE: ${param.nie}</label><br> 
                <label>ID Grupo: ${param.ID_Grupo}</label><br> 
                <input type="hidden" name="ID_Matricula" id="ID_Matricula" value="${param.ID_Matricula}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar la matrícula?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarMatriculas">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
