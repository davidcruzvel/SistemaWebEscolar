<%-- 
    Document   : GestionarGrupos
    Created on : Nov 3, 2023, 2:53:07 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Grupos</title>
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
        <h1>Gestión de Grupos</h1>
        <h2>Listado de Grupos</h2>
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <a href="/SistemaWebEscolar?accion=AgregarGrupo">Agregar grupo</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Grupo</th>
                    <th>Grado</th>
                    <th>Sección</th>
                    <th>Año</th>
                    <th>Turno</th>
                    <th>Aula</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>                
                <c:forEach items="${listaGrupos}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Grupo}" /></td>
                        <td><c:out value="${item.grado}" /></td>
                        <td><c:out value="${item.seccion}" /></td>
                        <td><c:out value="${item.anio}" /></td>
                        <!-- <td><c:out value="${item.ID_Turno}" /></td> -->
                        <td><c:out value="${item.turno}" /></td>
                        <!-- <td><c:out value="${item.ID_Aula}" /></td> -->
                        <td><c:out value="${item.aula}" /></td>
                        <!-- <td><c:out value="${item.ID_Docente}" /></td> -->
                        <!-- <td><c:out value="${item.docenteGuia}" /></td> -->
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesGrupo(
                                                    '${item.ID_Grupo}',
                                                    '${item.grado}',
                                                    '${item.seccion}',
                                                    '${item.anio}',
                                                    '${item.ID_Turno}',
                                                    '${item.turno}',
                                                    '${item.ID_Aula}',
                                                    '${item.aula}',
                                                    '${item.ID_Docente}',
                                                    '${item.docenteGuia}'
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Grupo: <span id="ID_Grupo"></span></label><br>
                                <label>Grado: <span id="grado"></span></label><br>
                                <label>Sección: <span id="seccion"></span></label><br>
                                <label>Año: <span id="anio"></span></label><br>
                                <label>ID Turno: <span id="ID_Turno"></span></label><br>
                                <label>Turno: <span id="turno"></span></label><br>
                                <label>ID Aula: <span id="ID_Aula"></span></label><br>
                                <label>Aula: <span id="aula"></span></label><br>
                                <label>ID Docente: <span id="ID_Docente"></span></label><br>
                                <label>Docente Guía: <span id="docenteGuia"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>

                            <!-- Modificar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Modificar/ModificarGrupo.jsp">
                                <input type="hidden" name="ID_Grupo" value="${item.ID_Grupo}" />
                                <input type="hidden" name="grado" value="${item.grado}" />
                                <input type="hidden" name="seccion" value="${item.seccion}" />
                                <input type="hidden" name="anio" value="${item.anio}" />
                                <input type="hidden" name="ID_Turno" value="${item.ID_Turno}" />
                                <input type="hidden" name="ID_Aula" value="${item.ID_Aula}" />
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="submit" value="Modificar" />
                            </form>

                            <!-- Eliminar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Eliminar/EliminarGrupo.jsp">
                                <input type="hidden" name="ID_Grupo" value="${item.ID_Grupo}" />
                                <input type="hidden" name="grado" value="${item.grado}" />
                                <input type="hidden" name="seccion" value="${item.seccion}" />
                                <input type="hidden" name="anio" value="${item.anio}" />
                                <input type="hidden" name="ID_Turno" value="${item.ID_Turno}" />
                                <input type="hidden" name="turno" value="${item.turno}" />
                                <input type="hidden" name="ID_Aula" value="${item.ID_Aula}" />
                                <input type="hidden" name="aula" value="${item.aula}" />
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="hidden" name="docenteGuia" value="${item.docenteGuia}" />
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

        function mostrarDetallesGrupo(ID_Grupo, grado, seccion, anio, ID_Turno, turno, ID_Aula, aula, ID_Docente, docenteGuia) {
            document.getElementById('ID_Grupo').textContent = ID_Grupo;
            document.getElementById('grado').textContent = grado;
            document.getElementById('seccion').textContent = seccion;
            document.getElementById('anio').textContent = anio;
            document.getElementById('ID_Turno').textContent = ID_Turno;
            document.getElementById('turno').textContent = turno;
            document.getElementById('ID_Aula').textContent = ID_Aula;
            document.getElementById('aula').textContent = aula;
            document.getElementById('ID_Docente').textContent = ID_Docente;
            document.getElementById('docenteGuia').textContent = docenteGuia;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>