<%-- 
    Document   : GestionarEncargados
    Created on : Nov 3, 2023, 2:56:03 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Encargados</title>
    </head>
    <body>
        <h1>Gestión de Encargados</h1>
        <h2>Listado de Encargados</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Encargado</th>                    
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Teléfono</th>                    
                    <th>DUI</th>
                    <th>ID Dirección</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaEncargados}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Encargado}" /></td>
                        <td><c:out value="${item.nombresEncargado}" /></td>
                        <td><c:out value="${item.apellidosEncargado}" /></td>                        
                        <td><c:out value="${item.telefonoEncargado}" /></td>
                        <td><c:out value="${item.DUI_Encargado}" /></td>
                        <td><c:out value="${item.ID_Direccion}" /></td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
