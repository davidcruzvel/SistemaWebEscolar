<%-- 
    Document   : AgregarDireccion
    Created on : 18-Nov-2023, 06:38:57
    Author     : david
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pre-registro de Direcciones</title>
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
        <h1>Agregar nueva dirección</h1>

        <form method="POST" action="/SistemaWebEscolar/ServletPrincipal?accion=AgregarDireccion">
            <div>
                <!-- El ID de las direcciones es autoincrementable -->
                <label>Departamento:</label>
                <select name="ID_Departamento" id="ID_Departamento" onchange="cargarMunicipios()" required>
                    <option value="-1" selected>Seleccione una opción</option>
                    <c:forEach var="item" items="${listaDepartamentos}">
                        <option value="${item.ID_Departamento}">${item.departamento}</option>
                    </c:forEach>
                </select><br>
                <label>Municipio:</label>
                <select name="ID_Municipio" id="ID_Municipio" required>
                    <option value="-1" selected>Seleccione una opción</option>
                    <c:forEach var="item" items="${listaMunicipios}">
                        <option value="${item.ID_Municipio}">${item.municipio}</option>
                    </c:forEach>
                </select><br>
                <label>Distrito:</label>
                <select name="ID_Distrito" id="ID_Distrito" required>
                    <option value="">Seleccione una opción</option>
                    <c:forEach var="item" items="${listaDistritos}">
                        <option value="${item.ID_Distrito}">${item.distrito}</option>
                    </c:forEach>
                </select><br><br>             
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la dirección?')" /><br><br>
            </div><br>
        </form>
    </body>
</html>
