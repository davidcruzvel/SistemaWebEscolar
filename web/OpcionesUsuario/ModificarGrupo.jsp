<%-- 
    Document   : ModificarGrupo
    Created on : 15-Nov-2023, 06:34:32
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Grupo</title>
    </head>
    <body>   
        <h1>Modificar grupo</h1>
        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=ModificarGrupo">
            <div>
                <label>ID Grupo:</label>
                <input type="text" name="ID_Grupo" id="ID_Grupo" value="${param.ID_Grupo}" readonly /><br>
                <label>Grado:</label>
                <input type="text" name="grado" id="grado" value="${param.grado}" required /><br>
                <label>Sección:</label>
                <input type="text" name="seccion" id="seccion" value="${param.seccion}" required /><br>
                <label>Año:</label>
                <input type="text" name="anio" id="anio" value="${param.anio}" required /><br>
                <label>ID Turno:</label>
                <input type="text" name="ID_Turno" id="ID_Turno" value="${param.ID_Turno}" required /><br>
                <label>ID Aula:</label>
                <input type="text" name="ID_Aula" id="ID_Aula" value="${param.ID_Aula}" required /><br>          
                <label>ID Docente:</label>
                <input type="text" name="ID_Docente" id="ID_Docente" value="${param.ID_Docente}" required /><br><br>
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el grupo?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarGrupos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
