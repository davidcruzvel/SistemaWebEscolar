<%-- 
    Document   : MenuDocente
    Created on : Nov 3, 2023, 7:38:49 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú Docente</title>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="/SistemaWebEscolar?accion=GestionarEncargados">Gestionar Encargados</a></li>
                <li><a href="/SistemaWebEscolar?accion=GestionarEstudiantes">Gestionar Estudiantes</a></li>
                <li><a href="/SistemaWebEscolar?accion=GestionarMatriculas">Gestionar Matriculas</a></li>
                <li><a href="/SistemaWebEscolar?accion=GestionarCalificaciones">Gestionar Calificaciones</a></li>
                <!-- Podra visualizar las materias pero no insertar, modificar ni eliminar. Permiso solo lectura.-->                
                <li><a href="/SistemaWebEscolar?accion=GestionarMaterias">Gestionar Materias</a></li>
            </ul>
        </nav>
    </body>
</html>