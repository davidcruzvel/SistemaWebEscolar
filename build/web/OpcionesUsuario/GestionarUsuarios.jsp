<%-- 
    Document   : GestionarUsuarios
    Created on : Nov 3, 2023, 2:46:09 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Usuarios</title>
    </head>
    <body>
        <h1>Gestión de Usuarios</h1>
        <h2>Listado de Usuarios</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Usuario</th>
                    <th>ID Empleado</th>
                    <th>ID Rol</th>
                    <th>Usuario</th>
                    <th>Clave</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaUsuarios}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Usuario}" /></td>
                        <td><c:out value="${item.ID_Empleado}" /></td>
                        <td><c:out value="${item.ID_Rol}" /></td>                        
                        <td><c:out value="${item.usuario}" /></td>
                        <td><c:out value="${item.clave}" /></td>                        
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
