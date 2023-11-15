<%-- 
    Document   : EliminarMateria
    Created on : 15-Nov-2023, 12:04:32
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Materia</title>
    </head>
    <body>
        <h1>Eliminar materia</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=EliminarMateria">
            <div>
                <label>ID Materia: ${param.ID_Materia}</label><br>
                <label>Nombre de la materia: ${param.nombreMateria}</label><br> 
                <input type="hidden" name="ID_Materia" id="ID_Materia" value="${param.ID_Materia}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar la materia?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarMaterias">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
