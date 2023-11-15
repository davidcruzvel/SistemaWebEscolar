<%-- 
    Document   : AgregarMatricula
    Created on : 15-Nov-2023, 11:35:07
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Matricula</title>
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
        <h1>Registrar nueva matricula</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=AgregarMatricula">
            <div>
                <!-- El ID de las matriculas es autoincrementable -->
                <label>NIE:</label>
                <input type="text" name="nie" id="nie" required /><br>                
                <label>ID Grupo:</label>
                <input type="text" name="ID_Grupo" id="ID_Grupo" required /><br><br>
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la matrícula?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebEscolar/?accion=GestionarMatriculas">Regresar</a>
            </div>            
        </form>
    </body>
</html>
