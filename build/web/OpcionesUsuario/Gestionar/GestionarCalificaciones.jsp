<%-- 
    Document   : GestionarCalificaciones
    Created on : Nov 3, 2023, 3:08:32 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Calificaciones</title>
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
        <h1>Gestión de Calificaciones</h1>
        <h2>Listado de Calificaciones</h2>
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <a href="/SistemaWebEscolar?accion=AgregarCalificacion">Nueva Calificación</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Calificación</th>
                    <th>Materia</th>
                    <th>NIE</th>
                    <th>Nombres Estudiante</th>
                    <th>Apellidos Estudiante</th>
                    <th>Promedio</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaCalificaciones}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Calificacion}" /></td>
                        <!-- <td><c:out value="${item.ID_Materia}" /></td> -->
                        <td><c:out value="${item.nombreMateria}" /></td>
                        <td><c:out value="${item.nie}" /></td>
                        <td><c:out value="${item.nombresEstudiante}" /></td>
                        <td><c:out value="${item.apellidosEstudiante}" /></td>                        
                        <!-- <td><c:out value="${item.examen1}" /></td> -->
                        <!-- <td><c:out value="${item.examen2}" /></td> -->
                        <!-- <td><c:out value="${item.examen3}" /></td> -->
                        <!-- <td><c:out value="${item.examenFinal}" /></td> -->
                        <!-- <td><c:out value="${item.tareas}" /></td> -->
                        <td><c:out value="${item.promedio}" /></td>
                        <td><c:out value="${item.estado}" /></td>
                        <!-- <td><c:out value="${item.ID_Docente}" /></td> -->
                        <!-- <td><c:out value="${item.nombresEmpleado}" /></td> -->
                        <!-- <td><c:out value="${item.apellidosEmpleado}" /></td> -->
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesCalificaciones(
                                                    '${item.ID_Calificacion}',
                                                    '${item.ID_Materia}',
                                                    '${item.nombreMateria}',
                                                    '${item.nie}',
                                                    '${item.nombresEstudiante}',
                                                    '${item.apellidosEstudiante}',
                                                    '${item.examen1}',
                                                    '${item.examen2}',
                                                    '${item.examen3}',
                                                    '${item.examenFinal}',
                                                    '${item.tareas}',
                                                    '${item.promedio}',
                                                    '${item.estado}',
                                                    '${item.ID_Docente}',
                                                    '${item.nombresEmpleado}',
                                                    '${item.apellidosEmpleado}'
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Calificación: <span id="ID_Calificacion"></span></label><br>
                                <label>ID Materia: <span id="ID_Materia"></span></label><br>
                                <label>Materia: <span id="nombreMateria"></span></label><br>
                                <label>NIE: <span id="nie"></span></label><br>
                                <label>Nombres Estudiante: <span id="nombresEstudiante"></span></label><br>
                                <label>Apellidos Estudiante: <span id="apellidosEstudiante"></span></label><br>
                                <label>Examen 1: <span id="examen1"></span></label><br>
                                <label>Examen 2: <span id="examen2"></span></label><br>
                                <label>Examen 3: <span id="examen3"></span></label><br>
                                <label>Examen Final: <span id="examenFinal"></span></label><br>
                                <label>Tareas: <span id="tareas"></span></label><br>
                                <label>Promedio: <span id="promedio"></span></label><br>
                                <label>Estado: <span id="estado"></span></label><br>
                                <label>ID Docente: <span id="ID_Docente"></span></label><br>
                                <label>Nombres Docente: <span id="nombresEmpleado"></span></label><br>
                                <label>Apellidos Docente: <span id="apellidosEmpleado"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>
                            <!-- Modificar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Modificar/ModificarCalificacion.jsp">
                                <input type="hidden" name="ID_Calificacion" value="${item.ID_Calificacion}" />
                                <input type="hidden" name="ID_Materia" value="${item.ID_Materia}" />
                                <input type="hidden" name="nie" value="${item.nie}" />
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="hidden" name="examen1" value="${item.examen1}" />
                                <input type="hidden" name="examen2" value="${item.examen2}" />
                                <input type="hidden" name="examen3" value="${item.examen3}" />
                                <input type="hidden" name="examenFinal" value="${item.examenFinal}" />
                                <input type="hidden" name="tareas" value="${item.tareas}" />
                                <input type="hidden" name="promedio" value="${item.promedio}" />
                                <input type="hidden" name="estado" value="${item.estado}" />
                                <input type="submit" value="Modificar" />
                            </form>    

                            <!-- Eliminar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/Eliminar/EliminarCalificacion.jsp">
                                <input type="hidden" name="ID_Calificacion" value="${item.ID_Calificacion}" />
                                <input type="hidden" name="ID_Materia" value="${item.ID_Materia}" />
                                <input type="hidden" name="nombreMateria" value="${item.nombreMateria}" />
                                <input type="hidden" name="nie" value="${item.nie}" />
                                <input type="hidden" name="nombresEstudiante" value="${item.nombresEstudiante}" />
                                <input type="hidden" name="apellidosEstudiante" value="${item.apellidosEstudiante}" />
                                <input type="hidden" name="examen1" value="${item.examen1}" />
                                <input type="hidden" name="examen2" value="${item.examen2}" />
                                <input type="hidden" name="examen3" value="${item.examen3}" />
                                <input type="hidden" name="examenFinal" value="${item.examenFinal}" />
                                <input type="hidden" name="tareas" value="${item.tareas}" />
                                <input type="hidden" name="promedio" value="${item.promedio}" />
                                <input type="hidden" name="estado" value="${item.estado}" />
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />
                                <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />
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

        function mostrarDetallesCalificaciones(ID_Calificacion, ID_Materia, nombreMateria, nie, nombresEstudiante, apellidosEstudiante, examen1, examen2, examen3, examenFinal, tareas, promedio, estado, ID_Docente, nombresEmpleado, apellidosEmpleado) {
            document.getElementById('ID_Calificacion').textContent = ID_Calificacion;
            document.getElementById('ID_Materia').textContent = ID_Materia;
            document.getElementById('nombreMateria').textContent = nombreMateria;
            document.getElementById('nie').textContent = nie;
            document.getElementById('nombresEstudiante').textContent = nombresEstudiante;
            document.getElementById('apellidosEstudiante').textContent = apellidosEstudiante;
            document.getElementById('examen1').textContent = examen1;
            document.getElementById('examen2').textContent = examen2;
            document.getElementById('examen3').textContent = examen3;
            document.getElementById('examenFinal').textContent = examenFinal;
            document.getElementById('tareas').textContent = tareas;
            document.getElementById('promedio').textContent = promedio;
            document.getElementById('estado').textContent = estado;
            document.getElementById('ID_Docente').textContent = ID_Docente;
            document.getElementById('nombresEmpleado').textContent = nombresEmpleado;
            document.getElementById('apellidosEmpleado').textContent = apellidosEmpleado;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>