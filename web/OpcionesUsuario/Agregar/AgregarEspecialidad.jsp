<%-- 
    Document   : AgregarEspecialidad
    Created on : 13-Nov-2023, 17:38:53
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Especialidad</title>
    </head>
    <body>
        <c:if test="${exito!=null}">
            <c:if test="${exito}">
                <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p><strong style="color: red;">No se guardó la información</strong></p>
            </c:if>
        </c:if>   
        <h1>Agregar nuevo especialidad</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=AgregarEspecialidad">
            <div>
                <!-- El ID de las especialidades es autoincrementable -->
                <label>Especialidad:</label>
                <input type="text" name="nombreEspecialidad" id="nombreEspecialidad" required /><br>
                <label>Carrera:</label>
                <input type="text" name="carrera" id="carrera" required /><br><br>                            
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la especialidad?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarEspecialidades">Regresar</a>
            </div>            
        </form>
    </body>
</html>
