<%-- 
    Document   : GestionarCalificaciones
    Created on : Nov 3, 2023, 3:08:32 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Calificaciones</title>
    </head>
    <body>
        <h1>Gestión de Calificaciones</h1>
        <h2>Listado de Calificaciones</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Calificación</th>
                    <th>ID Materia</th>
                    <th>NIE</th>
                    <th>ID Docente</th>
                    <th>Examen 1</th>
                    <th>Examen 2</th>
                    <th>Examen 3</th>
                    <th>Examen Final</th>
                    <th>Tareas</th>
                    <th>Promedio</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaCalificaciones}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Calificacion}" /></td>
                        <td><c:out value="${item.ID_Materia}" /></td>
                        <td><c:out value="${item.nie}" /></td>                        
                        <td><c:out value="${item.ID_Docente}" /></td>
                        <td><c:out value="${item.examen1}" /></td>
                        <td><c:out value="${item.examen2}" /></td>
                        <td><c:out value="${item.examen3}" /></td>
                        <td><c:out value="${item.examenFinal}" /></td>                        
                        <td><c:out value="${item.tareas}" /></td>
                        <td><c:out value="${item.promedio}" /></td>
                        <td><c:out value="${item.estado}" /></td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
