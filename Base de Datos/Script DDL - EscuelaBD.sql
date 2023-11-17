-- Base de Datos Escuela
-- DDL
create database Escuela;
go
use Escuela;
-- TABLAS
-- DIRECCIONES
go
create table Departamentos(
	ID_Departamento char(2) primary key,
	Departamento varchar(60) not null,
	Pais varchar(60)
);
go
create table Municipios(
	ID_Municipio char(3) primary key,
	Municipio varchar(60) not null,
	ID_Departamento char(2) not null
);
go
create table Distritos(
	ID_Distrito varchar(5) primary key,
	Distrito varchar(60) not null,
	ID_Municipio char(3) not null
);
go
create table Direcciones(
	ID_Direccion int primary key identity(1, 1),
    Linea1 varchar(100) not null,
    Linea2 varchar(100),
    ID_Distrito varchar(5) not null,
    CodigoPostal char(5),
);

-- EMPLEADOS
go
create table Cargos(
	ID_Cargo int primary key identity(1, 1),
    Cargo varchar(45) not null
);
go
create table Empleados(
	ID_Empleado int primary key identity(1, 1),
    DUI_Empleado varchar(10) not null,
    ISSS_Empleado int not null,
    NombresEmpleado varchar(60) not null,
    ApellidosEmpleado varchar(60) not null,
    FechaNacEmpleado date not null,
    TelefonoEmpleado varchar(10) not null,
    Correo varchar(100),
    ID_Cargo int not null,
    ID_Direccion int not null   
);
go
create table Especialidades(
	ID_Especialidad int primary key identity(1, 1),
	NombreEspecialidad varchar(100) not null,
	Carrera varchar(60) not null
);
go
create table Docentes(
	ID_Docente int primary key identity(1, 1),	
	ID_Empleado int not null,
	ID_Especialidad int not null,
	Escalafon varchar(20),
);

-- MANEJO DE ROLES
go
create table Opciones(
	ID_Opcion int primary key identity(1, 1),
    NombreOpcion varchar(60) not null
);
go
create table Roles(
	ID_Rol int primary key identity(1, 1),
    NombreRol varchar(60) not null
);
go
create table AsignacionRolesOpciones(
	ID_AsignacionRol int primary key identity(1, 1),
    ID_Rol int not null,
    ID_Opcion int not null
);
go
create table Usuarios(
	ID_Usuario int primary key identity(1, 1),	
    ID_Empleado int not null,
	ID_Rol int not null,
    Usuario varchar(60) not null,
    Clave varchar(60) not null,
);

-- GRUPOS
go
create table Turnos(
	ID_Turno int primary key identity(1, 1),
    Turno varchar(30) not null
);
go
create table Aulas(
	ID_Aula int primary key identity(1, 1),
    Edificio varchar(20),
    Piso varchar(10),	
    NumeroAula varchar(10)
);
go
create table Grupos(
	ID_Grupo int primary key identity(1, 1),
    Grado varchar(30) not null,
	Seccion varchar(10) not null,
    Anio int not null,
    ID_Turno int not null,
    ID_Aula int not null,
    ID_Docente int not null
);

-- ESTUDIANTES
go
create table Encargados(
	ID_Encargado int primary key identity(1, 1),
	NombresEncargado varchar(60) not null,
	ApellidosEncargado varchar(60) not null,
	TelefonoEncargado varchar(10),
	DUI_Encargado varchar(10) not null,
	ID_Direccion int not null
);
go
create table Estudiantes(
	NIE int primary key,
    NombresEstudiante varchar(60) not null,
    ApellidosEstudiante varchar(60) not null,
    FechaNacEstudiante date not null,
    GeneroEstudiante char(1),
	TelefonoEstudiante varchar(10),
    ID_Encargado int not null,
    ID_Direccion int not null
);
go
create table Matriculas(
	ID_Matricula int primary key identity(1, 1),
	NIE int not null,
	ID_Grupo int not null
);
go
create table Materias(
	ID_Materia int primary key identity(1, 1),
	NombreMateria varchar(60),
);
go
create table Calificaciones(
	ID_Calificacion int primary key identity(1, 1),
	ID_Materia int not null,
	NIE int not null,
	ID_Docente int not null,
	Examen1 decimal(3, 1),
	Examen2 decimal(3, 1),
	Examen3 decimal(3, 1),
	ExamenFinal decimal(3, 1),
	Tareas decimal(3, 1),
	Promedio decimal(3, 1),
	Estado char(1)
);

-- CONEXIONES CON LLAVES FOREANEAS
go
alter table Municipios add foreign key (ID_Departamento) references Departamentos(ID_Departamento);
alter table Distritos add foreign key (ID_Municipio) references Municipios(ID_Municipio);
alter table Direcciones add foreign key (ID_Distrito) references Distritos(ID_Distrito);
alter table Empleados add foreign key (ID_Cargo) references Cargos(ID_Cargo);
alter table Empleados add foreign key (ID_Direccion) references Direcciones(ID_Direccion);
alter table Docentes add foreign key (ID_Empleado) references Empleados(ID_Empleado);
alter table Docentes add foreign key (ID_Especialidad) references Especialidades(ID_Especialidad);
alter table Encargados add foreign key (ID_Direccion) references Direcciones(ID_Direccion);
alter table Grupos add foreign key (ID_Turno) references Turnos(ID_Turno);
alter table Grupos add foreign key (ID_Aula) references Aulas(ID_Aula);
alter table Grupos add foreign key (ID_Docente) references Docentes(ID_Docente);
alter table Estudiantes add foreign key (ID_Direccion) references Direcciones(ID_Direccion);
alter table Estudiantes add foreign key (ID_Encargado) references Encargados(ID_Encargado);
alter table Usuarios add foreign key (ID_Empleado) references Empleados(ID_Empleado);
alter table Usuarios add foreign key (ID_Rol) references Roles(ID_Rol);
alter table AsignacionRolesOpciones add foreign key (ID_Rol) references Roles(ID_Rol);
alter table AsignacionRolesOpciones add foreign key (ID_Opcion) references Opciones(ID_Opcion);
alter table Matriculas add foreign key (NIE) references Estudiantes(NIE);
alter table Matriculas add foreign key (ID_Grupo) references Grupos(ID_Grupo);
alter table Calificaciones add foreign key (ID_Materia) references Materias(ID_Materia);
alter table Calificaciones add foreign key (NIE) references Estudiantes(NIE);
alter table Calificaciones add foreign key (ID_Docente) references Docentes(ID_Docente);

