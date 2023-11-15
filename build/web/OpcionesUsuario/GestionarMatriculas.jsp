<%-- 
    Document   : GestionarMatriculas
    Created on : Nov 3, 2023, 3:04:29 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Matrículas</title>
    </head>
    <body>
        <h1>Gestión de Matrículas</h1>
        <h2>Listado de Matrículas</h2>      
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <a href="/SistemaWebEscolar?accion=AgregarMatricula">Agregar matricula</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Matrícula</th>
                    <th>NIE</th>
                    <th>ID Grupo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaMatriculas}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Matricula}" /></td>
                        <td><c:out value="${item.nie}" /></td>
                        <td><c:out value="${item.ID_Grupo}" /></td>
                        <td>
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/ModificarMatricula.jsp">
                                <input type="hidden" name="ID_Matricula" value="${item.ID_Matricula}" />
                                <input type="hidden" name="nie" value="${item.nie}" />             
                                <input type="hidden" name="ID_Grupo" value="${item.ID_Grupo}" />             
                                <input type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/EliminarMatricula.jsp">
                                <input type="hidden" name="ID_Matricula" value="${item.ID_Matricula}" />
                                <input type="hidden" name="nie" value="${item.nie}" />             
                                <input type="hidden" name="ID_Grupo" value="${item.ID_Grupo}" />  
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
