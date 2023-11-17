<%-- 
    Document   : EliminarEspecialidad
    Created on : 14-Nov-2023, 15:50:19
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Especialidad</title>
    </head>
    <body>
        <h1>Eliminar especialidad</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=EliminarEspecialidad">
            <div>
                <label>ID Especialidad ${param.ID_Especialidad}</label><br>
                <label>Especialidad: ${param.nombreEspecialidad}</label><br> 
                <label>Carrera: ${param.carrera}</label><br> 
                <input type="hidden" name="ID_Especialidad" id="ID_Especialidad" value="${param.ID_Especialidad}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el cargo?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarEspecialidades">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
