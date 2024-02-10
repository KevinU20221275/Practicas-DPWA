CREATE DATABASE HospitalDB
GO 
USE HospitalDB
GO

CREATE TABLE Departamentos(
	DepartamentoID INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(200),
	Descripcion VARCHAR(250)
)

CREATE TABLE Medicamentos(
	MedicamentoID INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(200),
	Descripcion VARCHAR(250),
	Existencias INT,
	FechaExpiracion DATE
)

CREATE TABLE Especialidades(
	EspecialidadID INT PRIMARY KEY IDENTITY(1,1),
	Especialidad VARCHAR(100),
	Descripcion VARCHAR(250)
)

CREATE TABLE Tele_Medicos(
	TelefonoID INT PRIMARY KEY IDENTITY(1,1),
	Telefono VARCHAR(20)
)

CREATE TABLE Tele_Enfermeras(
	TelefonoID INT PRIMARY KEY IDENTITY(1,1),
	Telefono VARCHAR(20)
)

CREATE TABLE Tele_Pacientes(
	TelefonoID INT PRIMARY KEY IDENTITY(1,1),
	Telefono VARCHAR(20)
)

CREATE TABLE Medicos(
	MedicoID INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(100),
	ApellidoPaterno VARCHAR(50),
	ApellidoMaterno VARCHAR(50),
	TelefonoID INT,
	EspecialidadID INT,
	DepartamentoID INT,
	FOREIGN KEY (TelefonoID) REFERENCES Tele_Medicos(TelefonoID),
	FOREIGN KEY (EspecialidadID) REFERENCES Especialidades(EspecialidadID),
	FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
)

CREATE TABLE Enfermeras(
	EnfermeraID INT PRIMARY KEY IDENTITY(1,1),
	Nombres VARCHAR(100),
	ApellidoPaterno VARCHAR(50),
	ApellidoMaterno VARCHAR(50),
	TelefonoID INT,
	DepartamentoID INT,
	FOREIGN KEY (TelefonoID) REFERENCES Tele_Enfermeras(TelefonoID),
	FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
)

CREATE TABLE Pacientes(
	PacienteID INT PRIMARY KEY IDENTITY(1,1),
	Nombres VARCHAR(100),
	ApellidoPaterno VARCHAR(50),
	ApellidoMaterno VARCHAR(50),
	TelefonoID INT,
	FOREIGN KEY (TelefonoID) REFERENCES Tele_Pacientes(TelefonoID)
)


CREATE TABLE Visitas_Medicas(
	VisitaMedicaID INT PRIMARY KEY IDENTITY(1,1),
	FechaVisita DATETIME,
	Descripcion VARCHAR(250),
	MedicoID INT,
	PacienteID INT,
	FOREIGN KEY (MedicoID) REFERENCES Medicos(MedicoID),
	FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID)
)

CREATE TABLE Diagnosticos(
	DiagnosticoID INT PRIMARY KEY IDENTITY(1,1),
	Descripcion VARCHAR(250),
	Fecha DATETIME,
	FechaAlta DATETIME,
	VisitaMedicaID INT,
	FOREIGN KEY (VisitaMedicaID) REFERENCES Visitas_Medicas(VisitaMedicaID)
)

CREATE TABLE Tratamiento(
	TratamientoID INT PRIMARY KEY IDENTITY(1,1),
	Descripcion VARCHAR(250),
	DiagnosticoID INT,
	MedicamentoID INT,
	FOREIGN KEY (DiagnosticoID) REFERENCES Diagnosticos(DiagnosticoID),
	FOREIGN KEY (MedicamentoID) REFERENCES Medicamentos(MedicamentoID)
)