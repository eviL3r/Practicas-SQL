CREATE TABLE Empresas (
  CIF       CHAR(9),
  Nombre    VARCHAR2(25) CONSTRAINT empresas_nn1 NOT NULL,
  Telefono  CHAR(9),
  Direccion VARCHAR2(50),
  CONSTRAINT empresas_pk PRIMARY KEY (CIF),
  CONSTRAINT empresas_uk UNIQUE (Nombre)
);
CREATE TABLE Alumnos (
  DNI       CHAR(9),
  Nombre VARCHAR2 (50) CONSTRAINT alumnos_nn1 NOT NULL,
  Apellido1 VARCHAR2(50) CONSTRAINT alumnos_nn2 NOT NULL,
  Apellido2 VARCHAR2(50) CONSTRAINT alunmos_nn3 NOT NULL,
  Direccion VARCHAR2(50),
  Telefono  CHAR(9),
  Edad      NUMBER(2),
  CIF       CHAR(9)
  CONSTRAINT alumnos_fk1
  REFERENCES Empresas,
  CONSTRAINT alumnos_pk PRIMARY KEY (DNI)
);
CREATE TABLE Asistir(
  DNI CHAR(9),
  n_curso NUMBER(3),
  nota  number(4,2),
  CONSTRAINT asistir_pk PRIMARY KEY (DNI,n_curso),
  CONSTRAINT asistir_fk1 FOREIGN KEY(DNI) REFERENCES Alumnos (DNI),
  CONSTRAINT asistir_fk2 FOREIGN KEY (n_curso) REFERENCES Cursos (n_curso)
);
CREATE TABLE Cursos(
  n_curso NUMBER(3),
  fecha_inicio TIMESTAMP,
  fecha_fin TIMESTAMP,
  cod_curso CHAR(8),
  dni_profesor CHAR(9),
  CONSTRAINT cursos_pk PRIMARY KEY (n_curso),
  CONSTRAINT cursos_fk1 FOREIGN KEY (cod_curso)
  REFERENCES tipos_curso (cod_curso),
  CONSTRAINT cursos_fk2 FOREIGN KEY (dni_profesor)
  REFERENCES Profesores (DNI)
);
CREATE TABLE tipos_curso(
  cod_curso CHAR(8),
  titulo VARCHAR2(50),
  duracion NUMBER(3),
  temario CLOB,
  CONSTRAINT tipos_curso_uk UNIQUE(titulo),
  CONSTRAINT tipos_curso_pk PRIMARY KEY(cod_curso)
);
CREATE TABLE Profesores(
  DNI CHAR(9),
  nombre VARCHAR2(50) CONSTRAINT profesores_nn1 NOT NULL,
  apellido1 VARCHAR2(50) CONSTRAINT profesores_nn2 NOT NULL,
  apellido2 VARCHAR2(50) CONSTRAINT profesores_nn3 NOT NULL,
  direccion VARCHAR2(50),
  telefono CHAR(9),
  CONSTRAINT profesores_pk PRIMARY KEY (DNI)
);

