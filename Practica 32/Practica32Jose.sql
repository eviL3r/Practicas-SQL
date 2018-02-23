CREATE TABLE tipos_apli(
  id_tipo NUMBER(2),
  tipo VARCHAR2(25) CONSTRAINT tipos_apli_nn1 NOT NULL,
  CONSTRAINT tipos_apli_pk PRIMARY KEY (id_tipo)
);
CREATE TABLE aplicaciones(
  n_aplicacion NUMBER(4),
  nombre VARCHAR2(25) CONSTRAINT aplicaciones_nn1 NOT NULL,
  extension VARCHAR2(10),
  id_tipo NUMBER(11,2) CONSTRAINT aplicaciones_nn2 NOT NULL,
  CONSTRAINT aplicaciones_pk PRIMARY KEY (n_aplicacion),
  CONSTRAINT aplicaciones_uk1 UNIQUE (nombre),
  CONSTRAINT aplicaciones_fk1 FOREIGN KEY (id_tipo) REFERENCES tipos_apli(id_tipo) ON DELETE CASCADE
);
CREATE TABLE procesos(
  n_aplicacion NUMBER(4),
  id_proceso NUMBER(3),
  nombre VARCHAR2(25) CONSTRAINT procesos_nn1 NOT NULL,
  mem_minima NUMBER(5,1) CONSTRAINT procesos_ck1 CHECK (mem_minima>=0),
  id_proceso_lanz NUMBER(3),
  n_aplicacion_lanz NUMBER(4),
  CONSTRAINT procesos_pk PRIMARY KEY (n_aplicacion,id_proceso),
  CONSTRAINT procesos_uk1 UNIQUE (nombre),
  CONSTRAINT procesos_fk1 FOREIGN KEY (n_aplicacion) REFERENCES aplicaciones(n_aplicacion) ON DELETE CASCADE,
  CONSTRAINT procesos_fk2 FOREIGN KEY (id_proceso_lanz,n_aplicacion_lanz)REFERENCES procesos(n_aplicacion,id_proceso) ON DELETE CASCADE
);
CREATE TABLE maquinas(
  n_maquina NUMBER(3),
  ip1 NUMBER(3) CONSTRAINT maquinas_nn1 NOT NULL
                CONSTRAINT maquinas_ck1 CHECK (ip1>=0 AND ip1<=255),
  ip2 NUMBER(3) CONSTRAINT maquinas_nn2 NOT NULL
                CONSTRAINT maquinas_ck2 CHECK (ip2>=0 AND ip2<=255),
  ip3 NUMBER(3) CONSTRAINT maquinas_nn3 NOT NULL
                CONSTRAINT maquinas_ck3 CHECK (ip3>=0 AND ip3<=255),
  ip4 NUMBER(3) CONSTRAINT maquinas_nn4 NOT NULL
                CONSTRAINT maquinas_ck4 CHECK (ip4>=0 AND ip4<=255),
  nombre VARCHAR2(45)CONSTRAINT maquinas_nn5 NOT NULL,
  memoria NUMBER(5,1),
  CONSTRAINT maquinas_pk PRIMARY KEY (n_maquina),
  CONSTRAINT maquinas_uk1 UNIQUE (ip1,ip2,ip3,ip4),
  CONSTRAINT maquinas_uk2 UNIQUE (nombre)
);
CREATE TABLE procesos_lanzados (
  n_aplicacion  NUMBER(4),
  id_proceso    NUMBER(3),
  fecha_lanz    TIMESTAMP,
  fecha_termino TIMESTAMP,
  bloqueado     NUMBER(1) CONSTRAINT procesos_lanzados_ck1 CHECK (bloqueado = 0 OR bloqueado = 1),
  n_maquina     NUMBER(3) CONSTRAINT procesos_lanzados_nn1 NOT NULL,
  CONSTRAINT procesos_lanzados_pk PRIMARY KEY (n_aplicacion, id_proceso, fecha_lanz),
  CONSTRAINT procesos_lanzados_fk1 FOREIGN KEY (n_aplicacion, id_proceso) REFERENCES procesos (n_aplicacion, id_proceso) ON DELETE CASCADE,
  CONSTRAINT procesos_lanzados_fk2 FOREIGN KEY (n_maquina) REFERENCES maquinas (n_maquina) ON DELETE CASCADE
);

