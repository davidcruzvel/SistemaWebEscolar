<%-- 
    Document   : AgregarCalificacion
    Created on : Nov 9, 2023, 12:03:24 AM
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Calificación</title>
    </head>
    <body>
        <c:if test="${exito!=null}">
            <c:if test="${exito}">
                <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p><strong style="color: red;">No se guardó la información</strong></p>
            </c:if>
        </c:if>   
        <h1>Realizar nueva calificación</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=AgregarCalificacion">
            <div>
                <!-- El ID de las calificaciones es autoincrementable -->
                <label>ID Materia:</label>
                <input type="text" name="ID_Materia" id="ID_Materia" required /><br>
                <label>NIE Estudiante:</label>
                <input type="text" name="nie" id="nie" required /><br>
                <label>ID Docente:</label>
                <input type="text" name="ID_Docente" id="ID_Docente" required /><br>
                <label>Examen 1:</label>
                <input type="text" name="examen1" id="examen1" required /><br>
                <label>Examen 2:</label>
                <input type="text" name="examen2" id="examen2" required /><br>
                <label>Examen 3:</label>
                <input type="text" name="examen3" id="examen3" required /><br>
                <label>Examen Final:</label>
                <input type="text" name="examenFinal" id="examenFinal" required /><br>
                <label>Tareas:</label>
                <input type="text" name="tareas" id="tareas" required /><br>
                
                <!-- ESTOS CAMPOS YA NO SE PEDIRAN CUANDO SEAN SETEADOS POR UN TRIGGER -->
                <label>Promedio:</label>
                <input type="text" name="promedio" id="promedio" required /><br>
                <label>Estado:</label>
                <input type="text" name="estado" id="estado" required /><br><br>
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar las notas?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarCalificaciones">Regresar</a>
            </div>            
        </form>
    </body>
</html>
