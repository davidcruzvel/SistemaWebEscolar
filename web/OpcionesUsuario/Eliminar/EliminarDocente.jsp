<%-- 
    Document   : EliminarDocente
    Created on : 14-Nov-2023, 18:16:33
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Docente</title>
    </head>
    <body>
        <h1>Eliminar docente</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=EliminarDocente">
            <div>                
                <label>Escalafón: ${param.escalafon}</label><br>
                <label>ID Docente: ${param.ID_Docente}</label><br>
                <label>ID Empleado: ${param.ID_Empleado}</label><br>
                <label>Nombres: ${param.nombresEmpleado}</label><br>
                <label>Apellidos: ${param.apellidosEmpleado}</label><br>
                <label>ID Especialidad: ${param.ID_Especialidad}</label><br>
                <label>Especialidad: ${param.nombreEspecialidad}</label><br>
                <label>Carrera: ${param.carrera}</label><br>  
                <input type="hidden" name="ID_Docente" id="ID_Docente" value="${param.ID_Docente}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el docente?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarDocentes">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>