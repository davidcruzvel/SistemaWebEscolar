<%-- 
    Document   : ModificarEstudiante
    Created on : 15-Nov-2023, 10:57:57
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Estudiante</title>
    </head>
    <body>   
        <h1>Modificar estudiante</h1>
        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=ModificarEstudiante">
            <div>
                <label>NIE:</label>
                <!-- Enviar un NIE auxiliar para modificar la llave primaria -->
                <input type="hidden" name="auxnie" id="auxnie" value="${param.nie}"/>
                <input type="text" name="nie" id="nie" value="${param.nie}" required /><br>
                <label>Nombres:</label>
                <input type="text" name="nombresEstudiante" id="nombresEstudiante" value="${param.nombresEstudiante}" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosEstudiante" id="apellidosEstudiante" value="${param.apellidosEstudiante}" required /><br>
                <label>Fecha de nacimiento:</label>
                <input type="date" name="fechaNacEstudiante" id="fechaNacEstudiante" value="${param.fechaNacEstudiante}" required /><br>
                <label>Género:</label>
                <input type="text" name="generoEstudiante" id="generoEstudiante" value="${param.generoEstudiante}" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefonoEstudiante" id="telefonoEstudiante" value="${param.telefonoEstudiante}" required /><br>
                <label>ID Encargado:</label>
                <input type="text" name="ID_Encargado" id="ID_Encargado" value="${param.ID_Encargado}" required /><br>
                <label>ID Dirección:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br><br>           
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el estudiante?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarEstudiantes">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
