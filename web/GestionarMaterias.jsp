<%-- 
    Document   : GestionarMaterias
    Created on : Nov 3, 2023, 3:06:49 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Materias</title>
    </head>
    <body>
        <h1>Gestión de Materias</h1>
        <h2>Listado de Materias</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Materia</th>
                    <th>Materia</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaMaterias}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Materia}" /></td>
                        <td><c:out value="${item.nombreMateria}" /></td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
