<%-- 
    Document   : GestionarDocentes
    Created on : Nov 3, 2023, 2:51:00 AM
    Author     : david
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Docentes</title>
    </head>
    <body>
        <h1>Gestión de Docentes</h1>
        <h2>Listado de Docentes</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Docente</th>
                    <th>ID Empleado</th>
                    <th>ID Especialidad</th>
                    <th>Escalafón</th>                    
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaDocentes}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Docente}" /></td>
                        <td><c:out value="${item.ID_Empleado}" /></td>
                        <td><c:out value="${item.ID_Especialidad}" /></td>                        
                        <td><c:out value="${item.escalafon}" /></td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
