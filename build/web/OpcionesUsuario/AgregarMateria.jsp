<%-- 
    Document   : AgregarMateria
    Created on : 15-Nov-2023, 11:35:15
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Materia</title>
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
        <h1>Agregar nuevo materia</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=AgregarMateria">
            <div>
                <!-- El ID de las materias es autoincrementable -->
                <label>Nombre de la materia:</label>
                <input type="text" name="nombreMateria" id="nombreMateria" required /><br><br>                
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la materia?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarMaterias">Regresar</a>
            </div>            
        </form>
    </body>
</html>
