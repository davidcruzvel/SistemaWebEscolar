<%-- 
    Document   : GestionarEstudiantes
    Created on : Nov 3, 2023, 3:00:25 AM
    Author     : david
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Estudiantes</title>
    </head>
    <body>
        <h1>Gestión de Estudiantes</h1>
        <h2>Listado de Estudiantes</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>NIE</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Fecha de nacimiento</th>
                    <th>Género</th>
                    <th>Teléfono</th>
                    <th>ID Encargado</th>
                    <th>ID Dirección</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaEstudiantes}" var="item">
                    <tr>
                        <td><c:out value="${item.nie}" /></td>
                        <td><c:out value="${item.nombresEstudiante}" /></td>
                        <td><c:out value="${item.apellidosEstudiante}" /></td>
                        <td><c:out value="${item.fechaNacEstudiante}" /></td>
                        <td><c:out value="${item.generoEstudiante}" /></td>                        
                        <td><c:out value="${item.telefonoEstudiante}" /></td>                        
                        <td><c:out value="${item.ID_Encargado}" /></td>
                        <td><c:out value="${item.ID_Direccion}" /></td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
