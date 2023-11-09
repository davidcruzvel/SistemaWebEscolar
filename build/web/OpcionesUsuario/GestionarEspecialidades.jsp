<%-- 
    Document   : GestionarEspecialidades
    Created on : Nov 3, 2023, 2:44:10 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Especialidades</title>
    </head>
    <body>
        <h1>Gestión de Especialidades</h1>
        <h2>Listado de Especialidades</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Especialidad</th>
                    <th>Especialidad</th>
                    <th>Carrera</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaEspecialidades}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Especialidad}" /></td>
                        <td><c:out value="${item.nombreEspecialidad}" /></td>
                        <td><c:out value="${item.carrera}" /></td>                        
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
