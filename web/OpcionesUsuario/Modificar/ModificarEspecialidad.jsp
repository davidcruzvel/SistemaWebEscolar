<%-- 
    Document   : ModificarEspecialidad
    Created on : 14-Nov-2023, 15:46:28
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Especialidad</title>
    </head>
    <body>   
        <h1>Modificar especialidad</h1>
        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=ModificarEspecialidad">
            <div>
                <label>ID Especialidad:</label>
                <input type="text" name="ID_Especialidad" id="ID_Especialidad" value="${param.ID_Especialidad}" readonly /><br>
                <label>Especialidad:</label>
                <input type="text" name="nombreEspecialidad" id="nombreEspecialidad" value="${param.nombreEspecialidad}" required /><br>        
                <label>Carrera:</label>
                <input type="text" name="carrera" id="carrera" value="${param.carrera}" required /><br><br>
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar la especialidad?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarEspecialidades">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
