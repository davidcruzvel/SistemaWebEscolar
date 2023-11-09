<%-- 
    Document   : MenuRRHH
    Created on : Nov 3, 2023, 7:52:03 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú Recursos Humanos</title>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="/SistemaWebEscolar?accion=GestionarCargos">Gestionar Cargos</a></li>
                <li><a href="/SistemaWebEscolar?accion=GestionarEmpleados">Gestionar Empleados</a></li>
                <li><a href="/SistemaWebEscolar?accion=GestionarEspecialidades">Gestionar Especialidades</a></li>
                <li><a href="/SistemaWebEscolar?accion=GestionarDocentes">Gestionar Docentes</a></li>
                <!-- Podra visualizar los usuarios pero no insertar, modificar ni eliminar. Permiso solo lectura.-->                
                <li><a href="/SistemaWebEscolar?accion=GestionarUsuarios">Gestionar Usuarios</a></li>
            </ul>
        </nav>
    </body>
</html>
