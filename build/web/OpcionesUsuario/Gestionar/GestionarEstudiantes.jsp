<%-- 
    Document   : GestionarEstudiantes
    Created on : Nov 3, 2023, 3:00:25 AM
    Author     : david
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Estudiantes</title>
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
        <h1>Gestión de Estudiantes</h1>
        <h2>Listado de Estudiantes</h2>
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <a href="/SistemaWebEscolar?accion=AgregarEstudiante">Agregar estudiante</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>NIE</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Grado</th>
                    <th>Sección</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaEstudiantes}" var="item">
                    <tr>
                        <td><c:out value="${item.nie}" /></td>
                        <td><c:out value="${item.nombresEstudiante}" /></td>
                        <td><c:out value="${item.apellidosEstudiante}" /></td>
                        <!-- <td><c:out value="${item.fechaNacEstudiante}" /></td> -->
                        <!-- <td><c:out value="${item.generoEstudiante}" /></td> -->
                        <!-- <td><c:out value="${item.telefonoEstudiante}" /></td> -->
                        <!-- <td><c:out value="${item.ID_Encargado}" /></td> -->
                        <!-- <td><c:out value="${item.nombresEncargado}" /></td> -->
                        <!-- <td><c:out value="${item.apellidosEncargado}" /></td> -->
                        <!-- <td><c:out value="${item.ID_Direccion}" /></td> -->
                        <!-- <td><c:out value="${item.direccionCompleta}" /></td> -->
                        <!-- <td><c:out value="${item.ID_Matricula}" /></td> -->
                        <td><c:out value="${item.grado}" /></td>
                        <td><c:out value="${item.seccion}" /></td>
                        <!-- <td><c:out value="${item.anio}" /></td> -->
                        <!-- <td><c:out value="${item.aula}" /></td> -->
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesEstudiante(
                                                    '${item.nie}',
                                                    '${item.nombresEstudiante}',
                                                    '${item.apellidosEstudiante}',
                                                    '${item.fechaNacEstudiante}',
                                                    '${item.generoEstudiante}',
                                                    '${item.telefonoEstudiante}',
                                                    '${item.ID_Encargado}',
                                                    '${item.nombresEncargado}',
                                                    '${item.apellidosEncargado}',
                                                    '${item.ID_Direccion}',
                                                    '${item.direccionCompleta}',
                                                    '${item.ID_Matricula}',
                                                    '${item.grado}',
                                                    '${item.seccion}',
                                                    '${item.anio}',
                                                    '${item.aula}',
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>NIE: <span id="nie"></span></label><br>
                                <label>Nombres Estudiante: <span id="nombresEstudiante"></span></label><br>
                                <label>Apellidos Estudiante: <span id="apellidosEstudiante"></span></label><br>
                                <label>Fecha de Nacimiento: <span id="fechaNacEstudiante"></span></label><br>
                                <label>Género: <span id="generoEstudiante"></span></label><br>
                                <label>Teléfono: <span id="telefonoEstudiante"></span></label><br>
                                <label>ID Encargado: <span id="ID_Encargado"></span></label><br>
                                <label>Nombres Encargado: <span id="nombresEncargado"></span></label><br>
                                <label>Apellidos Encargado: <span id="apellidosEncargado"></span></label><br>
                                <label>ID Dirección: <span id="ID_Direccion"></span></label><br>
                                <label>Dirección: <span id="direccionCompleta"></span></label><br>
                                <label>ID Matricula: <span id="ID_Matricula"></span></label><br>
                                <label>Grado: <span id="grado"></span></label><br>
                                <label>Sección: <span id="seccion"></span></label><br>
                                <label>Año: <span id="anio"></span></label><br>
                                <label>Aula: <span id="aula"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>

                            <!-- Modificar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Modificar/ModificarEstudiante.jsp">
                                <input type="hidden" name="nie" value="${item.nie}" />
                                <input type="hidden" name="nombresEstudiante" value="${item.nombresEstudiante}" />
                                <input type="hidden" name="apellidosEstudiante" value="${item.apellidosEstudiante}" />
                                <input type="hidden" name="fechaNacEstudiante" value="${item.fechaNacEstudiante}" />
                                <input type="hidden" name="generoEstudiante" value="${item.generoEstudiante}" />
                                <input type="hidden" name="telefonoEstudiante" value="${item.telefonoEstudiante}" />
                                <input type="hidden" name="ID_Encargado" value="${item.ID_Encargado}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="submit" value="Modificar" />
                            </form>

                            <!-- Eliminar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Eliminar/EliminarEstudiante.jsp">
                                <input type="hidden" name="nie" value="${item.nie}" />
                                <input type="hidden" name="nombresEstudiante" value="${item.nombresEstudiante}" />
                                <input type="hidden" name="apellidosEstudiante" value="${item.apellidosEstudiante}" />
                                <input type="hidden" name="fechaNacEstudiante" value="${item.fechaNacEstudiante}" />
                                <input type="hidden" name="generoEstudiante" value="${item.generoEstudiante}" />
                                <input type="hidden" name="telefonoEstudiante" value="${item.telefonoEstudiante}" />
                                <input type="hidden" name="ID_Encargado" value="${item.ID_Encargado}" />
                                <input type="hidden" name="nombresEncargado" value="${item.nombresEncargado}" />
                                <input type="hidden" name="apellidosEncargado" value="${item.apellidosEncargado}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="hidden" name="direccionCompleta" value="${item.direccionCompleta}" />
                                <input type="hidden" name="ID_Matricula" value="${item.ID_Matricula}" />
                                <input type="hidden" name="grado" value="${item.grado}" />
                                <input type="hidden" name="seccion" value="${item.seccion}" />
                                <input type="hidden" name="anio" value="${item.anio}" />
                                <input type="hidden" name="aula" value="${item.aula}" />
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

        function mostrarDetallesEstudiante(nie, nombresEstudiante, apellidosEstudiante, fechaNacEstudiante, generoEstudiante, telefonoEstudiante, ID_Encargado, nombresEncargado, apellidosEncargado, ID_Direccion, direccionCompleta, ID_Matricula, grado, seccion, anio, aula) {
            document.getElementById('nie').textContent = nie;
            document.getElementById('nombresEstudiante').textContent = nombresEstudiante;
            document.getElementById('apellidosEstudiante').textContent = apellidosEstudiante;
            document.getElementById('fechaNacEstudiante').textContent = fechaNacEstudiante;
            document.getElementById('generoEstudiante').textContent = generoEstudiante;
            document.getElementById('telefonoEstudiante').textContent = telefonoEstudiante;
            document.getElementById('ID_Encargado').textContent = ID_Encargado;
            document.getElementById('nombresEncargado').textContent = nombresEncargado;
            document.getElementById('apellidosEncargado').textContent = apellidosEncargado;
            document.getElementById('ID_Direccion').textContent = ID_Direccion;
            document.getElementById('direccionCompleta').textContent = direccionCompleta;
            document.getElementById('ID_Matricula').textContent = ID_Matricula;
            document.getElementById('grado').textContent = grado;
            document.getElementById('seccion').textContent = seccion;
            document.getElementById('anio').textContent = anio;
            document.getElementById('aula').textContent = aula;
            
            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>