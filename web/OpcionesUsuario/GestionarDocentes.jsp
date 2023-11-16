<%-- 
    Document   : GestionarDocentes
    Created on : Nov 3, 2023, 2:51:00 AM
    Author     : david
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Docentes</title>
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
        <h1>Gestión de Docentes</h1>
        <h2>Listado de Docentes</h2>        
        <h3>Conexion: ${mensaje_conexion}</h3><br><br>

        <a href="/SistemaWebEscolar?accion=AgregarDocente">Agregar docente</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>Escalafón</th> 
                    <th>Nombres</th> 
                    <th>Apellidos</th>
                    <th>Especialidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaDocentes}" var="item">
                    <tr>
                        <!-- Mostrar -->
                        <td><c:out value="${item.escalafon}" /></td>                        
                        <td><c:out value="${item.nombresEmpleado}" /></td>
                        <td><c:out value="${item.apellidosEmpleado}" /></td>                        
                        <td><c:out value="${item.nombreEspecialidad}" /></td>                          
                        <!-- <td><c:out value="${item.ID_Docente}" /></td> -->
                        <!-- <td><c:out value="${item.ID_Empleado}" /></td> -->
                        <!-- <td><c:out value="${item.ID_Especialidad}" /></td> -->
                        <!-- <td><c:out value="${item.carrera}" /></td> -->
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesDocente(
                                                    '${item.escalafon}',
                                                    '${item.ID_Docente}',
                                                    '${item.ID_Empleado}',
                                                    '${item.nombresEmpleado}',
                                                    '${item.apellidosEmpleado}',
                                                    '${item.ID_Especialidad}',
                                                    '${item.nombreEspecialidad}',
                                                    '${item.carrera}'
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>Escalafón: <span id="escalafon"></span></label><br>
                                <label>ID Docente: <span id="ID_Docente"></span></label><br>
                                <label>ID Empleado: <span id="ID_Empleado"></span></label><br>
                                <label>Nombres: <span id="nombresEmpleado"></span></label><br>
                                <label>Apellidos: <span id="apellidosEmpleado"></span></label><br>
                                <label>ID Especialidad: <span id="ID_Especialidad"></span></label><br>
                                <label>Especialidad: <span id="nombreEspecialidad"></span></label><br>
                                <label>Carrera: <span id="carrera"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>

                            <!-- Modificar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/ModificarDocente.jsp">
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="ID_Especialidad" value="${item.ID_Especialidad}" />
                                <input type="hidden" name="escalafon" value="${item.escalafon}" />
                                <input type="submit" value="Modificar" />
                            </form>

                            <!-- Eliminar -->
                            <form method="POST" action="/SistemaWebEscolar/OpcionesUsuario/EliminarDocente.jsp">
                                <input type="hidden" name="ID_Docente" value="${item.ID_Docente}" />
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="escalafon" value="${item.escalafon}" />
                                <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />
                                <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />
                                <input type="hidden" name="ID_Especialidad" value="${item.ID_Especialidad}" />
                                <input type="hidden" name="nombreEspecialidad" value="${item.nombreEspecialidad}" />
                                <input type="hidden" name="carrera" value="${item.carrera}" />
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

        function mostrarDetallesDocente(escalafon, ID_Docente, ID_Empleado, nombresEmpleado, apellidosEmpleado, ID_Especialidad, nombreEspecialidad, carrera) {
            document.getElementById('escalafon').textContent = escalafon;
            document.getElementById('ID_Docente').textContent = ID_Docente;
            document.getElementById('ID_Empleado').textContent = ID_Empleado;
            document.getElementById('nombresEmpleado').textContent = nombresEmpleado;
            document.getElementById('apellidosEmpleado').textContent = apellidosEmpleado;
            document.getElementById('ID_Especialidad').textContent = ID_Especialidad;
            document.getElementById('nombreEspecialidad').textContent = nombreEspecialidad;
            document.getElementById('carrera').textContent = carrera;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>