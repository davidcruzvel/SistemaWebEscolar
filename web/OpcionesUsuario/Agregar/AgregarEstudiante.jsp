<%-- 
    Document   : AgregarEstudiante
    Created on : 15-Nov-2023, 10:54:42
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Estudiante</title>
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
        <h1>Agregar nuevo estudiante</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=AgregarEstudiante">
            <div>
                <label>NIE: </label>
                <input type="text" name="nie" id="nie" required /><br>
                <label>Nombres:</label>
                <input type="text" name="nombresEstudiante" id="nombresEstudiante" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosEstudiante" id="apellidosEstudiante" required /><br>
                <label>Fecha de nacimiento:</label>
                <input type="date" name="fechaNacEstudiante" id="fechaNacEstudiante" required /><br>
                <label>Género:</label>
                <input type="text" name="generoEstudiante" id="generoEstudiante" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefonoEstudiante" id="telefonoEstudiante" required /><br>
                <label>ID Encargado:</label>
                <input type="text" name="ID_Encargado" id="ID_Encargado" required /><br>
                <label>ID Dirección:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" required /><br><br>                            
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el estudiante?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarEstudiantes">Regresar</a>
            </div>            
        </form>
    </body>
</html>
