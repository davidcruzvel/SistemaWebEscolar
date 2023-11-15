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
                String sqlQuery = "select * from VistaEmpleados";
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
                    empleado.setCargo(rs.getString("cargo"));
                    //empleado.setID_Cargo(rs.getInt("ID_Cargo"));
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

    public void agregarCalificacion(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de las calificaciones es autoincrementable
        String ID_Materia = request.getParameter("ID_Materia");
        String nie = request.getParameter("nie");
        String ID_Docente = request.getParameter("ID_Docente");
        String examen1 = request.getParameter("examen1");
        String examen2 = request.getParameter("examen2");
        String examen3 = request.getParameter("examen3");
        String examenFinal = request.getParameter("examenFinal");
        String tareas = request.getParameter("tareas");
        String promedio = request.getParameter("promedio");
        String estado = request.getParameter("estado");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Calificaciones values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, ID_Materia);
                pstmt.setString(2, nie);
                pstmt.setString(3, ID_Docente);
                pstmt.setString(4, examen1);
                pstmt.setString(5, examen2);
                pstmt.setString(6, examen3);
                pstmt.setString(7, examenFinal);
                pstmt.setString(8, tareas);
                pstmt.setString(9, promedio);
                pstmt.setString(10, estado);
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

    public void agregarCargo(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los cargos es autoincrementable
        String cargo = request.getParameter("cargo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Cargos values (?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, cargo);
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

    public void agregarEspecialidad(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de las especialidades es autoincrementable
        String nombreEspecialidad = request.getParameter("nombreEspecialidad");
        String carrera = request.getParameter("carrera");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Especialidades values (?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombreEspecialidad);
                pstmt.setString(2, carrera);
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

    public void agregarDocente(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los docentes es autoincrementable
        String ID_Empleado = request.getParameter("ID_Empleado");
        String ID_Especialidad = request.getParameter("ID_Especialidad");
        String escalafon = request.getParameter("escalafon");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Docentes values (?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, ID_Empleado);
                pstmt.setString(2, ID_Especialidad);
                pstmt.setString(3, escalafon);
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

    public void agregarGrupo(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los grupos es autoincrementable
        String grado = request.getParameter("grado");
        String seccion = request.getParameter("seccion");
        String anio = request.getParameter("anio");
        String ID_Turno = request.getParameter("ID_Turno");
        String ID_Aula = request.getParameter("ID_Aula");
        String ID_Docente = request.getParameter("ID_Docente");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Grupos values (?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, grado);
                pstmt.setString(2, seccion);
                pstmt.setString(3, anio);
                pstmt.setString(4, ID_Turno);
                pstmt.setString(5, ID_Aula);
                pstmt.setString(6, ID_Docente);
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

    public void agregarEncargado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los encargados es autoincrementable
        String nombresEncargado = request.getParameter("nombresEncargado");
        String apellidosEncargado = request.getParameter("apellidosEncargado");
        String telefonoEncargado = request.getParameter("telefonoEncargado");
        String DUI_Encargado = request.getParameter("DUI_Encargado");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Encargados values (?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresEncargado);
                pstmt.setString(2, apellidosEncargado);
                pstmt.setString(3, telefonoEncargado);
                pstmt.setString(4, DUI_Encargado);
                pstmt.setString(5, ID_Direccion);
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

    public void agregarEstudiante(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String nie = request.getParameter("nie");
        String nombresEstudiante = request.getParameter("nombresEstudiante");
        String apellidosEstudiante = request.getParameter("apellidosEstudiante");
        String fechaNacEstudiante = request.getParameter("fechaNacEstudiante");
        String generoEstudiante = request.getParameter("generoEstudiante");
        String telefonoEstudiante = request.getParameter("telefonoEstudiante");
        String ID_Encargado = request.getParameter("ID_Encargado");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Estudiantes values (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nie);
                pstmt.setString(2, nombresEstudiante);
                pstmt.setString(3, apellidosEstudiante);
                pstmt.setString(4, fechaNacEstudiante);
                pstmt.setString(5, generoEstudiante);
                pstmt.setString(6, telefonoEstudiante);
                pstmt.setString(7, ID_Encargado);
                pstmt.setString(8, ID_Direccion);
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
                        + "DUI_Empleado='" + DUI_Empleado + "', "
                        + "ISSS_Empleado='" + ISSS_Empleado + "', "
                        + "NombresEmpleado='" + nombresEmpleado + "', "
                        + "ApellidosEmpleado='" + apellidosEmpleado + "', "
                        + "FechaNacEmpleado='" + fechaNacEmpleado + "', "
                        + "TelefonoEmpleado='" + telefonoEmpleado + "', "
                        + "Correo='" + correo + "', "
                        + "ID_Cargo='" + ID_Cargo + "', "
                        + "ID_Direccion='" + ID_Direccion + "' "
                        + "where ID_Empleado='" + ID_Empleado + "'";

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

    public void modificarCalificacion(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Calificacion = request.getParameter("ID_Calificacion");
        String ID_Materia = request.getParameter("ID_Materia");
        String nie = request.getParameter("nie");
        String ID_Docente = request.getParameter("ID_Docente");
        String examen1 = request.getParameter("examen1");
        String examen2 = request.getParameter("examen2");
        String examen3 = request.getParameter("examen3");
        String examenFinal = request.getParameter("examenFinal");
        String tareas = request.getParameter("tareas");
        String promedio = request.getParameter("promedio");
        String estado = request.getParameter("estado");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Calificaciones set "
                        + "ID_Materia='" + ID_Materia + "', "
                        + "nie='" + nie + "', "
                        + "ID_Docente='" + ID_Docente + "', "
                        + "examen1='" + examen1 + "', "
                        + "examen2='" + examen2 + "', "
                        + "examen3='" + examen3 + "', "
                        + "examenFinal='" + examenFinal + "', "
                        + "tareas='" + tareas + "', "
                        + "promedio='" + promedio + "', "
                        + "estado='" + estado + "' "
                        + "where ID_Calificacion='" + ID_Calificacion + "'";

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

    public void modificarCargo(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Cargo = request.getParameter("ID_Cargo");
        String cargo = request.getParameter("cargo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Cargos set "
                        + "cargo='" + cargo + "' "
                        + "where ID_Cargo='" + ID_Cargo + "'";

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

    public void modificarEspecialidad(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Especialidad = request.getParameter("ID_Especialidad");
        String nombreEspecialidad = request.getParameter("nombreEspecialidad");
        String carrera = request.getParameter("carrera");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Especialidades set "
                        + "nombreEspecialidad='" + nombreEspecialidad + "', "
                        + "carrera='" + carrera + "' "
                        + "where ID_Especialidad='" + ID_Especialidad + "'";

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

    public void modificarDocente(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Docente = request.getParameter("ID_Docente");
        String ID_Empleado = request.getParameter("ID_Empleado");
        String ID_Especialidad = request.getParameter("ID_Especialidad");
        String escalafon = request.getParameter("escalafon");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Docentes set "
                        + "ID_Empleado='" + ID_Empleado + "', "
                        + "ID_Especialidad='" + ID_Especialidad + "', "
                        + "escalafon='" + escalafon + "' "
                        + "where ID_Docente='" + ID_Docente + "'";

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

    public void modificarGrupo(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Grupo = request.getParameter("ID_Grupo");
        String grado = request.getParameter("grado");
        String seccion = request.getParameter("seccion");
        String anio = request.getParameter("anio");
        String ID_Turno = request.getParameter("ID_Turno");
        String ID_Aula = request.getParameter("ID_Aula");
        String ID_Docente = request.getParameter("ID_Docente");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Grupos set "
                        + "grado='" + grado + "', "
                        + "seccion='" + seccion + "', "
                        + "anio='" + anio + "', "
                        + "ID_Turno='" + ID_Turno + "', "
                        + "ID_Aula='" + ID_Aula + "', "
                        + "ID_Docente='" + ID_Docente + "' "
                        + "where ID_Grupo='" + ID_Grupo + "'";

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

    public void modificarEncargado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Encargado = request.getParameter("ID_Encargado");
        String nombresEncargado = request.getParameter("nombresEncargado");
        String apellidosEncargado = request.getParameter("apellidosEncargado");
        String telefonoEncargado = request.getParameter("telefonoEncargado");
        String DUI_Encargado = request.getParameter("DUI_Encargado");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Encargados set "
                        + "nombresEncargado='" + nombresEncargado + "', "
                        + "apellidosEncargado='" + apellidosEncargado + "', "
                        + "telefonoEncargado='" + telefonoEncargado + "', "
                        + "DUI_Encargado='" + DUI_Encargado + "', "
                        + "ID_Direccion='" + ID_Direccion + "' "
                        + "where ID_Encargado='" + ID_Encargado + "'";

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

    public void modificarEstudiante(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String auxnie = request.getParameter("auxnie");
        String nie = request.getParameter("nie");
        String nombresEstudiante = request.getParameter("nombresEstudiante");
        String apellidosEstudiante = request.getParameter("apellidosEstudiante");
        String fechaNacEstudiante = request.getParameter("fechaNacEstudiante");
        String generoEstudiante = request.getParameter("generoEstudiante");
        String telefonoEstudiante = request.getParameter("telefonoEstudiante");
        String ID_Encargado = request.getParameter("ID_Encargado");
        String ID_Direccion = request.getParameter("ID_Direccion");

        System.out.print(nie);
        System.out.print(auxnie);
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Estudiantes set "
                        + "nie='" + nie + "', "
                        + "nombresEstudiante='" + nombresEstudiante + "', "
                        + "apellidosEstudiante='" + apellidosEstudiante + "', "
                        + "fechaNacEstudiante='" + fechaNacEstudiante + "', "
                        + "generoEstudiante='" + generoEstudiante + "', "
                        + "telefonoEstudiante='" + telefonoEstudiante + "', "
                        + "ID_Encargado='" + ID_Encargado + "', "
                        + "ID_Direccion='" + ID_Direccion + "' "
                        + "where nie='" + auxnie + "'";

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

    public void eliminarCalificacion(HttpServletRequest request, HttpServletResponse response) {
        String ID_Calificacion = request.getParameter("ID_Calificacion");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Calificaciones where ID_Calificacion='" + ID_Calificacion + "'";
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

    public void eliminarCargo(HttpServletRequest request, HttpServletResponse response) {
        String ID_Cargo = request.getParameter("ID_Cargo");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Cargos where ID_Cargo='" + ID_Cargo + "'";
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

    public void eliminarEspecialidad(HttpServletRequest request, HttpServletResponse response) {
        String ID_Especialidad = request.getParameter("ID_Especialidad");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Especialidades where ID_Especialidad='" + ID_Especialidad + "'";
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

    public void eliminarDocente(HttpServletRequest request, HttpServletResponse response) {
        String ID_Docente = request.getParameter("ID_Docente");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Docentes where ID_Docente='" + ID_Docente + "'";
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

    public void eliminarGrupo(HttpServletRequest request, HttpServletResponse response) {
        String ID_Grupo = request.getParameter("ID_Grupo");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Grupos where ID_Grupo='" + ID_Grupo + "'";
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

    public void eliminarEncargado(HttpServletRequest request, HttpServletResponse response) {
        String ID_Encargado = request.getParameter("ID_Encargado");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Encargados where ID_Encargado='" + ID_Encargado + "'";
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

    public void eliminarEstudiante(HttpServletRequest request, HttpServletResponse response) {
        String nie = request.getParameter("nie");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Estudiantes where nie='" + nie + "'";
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
        } else if (accion.equals("AgregarEmpleado")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("OpcionesUsuario/AgregarEmpleado.jsp").forward(request, response);
        } else if (accion.equals("AgregarCalificacion")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("OpcionesUsuario/AgregarCalificacion.jsp").forward(request, response);
        } else if (accion.equals("AgregarCargo")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("OpcionesUsuario/AgregarCargo.jsp").forward(request, response);
        } else if (accion.equals("AgregarEspecialidad")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("OpcionesUsuario/AgregarEspecialidad.jsp").forward(request, response);
        } else if (accion.equals("AgregarDocente")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("OpcionesUsuario/AgregarDocente.jsp").forward(request, response);
        } else if (accion.equals("AgregarGrupo")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("OpcionesUsuario/AgregarGrupo.jsp").forward(request, response);
        } else if (accion.equals("AgregarEncargado")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("OpcionesUsuario/AgregarEncargado.jsp").forward(request, response);
        } else if (accion.equals("AgregarEstudiante")) {
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("OpcionesUsuario/AgregarEstudiante.jsp").forward(request, response);
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
            agregarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarEmpleado");
        } else if (accion.equals("ModificarEmpleado")) {
            modificarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        } else if (accion.equals("EliminarEmpleado")) {
            eliminarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEmpleados");
        } else if (accion.equals("AgregarCalificacion")) {
            agregarCalificacion(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCalificacion");
        } else if (accion.equals("ModificarCalificacion")) {
            modificarCalificacion(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCalificaciones");
        } else if (accion.equals("EliminarCalificacion")) {
            eliminarCalificacion(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCalificaciones");
        } else if (accion.equals("AgregarCargo")) {
            agregarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCargo");
        } else if (accion.equals("ModificarCargo")) {
            modificarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCargos");
        } else if (accion.equals("EliminarCargo")) {
            eliminarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarCargos");
        } else if (accion.equals("AgregarEspecialidad")) {
            agregarEspecialidad(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarEspecialidad");
        } else if (accion.equals("ModificarEspecialidad")) {
            modificarEspecialidad(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEspecialidades");
        } else if (accion.equals("EliminarEspecialidad")) {
            eliminarEspecialidad(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEspecialidades");
        } else if (accion.equals("AgregarDocente")) {
            agregarDocente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarDocente");
        } else if (accion.equals("ModificarDocente")) {
            modificarDocente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarDocentes");
        } else if (accion.equals("EliminarDocente")) {
            eliminarDocente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarDocentes");
        } else if (accion.equals("AgregarGrupo")) {
            agregarGrupo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarGrupo");
        } else if (accion.equals("ModificarGrupo")) {
            modificarGrupo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarGrupos");
        } else if (accion.equals("EliminarGrupo")) {
            eliminarGrupo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarGrupos");
        } else if (accion.equals("AgregarEncargado")) {
            agregarEncargado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarEncargado");
        } else if (accion.equals("ModificarEncargado")) {
            modificarEncargado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEncargados");
        } else if (accion.equals("EliminarEncargado")) {
            eliminarEncargado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEncargados");
        } else if (accion.equals("AgregarEstudiante")) {
            agregarEstudiante(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarEstudiante");
        } else if (accion.equals("ModificarEstudiante")) {
            modificarEstudiante(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEstudiantes");
        } else if (accion.equals("EliminarEstudiante")) {
            eliminarEstudiante(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionarEstudiantes");
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
