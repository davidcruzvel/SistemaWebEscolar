<%-- 
    Document   : GestionarEncargados
    Created on : Nov 3, 2023, 2:56:03 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Encargados</title>
        <style>
            /* Estilo para el contenedor del pop-up */
            .popup-container {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                z-index: 1;
            }

            /* Estilo para el fondo oscuro */
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 0;
            }
        </style>
    </head>
    <body>
        <h1>Gestión de Encargados</h1>
        <h2>Listado de Encargados</h2>
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <a href="/SistemaWebEscolar?accion=AgregarEncargado">Agregar encargado</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Encargado</th>                    
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Teléfono</th>                    
                    <th>DUI</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaEncargados}" var="item">
                    <tr>
                        <!-- Mostrar -->
                        <td><c:out value="${item.ID_Encargado}" /></td>
                        <td><c:out value="${item.nombresEncargado}" /></td>
                        <td><c:out value="${item.apellidosEncargado}" /></td>                        
                        <td><c:out value="${item.telefonoEncargado}" /></td>
                        <td><c:out value="${item.DUI_Encargado}" /></td>
                        <!-- <td><c:out value="${item.ID_Direccion}" /></td> -->
                        <!-- <td><c:out value="${item.direccionCompleta}" /></td> -->
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesEncargado(
                                                    '${item.ID_Encargado}',
                                                    '${item.nombresEncargado}',
                                                    '${item.apellidosEncargado}',
                                                    '${item.telefonoEncargado}',
                                                    '${item.DUI_Encargado}',
                                                    '${item.ID_Direccion}',
                                                    '${item.direccionCompleta}'
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Encargado: <span id="ID_Encargado"></span></label><br>
                                <label>Nombres: <span id="nombresEncargado"></span></label><br>
                                <label>Apellidos: <span id="apellidosEncargado"></span></label><br>
                                <label>Teléfono: <span id="telefonoEncargado"></span></label><br>
                                <label>DUI: <span id="DUI_Encargado"></span></label><br>
                                <label>ID Dirección: <span id="ID_Direccion"></span></label><br>
                                <label>Dirección: <span id="direccionCompleta"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>

                            <!-- Modificar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Modificar/ModificarEncargado.jsp">
                                <input type="hidden" name="ID_Encargado" value="${item.ID_Encargado}" />
                                <input type="hidden" name="nombresEncargado" value="${item.nombresEncargado}" />
                                <input type="hidden" name="apellidosEncargado" value="${item.apellidosEncargado}" />
                                <input type="hidden" name="telefonoEncargado" value="${item.telefonoEncargado}" />
                                <input type="hidden" name="DUI_Encargado" value="${item.DUI_Encargado}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="submit" value="Modificar" />
                            </form>

                            <!-- Eliminar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Eliminar/EliminarEncargado.jsp">
                                <input type="hidden" name="ID_Encargado" value="${item.ID_Encargado}" />
                                <input type="hidden" name="nombresEncargado" value="${item.nombresEncargado}" />
                                <input type="hidden" name="apellidosEncargado" value="${item.apellidosEncargado}" />
                                <input type="hidden" name="telefonoEncargado" value="${item.telefonoEncargado}" />
                                <input type="hidden" name="DUI_Encargado" value="${item.DUI_Encargado}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="hidden" name="direccionCompleta" value="${item.direccionCompleta}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
    <script>
        function abrirPopup() {
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');

            if (popup.style.display === 'block') {
                popup.style.display = 'none';
                overlay.style.display = 'none';
            } else {
                popup.style.display = 'block';
                overlay.style.display = 'block';
            }
        }

        function mostrarDetallesEncargado(ID_Encargado, nombresEncargado, apellidosEncargado, telefonoEncargado, DUI_Encargado, ID_Direccion, direccionCompleta) {
            document.getElementById('ID_Encargado').textContent = ID_Encargado;
            document.getElementById('nombresEncargado').textContent = nombresEncargado;
            document.getElementById('apellidosEncargado').textContent = apellidosEncargado;
            document.getElementById('telefonoEncargado').textContent = telefonoEncargado;
            document.getElementById('DUI_Encargado').textContent = DUI_Encargado;
            document.getElementById('ID_Direccion').textContent = ID_Direccion;
            document.getElementById('direccionCompleta').textContent = direccionCompleta;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
