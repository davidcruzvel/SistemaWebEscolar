<%-- 
    Document   : ModificarCalificacion
    Created on : Nov 9, 2023, 12:36:17 AM
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Calificación</title>
    </head>
    <body>   
        <h1>Modificar Calificación</h1>
        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=ModificarCalificacion">
            <div>
                <label>ID Calificacion:</label>
                <input type="text" name="ID_Calificacion" id="ID_Calificacion" value="${param.ID_Calificacion}" readonly /><br>
                <label>ID Materia:</label>
                <input type="text" name="ID_Materia" id="ID_Materia" value="${param.ID_Materia}" required /><br>
                <label>NIE Estudiante:</label>
                <input type="text" name="nie" id="nie" value="${param.nie}" required /><br>
                <label>ID Docente:</label>
                <input type="text" name="ID_Docente" id="ID_Docente" value="${param.ID_Docente}" required /><br>
                <label>Examen 1:</label>
                <input type="text" name="examen1" id="examen1" value="${param.examen1}" required /><br>
                <label>Examen 2:</label>
                <input type="text" name="examen2" id="examen2" value="${param.examen2}" required /><br>
                <label>Examen 3:</label>
                <input type="text" name="examen3" id="examen3" value="${param.examen3}" required /><br>
                <label>Examen Final:</label>
                <input type="text" name="examenFinal" id="examenFinal" value="${param.examenFinal}" required /><br>
                <label>Tareas:</label>
                <input type="text" name="tareas" id="tareas" value="${param.tareas}" required /><br>
                
                <!-- ESTOS CAMPOS YA NO SE MODIFICARAN CUANDO SEAN SETEADOS POR UN TRIGGER -->
                <label>Promedio:</label>
                <input type="text" name="promedio" id="promedio" value="${param.promedio}" required /><br>
                <label>Estado:</label>
                <input type="text" name="estado" id="estado" value="${param.estado}" required /><br><br>           
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar las notas?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarCalificaciones">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
