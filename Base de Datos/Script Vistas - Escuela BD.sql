-- Ejemplo 1: Vistas
use Escuela;
go
-- Vista de Direcciones completas
create view VistaDireccionCompleta as
select
    DIR.ID_Direccion,
    DIR.Linea1,
    DIR.Linea2,
    DIS.Distrito,
    MUN.Municipio,
    DEP.Departamento,
    DEP.Pais,
    DIR.CodigoPostal
from Direcciones DIR
	inner join Distritos DIS on DIR.ID_Distrito = DIS.ID_Distrito
	inner join Municipios MUN on DIS.ID_Municipio = MUN.ID_Municipio
	inner join Departamentos DEP on MUN.ID_Departamento = DEP.ID_Departamento;
go
-- Vista de Empleados
create view VistaEmpleados as
select
    EMP.ID_Empleado,
    EMP.DUI_Empleado,
    EMP.ISSS_Empleado,
    EMP.NombresEmpleado,
    EMP.ApellidosEmpleado,
    EMP.FechaNacEmpleado,
    EMP.TelefonoEmpleado,
    EMP.Correo,
	EMP.ID_Cargo,
    CAR.Cargo,
	EMP.ID_Direccion,
	DIR.Linea1 + ', ' + DIR.Linea2 + ', ' +
    DIR.Distrito + ', ' + DIR.Municipio + ', ' +
    DIR.Departamento + ', ' + DIR.Pais + ', ' +
	CAST(DIR.CodigoPostal AS char(5)) as DireccionCompleta
from Empleados EMP
	inner join Cargos CAR on EMP.ID_Cargo = CAR.ID_Cargo
	inner join VistaDireccionCompleta DIR on EMP.ID_Direccion = DIR.ID_Direccion;
go
-- Vista de Docentes
create view VistaDocentes as
select 
    DOC.ID_Docente,
    EMP.ID_Empleado,
    EMP.NombresEmpleado,
    EMP.ApellidosEmpleado,
	ESP.ID_Especialidad,
    ESP.NombreEspecialidad,
    ESP.Carrera,
	DOC.Escalafon	
from Empleados EMP
    inner join Docentes DOC on EMP.ID_Empleado = DOC.ID_Empleado
    inner join Especialidades ESP on DOC.ID_Especialidad = ESP.ID_Especialidad;
go
-- Vista de Grupos
create view VistaGrupos as
select 
	GRU.ID_Grupo,
	GRU.Grado,
	GRU.Seccion,
	GRU.Anio,
	GRU.ID_Turno,
	TUR.Turno,
	GRU.ID_Aula,
	AUL.Edificio + AUL.Piso + AUL.NumeroAula as Aula,
	GRU.ID_Docente,
	DOC.NombresEmpleado + ' ' + DOC.ApellidosEmpleado as DocenteGuia
from Grupos GRU
	inner join Turnos TUR on GRU.ID_Turno = TUR.ID_Turno
	inner join Aulas AUL on GRU.ID_Aula = AUL.ID_Aula
	inner join VistaDocentes DOC on GRU.ID_Docente = DOC.ID_Docente;
go
-- Vista de Encargados
create view VistaEncargados as
select 
	ENC.ID_Encargado,
	ENC.NombresEncargado,
	ENC.ApellidosEncargado,
	ENC.TelefonoEncargado,
	ENC.DUI_Encargado,
	ENC.ID_Direccion,
	DIR.Linea1 + ', ' + DIR.Linea2 + ', ' +
    DIR.Distrito + ', ' + DIR.Municipio + ', ' +
    DIR.Departamento + ', ' + DIR.Pais + ', ' +
	CAST(DIR.CodigoPostal AS char(5)) as DireccionCompleta
from Encargados ENC
	inner join VistaDireccionCompleta DIR on ENC.ID_Direccion = DIR.ID_Direccion; 
go
-- Vista de Estudiantes
create view VistaEstudiantes as
select 
	EST.NIE,
	EST.NombresEstudiante,
	EST.ApellidosEstudiante,
	EST.FechaNacEstudiante,
	EST.GeneroEstudiante,
	EST.TelefonoEstudiante,
	EST.ID_Encargado,
	ENC.NombresEncargado,
	ENC.ApellidosEncargado,
	EST.ID_Direccion,
	DIR.Linea1 + ', ' + DIR.Linea2 + ', ' +
    DIR.Distrito + ', ' + DIR.Municipio + ', ' +
    DIR.Departamento + ', ' + DIR.Pais + ', ' +
	CAST(DIR.CodigoPostal AS char(5)) as DireccionCompleta,
	MAT.ID_Matricula,
    GRU.Grado,
    GRU.Seccion,
    GRU.Anio,
    GRU.Aula
from Estudiantes EST
	inner join Encargados ENC on EST.ID_Encargado = ENC.ID_Encargado
	inner join VistaDireccionCompleta DIR on EST.ID_Direccion = DIR.ID_Direccion
    inner join Matriculas MAT on EST.NIE = MAT.NIE
    inner join VistaGrupos GRU on MAT.ID_Grupo = GRU.ID_Grupo;
go
-- Vista de Calificaciones
create view VistaCalificaciones as
select 
	CAL.ID_Calificacion,
	CAL.ID_Materia,
	MAT.NombreMateria,
	CAL.NIE,
	EST.NombresEstudiante,
	EST.ApellidosEstudiante,
	CAL.Examen1,
	CAL.Examen2,
	CAL.Examen3,
	CAL.ExamenFinal,
	CAL.Tareas,
	CAL.Promedio,
	CAL.Estado,
	CAL.ID_Docente,
	EMP.NombresEmpleado,
	EMP.ApellidosEmpleado
from Calificaciones CAL
	inner join Materias MAT on CAL.ID_Materia = MAT.ID_Materia
	inner join Estudiantes EST on CAL.NIE = EST.NIE
	inner join Docentes DOC on CAL.ID_Docente = DOC.ID_Docente
	inner join Empleados EMP on DOC.ID_Empleado = EMP.ID_Empleado;
go
-- 


-- Consulta que permite saber las vistas almacenadas
select * from INFORMATION_SCHEMA.VIEWS 
where TABLE_SCHEMA = 'dbo';

-- Consultas a Vistas
select * from VistaDireccionCompleta;
select * from VistaEmpleados;
select * from VistaDocentes;
select * from VistaGrupos;
select * from VistaEstudiantes;
select * from VistaCalificaciones;