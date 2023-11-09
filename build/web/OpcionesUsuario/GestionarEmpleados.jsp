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
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <a href="/SistemaWebEscolar?accion=AgregarEmpleado">Agregar empleado</a><br><br>

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
                    <th>ID Dirección</th>
                    <th>Acciones</th>
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
                        <td>
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/ModificarEmpleado.jsp">
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="DUI_Empleado" value="${item.DUI_Empleado}" />
                                <input type="hidden" name="ISSS_Empleado" value="${item.ISSS_Empleado}" />
                                <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />
                                <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />
                                <input type="hidden" name="fechaNacEmpleado" value="${item.fechaNacEmpleado}" />
                                <input type="hidden" name="telefonoEmpleado" value="${item.telefonoEmpleado}" />
                                <input type="hidden" name="correo" value="${item.correo}" />
                                <input type="hidden" name="ID_Cargo" value="${item.ID_Cargo}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/EliminarEmpleado.jsp">
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="DUI_Empleado" value="${item.DUI_Empleado}" />
                                <input type="hidden" name="ISSS_Empleado" value="${item.ISSS_Empleado}" />
                                <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />
                                <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />
                                <input type="hidden" name="fechaNacEmpleado" value="${item.fechaNacEmpleado}" />
                                <input type="hidden" name="telefonoEmpleado" value="${item.telefonoEmpleado}" />
                                <input type="hidden" name="correo" value="${item.correo}" />
                                <input type="hidden" name="ID_Cargo" value="${item.ID_Cargo}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>      
    </body>
</html>
