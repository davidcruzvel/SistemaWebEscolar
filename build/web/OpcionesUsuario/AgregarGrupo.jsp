<%-- 
    Document   : Agregar grupo
    Created on : 15-Nov-2023, 06:27:55
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Grupo</title>
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
        <h1>Agregar nuevo grupo</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=AgregarGrupo">
            <div>
                <!-- El ID de los grupos es autoincrementable -->
                <label>Grado:</label>
                <input type="text" name="grado" id="grado" required /><br>
                <label>Sección:</label>
                <input type="text" name="seccion" id="seccion" required /><br>
                <label>Año:</label>
                <input type="text" name="anio" id="anio" required /><br>
                <label>ID Turno:</label>
                <input type="text" name="ID_Turno" id="ID_Turno" required /><br>
                <label>ID Aula:</label>
                <input type="text" name="ID_Aula" id="ID_Aula" required /><br>
                <label>ID Docente:</label>
                <input type="text" name="ID_Docente" id="ID_Docente" required /><br><br>                            
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el grupo?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarGrupos">Regresar</a>
            </div>            
        </form>
    </body>
</html>
