<%-- 
    Document   : ModificarDocente
    Created on : 14-Nov-2023, 18:13:40
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Docente</title>
    </head>
    <body>   
        <h1>Modificar docente</h1>
        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=ModificarDocente">
            <div>
                <label>ID Docente:</label>
                <input type="text" name="ID_Docente" id="ID_Docente" value="${param.ID_Docente}" readonly /><br>
                <label>ID Empleado:</label>
                <input type="text" name="ID_Empleado" id="ID_Empleado" value="${param.ID_Empleado}" required /><br>
                <label>ID Especialidad:</label>
                <input type="text" name="ID_Especialidad" id="ID_Especialidad" value="${param.ID_Especialidad}" required /><br>
                <label>Escalafón: </label>
                <input type="text" name="escalafon" id="escalafon" value="${param.escalafon}" required /><br><br>           
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el docente?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarDocentes">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
