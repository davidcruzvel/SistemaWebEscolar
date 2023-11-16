<%-- 
    Document   : EliminarGrupo
    Created on : 15-Nov-2023, 06:38:33
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Grupo</title>
    </head>
    <body>
        <h1>Eliminar grupo</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=EliminarGrupo">
            <div>
                <label>ID Grupo: ${param.ID_Grupo}</label><br>
                <label>Grado: ${param.grado}</label><br>
                <label>Sección: ${param.seccion}</label><br>
                <label>Año: ${param.anio}</label><br>
                <label>ID Turno: ${param.ID_Turno}</label><br>
                <label>ID Aula: ${param.ID_Aula}</label><br>
                <label>ID Docente ${param.ID_Docente}</label><br>
                <input type="hidden" name="ID_Grupo" id="ID_Grupo" value="${param.ID_Grupo}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el grupo?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarGrupos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
