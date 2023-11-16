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
    EMP.ID_Empleado,
    DOC.ID_Docente,
    EMP.NombresEmpleado,
    EMP.ApellidosEmpleado,
	ESP.ID_Especialidad,
    ESP.NombreEspecialidad,
    ESP.Carrera,
	DOC.Escalafon
from 
    Empleados EMP
    inner join Docentes DOC on EMP.ID_Empleado = DOC.ID_Empleado
    inner join Especialidades ESP on DOC.ID_Especialidad = ESP.ID_Especialidad;

-- Consulta que permite saber las vistas almacenadas
select * from INFORMATION_SCHEMA.VIEWS 
where TABLE_SCHEMA = 'dbo';

-- Consultas a Vistas
select * from VistaDireccionCompleta;
select * from VistaEmpleados;
select * from VistaDocentes;
