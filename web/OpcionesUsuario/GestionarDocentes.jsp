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
        <h3>Conexion: ${mensaje_conexion}</h3><br><br>

        <a href="/SistemaWebEscolar?accion=AgregarDocente">Agregar docente</a><br><br>
        
        <table border="1">
            <thead>
                <tr>
                    <th>ID Docente</th>
                    <th>ID Empleado</th>
                    <th>ID Especialidad</th>
                    <th>Escalafón</th>                    
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaDocentes}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Docente}" /></td>
                        <td><c:out value="${item.ID_Empleado}" /></td>
                        <td><c:out value="${item.ID_Especialidad}" /></td>                        
                        <td><c:out value="${item.escalafon}" /></td>
                        <td>
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/ModificarDocente.jsp">
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="ID_Especialidad" value="${item.ID_Especialidad}" />
                                <input type="hidden" name="escalafon" value="${item.escalafon}" />
                                <input type="submit" value="Modificar" />
                            </form>
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/EliminarDocente.jsp">
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="ID_Especialidad" value="${item.ID_Especialidad}" />
                                <input type="hidden" name="escalafon" value="${item.escalafon}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
