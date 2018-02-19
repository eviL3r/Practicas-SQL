CREATE TABLE equipos (
  id_equipo NUMBER(2),
  nombre VARCHAR2(50) CONSTRAINT equipos_nn1 NOT NULL,
  estadio VARCHAR2(50),
  aforo NUMBER(6),
  ano_fundacion NUMBER(4),
  ciudad VARCHAR2(50) CONSTRAINT equipos_nn2 NOT NULL,
  CONSTRAINT equipos_pk PRIMARY KEY (id_equipo),
  CONSTRAINT equipos_uk1 UNIQUE (nombre),
  CONSTRAINT equipos_uk2 UNIQUE (estadio)
);
CREATE TABLE jugadores(
  id_jugador NUMBER(3),
  nombre VARCHAR2(50) CONSTRAINT jugadores_nn1 NOT NULL,
  fecha DATE,
  id_equipo NUMBER(2),
  CONSTRAINT jugadores_pk PRIMARY KEY (id_jugador),
  CONSTRAINT jugadores_fk1 FOREIGN KEY (id_equipo) REFERENCES equipos ON DELETE SET NULL
);
CREATE TABLE partidos(
  id_equipo_casa number(2),
  id_equipo_fuera number(2),
  fecha TIMESTAMP,
  goles_casa NUMBER(2),
  goles_fuera number(2),
  observaciones VARCHAR2(1000),
  CONSTRAINT partidos_pk PRIMARY KEY (id_equipo_casa,id_equipo_fuera),
  CONSTRAINT partidos_fk1 FOREIGN KEY (id_equipo_casa) REFERENCES equipos ON DELETE CASCADE,
  CONSTRAINT partidos_fk2 FOREIGN KEY (id_equipo_fuera) REFERENCES equipos ON DELETE CASCADE,
  CONSTRAINT partidos_ck CHECK (id_equipo_casa!=id_equipo_fuera)
);
CREATE TABLE goles(
  id_equipo_casa NUMBER(2),
  id_equipo_fuera NUMBER(2),
  minuto INTERVAL DAY TO SECOND,
  descripcion VARCHAR2(2000),
  id_jugador NUMBER(3),
  CONSTRAINT goles_pk PRIMARY KEY (id_equipo_fuera,id_equipo_casa,minuto),
  CONSTRAINT goles_fk1 FOREIGN KEY (id_equipo_casa,id_equipo_fuera) REFERENCES partidos(id_equipo_casa,id_equipo_fuera) ON DELETE CASCADE,
  CONSTRAINT goles_fk2 FOREIGN KEY (id_jugador) REFERENCES jugadores ON DELETE CASCADE
);
ALTER TABLE equipos MODIFY aforo CONSTRAINT equipos_nn3 NOT NULL;
ALTER  TABLE  equipos MODIFY estadio CONSTRAINT equipos_nn4 NOT NULL;
ALTER TABLE equipos MODIFY (ano_fundacion DATE);
ALTER TABLE jugadores DROP CONSTRAINT jugadores_nn1;

INSERT INTO EQUIPOS VALUES (1,'Cascorro F.C.','La Arenera','4000','1/1/1961','Cascorro De Arriba');
INSERT INTO EQUIPOS VALUES (2,'Athlético Matalasleñas','Cerro Gálvez','1200','12/3/1970','Matalasleñas');

INSERT INTO JUGADORES VALUES (4,'Amoribia','20/1/1990',1);
INSERT INTO JUGADORES VALUES (9,'García','25/4/1991',2);
INSERT INTO JUGADORES VALUES (7,'Pedrosa','12/9/1993',1);

INSERT INTO PARTIDOS VALUES (1,2,TO_DATE('05/11/2016','DD/MM/YYYY'),2,1,'Partido ganado por el Cascorro');

INSERT INTO GOLES VALUES (1,2,INTERVAL '23' MINUTE ,'Falta directa',4);
INSERT INTO GOLES VALUES (1,2,INTERVAL '40' MINUTE ,'Penalti',9);
INSERT INTO GOLES VALUES (1,2,INTERVAL '1:10' HOUR TO MINUTE ,'Gran jugada personal',7);




