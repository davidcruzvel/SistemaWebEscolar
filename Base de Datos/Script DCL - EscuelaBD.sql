-- Base de Datos Escuela
-- DCL
use Escuela;

-- ROLES
go
create role Administrador;
create role Director;
create role Docente;
create role RRHH;

-- LOGINS
go
create login login_admin_juanrodas
with password = 'root';
go
create login login_dir_diegosanchez
with password = 'Sanchez1234';
go
create login login_doc_rauldvalle
with password = 'Valle1234';
go
create login login_rrhh_maryperez
with password = 'Perez1234';

-- USUARIOS
go
create user admin_juanrodas
for login login_admin_juanrodas;
go
create user dir_diegosanchez
for login login_dir_diegosanchez;

create user doc_rauldvalle
for login login_doc_rauldvalle;
go
create user rrhh_maryperez
for login login_rrhh_maryperez;

-- AGREGAR USUARIOS A ROLES
go
alter role Administrador add member admin_juanrodas;
alter role Director add member dir_diegosanchez;
alter role Docente add member doc_rauldvalle;
alter role RRHH add member rrhh_maryperez;

-- OTORGAR PERMISOS (En base a las opciones)
go
-- Administrador
grant control on database::Escuela to Administrador;
-- Director
grant select, insert, update, delete on dbo.Direcciones to Director;
grant select, insert, update, delete on dbo.Aulas to Director;
grant select, insert, update, delete on dbo.Grupos to Director;
grant select, insert, update, delete on dbo.Encargados to Director;
grant select, insert, update, delete on dbo.Estudiantes to Director;
grant select, insert, update, delete on dbo.Matriculas to Director;
grant select, insert, update, delete on dbo.Materias to Director;
grant select, insert, update, delete on dbo.Calificaciones to Director;
grant select on dbo.Departamentos to Director;
grant select on dbo.Municipios to Director;
grant select on dbo.Distritos to Director;
-- Docentes
grant select, insert, update, delete on dbo.Direcciones to Docente;
grant select, insert, update, delete on dbo.Encargados to Docente;
grant select, insert, update, delete on dbo.Estudiantes to Docente;
grant select, insert, update, delete on dbo.Matriculas to Docente;
grant select, insert, update, delete on dbo.Calificaciones to Docente;
grant select on dbo.Materias to Docente;
grant select on dbo.Departamentos to Docente;
grant select on dbo.Municipios to Docente;
grant select on dbo.Distritos to Docente;
-- RRHH
grant select, insert, update, delete on dbo.Direcciones to RRHH;
grant select, insert, update, delete on dbo.Cargos to RRHH;
grant select, insert, update, delete on dbo.Empleados to RRHH;
grant select, insert, update, delete on dbo.Especialidades to RRHH;
grant select, insert, update, delete on dbo.Docentes to RRHH;
grant select on dbo.Usuarios to RRHH;
grant select on dbo.Roles to RRHH;
grant select on dbo.Departamentos to RRHH;
grant select on dbo.Municipios to RRHH;
grant select on dbo.Distritos to RRHH;

-- CONSULTAS
go
-- Consulta para obtener una lista de logins en la instancia de SQL Server
select name from sys.server_principals where type_desc = 'SQL_LOGIN';
go
-- Consulta para obtener una lista de usuarios en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'SQL_USER';
go
-- Consulta para obtener una lista de roles en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'DATABASE_ROLE';
