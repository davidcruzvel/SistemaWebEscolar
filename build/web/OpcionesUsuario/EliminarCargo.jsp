<%-- 
    Document   : EliminarCargo
    Created on : Nov 9, 2023, 1:29:46 AM
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Cargo</title>
    </head>
    <body>
        <h1>Eliminar cargo</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=EliminarCargo">
            <div>
                <label>ID Cargo: ${param.ID_Cargo}</label><br>
                <label>Cargo: ${param.cargo}</label><br> 
                <input type="hidden" name="ID_Cargo" id="ID_Cargo" value="${param.ID_Cargo}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el cargo?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarCargos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
