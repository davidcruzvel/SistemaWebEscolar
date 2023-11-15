<%-- 
    Document   : AgregarDocente
    Created on : 14-Nov-2023, 18:00:46
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Docente</title>
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
        <h1>Agregar nuevo docente</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=AgregarDocente">
            <div>
                <!-- El ID de los docentes es autoincrementable -->
                <label>ID Empleado:</label>
                <input type="text" name="ID_Empleado" id="ID_Empleado" required /><br>
                <label>ID Especialidad:</label>
                <input type="text" name="ID_Especialidad" id="ID_Especialidad" required /><br>
                <label>Escalafón</label>
                <input type="text" name="escalafon" id="escalafon" required /><br><br>                            
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el docente?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarDocentes">Regresar</a>
            </div>            
        </form>
    </body>
</html>
