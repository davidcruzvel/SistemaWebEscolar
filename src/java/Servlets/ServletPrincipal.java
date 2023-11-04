/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

//Importanto librerias de conexion con BD
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// Importando modelos
import Models.ViewModelEmpleados;
import Models.ViewModelCargos;
import Models.ViewModelEspecialidades;
import Models.ViewModelUsuarios;
import Models.ViewModelDocentes;
import Models.ViewModelGrupos;
import Models.ViewModelEncargados;
import Models.ViewModelEstudiantes;
import Models.ViewModelMatriculas;
import Models.ViewModelMaterias;
import Models.ViewModelCalificaciones;

//Importando librerias de servlets
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author david
 */
public class ServletPrincipal extends HttpServlet {

    //Estableciendo conexion con la BD
    private final String usuario = "sa";
    private final String contrasenia = "root";
    private final String servidor = "localhost:1433";
    private final String bd = "Escuela";

    String url = "jdbc:sqlserver://"
            + servidor
            + ";databaseName=" + bd
            + ";user=" + usuario
            + ";password=" + contrasenia
            + ";encrypt=false;trustServerCertificate=false;";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    //FUNCIONES DE CRUD SOBRE LA BASE DE DATOS
    //Funciones de lectura de tablas (SELECT)
    public void mostrarCargos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Cargos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelCargos> listaCargos = new ArrayList<>();
                while (rs.next()) {
                    ViewModelCargos cargo = new ViewModelCargos();
                    cargo.setID_Cargo(rs.getInt("ID_Cargo"));
                    cargo.setCargo(rs.getString("cargo"));
                    listaCargos.add(cargo);
                }
                request.setAttribute("listaCargos", listaCargos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarEspecialidades(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Especialidades";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelEspecialidades> listaEspecialidades = new ArrayList<>();
                while (rs.next()) {
                    ViewModelEspecialidades especialidad = new ViewModelEspecialidades();
                    especialidad.setID_Especialidad(rs.getInt("ID_Especialidad"));
                    especialidad.setNombreEspecialidad(rs.getString("nombreEspecialidad"));
                    especialidad.setCarrera(rs.getString("carrera"));
                    listaEspecialidades.add(especialidad);
                }
                request.setAttribute("listaEspecialidades", listaEspecialidades);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarEmpleados(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Empleados";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelEmpleados> listaEmpleados = new ArrayList<>();
                while (rs.next()) {
                    ViewModelEmpleados empleado = new ViewModelEmpleados();
                    empleado.setID_Empleado(rs.getInt("ID_Empleado"));
                    empleado.setDUI_Empleado(rs.getString("DUI_Empleado"));
                    empleado.setISSS_Empleado(rs.getInt("ISSS_Empleado"));
                    empleado.setNombresEmpleado(rs.getString("nombresEmpleado"));
                    empleado.setApellidosEmpleado(rs.getString("apellidosEmpleado"));
                    empleado.setFechaNacEmpleado(rs.getDate("fechaNacEmpleado"));
                    empleado.setTelefonoEmpleado(rs.getString("telefonoEmpleado"));
                    empleado.setCorreo(rs.getString("correo"));
                    empleado.setID_Cargo(rs.getInt("ID_Cargo"));
                    empleado.setID_Direccion(rs.getInt("ID_Direccion"));
                    listaEmpleados.add(empleado);
                }
                request.setAttribute("listaEmpleados", listaEmpleados);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Usuarios";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelUsuarios> listaUsuarios = new ArrayList<>();
                while (rs.next()) {
                    ViewModelUsuarios usuario = new ViewModelUsuarios();
                    usuario.setID_Usuario(rs.getInt("ID_Usuario"));
                    usuario.setID_Empleado(rs.getInt("ID_Empleado"));
                    usuario.setID_Rol(rs.getInt("ID_Rol"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setClave(rs.getString("clave"));
                    listaUsuarios.add(usuario);
                }
                request.setAttribute("listaUsuarios", listaUsuarios);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarDocentes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Docentes";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelDocentes> listaDocentes = new ArrayList<>();
                while (rs.next()) {
                    ViewModelDocentes docente = new ViewModelDocentes();
                    docente.setID_Docente(rs.getInt("ID_Docente"));
                    docente.setID_Empleado(rs.getInt("ID_Empleado"));
                    docente.setID_Especialidad(rs.getInt("ID_Especialidad"));
                    docente.setEscalafon(rs.getString("escalafon"));
                    listaDocentes.add(docente);
                }
                request.setAttribute("listaDocentes", listaDocentes);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarGrupos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Grupos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelGrupos> listaGrupos = new ArrayList<>();
                while (rs.next()) {
                    ViewModelGrupos grupo = new ViewModelGrupos();
                    grupo.setID_Grupo(rs.getInt("ID_Grupo"));
                    grupo.setGrado(rs.getString("grado"));
                    grupo.setSeccion(rs.getString("seccion"));
                    grupo.setAnio(rs.getInt("anio"));
                    grupo.setID_Turno(rs.getInt("ID_Turno"));
                    grupo.setID_Aula(rs.getInt("ID_Aula"));
                    grupo.setID_Docente(rs.getInt("ID_Docente"));
                    listaGrupos.add(grupo);
                }
                request.setAttribute("listaGrupos", listaGrupos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarEncargados(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Encargados";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelEncargados> listaEncargados = new ArrayList<>();
                while (rs.next()) {
                    ViewModelEncargados encargado = new ViewModelEncargados();
                    encargado.setID_Encargado(rs.getInt("ID_Encargado"));
                    encargado.setNombresEncargado(rs.getString("nombresEncargado"));
                    encargado.setApellidosEncargado(rs.getString("apellidosEncargado"));
                    encargado.setTelefonoEncargado(rs.getString("telefonoEncargado"));
                    encargado.setDUI_Encargado(rs.getString("DUI_Encargado"));
                    encargado.setID_Direccion(rs.getInt("ID_Direccion"));
                    listaEncargados.add(encargado);
                }
                request.setAttribute("listaEncargados", listaEncargados);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarEstudiantes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Estudiantes";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelEstudiantes> listaEstudiantes = new ArrayList<>();
                while (rs.next()) {
                    ViewModelEstudiantes estudiante = new ViewModelEstudiantes();
                    estudiante.setNie(rs.getInt("nie"));
                    estudiante.setNombresEstudiante(rs.getString("nombresEstudiante"));
                    estudiante.setApellidosEstudiante(rs.getString("apellidosEstudiante"));
                    estudiante.setFechaNacEstudiante(rs.getDate("fechaNacEstudiante"));
                    estudiante.setGeneroEstudiante(rs.getString("generoEstudiante"));
                    estudiante.setTelefonoEstudiante(rs.getString("telefonoEstudiante"));
                    estudiante.setID_Encargado(rs.getInt("ID_Encargado"));
                    estudiante.setID_Direccion(rs.getInt("ID_Direccion"));
                    listaEstudiantes.add(estudiante);
                }
                request.setAttribute("listaEstudiantes", listaEstudiantes);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarMatriculas(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Matriculas";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelMatriculas> listaMatriculas = new ArrayList<>();
                while (rs.next()) {
                    ViewModelMatriculas matricula = new ViewModelMatriculas();
                    matricula.setID_Matricula(rs.getInt("ID_Matricula"));
                    matricula.setNie(rs.getInt("nie"));
                    matricula.setID_Grupo(rs.getInt("ID_Grupo"));
                    listaMatriculas.add(matricula);
                }
                request.setAttribute("listaMatriculas", listaMatriculas);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarMaterias(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Materias";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelMaterias> listaMaterias = new ArrayList<>();
                while (rs.next()) {
                    ViewModelMaterias materia = new ViewModelMaterias();
                    materia.setID_Materia(rs.getInt("ID_Materia"));
                    materia.setNombreMateria(rs.getString("nombreMateria"));
                    listaMaterias.add(materia);
                }
                request.setAttribute("listaMaterias", listaMaterias);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarCalificaciones(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Calificaciones";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelCalificaciones> listaCalificaciones = new ArrayList<>();
                while (rs.next()) {
                    ViewModelCalificaciones calificacion = new ViewModelCalificaciones();
                    calificacion.setID_Calificacion(rs.getInt("ID_Calificacion"));
                    calificacion.setID_Materia(rs.getInt("ID_Materia"));
                    calificacion.setNie(rs.getInt("nie"));
                    calificacion.setID_Docente(rs.getInt("ID_Docente"));
                    calificacion.setExamen1(rs.getDouble("examen1"));
                    calificacion.setExamen2(rs.getDouble("examen2"));
                    calificacion.setExamen3(rs.getDouble("examen3"));
                    calificacion.setExamenFinal(rs.getDouble("examenFinal"));
                    calificacion.setTareas(rs.getDouble("tareas"));
                    calificacion.setPromedio(rs.getDouble("promedio"));
                    calificacion.setEstado(rs.getString("estado"));
                    listaCalificaciones.add(calificacion);
                }
                request.setAttribute("listaCalificaciones", listaCalificaciones);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    //Funciones de escritura en tablas (INSERT)
    public void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefonoEmpleado");
        String correo = request.getParameter("correo");
        String ID_Cargo = request.getParameter("ID_Cargo");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Empleados values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, DUI_Empleado);
                pstmt.setString(2, ISSS_Empleado);
                pstmt.setString(3, nombresEmpleado);
                pstmt.setString(4, apellidosEmpleado);
                pstmt.setString(5, fechaNacEmpleado);
                pstmt.setString(6, telefonoEmpleado);
                pstmt.setString(7, correo);
                pstmt.setString(8, ID_Cargo);
                pstmt.setString(9, ID_Direccion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    //Funciones de actualizacion de registros (UPDATE)
    public void modificarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Empleado = request.getParameter("ID_Empleado");
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefonoEmpleado");
        String correo = request.getParameter("correo");
        String ID_Cargo = request.getParameter("ID_Cargo");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                
                String sql = "update Empleados set "
                 + "DUI_Empleado='"+DUI_Empleado+"', "
                 + "ISSS_Empleado='"+ISSS_Empleado+"', "
                 + "NombresEmpleado='"+nombresEmpleado+"', "
                 + "ApellidosEmpleado='"+apellidosEmpleado+"', "
                 + "FechaNacEmpleado='"+fechaNacEmpleado+"', "
                 + "TelefonoEmpleado='"+telefonoEmpleado+"', "
                 + "Correo='"+correo+"', " 
                 + "ID_Cargo='"+ID_Cargo+"', "
                 + "ID_Direccion='"+ID_Direccion+"' " 
                 + "where ID_Empleado='"+ID_Empleado+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    //Funciones de eliminacion de registros (DELETE)
    public void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        String ID_Empleado = request.getParameter("ID_Empleado");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Empleados where ID_Empleado='" + ID_Empleado + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    //Metodos doGet y doPost
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //REDIRECCIONES DE PAGINAS
        String accion = request.getParameter("accion");
        if (accion == null) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        } else if (accion.equals("Login")) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        } else if (accion.equals("GestionarCargos")) {
            mostrarCargos(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarCargos.jsp").forward(request, response);
        } else if (accion.equals("GestionarEmpleados")) {
            mostrarEmpleados(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarEmpleados.jsp").forward(request, response);
        } else if (accion.equals("GestionarEspecialidades")) {
            mostrarEspecialidades(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarEspecialidades.jsp").forward(request, response);
        } else if (accion.equals("GestionarUsuarios")) {
            mostrarUsuarios(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarUsuarios.jsp").forward(request, response);
        } else if (accion.equals("GestionarDocentes")) {
            mostrarDocentes(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarDocentes.jsp").forward(request, response);
        } else if (accion.equals("GestionarGrupos")) {
            mostrarGrupos(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarGrupos.jsp").forward(request, response);
        } else if (accion.equals("GestionarEncargados")) {
            mostrarEncargados(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarEncargados.jsp").forward(request, response);
        } else if (accion.equals("GestionarEstudiantes")) {
            mostrarEstudiantes(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarEstudiantes.jsp").forward(request, response);
        } else if (accion.equals("GestionarMatriculas")) {
            mostrarMatriculas(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarMatriculas.jsp").forward(request, response);
        } else if (accion.equals("GestionarMaterias")) {
            mostrarMaterias(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarMaterias.jsp").forward(request, response);
        } else if (accion.equals("GestionarCalificaciones")) {
            mostrarCalificaciones(request, response);
            request.getRequestDispatcher("OpcionesUsuario/GestionarCalificaciones.jsp").forward(request, response);

            //REDIRECCION PARA JSP DE AGREGAR
        } else if (accion.equals("AgregarEmpleado")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("OpcionesUsuario/AgregarEmpleado.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //AUTENTICACION DE CREDENCIALES
        String accion = request.getParameter("accion");

        if (accion.equals("Login")) {
            String usuario = request.getParameter("tfUsuario");
            String contrasenia = request.getParameter("tfContrasenia");

            try (PrintWriter print = response.getWriter()) {
                if (usuario.equals("admin") && contrasenia.equals("root")) {
                    request.getRequestDispatcher("PanelesUsuario/PanelAdministrador.jsp").forward(request, response);
                } else if (usuario.equals("director") && contrasenia.equals("1234")) {
                    request.getRequestDispatcher("PanelesUsuario/PanelDirector.jsp").forward(request, response);
                } else if (usuario.equals("docente") && contrasenia.equals("1234")) {
                    request.getRequestDispatcher("PanelesUsuario/PanelDocente.jsp").forward(request, response);
                } else if (usuario.equals("rrhh") && contrasenia.equals("1234")) {
                    request.getRequestDispatcher("PanelesUsuario/PanelRRHH.jsp").forward(request, response);
                } else {
                    print.println("<!DOCTYPE html>");
                    print.println("<html>");
                    print.println("<head>");
                    print.println("<title>Login Sistema Escolar</title>");
                    print.println("</head>");
                    print.println("<body>");
                    print.println("<h2>Error: La contraseña o el usuario son erróneos</h2>");
                    print.println("</body>");
                    print.println("</html>");
                }
            }
        }

        //CAPTURA DE DATOS ENVIADOS POR POST
        if (accion.equals("AgregarEmpleado")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarEmpleado(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarEmpleado");
        } else if (accion.equals("ModificarEmpleado")) {
            modificarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        } else if (accion.equals("EliminarEmpleado")) {
            eliminarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
