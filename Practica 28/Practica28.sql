CREATE TABLE articulos(
  cod_art CHAR(7),
  nombre VARCHAR2(40) CONSTRAINT articulos_nn1 NOT NULL,
  marca VARCHAR2(20) CONSTRAINT articulos_nn2 NOT NULL,
  modelo VARCHAR2(15) CONSTRAINT articulos NOT NULL,
  CONSTRAINT articulos_pk PRIMARY KEY (cod_art),
);
CREATE TABLE seccion(
  id_sec NUMBER(3),
  id_supersec NUMBER(3),
  nombre VARCHAR2(40)CONSTRAINT seccion_nn1 NOT NULL,
  CONSTRAINT seccion_pk PRIMARY KEY (id_sec),
  CONSTRAINT seccion_uk1 UNIQUE (nombre),
  CONSTRAINT seccion_fk1 FOREIGN KEY REFERENCES id_sec
);