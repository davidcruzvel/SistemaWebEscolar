<%-- 
    Document   : EliminarCalificacion
    Created on : Nov 9, 2023, 12:50:18 AM
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Calificacion</title>
    </head>
    <body>
        <h1>Eliminar Calificacion</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=EliminarCalificacion">
            <div>
                <label>ID Calificación: ${param.ID_Calificacion}</label><br>
                <label>ID Materia: ${param.ID_Materia}</label><br>
                <label>NIE Estudiante: ${param.nie}</label><br>
                <label>ID Docente: ${param.ID_Docente}</label><br>
                <label>Examen 1: ${param.examen1}</label><br>
                <label>Examen 2: ${param.examen2}</label><br>
                <label>Examen 3: ${param.examen3}</label><br>
                <label>Examen Final: ${param.examenFinal}</label><br>
                <label>Tareas: ${param.tareas}</label><br>
                <label>Promedio: ${param.promedio}</label>   
                <label>Estado: ${param.estado}</label>   
                <input type="hidden" name="ID_Calificacion" id="ID_Calificacion" value="${param.ID_Calificacion}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar la calificacion?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarCalificaciones">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
