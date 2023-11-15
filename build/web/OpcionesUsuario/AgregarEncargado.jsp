<%-- 
    Document   : AgregarEncargado
    Created on : 15-Nov-2023, 07:22:22
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Encargado</title>
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
        <h1>Agregar nuevo encargado</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=AgregarEncargado">
            <div>
                <!-- El ID de los encargados es autoincrementable -->
                <label>Nombres:</label>
                <input type="text" name="nombresEncargado" id="nombresEncargado" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosEncargado" id="apellidosEncargado" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefonoEncargado" id="telefonoEncargado" required /><br>
                <label>DUI:</label>
                <input type="text" name="DUI_Encargado" id="DUI_Encargado" required /><br>
                <label>ID Direccion:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" required /><br><br>                            
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el encargado?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarEncargados">Regresar</a>
            </div>            
        </form>
    </body>
</html>