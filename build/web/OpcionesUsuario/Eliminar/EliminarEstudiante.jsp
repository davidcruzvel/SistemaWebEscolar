<%-- 
    Document   : EliminarEstudiante
    Created on : 15-Nov-2023, 11:02:37
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Estudiante</title>
    </head>
    <body>
        <h1>Eliminar estudiante</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=EliminarEstudiante">
            <div>
                <label>NIE: ${param.nie}</label><br>
                <label>Nombres: ${param.nombresEstudiante}</label><br>
                <label>Apellidos: ${param.apellidosEstudiante}</label><br>
                <label>Fecha de nacimiento: ${param.fechaNacEstudiante}</label><br>
                <label>Género: ${param.generoEstudiante}</label><br>
                <label>Teléfono: ${param.telefonoEstudiante}</label><br>
                <label>ID Encargado: ${param.ID_Encargado}</label><br>
                <label>ID Dirección: ${param.ID_Direccion}</label>   
                <input type="hidden" name="nie" id="nie" value="${param.nie}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el estudiante?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarEstudiantes">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
