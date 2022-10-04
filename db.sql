USE MASTER
GO

DROP DATABASE
  IF EXISTS CheckSalud_DB

CREATE DATABASE CheckSalud_DB
ON PRIMARY
(        NAME = CheckSalud_DB,
     FILENAME = 'C:\MSSQL\CheckSalud\CheckSalud_DB.MDF',
         SIZE = 4,
   FILEGROWTH = 15%)
LOG ON
(        NAME = CheckSalud_DB_log,
     FILENAME = 'C:\MSSQL\CheckSalud\CheckSalud_DB_log.LDF',
         SIZE = 2,
   FILEGROWTH = 15%)
GO

USE [CheckSalud_DB]
GO


IF OBJECT_ID('Tb_Especialidad','U') IS NOT NULL
	DROP TABLE Tb_Especialidad
GO

CREATE TABLE [dbo].Tb_Especialidad
(
	 [codEspecialidad] NCHAR (2) NOT NULL,
	[descEspecialidad] VARCHAR (99)
PRIMARY KEY 
	(
		[codEspecialidad] ASC
	)
)
GO

IF OBJECT_ID('Tb_Enfermedad','U') IS NOT NULL
	DROP TABLE Tb_Enfermedad 
GO

CREATE TABLE [dbo].Tb_Enfermedad
(
	 [codEnfermedad] VARCHAR (5) NOT NULL,
	[descEnfermedad] VARCHAR (99)
PRIMARY KEY 
	(
		[codEnfermedad] ASC
	)
)
GO



IF OBJECT_ID('Tb_Ubicacion','U') IS NOT NULL
	DROP TABLE Tb_Ubicacion 
GO

CREATE TABLE [dbo].Tb_Ubicacion
(
	   [Id_Ubigeo] NCHAR(6) NOT NULL,
	      [IdDepa] CHAR(2) NULL,
	      [IdProv] CHAR(2) NULL,
	      [IdDist] CHAR(2) NULL,
	[Departamento] NVARCHAR(255) NULL,
	   [Provincia] NVARCHAR(255) NULL,
	    [Distrito] NVARCHAR(255) NULL,
PRIMARY KEY 
	(
       [Id_Ubigeo] ASC
	)
)
GO

IF OBJECT_ID('Tb_Usuario','U') IS NOT NULL
	DROP TABLE Tb_Usuario 
GO

CREATE TABLE [dbo].Tb_Usuario
(
	[Login_Usuario] NVARCHAR(20) NOT NULL,
	 [Pass_Usuario] NVARCHAR(20) NULL,
	  [Niv_Usuario] INT NULL,
	  [Est_Usuario] INT NULL,
	 [Fec_Registro] DATETIME NULL,
	 [Usu_Registro] NVARCHAR(20) NULL,
PRIMARY KEY 
	(
		[Login_Usuario] ASC
	)
)
GO

IF OBJECT_ID('Tb_Medico','U') IS NOT NULL
	DROP TABLE Tb_Medico 
GO

CREATE TABLE [dbo].Tb_Medico
(
	      [codMedico] NCHAR(4) NOT NULL,
	       [dniMedic] NCHAR(8) NULL,
	      [nomMedico] VARCHAR(20) NOT NULL,
	      [apeMedico] VARCHAR(20) NOT NULL,
	 [numColegiatura] CHAR(9) NOT NULL,
	[fechaNacimiento] DATE NOT NULL,
	    [emailMedico] VARCHAR(320) NULL,
	     [fotoMedico] NVARCHAR NULL,
	    [direcMedico] VARCHAR(99) NULL,
	         [estado] INT NOT NULL,
	[codEspecialidad] NCHAR(2) NULL,
	  [Login_Usuario] NVARCHAR(20) NULL,
	        [Fec_Reg] DATETIME NULL,
	   [Usu_Registro] NVARCHAR(20) NULL,
	   [Fech_Ult_Mod] DATE NULL,
	    [Usu_Ult_Mod] NVARCHAR(20) NULL,
	      [Id_Ubigeo] NCHAR(6) NOT NULL,
	    [fec_ingreso] DATETIME
PRIMARY KEY 
	(
		[codMedico] ASC
	)
)
GO

IF OBJECT_ID('Tb_DocumentoPac','U') IS NOT NULL
	DROP TABLE Tb_DocumentoPac
GO

CREATE TABLE [dbo].Tb_DocumentoPac
(
	[codDocumento]    INT IDENTITY(1,1) NOT NULL,
	[img_sangre]      IMAGE,
	[img_orina]       IMAGE,
	[img_ekg]         IMAGE,
	[img_spirometria] IMAGE,
	[img_psicologia]  IMAGE,
	[img_rayosX]      IMAGE,
	[img_audicion]    IMAGE,
	[img_vista]       IMAGE,
	[Login_Usuario]   NVARCHAR(20),
	[codPaciente]     NVARCHAR(8)
PRIMARY KEY 
	(
		codDocumento ASC
	)
)
GO

IF OBJECT_ID('Tb_empresa','U') IS NOT NULL
	DROP TABLE Tb_Empresa 
GO

CREATE TABLE [dbo].Tb_Empresa
(
	  [codEmpresa]  NVARCHAR (5) NOT NULL,
	 [Raz_soc_emp]  NVARCHAR (50) NOT NULL,
	     [Dir_emp]  NVARCHAR (50),
	     [Tel_emp]  NVARCHAR (10),
	     [Ruc_emp]  NCHAR(11) NOT NULL,
	     [Rep_emp]  NVARCHAR (30),
	   [Id_Ubigeo]  NCHAR(6),
	 [fec_Ingreso]  DATETIME,
	      [estado]  INT NOT NULL,
	     [Fec_reg]  DATETIME NULL,
	[Usu_Registro]  NVARCHAR (20) NULL,
	 [Fec_Ult_Mod]  DATETIME NULL,
	 [Usu_Ult_Mod]  NVARCHAR (20) NULL
PRIMARY KEY 
	(
		[codEmpresa] ASC
	)
)
GO

IF OBJECT_ID('TB_paciente','U') IS NOT NULL
	DROP TABLE Tb_Paciente 
GO

CREATE TABLE [dbo].[Tb_Paciente]
(
	[codPaciente] NVARCHAR (8) NOT NULL,
	[nomPaciente] NVARCHAR (99) NOT NULL,
	[apePaciente] NVARCHAR (99) NOT NULL,
	[fechaNacimiento] DATE NOT NULL,
	[dniPaciente] NCHAR (8) NOT NULL,
	[sexo] INT NOT NULL,
	[direcPaciente] VARCHAR(20),
	[tipoSangre] CHAR(3),
	[fotoPaciente] NVARCHAR NULL,
	[emailPaciente] VARCHAR(320),
	[fechaIngreso] DATETIME,
	[numTelefono] NVARCHAR (9) not null,
	[estado] INT NOT NULL,
	[tipoCliente] INT,
	[codEmpresa] NVARCHAR (5),
	[Fec_reg] DATETIME NULL,
	[Usu_Registro] NVARCHAR (20) NULL,
	[Fec_Ult_Mod] DATETIME NULL,
	[Usu_Ult_Mod] NVARCHAR (20) NULL,
	[Id_Ubigeo] NCHAR(6) NOT NULL,
PRIMARY KEY 
	(
		[codPaciente] ASC
	)
)
GO

IF OBJECT_ID('Tb_Resultados','U') IS NOT NULL
	DROP TABLE Tb_Resultados 
GO

CREATE TABLE [dbo].Tb_Resultados
(
	           [peso] FLOAT,
	         [altura] FLOAT,
	         [sangre] NVARCHAR(99),
	          [orina] NVARCHAR(99),
	            [ekg] NVARCHAR(99),
	    [spirometria] NVARCHAR(99),
	     [psicologia] NVARCHAR(99),
	         [rayosX] NVARCHAR(99),
	       [audicion] NVARCHAR(99),
	          [vista] NVARCHAR(99),
	    [codAnalisis] CHAR(5),
	  [codEvaluacion] CHAR(5),
	  [codEnfermedad] VARCHAR(5),
	[recomendaciones] NVARCHAR(99),
	    [codPaciente] NVARCHAR(8),
	        [Fec_reg] DATETIME NULL,
	   [Usu_Registro] NVARCHAR (20) NULL,
	    [Fec_Ult_Mod] DATETIME NULL,
	    [Usu_Ult_Mod] NVARCHAR (20) NULL	
PRIMARY KEY 
	(
		  [codAnalisis] ASC,
		[codEvaluacion] ASC
	)
)
GO

IF OBJECT_ID('Tb_evaluacion','U') IS NOT NULL
	DROP TABLE Tb_Evaluacion 
GO

CREATE TABLE [dbo].Tb_Evaluacion
(
	[codEvaluacion] Char(5) NOT NULL,
	      [Fec_Eva] Date NULL,
	       [estado] Int NULL,
	    [codMedico] Nchar(4) NOT NULL,
	   [codAuditor] Char(3) NOT NULL,
	      [Fec_reg] datetime NULL,
	 [Usu_Registro] nvarchar (20) NULL,
	  [Fec_Ult_Mod] datetime NULL,
	  [Usu_Ult_Mod] nvarchar (20) NULL
PRIMARY KEY 
	(
		codEvaluacion ASC
	)
)
GO

IF OBJECT_ID('Tb_analisis','U') IS NOT NULL
	DROP TABLE Tb_Analisis
GO

CREATE TABLE [dbo].Tb_Analisis
(
	 [codAnalisis] CHAR(5) NOT NULL,
	[descAnalisis] NVARCHAR(99) NULL,
	       [costo] MONEY NULL,
	      [estado] INT NOT NULL,
	     [Fec_reg] DATETIME NULL,
	[Usu_Registro] NVARCHAR(20) NULL,
	 [Fec_Ult_Mod] DATETIME NULL,
	 [Usu_Ult_Mod] NVARCHAR(20) NULL
PRIMARY KEY 
	(
		[codAnalisis] ASC
	)
)
GO

IF OBJECT_ID('Tb_auditor','U') IS NOT NULL
	DROP TABLE Tb_Auditor
GO

CREATE TABLE [dbo].Tb_Auditor
(
	[codAuditor] CHAR(3) NOT NULL,
	[codMedico] NCHAR(4) NULL,
PRIMARY KEY 
	(
		[codAuditor] ASC
	)
)
GO


-- DEFINICION DE LA INTEGRIDAD REFERENCIAL - LLAVES FORANEAS (FK)
Alter table Tb_Paciente add foreign key(codEmpresa) references Tb_Empresa (codEmpresa) 
go
Alter table Tb_Paciente add foreign key(Id_Ubigeo) references Tb_Ubicacion (Id_Ubigeo) 
go



Alter table Tb_Resultados add foreign key(codAnalisis) references Tb_Analisis (codAnalisis) 
go
Alter table Tb_Resultados add foreign key(codEvaluacion) references Tb_Evaluacion (codEvaluacion) 
go
Alter table Tb_Resultados add foreign key(codEnfermedad) references Tb_Enfermedad (codEnfermedad) 
go
Alter table Tb_Resultados add foreign key(codPaciente) references Tb_Paciente (codPaciente) 
go


Alter table Tb_DocumentoPac add foreign key(Login_Usuario) references Tb_Usuario (Login_Usuario) 
go
Alter table Tb_DocumentoPac add foreign key(codPaciente) references Tb_Paciente (codPaciente) 
go


Alter table Tb_Medico add foreign key(codEspecialidad) references Tb_Especialidad (codEspecialidad) 
go
Alter table Tb_Medico add foreign key(Login_Usuario) references Tb_Usuario (Login_Usuario) 
go
Alter table Tb_Medico add foreign key(Id_Ubigeo) references Tb_Ubicacion (Id_Ubigeo) 
go


Alter table Tb_Empresa add foreign key(Id_Ubigeo) references Tb_Ubicacion (Id_Ubigeo) 
go


Alter table Tb_Evaluacion add foreign key(codMedico) references Tb_Medico (codMedico) 
go
Alter table Tb_Evaluacion add foreign key(codAuditor) references Tb_Auditor (codAuditor) 
go


Alter table Tb_Auditor add foreign key(codMedico) references Tb_Medico (codMedico) 
go

-- CONSTRAINTS TIPO CHECK, DEFAULT Y UNIQUE
ALTER TABLE Tb_Empresa
        ADD CONSTRAINT chk_RucEmpresa 
      CHECK (Ruc_emp LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

ALTER TABLE Tb_Paciente
        ADD CONSTRAINT chk_numTelefono 
      CHECK (numTelefono LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

ALTER TABLE Tb_Paciente
        ADD constraint def_fechaingreso 
    DEFAULT GETDATE() 
        FOR fechaIngreso
GO

ALTER TABLE Tb_Paciente
        ADD CONSTRAINT chk_codPaciente 
      CHECK (codPaciente LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

ALTER TABLE Tb_Empresa
        ADD CONSTRAINT UQ_Ruc_emp
     UNIQUE (Ruc_emp)
GO

--check constraint solo permite tipo cliente 1=gerente, 2=administrativo o 3=operacional
ALTER TABLE Tb_Paciente
	    ADD CONSTRAINT chk_tipoCliente 
      CHECK (tipoCliente IN (1,2,3))
GO

--check constraint solo permite 0=inactivo y 1=activo
ALTER TABLE Tb_Paciente
	    ADD CONSTRAINT chk_estado 
      CHECK (estado IN (0,1))
GO

ALTER TABLE Tb_Resultados
        ADD constraint def_Fec_reg 
    DEFAULT GETDATE() 
        FOR Fec_reg
GO

ALTER TABLE Tb_Paciente
        ADD CONSTRAINT def_Fec_reg_p 
    DEFAULT GETDATE() 
        FOR Fec_reg
GO

ALTER TABLE Tb_Medico
        ADD CONSTRAINT chk_dniMedic 
      CHECK (dniMedic LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

-- Constraint tipo check de nivel de usuario: 1=admin, 2=publico
ALTER TABLE Tb_Usuario
	    ADD CONSTRAINT chk_Niv_Usuario 
      CHECK (Niv_Usuario IN (1,2))
GO

--Constraint tipo check de estado de usuario: 0=inactivo, 1=activo
ALTER TABLE Tb_Usuario
	    ADD CONSTRAINT chk_Est_Usuario 
      CHECK (Est_Usuario IN (0,1))
GO

-- COMIENZO DE LAS 5 VISTAS--

-- VISTA PARA GERENCIA (JENNI)
CREATE OR ALTER VIEW vw_VistaEmpresaEvaluados 
                  AS SELECT E.codEmpresa, E.Raz_soc_emp, 
                            E.Ruc_emp, DATEDIFF(day, E.fec_Ingreso, GETDATE()) / 365  AS Años_servicios,
			    CASE E.estado
				WHEN 1 THEN 'Activa'
				WHEN 0 THEN 'Inactiva'
			  END AS Estado_actual,
                     E.Id_Ubigeo, U.Departamento, 
                     U.Provincia, U.Distrito, COUNT(P.codPaciente) 
                  AS Trabajadores_Evaluados
                FROM Tb_Empresa  E 
     LEFT OUTER JOIN Tb_Paciente P 
                  ON P.codEmpresa = E.codEmpresa
		  INNER JOIN Tb_Ubicacion U ON E.Id_Ubigeo = U.Id_Ubigeo
            GROUP BY E.codEmpresa, E.Raz_soc_emp, 
                     E.Ruc_emp, DATEDIFF(day, E.fec_Ingreso, GETDATE()) / 365,
                     E.estado, E.Id_Ubigeo, U.Departamento, U.Provincia, 
                     U.Distrito
GO


--VISTA PARA ADMINISTRATIVO (MAURICIO)
CREATE OR ALTER VIEW vw_VistaPacienteEstado 
                  AS SELECT P.codPaciente, 
                            P.nomPaciente AS Nombre, 
                            P.apePaciente AS Apellido, 
		        CASE P.sexo
			    WHEN 0 THEN 'Hombre'
			    WHEN 1 THEN 'Mujer'
		      END AS Genero, E.Raz_soc_emp AS Lugar_de_trabajo, 
                     CONVERT(VARCHAR, P.fechaNacimiento, 105) AS Fecha_Nacimiento, 
                     P.dniPaciente   AS Dni, 
                     P.direcPaciente AS Dirección,
                CASE P.estado 
                WHEN 0 THEN 'Inactivo'
                WHEN 1 THEN 'Activo'
              END AS estado,
                CASE P.tipoCliente
                WHEN 1 THEN 'Gerente'
                WHEN 2 THEN 'Administrativo'
                WHEN 3 THEN 'Operacional'
              END AS Tipo_Cliente,
                     COUNT(R.codEvaluacion) AS Cantidad_de_evaluaciones
                FROM Tb_Paciente P 
          INNER JOIN Tb_Empresa  E 
                  ON P.codEmpresa = E.codEmpresa
     LEFT OUTER JOIN Tb_Resultados R 
                  ON P.codPaciente = R.codPaciente 
            GROUP BY P.codPaciente, P.nomPaciente, P.apePaciente, 
                     P.fechaNacimiento, P.dniPaciente, P.direcPaciente, 
                     P.estado, P.sexo, P.tipoCliente, E.Raz_soc_emp
GO



--VISTA PARA PAPELEO/ADMINISTRATIVO/CONTABILIDAD (ENZO)
CREATE OR ALTER VIEW vw_VistaAnalisisEstado 
                  AS SELECT A.codAnalisis, 
                            P.nomPaciente  AS NombrePaciente, 
                            P.apePaciente  AS ApellidoPaciente,
                            Em.Raz_soc_emp AS Lugar_de_trabajo, 
                            A.descAnalisis AS TipoAnalisis, 
	                               A.costo AS CostoAnalisis, 
                                 E.Fec_Eva AS FechaEvaluacion,
                CASE A.estado 
			    WHEN 0 THEN 'Pendiente'
			    WHEN 1 THEN 'Finalizado'
	          END AS Estado
                FROM Tb_Analisis   A 
          INNER JOIN Tb_Resultados R
                  ON A.codAnalisis = R.CodAnalisis
          INNER JOIN Tb_Paciente   P  ON R.codPaciente   = P.codPaciente
          INNER JOIN Tb_Evaluacion E  ON E.codEvaluacion = R.codEvaluacion
          INNER JOIN Tb_Empresa    Em ON P.codEmpresa    = Em.codEmpresa
GO

-- VISTA PARA PACIENTE/EMPRESA (INFORME MEDICO RESUMIDO) (PATRICIO)
CREATE OR ALTER VIEW vw_VistaInformeMedico
                  AS SELECT R.codEvaluacion, 
                            P.nomPaciente AS Nombre_Paciente, 
                            P.apePaciente AS Apellido_Paciente,
                            CONVERT(VARCHAR, P.fechaNacimiento, 105) AS Fecha_Nacimiento, 
                            DATEDIFF(day, P.fechaNacimiento, GETDATE()) / 365 AS Edad, 
                            P.dniPaciente,
                            Em.Raz_soc_emp   AS Lugar_de_trabajo, 
                            An.descAnalisis  AS Tipo_Examen,
	                        E.Fec_Eva        AS Fecha_Evaluacion, 
                            R.peso           AS Peso_Paciente_Kg,
                            R.altura         AS Altura_Paciente_m, 
	                        R.sangre, R.orina, 
                            R.ekg, R.spirometria, 
                            R.psicologia, R.rayosX, 
                            R.audicion, R.vista, R.recomendaciones,
                            M.nomMedico  AS Nombre_Medico_Evaluador,
                            M.apeMedico  AS Apellidos_Medico_Evaluador, 
                            MA.nomMedico AS Nombre_Medico_Auditor, 
                            MA.apeMedico AS Apellido_Medico_Auditor
                FROM Tb_Resultados R 
          INNER JOIN Tb_Paciente   P 
                  ON R.codPaciente = P.codPaciente
          INNER JOIN Tb_Empresa Em 
                  ON P.codEmpresa = Em.codEmpresa
          INNER JOIN Tb_Evaluacion E 
                  ON R.codEvaluacion = E.codEvaluacion
          INNER JOIN Tb_Medico M 
                  ON E.codMedico = M.codMedico
		  INNER JOIN Tb_Auditor A 
                  ON E.codAuditor = A.codAuditor
          INNER JOIN Tb_Medico MA 
                  ON A.codMedico = MA.codMedico
          INNER JOIN Tb_Analisis An 
                  ON R.codAnalisis = An.codAnalisis
GO

-- VISTA PARA GERENCIA/RECURSOS HUMANOS/ADMINISTRACION
CREATE OR ALTER VIEW vw_VistaMedicoEstado 
                  AS SELECT M.codMedico, 
                            M.nomMedico         AS Nombre, 
                            M.apeMedico         AS Apellido,
                            Es.descEspecialidad AS Especialidad, 
			    CASE M.estado
				WHEN 1 THEN 'Activo'
				WHEN 0 THEN 'Inactivo'
			  END AS Estado,
                            M.fechaNacimiento,
                            DATEDIFF(day, M.fechaNacimiento , GETDATE()) / 365 AS Edad,
                            M.dniMedic, M.direcMedico, M.emailMedico, DATEDIFF(day, M.fec_ingreso, GETDATE()) / 365 AS Años_de_trabajo,
                            COUNT(E.codEvaluacion) AS Cantidad_de_evaluaciones, 
	                        COUNT(distinct R.codPaciente) AS Pacientes_Atendidos
                FROM Tb_Medico     M 
          INNER JOIN Tb_Evaluacion E 
                  ON M.codMedico = E.codMedico
		  INNER JOIN Tb_Resultados R 
                  ON R.codEvaluacion = E.codEvaluacion
		  INNER JOIN Tb_Paciente   P
                  ON P.codPaciente = R.codPaciente
		  INNER JOIN Tb_Especialidad Es
                  ON M.codEspecialidad = Es.codEspecialidad
            GROUP BY M.codMedico, M.nomMedico, M.apeMedico, 
                     Es.descEspecialidad, M.estado, M.fechaNacimiento, 
                     M.dniMedic, M.fec_ingreso, M.direcMedico, M.emailMedico
GO


--COMIENZO DE LOS 5 INDICES--

CREATE INDEX IDX_TB_DNI_PACIENTE 
          ON Tb_Paciente (dniPaciente ASC);
GO

CREATE INDEX IDX_TB_RZN_EMPRESA
          ON Tb_Empresa (Raz_soc_emp ASC);
GO

CREATE INDEX IDX_TB_UBICACION
          ON Tb_Ubicacion (Departamento ASC);
GO

CREATE INDEX IDX_TB_CLG_MEDICO
          ON Tb_Medico (dniMedic ASC);
GO

CREATE INDEX IDX_TB_FEC_EVA
          ON Tb_Evaluacion (Fec_Eva DESC);
GO

--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--Descripcion: SP que permite la insercion de un registro de una evaluacion
CREATE OR ALTER PROCEDURE usp_InsertarEvaluacion
@vFecEva DATE,
@vEstado INT,
@vCodMedico NCHAR(4),
@vCodAuditor CHAR(3),
@vUsu_Registro NVARCHAR(20)
AS
DECLARE @vCont INT
DECLARE @vCodEva CHAR(5)
SET @vCont = (SELECT COUNT(*) FROM Tb_Evaluacion)
-- Se obtiene el siguiente valor para el codigo de la evaluacion a insertar.
IF @vCont = 0 
       SET @vCodEva = '00001'
ELSE
       SET @vCodEva = (SELECT RIGHT(MAX(codEvaluacion) + 100001, 5)
                         FROM Tb_Evaluacion)
-- Insertamos el nuevo resultado
INSERT INTO Tb_Evaluacion 
     VALUES (@vCodEva, @vFecEva, @vEstado, @vCodMedico, @vCodAuditor,
				              GETDATE(), @vUsu_Registro, NULL, NULL)
GO

--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--Descripcion: SP que permite la actualizacion de un registro de una Evaluacion
Create or ALTER PROCEDURE usp_ActualizarEvaluacion
@vCodEva CHAR(5),
@vFecEva DATE,
@vEstado INT,
@vCodMedico nchar(4),
@vCodAuditor char(3),
@vUsu_Ult_Mod nvarchar(20)
AS
--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--SP que permite la actualizacion de un registro de una Evaluacion
UPDATE Tb_Evaluacion set 
		Fec_Eva = @vFecEva,
		estado = @vEstado,
		codMedico = @vCodMedico,
		codAuditor = @vCodAuditor,
		Fec_Ult_Mod = GETDATE(),
		Usu_Ult_Mod = @vUsu_Ult_Mod
WHERE codEvaluacion = @vCodEva
GO

--3: Eliminar una Evaluacion
CREATE OR ALTER PROCEDURE usp_EliminarEvaluacion
@vCod char(5)
AS
--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--SP que permite la eliminacion de un registro de una Evaluacion
DELETE FROM Tb_Evaluacion WHERE codEvaluacion = @vCod
GO

--PRUEBA
EXEC usp_EliminarEvaluacion '00022'
GO

--COMPROBAMOS
SELECT * FROM Tb_Evaluacion
GO


--4: Consultar una Evaluacion
CREATE OR ALTER PROCEDURE usp_ConsultarEvaluacion
@vCod char(5)
AS
--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--SP que permite la consulta de un registro de una evaluacion por su ID.
SELECT [Nombre_Paciente]
      ,[Apellido_Paciente]
	  ,[Fecha_Nacimiento]
	  ,[Edad]
	  ,[dniPaciente]
	  ,[Lugar_de_trabajo]
	  ,[Tipo_Examen]
	  ,[Fecha_Evaluacion]
	  ,[Peso_Paciente_Kg]
      ,[sangre]
      ,[orina]
      ,[ekg]
      ,[spirometria]
      ,[psicologia]
      ,[rayosX]
      ,[audicion]
      ,[vista]
      ,[recomendaciones]
      ,[Nombre_Medico_Evaluador]
      ,[Apellidos_Medico_Evaluador]
      ,[Nombre_Medico_Auditor]
      ,[Apellido_Medico_Auditor]
  FROM [dbo].[vw_VistaInformeMedico]
WHERE codEvaluacion = @vCod
GO

--Prueba 
EXEC usp_ConsultarEvaluacion '00021'
GO





--5: Listar Evaluaciones
CREATE OR ALTER PROCEDURE usp_ListarEvaluaciones
AS
--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--SP que permite el listado general de evaluaciones
SELECT [Nombre_Paciente]
      ,[Apellido_Paciente]
	  ,[Fecha_Nacimiento]
	  ,[Edad]
	  ,[dniPaciente]
	  ,[Lugar_de_trabajo]
	  ,[Tipo_Examen]
	  ,[Fecha_Evaluacion]
	  ,[Peso_Paciente_Kg]
      ,[sangre]
      ,[orina]
      ,[ekg]
      ,[spirometria]
      ,[psicologia]
      ,[rayosX]
      ,[audicion]
      ,[vista]
      ,[recomendaciones]
      ,[Nombre_Medico_Evaluador]
      ,[Apellidos_Medico_Evaluador]
      ,[Nombre_Medico_Auditor]
      ,[Apellido_Medico_Auditor]
  FROM [dbo].[vw_VistaInformeMedico]
ORDER BY Fecha_Evaluacion
GO

--Prueba 
EXEC usp_ListarEvaluaciones
GO

--COMPROBAMOS
SELECT * FROM Tb_Evaluacion
GO



--1: Para  Insertar un solo Analisis 
CREATE OR ALTER PROCEDURE usp_InsertarAnalisis
@vDes varchar(99),
@vCos money,
@vEst integer = 1, -- Determinante
@vUsu_Reg nvarchar(20)
AS
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite la insercion un analisis
DECLARE @vCod  char(5)
DECLARE @vcont int
SET @vcont=(SELECT COUNT(*) FROM Tb_Analisis)
-- Se obtiene el siguiente valor para el codigo del análisis a 
-- insertar.
IF @vcont=0 
        SET @vcod ='00001'
ELSE
		set @vCod = (Select Right(Max(codAnalisis) + 100001, 5)
		FROM Tb_Analisis)
--Insertamos el nuevo análisis
INSERT INTO Tb_Analisis VALUES(@vcod,@vDes,@vCos,@vEst,GETDATE(),@vUsu_Reg,null,null)
GO

--Prueba
EXEC usp_InsertarAnalisis 'EXAMEN PREOCUPACIONAL','416.00',1,'ezvrtgs' 
GO

--COMPROBAMOS
SELECT * FROM Tb_Analisis
GO


--2: Para Actualizar un solo Análisis 
CREATE OR ALTER PROCEDURE usp_ActualizarAnalisis
@vCod char(5),
@vDes varchar(99),
@vCos money,
@vEst integer = 1, -- Determinante 
@vUsu_Ult_Mod nvarchar(20)
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite actualizar un analisis
AS
	UPDATE  Tb_Analisis SET 
			descAnalisis = @vDes,
			costo        = @vCos,
			estado       = @vEst,
			Fec_Ult_Mod  = GETDATE(),
            Usu_Ult_Mod  = @vUsu_Ult_Mod
			WHERE 
			codAnalisis  = @vCod
GO

--Prueba
EXEC usp_ActualizarAnalisis '00001','EXAMEN PREOCUPACIONAL', '540.00', 0,'ezvrtgs'
GO

--COMPROBAMOS
SELECT * FROM Tb_Analisis
GO

--3: Para   Eliminar un solo Análisis 
CREATE OR ALTER PROCEDURE   usp_EliminarAnalisis
@vCod char(5)
AS
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite eliminar  un analisis
DELETE FROM  Tb_Analisis
	   WHERE codAnalisis = @vCod
GO

--Prueba
EXEC usp_EliminarAnalisis '00024'
GO

--COMPROBAMOS
SELECT * FROM Tb_Analisis
GO



--4: Para  Consultar un solo Análisis
--Cambie el parametro de codigo por estado
CREATE OR ALTER PROCEDURE  usp_ConsultarAnalisis
@vEstado varchar(99)
AS
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite consultar un analisis
SELECT [codAnalisis]
      ,[NombrePaciente]
      ,[ApellidoPaciente]
      ,[Lugar_de_trabajo]
      ,[TipoAnalisis]
      ,[CostoAnalisis]
      ,[FechaEvaluacion]
      ,[Estado]
  FROM [dbo].[vw_VistaAnalisisEstado]
  WHERE Estado = @vEstado
GO

--Prueba
EXEC usp_ConsultarAnalisis 'Finalizado'
GO

--COMPROBAMOS
SELECT * FROM vw_VistaAnalisisEstado
GO



--5: Para Listar todos los Análisis 
CREATE OR ALTER PROCEDURE usp_ListarAnalisis
AS
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite listar todos los analisis
SELECT [codAnalisis]
      ,[NombrePaciente]
      ,[ApellidoPaciente]
      ,[Lugar_de_trabajo]
      ,[TipoAnalisis]
      ,[CostoAnalisis]
      ,[FechaEvaluacion]
      ,[Estado]
  FROM [dbo].[vw_VistaAnalisisEstado]
  ORDER BY codAnalisis
GO

--Prueba
EXEC usp_ListarAnalisis
GO

--COMPROBAMOS
SELECT * FROM Tb_Analisis
GO



---1: insertar una empresa
CREATE OR ALTER PROCEDURE usp_InsertarEmpresa
@VRaz_soc_empl nvarchar(50),
@VDir_emp nvarchar(50),
@VTel_emp nvarchar(10),
@VRuc_emp nchar(11),
@VRep_emp nvarchar(30),
@VId_ubigeo nchar(6),
@Vestado int,
@vUsu_Reg nvarchar(20)
AS 
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite la insercion una empresa
declare @VcodEmpresa nvarchar(5)  
declare @vcont int
set @vcont=(Select count(*) from Tb_Empresa)
-- Se obtiene el siguiente valor para el codigo de empresa a 
-- insertar.
if @vcont= 0
	set @VcodEmpresa = '00001'
else
	set @VcodEmpresa=(select RIGHT(MAX(codEmpresa) + 100001, 5) from Tb_Empresa)
	--Insertamos la nueva empresa
	insert into Tb_Empresa values (@VcodEmpresa, @VRaz_soc_empl, @VDir_emp, @VTel_emp, @VRuc_emp, @VRep_emp, @VId_ubigeo, GETDATE(), @Vestado, GETDATE(), @vUsu_Reg, null, null)
GO
--Pruebaa
EXEC usp_InsertarEmpresa 'JENNIFER S.A.C', 'Av. Javier Prado Este 234', '3872345', '20500397665', 'Martha Bellido', '140101', 1 , 'jleon'
GO

--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO


--2: Actualizar una empresa
CREATE OR ALTER PROCEDURE usp_ActualizarEmpresa
@VcodEmpresa nvarchar(5),
@VRaz_soc_emp nvarchar(50),
@VDir_emp nvarchar(50),
@VTel_emp nvarchar(10),
@VRuc_emp nchar(11),
@VRep_emp nvarchar(30),
@VId_ubigeo nchar(6),
@Vestado integer = 1,
@vUsu_Ult_Mod nvarchar(20)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite la actualizacion de una empresa

	UPDATE  Tb_Empresa SET 
			Raz_soc_emp = @VRaz_soc_emp,
			Dir_emp     = @VDir_emp,
			Tel_emp     = @VTel_emp,
			Ruc_emp     = @VRuc_emp,
			Rep_emp     = @VRep_emp,
			Id_Ubigeo   = @VId_ubigeo,
			estado      = @Vestado,
			Fec_Ult_Mod  = GETDATE(),
            Usu_Ult_Mod  = @vUsu_Ult_Mod
			WHERE 
			codEmpresa= @VcodEmpresa
GO

--Prueba
EXEC usp_ActualizarEmpresa '00021', 'PATRICIO S.A.C', 'Av. ricardo Este 234', '3887345', '20576397665', 'PEPI Bellido', '140102', 1 , 'jleon'
GO

--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO


--3: Eliminar una empresa
CREATE OR ALTER PROCEDURE   usp_EliminarEmpresa
@VcodEmpresa nvarchar(5)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite eliminar una empresa
DELETE FROM  Tb_Empresa
	   WHERE codEmpresa=@VcodEmpresa
GO

--Prueba
EXEC usp_EliminarEmpresa '00021'
GO

--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO


--4: Consultar una empresa
CREATE OR ALTER PROCEDURE  usp_ConsultarEmpresa
@VcodEmpresa nvarchar(5)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite consultar una empresa
SELECT [codEmpresa]
      ,[Raz_soc_emp]
	  ,[Dir_emp]
	  ,[Tel_emp]
      ,[Ruc_emp]
      ,[Rep_emp]
      ,[Id_Ubigeo]
      ,[fec_Ingreso]
	  ,[estado]
	  ,[Fec_reg]
	  ,[Usu_Registro]
	  ,[Fec_Ult_Mod]
	  ,[Usu_Ult_Mod]
  FROM [dbo].[Tb_Empresa]
  WHERE codEmpresa=@VcodEmpresa
GO

--Prueba
EXEC usp_ConsultarEmpresa '00020'
GO

--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO


--5:  Listar empresas
CREATE OR ALTER PROCEDURE usp_ListarEmpresa
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite listar una empresa
SELECT [codEmpresa]
      ,[Raz_soc_emp]
      ,[Ruc_emp]
      ,[Años_servicios]
      ,[Estado_actual]
      ,[Id_Ubigeo]
      ,[Departamento]
      ,[Provincia]
      ,[Distrito]
      ,[Trabajadores_Evaluados]
  FROM [dbo].[vw_VistaEmpresaEvaluados]
  ORDER BY codEmpresa
GO

--Prueba
EXEC usp_ListarEmpresa
GO


--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO



--1) Insertar un Paciente
CREATE OR ALTER PROCEDURE usp_InsertarPaciente
	@vNom nvarchar (99),
	@vApe nvarchar (99),
	@vFNac date,
	@vDni nchar (8),
	@vSexo int,
	@vDir varchar(20),
	@vSang char(3),
	@vFoto nvarchar null,
	@vEmail varchar(320),
	@vFIngr datetime,
	@vTelef nvarchar (9) ,
	@vEsta int = 1, -- Determinante
	@vTipo int,
	@vCEmpr nvarchar (5),
	@vUsu_Reg nvarchar (20) NULL,
	@vId_Ubigeo nchar(6)
AS 
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite el registro de un paciente
declare @vcod char(8)
declare @vcont int
set @vcont=(Select count(*) from Tb_Paciente)
if @vcont=0
	set @vcod='00000001'
else 
	set @vcod= (Select Right(Max(codPaciente) + 100000001,8) FROM Tb_Paciente)
insert into Tb_Paciente values (@vcod, @vNom, @vApe, @vFNac, @vDni, @vSexo, @vDir, 
								@vSang, @vFoto, @vEmail, @vFIngr , @vTelef, @vEsta, 
								@vTipo, @vCEmpr,GETDATE(), @vUsu_Reg, NULL, NULL, @vId_Ubigeo)
GO

--Prueba
EXEC usp_InsertarPaciente 'Mauricio', 'Vasquez Vidal','09/07/1998', '74909986', 0, 'Av. Javier Prado 221', 'A+', '', 
								'mauvasquez0907@gmail.com', '2019-03-18 08:00:00', '997894748', 1, 3, '00006', 'jleon', '140101'
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO

--2) Actualizar un Paciente
CREATE PROCEDURE usp_ActualizarPaciente
	@vCod char(8),
	@vNom nvarchar (99),
	@vApe nvarchar (99),
	@vFNac date,
	@vDni nchar (8),
	@vSexo int,
	@vDir varchar(20),
	@vSang char(3),
	@vFoto nvarchar = null,
	@vEmail varchar(320),
	@vFIngr datetime,
	@vTelef nvarchar (9) ,
	@vEsta int = 1, -- Determinante
	@vTipo int,
	@vCEmpr nvarchar (5),
	@vUsu_Ult_Mod nvarchar (20),
	@vId_Ubigeo nchar(6)
AS
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite la actualización del registro de un paciente
	UPDATE  Tb_Paciente SET 
			nomPaciente = @vNom,
			apePaciente = @vApe,
			fechaNacimiento = @vFNac,
			dniPaciente = @vDni,
			sexo = @vSexo,
			direcPaciente = @vDir,
			tipoSangre = @vSang,
			fotoPaciente = @vFoto,
			emailPaciente = @vEmail,
			fechaIngreso = @vFIngr,
			numTelefono = @vTelef,
			estado       = @vEsta,
			tipoCliente = @vTipo,
			codEmpresa = @vCEmpr,
			Fec_Ult_Mod  = GETDATE(),
			Usu_Ult_Mod  = @vUsu_Ult_Mod,
			Id_Ubigeo = @vId_Ubigeo
			WHERE 
			codPaciente  = @vCod
GO

--Prueba
EXEC usp_ActualizarPaciente '00000021', 'Alberto', 'Vasquez Vidal','10/07/1998', '74909986', 0, 'Av. Javier Prado 222', 'O-', '', 
								  'mauvasquez0907@gmail.com', '2019-03-18 08:00:00', '997894748', 1, 3, '00006', 'jleon', '140101'
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO


--3) Eliminar un Paciente
CREATE OR ALTER PROCEDURE   usp_EliminarPaciente
@vCod char(8)
AS
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite la eliminación del registro de un paciente
DELETE FROM  Tb_Paciente
	   WHERE codPaciente = @vCod
GO

--Prueba
EXEC usp_EliminarPaciente '00000021'
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO

--4) Consultar un Paciente
CREATE OR ALTER PROCEDURE  usp_ConsultarPaciente
@vCod char(8)
AS
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite consultar el registro de un paciente
SELECT [codPaciente]
      ,[nomPaciente]
      ,[apePaciente]
      ,[fechaNacimiento]
      ,[dniPaciente]
      ,[sexo]
      ,[direcPaciente]
	  ,[tipoSangre]
      ,[fotoPaciente]
	  ,[emailPaciente]
	  ,[fechaIngreso]
	  ,[numTelefono]
	  ,[estado]
	  ,[tipoCliente]
	  ,[codEmpresa]
	  ,[Fec_reg]
	  ,[Usu_Registro]
	  ,[Fec_Ult_Mod]
	  ,[Usu_Ult_Mod]
	  ,[Id_Ubigeo]
  FROM [dbo].[Tb_Paciente]
  WHERE codPaciente = @vCod
GO

--Prueba
EXEC usp_ConsultarPaciente '00000020'
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO


--5) Listar un Estado de Paciente
CREATE OR ALTER PROCEDURE usp_ListarPaciente
AS
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite mostrar el registro de pacientes
SELECT [codPaciente]
      ,[Nombre]
      ,[Apellido]
      ,[Genero]
      ,[Lugar_de_trabajo]
      ,[Fecha_Nacimiento]
      ,[Dni]
	  ,[Dirección]
      ,[Estado]
	  ,[Tipo_Cliente]
	  ,[Cantidad_de_evaluaciones]
  FROM [dbo].[vw_VistaPacienteEstado]
  ORDER BY codPaciente
GO

--Prueba
EXEC usp_ListarPaciente
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO



---1: insertar un medico
CREATE OR ALTER PROCEDURE usp_InsertarMedico
@dniMedic nchar(8),
@nomMedico varchar(20),
@apeMedico varchar(20),
@numColegiatura char(9),
@fechaNacimiento date,
@emailMedico varchar(320),
@fotoMedico nvarchar,
@direcMedico varchar(99),
@estado integer=1,
@codEspecialidad nchar(2),
@Login_Usuario nvarchar(20),
@Usu_Registro nvarchar(20),
@Fech_Ult_Mod date,
@Usu_Ult_Mod nvarchar(20),
@Id_Ubigeo nchar(6),
@fec_ingreso datetime
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite la insercion un medico
declare @VcodMedico nchar(4)  
declare @vcont int
set @vcont=(Select count(*) from Tb_Medico)
-- Se obtiene el siguiente valor para el codigo de medico a 
-- insertar.
if @vcont= 0
	set @VcodMedico = '0001'
else
	set @VcodMedico=(select RIGHT(MAX(codMedico) + 10001,4) from Tb_Medico)
	--Insertamos el nuevo Medico
insert into Tb_Medico values ( @VcodMedico, @dniMedic, @nomMedico, @apeMedico, @numColegiatura, @fechaNacimiento, @emailMedico, @fotoMedico, @direcMedico, @estado,
							   @codEspecialidad, @Login_Usuario, GETDATE(), @Usu_Registro, null, null, @Id_Ubigeo, @fec_ingreso)
GO

--PRUEBA
EXEC usp_InsertarMedico '80851339', 'Mengeche', 'Saba Rojas', '523455646', '05/03/1978', 'mengeSR@gmail.com', '', 
						'Costa Azul 296', 1, '12', 'mengeS2021', 'jleon', null, null, '140101', '2021-01-26 08:00:00'
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO

--2: Actualizar un medico 
CREATE OR ALTER PROCEDURE usp_ActualizarMedico
@vCodMedico nchar(4),
@dniMedic nchar(8),
@nomMedico varchar(20),
@apeMedico varchar(20),
@numColegiatura char(9),
@fechaNacimiento date,
@emailMedico varchar(320),
@fotoMedico nvarchar,
@direcMedico varchar(99),
@estado integer,
@codEspecialidad nchar(2),
@Login_Usuario nvarchar(20),
@Usu_Ult_Mod nvarchar(20),
@Id_Ubigeo nchar(6)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite la actualizacion un medico
	UPDATE  Tb_Medico SET 
			dniMedic = @dniMedic, 
			nomMedico = @nomMedico,
			apeMedico = @apeMedico,
			numColegiatura = @numColegiatura,
			fechaNacimiento = @fechaNacimiento,
			emailMedico = @emailMedico,
			fotoMedico = @fotoMedico,
			direcMedico = @direcMedico,
			estado = @estado,
			codEspecialidad = @codEspecialidad,
			Login_Usuario = @Login_Usuario,
			Fech_Ult_Mod = GETDATE(),
			Usu_Ult_Mod = @Usu_Ult_Mod,
			Id_Ubigeo = @Id_Ubigeo
WHERE codMedico = @VcodMedico
GO

--PRUEBA
EXEC usp_ActualizarMedico '0021', '80851339', 'Mengeche', 'Saba Rojas', '523455646', '05/03/1978', 'mengeSR@gmail.com', '', 
						  'Costa Azul 296', 1, '12', 'mengeS2021', 'jleon', '140101'
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO



--3: Eliminar un medico
CREATE OR ALTER PROCEDURE usp_EliminarMedico
@VcodMedico nchar(4)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite eliminar una medico
DELETE FROM  Tb_Medico
	   WHERE codMedico=@VcodMedico
GO

--PRUEBA
EXEC usp_EliminarMedico '0021'
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO

--4: Consultar un medico
CREATE OR ALTER PROCEDURE usp_ConsultarMedico
@vCodMedico nchar(4)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite consultar un medico
SELECT [codMedico]
      ,[dniMedic]
      ,[nomMedico]
      ,[apeMedico]
      ,[numColegiatura]
      ,[fechaNacimiento]
      ,[emailMedico]
      ,[fotoMedico]
      ,[direcMedico]
      ,[estado]
      ,[codEspecialidad]
      ,[Login_Usuario]
	  ,[Fec_Reg]
	  ,[Usu_Registro]
	  ,[Fech_Ult_Mod]
	  ,[Usu_Ult_Mod]
	  ,[Id_Ubigeo]
	  ,[fec_ingreso]
  FROM [dbo].[Tb_Medico]
WHERE codMedico = @vCodMedico
GO

--PRUEBA
EXEC usp_ConsultarMedico '0020'
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO


--5:  Listar medicos
CREATE OR ALTER PROCEDURE  usp_ListarMedico
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite listar una empresa
SELECT [codMedico]
      ,[dniMedic]
      ,[nomMedico]
      ,[apeMedico]
      ,[numColegiatura]
      ,[fechaNacimiento]
      ,[emailMedico]
      ,[fotoMedico]
      ,[direcMedico]
      ,[estado]
      ,[codEspecialidad]
      ,[Login_Usuario]
	  ,[Fec_Reg]
	  ,[Usu_Registro]
	  ,[Fech_Ult_Mod]
	  ,[Usu_Ult_Mod]
	  ,[Id_Ubigeo]
	  ,[fec_ingreso]
  FROM [dbo].[Tb_Medico]
ORDER BY codMedico
GO

--Prueba
EXEC usp_ListarMedico
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO

-- SP que devuelve todos los departamentos de la tabla Ubicacion
CREATE or ALTER Procedure [dbo].[usp_Ubigeo_Departamentos]
as
  SELECT DISTINCT IDDEPA,DEPARTAMENTO 
  FROM Tb_Ubicacion
  ORDER BY Departamento 
GO

-- SP que devuelve todas las provincias de un solo departamento especifico
CREATE or ALTER Procedure [dbo].[usp_Ubigeo_ProvinciasDepartamento]
@IdDepartamento char(2)
as
SELECT  DISTINCT IDPROV,PROVINCIA
FROM Tb_Ubicacion
WHERE IDDEPA=@IdDepartamento
ORDER BY Provincia 
GO

-- SP que devuelve todos los distritos de una sola provincia y de un solo departamento especifico
CREATE or ALTER Procedure [dbo].[usp_Ubigeo_DistritosProvinciaDepartamento]
@IdDepartamento char(2),
@IdProvincia char(2)
as
SELECT  IDDIST,DISTRITO
FROM Tb_Ubicacion
WHERE IDDEPA=@IdDepartamento AND IDPROV=@IdProvincia
ORDER BY Distrito 
GO

CREATE or ALTER Procedure [dbo].[usp_Empresa_Razon_Social]
as
  SELECT DISTINCT codEmpresa, Raz_soc_emp 
  FROM Tb_Empresa
  ORDER BY Raz_soc_emp 
GO

create or alter procedure usp_ConsultarUsuario
@vLogin nvarchar(20)
as
select Login_Usuario, Pass_Usuario, Niv_Usuario, Est_Usuario, Fec_Registro, Usu_Registro
from Tb_Usuario where Login_Usuario = @vLogin
go

CREATE OR ALTER PROCEDURE usp_ListaEspecialidades
AS
SELECT * FROM Tb_Especialidad
GO
-----------------------------------------------------------------------------------
-------------------------FIN PROCEDIMIENTO ALMACENADOS ----------------------------
-----------------------------------------------------------------------------------

--------------------------------------------------------------------------------
------------PROCEDIMIENTO ALMACENADO ESCENARIO TRANSACCIONAL--------------------
--------------------------------------------------------------------------------


CREATE TYPE MiResultado AS TABLE
(
-- Tipo de dato empleado para el registro de un Resultado de una Evaluacion
-- Elaborado por: Patricio Calderon (5-12-21)
	peso  float,	
	altura float,
	sangre nvarchar(99),
	orina nvarchar(99),
	ekg nvarchar(99),
	spiro nvarchar(99),
	psico nvarchar(99),
	rayosX nvarchar(99),
	audi nvarchar(99),
	vista nvarchar(99),
	codAnal char(5),
	codEnfe char(5),
	recom nvarchar(99),
	codPac nvarchar(8),
	Usu_Registro nvarchar(20)
)
GO

CREATE OR ALTER PROCEDURE usp_RegistrarEvaluacion
@vFecEva date,
@vEstado int,
@vCodMed nchar(4),
@vCodAudi char(3),
@vUsu_registro nvarchar(20),
@vCodEva char(5) OUTPUT, 
@detalles MiResultado READONLY --parametro tipo tabla con los resultados de la Evaluacion
AS
--SP que permite el registro de una nueva Evaluacion
--Modulo: Evaluaciones
--Elaborado por: Patricio Calderon (5-12-21)
BEGIN TRY --Iniciamos bloque TRY en SQL
	BEGIN TRANSACTION --Iniciamos la transaccion
	SET NOCOUNT OFF
	--1ro se obtiene el Numero de OC
	declare @vcont int
	set @vcont=(Select count(*) from Tb_Evaluacion)
		if @vcont=0 
			set @vCodEva ='00001'
		else
		--Se genera el numero de orden de compra
			set @vCodEva = (Select Right(Max(codEvaluacion)+ 100001 ,5) 
	From Tb_Evaluacion)
	--2do se inserta en la cabecera
	INSERT INTO Tb_Evaluacion VALUES
	(@vCodEva, @vFecEva, @vEstado, @vCodMed, @vCodAudi, GETDATE(), @vUsu_registro, null, null)
	--3ro se inserta el detalle 
	INSERT INTO Tb_Resultados
		SELECT peso, altura, sangre, orina, ekg, spiro, psico, rayosX, audi, vista, codAnal,
				@vCodEva as codEvaluacion, codEnfe, recom, codPac, GETDATE(), Usu_Registro, null, null
		from @detalles
	--4to si todo esta OK, se confirma la transaccion
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	--5to si algun paso fracasa, el flujo ingresa al bloque CATCH y se cancela 
	--la transaccion
	PRINT @@error
	ROLLBACK TRANSACTION
END CATCH
GO

--TESTEANDO--
declare @mitabla MiResultado
insert into @mitabla 
values  (80, 1.75, 'Resultados Sangre', 'Resultados orina', 
		'Resultados ekg', 'Resultados spiro', 'Resultados psico', 
		'Resultados rayosX', 'Resultados audi', 'Resultados vista',
		'00001', 'R00.0', 'Recomendaciones', '00000001', 'pcalderon2021')
declare @numgenerado char(5)
Execute usp_RegistrarEvaluacion '2020-04-03',1, '0011', '001','pcalderon2021',
                              @numgenerado OUTPUT,@mitabla
Print 'es....' +  @numgenerado
Select * from Tb_Evaluacion where codEvaluacion = @numgenerado 
Select * from Tb_Resultados where codEvaluacion = @numgenerado 
go

SELECT * FROM Tb_Evaluacion


---------------------------------------------------------------------------------
------------FIN DEL PROCEDIMIENTO ALMACENADO ESCENARIO TRANSACCIONAL-------------
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
---------------------------------DISPARADORES------------------------------------
---------------------------------------------------------------------------------

--CREAMOS LA TABLA DE AUDITORIA DE ANALISIS 
CREATE TABLE Tb_Analisis_Aud
(
	[codAnalisis] char(5) NOT NULL,
	[descAnalisis] Nvarchar(99) NULL,
	[costo] Money NULL,
	[estado] Int NOT NULL,
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL,
	Accion varchar(20) NULL,
	FechaAccion smalldatetime NULL
)
GO

--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Analisis 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Analisis_Aud
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Analisis_Ins
on Tb_Analisis
for Insert
as
Insert into Tb_Analisis_Aud 
Select [codAnalisis],[descAnalisis],[costo],[estado], Fec_reg,Usu_Registro,Fec_Ult_Mod,
	   Usu_Ult_Mod,'INSERTADO', GETDATE()
From inserted 
go


--Prueba
EXEC usp_InsertarAnalisis 'EXAMEN PREOCUPACIONAL','416.00',1,'ezvrtgs' 
GO

--Vemos la tabla Tb_Analisis_Aud
Select * from Tb_Analisis_Aud order by codAnalisis, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Analisis 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Analisis_Aud, PARA ACTUALIZACION 
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Analisis_Upd
on Tb_Analisis
for update
as
Insert into Tb_Analisis_Aud 
Select [codAnalisis],[descAnalisis],[costo],[estado], Fec_reg,Usu_Registro,Fec_Ult_Mod,
	   Usu_Ult_Mod,'NUEVO', GETDATE()
From inserted 
Insert into Tb_Analisis_Aud 
Select [codAnalisis],[descAnalisis],[costo],[estado], Fec_reg,Usu_Registro,Fec_Ult_Mod,
	   Usu_Ult_Mod,'ANTERIOR', GETDATE()
From deleted 
go

--Prueba
EXEC usp_ActualizarAnalisis '00022', 'EXAMEN PREOCUPACIONAL','200.00', 0, 'pcalderon2021' 
GO

--Vemos la tabla Tb_Analisis_Aud
Select * from Tb_Analisis_Aud order by codAnalisis, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Analisis 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Analisis_Aud, PARA ELIMINACION 
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Analisis_Elim
on Tb_Analisis
for delete 
as
Insert into Tb_Analisis_Aud 
Select [codAnalisis],[descAnalisis],[costo],[estado], Fec_reg,Usu_Registro,Fec_Ult_Mod,
	   Usu_Ult_Mod, 'ELIMINADO', GETDATE()
From deleted 
go

--Prueba
EXEC usp_EliminarAnalisis '00022'
GO

--Vemos la tabla Tb_Analisis_Aud
Select * from Tb_Analisis_Aud order by codAnalisis, FechaAccion 
go


--CREAMOS LA TABLA DE AUDITORIA DEl PACIENTE 
CREATE TABLE Tb_Paciente_Aud
(
	codPaciente nvarchar (8) NOT NULL,
	nomPaciente nvarchar (99) not null,
	apePaciente nvarchar (99) not null,
	fechaNacimiento date not null,
	dniPaciente nchar (8) not null,
	sexo int not null,
	direcPaciente varchar(20),
	tipoSangre char(3),
	fotoPaciente nvarchar null,
	emailPaciente varchar(320),
	fechaIngreso datetime,
	numTelefono nvarchar (9) not null,
	estado int not null,
	tipoCliente int,
	codEmpresa nvarchar (5),
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL,
	Id_Ubigeo nchar(6) NOT NULL,	
	Accion varchar(20) NULL,
	FechaAccion smalldatetime NULL
)
GO

--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Paciente 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Paciente_Aud
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Paciente_Ins
on Tb_Paciente 
for Insert
as
Insert into Tb_Paciente_Aud 
Select 	codPaciente, nomPaciente, apePaciente, fechaNacimiento, dniPaciente, sexo, direcPaciente, tipoSangre, null, emailPaciente, fechaIngreso,
	    numTelefono, estado, tipoCliente, codEmpresa, Fec_reg, Usu_Registro, Fec_Ult_Mod, Usu_Ult_Mod, Id_Ubigeo,'INSERTADO', GETDATE()
From inserted 
go

--Prueba
EXEC usp_InsertarPaciente 'Mauricio', 'Vasquez Vidal','09/07/1998', '74909986', 0, 'Av. Javier Prado 221', 'AB-', null, 
								'mauvasquez0907@gmail.com', '2019-03-18 08:00:00', '997894748', 1, 3, '00006', 'jleon', '140101'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Paciente_Aud order by codPaciente, FechaAccion 
go

SELECT * FROM Tb_Paciente
GO


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Paciente 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Paciente_Aud, PARA ACTUALIZACION
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Paciente_Upd
on Tb_Paciente 
for update
as
Insert into Tb_Paciente_Aud 
Select 	codPaciente, nomPaciente, apePaciente, fechaNacimiento, dniPaciente, sexo, direcPaciente, tipoSangre, null, emailPaciente, fechaIngreso,
	    numTelefono, estado, tipoCliente, codEmpresa, Fec_reg, Usu_Registro, Fec_Ult_Mod, Usu_Ult_Mod, Id_Ubigeo,'NUEVO', GETDATE()
From inserted 
Insert into Tb_Paciente_Aud 
Select 	codPaciente, nomPaciente, apePaciente, fechaNacimiento, dniPaciente, sexo, direcPaciente, tipoSangre, null, emailPaciente, fechaIngreso,
	    numTelefono, estado, tipoCliente, codEmpresa, Fec_reg, Usu_Registro, Fec_Ult_Mod, Usu_Ult_Mod, Id_Ubigeo,'ANTERIOR', GETDATE()
From deleted 
go

--Prueba
EXEC usp_ActualizarPaciente '00000021', 'Mauricio', 'Vasquez Vidal','09/07/1998', '74909986', 0, 'Av. Raul Ferrero 130', 'AB-', null, 
								'mauvasquez0985@gmail.com', '2019-03-18 08:00:00', '997894748', 1, 3, '00006', 'jleon', '140101'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Paciente_Aud order by codPaciente, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Paciente 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Paciente_Aud, PARA ELIMINACION
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Paciente_Elim
on Tb_Paciente 
for delete 
as
Insert into Tb_Paciente_Aud 
Select 	codPaciente, nomPaciente, apePaciente, fechaNacimiento, dniPaciente, sexo, direcPaciente, tipoSangre, null, emailPaciente, fechaIngreso,
	    numTelefono, estado, tipoCliente, codEmpresa, Fec_reg, Usu_Registro, Fec_Ult_Mod, Usu_Ult_Mod, Id_Ubigeo,'ELIMINADO', GETDATE()
From deleted 
go

--Prueba
EXEC usp_EliminarPaciente '00000021'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Paciente_Aud order by codPaciente, FechaAccion 
go


--CREAMOS LA TABLA DE AUDITORIA DE EMPRESA 
CREATE TABLE Tb_Empresa_Aud
(
	codEmpresa nvarchar (5) NOT NULL,
	Raz_soc_emp nvarchar (50) not null,
	Dir_emp nvarchar (50),
	Tel_emp  nvarchar (10),
	Ruc_emp nchar(11) not null,
	Rep_emp nvarchar (30),
	Id_Ubigeo nchar(6),
	fec_Ingreso datetime,
	estado int not null,
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL,
	Accion varchar(20) NULL,
	FechaAccion smalldatetime NULL
)
GO

--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Empresa 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Empresa_Aud
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Empresa_Ins
on Tb_Empresa
for Insert
as
Insert into Tb_Empresa_Aud 
Select codEmpresa, Raz_soc_emp, Dir_emp, Tel_emp, Ruc_emp,
	   Rep_emp, Id_Ubigeo, fec_Ingreso, estado, Fec_reg, Usu_Registro, Fec_Ult_Mod,
	   Usu_Ult_Mod, 'INSERTADO', GETDATE()
From inserted 
go

--Pruebaa
EXEC usp_InsertarEmpresa 'JENNIFER S.A.C', 'Av. Javier Prado Este 234', '3872345', '20500397665', 'Martha Bellido', '140101', 1, 'jleon'
GO


--Vemos la tabla Tb_Empresa_Aud
Select * from Tb_Empresa_Aud order by codEmpresa, FechaAccion 
go



--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Empresa 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Empresa_Aud, PARA ACTUALIZACION
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Empresa_Upd
on Tb_Empresa
for update
as
Insert into Tb_Empresa_Aud 
Select codEmpresa, Raz_soc_emp, Dir_emp, Tel_emp, Ruc_emp,
	   Rep_emp, Id_Ubigeo, fec_Ingreso, estado, Fec_reg, Usu_Registro, Fec_Ult_Mod,
	   Usu_Ult_Mod, 'NUEVO', GETDATE()
From inserted 
Insert into Tb_Empresa_Aud 
Select codEmpresa, Raz_soc_emp, Dir_emp, Tel_emp, Ruc_emp,
	   Rep_emp, Id_Ubigeo, fec_Ingreso, estado, Fec_reg, Usu_Registro, Fec_Ult_Mod,
	   Usu_Ult_Mod, 'ANTERIOR', GETDATE()
From deleted 
go

--Prueba
EXEC usp_ActualizarEmpresa '00021','JENNIFER S.A.C', 'Av. Javier Prado Este 234', '3872345', '20500397665', 'Martha Bellido', '140101', 1, 'jleon'
GO

--Vemos la tabla Tb_Empresa_Aud
Select * from Tb_Empresa_Aud order by codEmpresa, FechaAccion 
go

--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Empresa 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Empresa_Aud, PARA ELIMINACION
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Empresa_Elim
on Tb_Empresa
for delete 
as
Insert into Tb_Empresa_Aud 
Select codEmpresa, Raz_soc_emp, Dir_emp, Tel_emp, Ruc_emp,
	   Rep_emp, Id_Ubigeo, fec_Ingreso, estado, Fec_reg, Usu_Registro, Fec_Ult_Mod,
	   Usu_Ult_Mod, 'ELIMINADO', GETDATE()
From deleted 
go

--Prueba
EXEC usp_EliminarEmpresa '00021'
GO

--Vemos la tabla Tb_Medico_Aud
Select * from Tb_Empresa_Aud order by codEmpresa, FechaAccion 
go


--CREAMOS LA TABLA DE AUDITORIA DEl MEDICO 
CREATE TABLE Tb_Medico_Aud
(
	[codMedico] Nchar(4) NOT NULL,
	[dniMedic] Nchar(8) NULL,
	[nomMedico] Varchar(20) NOT NULL,
	[apeMedico] Varchar(20) NOT NULL,
	[numColegiatura] Char(9) NOT NULL,
	[fechaNacimiento] Date NOT NULL,
	[emailMedico] Varchar(320) NULL,
	[fotoMedico] nvarchar NULL,
	[direcMedico] Varchar(99) NULL,
	[estado] Int NOT NULL,
	[codEspecialidad] Nchar(2) NULL,
	[Login_Usuario] Nvarchar(20) NULL,
	[Fec_Reg] Datetime NULL,
	[Usu_Registro] Nvarchar(20) NULL,
	[Fech_Ult_Mod] Date NULL,
	[Usu_Ult_Mod] Nvarchar(20) NULL,
	[Id_Ubigeo] Nchar(6) NOT NULL,
	[fec_ingreso] datetime,
	Accion varchar(20) NULL,
	FechaAccion smalldatetime NULL
)
GO
--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Medico 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Medico_Aud
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Medico_Ins
on Tb_Medico
for Insert
as
Insert into Tb_Medico_Aud 
Select 	[codMedico], [dniMedic], [nomMedico], [apeMedico], [numColegiatura], [fechaNacimiento], [emailMedico],NULL, [direcMedico], [estado],
	    [codEspecialidad], [Login_Usuario], [Fec_Reg], [Usu_Registro], [Fech_Ult_Mod], [Usu_Ult_Mod], [Id_Ubigeo],[fec_ingreso],'INSERTADO', GETDATE()
From inserted 
go

--PRUEBA
EXEC usp_InsertarMedico '80851339', 'Mengeche', 'Saba Rojas', '523455646', '05/03/1978', 'mengeSR@gmail.com', null, 
						'Costa Azul 296', 1, '12', 'mengeS2021', 'jleon', null, null, '140101', '2021-01-26 08:00:00'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Medico_Aud order by codMedico, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Medico 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Medico_Aud, PARA ACTUALIZACION 
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Medico_Upd
on Tb_Medico
for update
as
Insert into Tb_Medico_Aud 
Select 	[codMedico], [dniMedic], [nomMedico], [apeMedico], [numColegiatura], [fechaNacimiento], [emailMedico],null, [direcMedico], [estado],
	    [codEspecialidad], [Login_Usuario], [Fec_Reg], [Usu_Registro], [Fech_Ult_Mod], [Usu_Ult_Mod], [Id_Ubigeo],[fec_ingreso],'NUEVO', GETDATE()
From inserted 
Insert into Tb_Medico_Aud 
Select 	[codMedico], [dniMedic], [nomMedico], [apeMedico], [numColegiatura], [fechaNacimiento], [emailMedico],null, [direcMedico], [estado],
	    [codEspecialidad], [Login_Usuario], [Fec_Reg], [Usu_Registro], [Fech_Ult_Mod], [Usu_Ult_Mod], [Id_Ubigeo],[fec_ingreso],'ANTERIOR', GETDATE()
From deleted 
go

--Prueba
EXEC usp_ActualizarMedico '0021', '80851339', 'Mengeche', 'Saba Rojas', '523455646', '05/03/1978', 'mengeSR@gmail.com', null, 
						  'mar Azul 296', 1, '12', 'mengeS2021', 'jleon', '140101'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Medico_Aud order by codMedico, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Medico 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Medico_Aud, PARA ELIMINACION 
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Medico_Elim
on Tb_Medico
for delete 
as
Insert into Tb_Medico_Aud 
Select 	[codMedico], [dniMedic], [nomMedico], [apeMedico], [numColegiatura], [fechaNacimiento], [emailMedico],null, [direcMedico], [estado],
	    [codEspecialidad], [Login_Usuario], [Fec_Reg], [Usu_Registro], [Fech_Ult_Mod], [Usu_Ult_Mod], [Id_Ubigeo],[fec_ingreso],'ELIMINADO', GETDATE()
From deleted 
go

--Prueba
EXEC usp_EliminarMedico '0021'
GO

--Vemos la tabla Tb_Medico_Aud
Select * from Tb_Medico_Aud order by codMedico, FechaAccion 
go


--1) Paginacion Analisis Estado
CREATE or ALTER PROCEDURE usp_AnalisisEstado_Paginacion
@codAnalisis varchar(5) = '',
@Lugar_de_trabajo varchar(50) = '',
@TipoAnalisis varchar(99) = '',
@NumPag int 
AS
-- SP FILTRADO POR CODIGO DE ANALISIS Y LUGAR DE TRABAJO
-- MODULO ANALISIS
-- ELABORADO POR : MAURICIO MANUEL VASQUEZ VIDAL - 05/12/2021
DECLARE @PAGESIZE INT
SET @PAGESIZE = 5 
IF @codAnalisis='' AND @Lugar_de_trabajo='' AND @TipoAnalisis=''
    BEGIN
	           SELECT top 5 codAnalisis, NombrePaciente, ApellidoPaciente, Lugar_de_trabajo , TipoAnalisis, CostoAnalisis
               from vw_VistaAnalisisEstado
			   ORDER BY codAnalisis
    END
ELSE
   BEGIN
             IF @codAnalisis=''
			         SET @codAnalisis='%'
			 IF @Lugar_de_trabajo=''
			         SET @Lugar_de_trabajo='%'
			 IF @TipoAnalisis=''
					SET @TipoAnalisis='%'
              
               SELECT top 5 codAnalisis, NombrePaciente, ApellidoPaciente, Lugar_de_trabajo ,TipoAnalisis, CostoAnalisis
               from 
		 (SELECT codAnalisis, NombrePaciente, ApellidoPaciente, Lugar_de_trabajo ,TipoAnalisis, CostoAnalisis,
				ROW_NUMBER() OVER (ORDER BY codAnalisis) AS NumOrden 
				from vw_VistaAnalisisEstado
				where 
				     codAnalisis like '%' + @codAnalisis + '%'
				 and Lugar_de_trabajo like '%' + @Lugar_de_trabajo + '%'
				 and TipoAnalisis like '%' + @TipoAnalisis + '%'
				
			) AS CONSULTAPAGINADAANALISIS 
			WHERE NumOrden BETWEEN @PageSize * @NUMPAG + 1 AND @PageSize * (@NUMPAG + 1)
	            ORDER BY codAnalisis 
END
GO

EXEC usp_AnalisisEstado_Paginacion '','','EXAMEN PREOCUPACIONAL', 1
GO


--2) Paginacion de Medico Estado

CREATE or ALTER PROCEDURE usp_MedicoEstado_Paginacion
@codMedico varchar(5)='',
@dniMedic varchar(50)='',
@Especialidad varchar(99)='',
@NumPag int =1
AS
-- SP FILTRADO POR CODIGO DE MEDICO Y DNI DEL MEDICO
-- MODULO MEDICO
-- ELABORADO POR : MAURICIO MANUEL VASQUEZ VIDAL - 05/12/2021
DECLARE @NUMREG INT
DECLARE @PAGESIZE INT
SET @PAGESIZE=5 
IF @codMedico='' AND @dniMedic='' AND @Especialidad=''
    BEGIN
	           SELECT top 5 codMedico, Nombre, Apellido, Especialidad,estado,fechaNacimiento,dniMedic,direcMedico ,emailMedico
               from vw_VistaMedicoEstado
			   ORDER BY codMedico
    END
ELSE
   BEGIN
             IF @codMedico=''
			         SET @codMedico='%'

			 IF @dniMedic=''
			         SET @dniMedic='%'
			 IF @Especialidad=''
					 SET @Especialidad='%'
              
               SELECT top 5  codMedico, Nombre, Apellido, Especialidad,estado,fechaNacimiento,dniMedic,direcMedico ,emailMedico
               from 			  
		 ( SELECT codMedico, Nombre, Apellido, Especialidad,estado,fechaNacimiento,dniMedic,direcMedico ,emailMedico,
				ROW_NUMBER() OVER (ORDER BY codMedico DESC) AS NumOrden 
				from vw_VistaMedicoEstado
				where 
				     codMedico like '%' + @codMedico + '%'
				 and dniMedic like '%' + @dniMedic + '%'
				 and Especialidad like '%' + @Especialidad + '%'
			) AS CONSULTAPAGINADAMEDICO 
			WHERE NumOrden BETWEEN @PageSize * @NUMPAG + 1 AND @PageSize * (@NUMPAG + 1)
	            ORDER BY codMedico
END

GO
EXEC usp_MedicoEstado_Paginacion '','','', 1
GO
