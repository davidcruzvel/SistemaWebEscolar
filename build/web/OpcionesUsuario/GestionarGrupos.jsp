<%-- 
    Document   : GestionarGrupos
    Created on : Nov 3, 2023, 2:53:07 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Grupos</title>
    </head>
    <body>
        <h1>Gestión de Grupos</h1>
        <h2>Listado de Grupos</h2>
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <a href="/SistemaWebEscolar?accion=AgregarGrupo">Agregar grupo</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Grupo</th>
                    <th>Grado</th>
                    <th>Sección</th>
                    <th>Año</th>
                    <th>ID Turno</th>
                    <th>ID Aula</th>
                    <th>ID Docente</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaGrupos}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Grupo}" /></td>
                        <td><c:out value="${item.grado}" /></td>
                        <td><c:out value="${item.seccion}" /></td>                        
                        <td><c:out value="${item.anio}" /></td>                        
                        <td><c:out value="${item.ID_Turno}" /></td>
                        <td><c:out value="${item.ID_Aula}" /></td>
                        <td><c:out value="${item.ID_Docente}" /></td>
                        <td>
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/ModificarGrupo.jsp">
                                <input type="hidden" name="ID_Grupo" value="${item.ID_Grupo}" />
                                <input type="hidden" name="grado" value="${item.grado}" />
                                <input type="hidden" name="seccion" value="${item.seccion}" />
                                <input type="hidden" name="anio" value="${item.anio}" />
                                <input type="hidden" name="ID_Turno" value="${item.ID_Turno}" />
                                <input type="hidden" name="ID_Aula" value="${item.ID_Aula}" />
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="submit" value="Modificar" />
                            </form>
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/EliminarGrupo.jsp">
                                <input type="hidden" name="ID_Grupo" value="${item.ID_Grupo}" />
                                <input type="hidden" name="grado" value="${item.grado}" />
                                <input type="hidden" name="seccion" value="${item.seccion}" />
                                <input type="hidden" name="anio" value="${item.anio}" />
                                <input type="hidden" name="ID_Turno" value="${item.ID_Turno}" />
                                <input type="hidden" name="ID_Aula" value="${item.ID_Aula}" />
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
