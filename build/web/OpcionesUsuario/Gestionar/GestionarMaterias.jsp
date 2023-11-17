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
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <a href="/SistemaWebEscolar?accion=AgregarMateria">Agregar materia</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Materia</th>
                    <th>Materia</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaMaterias}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Materia}" /></td>
                        <td><c:out value="${item.nombreMateria}" /></td>
                        <td>
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Modificar/ModificarMateria.jsp">
                                <input type="hidden" name="ID_Materia" value="${item.ID_Materia}" />
                                <input type="hidden" name="nombreMateria" value="${item.nombreMateria}" />             
                                <input type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Eliminar/EliminarMateria.jsp">
                                <input type="hidden" name="ID_Materia" value="${item.ID_Materia}" />
                                <input type="hidden" name="nombreMateria" value="${item.nombreMateria}" />             
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
