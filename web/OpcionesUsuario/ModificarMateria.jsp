<%-- 
    Document   : ModificarMateria
    Created on : 15-Nov-2023, 11:38:46
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Materia</title>
    </head>
    <body>   
        <h1>Modificar materia</h1>
        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=ModificarMateria">
            <div>
                <label>ID Materia:</label>
                <input type="text" name="ID_Materia" id="ID_Materia" value="${param.ID_Materia}" readonly /><br>
                <label>Nombre de la materia:</label>
                <input type="text" name="nombreMateria" id="nombreMateria" value="${param.nombreMateria}" required /><br><br>        
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar la materia?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarMaterias">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
