<%-- 
    Document   : EliminarEncargado
    Created on : 15-Nov-2023, 07:36:25
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Encargado</title>
    </head>
    <body>
        <h1>Eliminar encargado</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=EliminarEncargado">
            <div>
                <label>ID_Encargado: ${param.ID_Encargado}</label><br>
                <label>Nombres: ${param.nombresEncargado}</label><br>
                <label>Apellidos: ${param.apellidosEncargado}</label><br>
                <label>Teléfono: ${param.telefonoEncargado}</label><br>
                <label>ID Dirección: ${param.ID_Direccion}</label><br>
                <input type="hidden" name="ID_Encargado" id="ID_Encargado" value="${param.ID_Encargado}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el encargado?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarEncargados">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>