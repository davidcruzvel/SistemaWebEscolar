<%-- 
    Document   : GestionarCargos
    Created on : Nov 3, 2023, 2:41:18 AM
    Author     : david
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Cargos</title>
    </head>
    <body>
        <h1>Gestión de Cargos</h1>
        <h2>Listado de Cargos</h2>
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <a href="/SistemaWebEscolar?accion=AgregarCargo">Agregar cargo</a><br><br>
        
        <table border="1">
            <thead>
                <tr>
                    <th>ID Cargo</th>
                    <th>Cargo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaCargos}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Cargo}" /></td>
                        <td><c:out value="${item.cargo}" /></td>
                        <td>
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/ModificarCargo.jsp">
                                <input type="hidden" name="ID_Cargo" value="${item.ID_Cargo}" />
                                <input type="hidden" name="cargo" value="${item.cargo}" />             
                                <input type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/EliminarCargo.jsp">
                                <input type="hidden" name="ID_Cargo" value="${item.ID_Cargo}" />
                                <input type="hidden" name="cargo" value="${item.cargo}" />             
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
