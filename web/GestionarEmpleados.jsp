<%-- 
    Document   : GestionarEmpleados
    Created on : 13 oct 2023, 22:32:39
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Empleados</title>
    </head>
    <body>
        <h1>Gestión de Empleados</h1>
        <h2>Listado de Empleados</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Empleado</th>
                    <th>DUI</th>
                    <th>ISSS</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Fecha de nacimiento</th>
                    <th>Teléfono</th>
                    <th>Correo</th>
                    <th>ID Cargo</th>
                    <th>ID Direccion</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaEmpleados}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Empleado}" /></td>
                        <td><c:out value="${item.DUI_Empleado}" /></td>
                        <td><c:out value="${item.ISSS_Empleado}" /></td>                        
                        <td><c:out value="${item.nombresEmpleado}" /></td>
                        <td><c:out value="${item.apellidosEmpleado}" /></td>
                        <td><c:out value="${item.fechaNacEmpleado}" /></td>
                        <td><c:out value="${item.telefonoEmpleado}" /></td>
                        <td><c:out value="${item.correo}" /></td>                        
                        <td><c:out value="${item.ID_Cargo}" /></td>
                        <td><c:out value="${item.ID_Direccion}" /></td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
