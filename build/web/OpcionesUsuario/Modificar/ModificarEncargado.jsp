<%-- 
    Document   : ModificarEncargado
    Created on : 15-Nov-2023, 07:33:01
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Encargado</title>
    </head>
    <body>   
        <h1>Modificar encargado</h1>
        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=ModificarEncargado">
            <div>
                <label>ID Encargado:</label>
                <input type="text" name="ID_Encargado" id="ID_Encargado" value="${param.ID_Encargado}" readonly /><br>
                <label>Nombres:</label>
                <input type="text" name="nombresEncargado" id="nombresEncargado" value="${param.nombresEncargado}" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosEncargado" id="apellidosEncargado" value="${param.apellidosEncargado}" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefonoEncargado" id="telefonoEncargado" value="${param.telefonoEncargado}" required /><br>
                <label>DUI:</label>
                <input type="text" name="DUI_Encargado" id="DUI_Encargado" value="${param.DUI_Encargado}" required /><br>
                <label>ID Direccion:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br><br>           
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el encargado?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarEncargados">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>