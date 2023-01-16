


-- forma de insertar datos
insert into nombreTabla (nombreColum) values(valor1,valor2) 

-- insertamos datos en la tabla carrera

insert into carrera values (1,'Derecho',3)
insert into carrera values (2,'Ingenieria en Sistemas',3)

-- insertamos datos en tabla materia

insert into materia values (1,'Matemáticas',25)
insert into materia values (2,'Español',15)

-- insertamos datos en la tabla profesor

insert into profesor values (1,'Laura Rosas','Calle Azul', 567867.'7:00')
insert into profesor values (1,'Roberto Díaz','Calle Rosa', 56473256.'9:00')

-- ====== tablas con claves foraneas =======

--  insertamos datos en tabla alumno con clave foranea

insert into alumno values (1,'Ana',18,6, 'mujer'.1)

-- Insertamos datos en tabla Alumno Profesor con clave foraneas

insert into alu_pro values (1,2)/* solo las claves de alumno y profesor */

-- insertamos datos en tabla Materia-Alumno 

insert into mat_alu values(1,1)/* ana toma la clase matematica */

-- insertamos datos en labla Materia-Profesor

insert into mat_pro values(2,2)/*  */


-- ===========  SELECT ===========
-- para ver toda la tabla 
select * from carrera
select nombreColum nombreCampo from nombreTabla


*******************************************************
-- ===========  SELECT - INNER JOIN - WHERE ===========

/* Insert */
-- Tabla Carrera
INSERT INTO carrera VALUES (3,'Diseño',3)

-- Tabla Carrera
INSERT INTO materia VALUES (3,'Dibujo',15)
INSERT INTO materia VALUES (3,'Programación',20)

-- Tabla Alumno
INSERT INTO alumno VALUES (2,'Sergio',19,7,'Hombre',2)
INSERT INTO alumno VALUES (3,'Julieta',20,6,'Mujer',3)

-- Alumno-Profesor
INSERT INTO alu_pro VALUES (2,2)
INSERT INTO alu_pro VALUES (3,2)

-- Materia-Alumno
INSERT INTO mat_alu VALUES (4,2)
INSERT INTO mat_alu VALUES (3,3)
INSERT INTO mat_alu VALUES (4,1)

-- * Select 
-- Accediendo a traves de tablas intermedias a otras tablas
-- alumno se une a carrera mediante KF y KP 
SELECT nom_alu, edad_alu, sem_alu, nom_c, nom_p, nom_m
FROM alumno INNER JOIN carrera ON alumno.clave_c1=carrera.clave_c
INNER JOIN alu_pro ON alu_pro.mat_alu1=alumno.mat_alu
INNER JOIN profesor ON profesor.clave_p=clave_p1
INNER JOIN mat_alu ON mat_alu.mat_alu2=alumno.mat_alu
INNER JOIN materia ON materia.clave_m=mat_alu.clave_m1
-- tambien usamos una condicion
WHERE edad_alu!=18

*******************************************************
CREATE DATABASE modificar

USE modificar

CREATE TABLE producto(
clave_prod INT,
nom_prod VARCHAR(20),
precio float,
CONSTRAINT pk_cp PRIMARY KEY (clave_prod)
)

CREATE TABLE cliente(
clave_clie INT,
nom_clie VARCHAR(20),
CONSTRAINT pk_cc PRIMARY KEY (clave_clie)
)

CREATE TABLE nota(
folio INT,
clave_prod1 INT,
clave_clie1 INT,
cant INT,
subtot FLOAT,
CONSTRAINT fk_cp1 FOREIGN KEY (clave_prod1) REFERENCES producto (clave_prod),
CONSTRAINT fk_cc1 FOREIGN KEY (clave_clie1) REFERENCES cliente (clave_clie)
 )

INSERT INTO producto VALUES (1,'papas',7)
INSERT INTO producto VALUES (2,'refresco',9)

INSERT INTO cliente VALUES (1,'ana')
INSERT INTO cliente VALUES (2,'sergio')

INSERT INTO nota VALUES (1,1,1,4,null)
INSERT INTO nota VALUES (2,2,2,1,null)

/* Actualizar datos */
 UPDATE cliente /* la tabla */
 SET nom_clie='ana'/* el campo o columna y el valor*/
 WHERE clave_clie=1 /* especifica una celda o id */

/* Actualizar datos obteniendo datos de diferentes tablas */
UPDATE nota
SET subtot=cant*precio
FROM nota INNER JOIN producto ON producto.clave_prod=nota.clave_prod1


*******************************************************
CREATE DATABASE modificar

USE modificar

CREATE TABLE producto(
clave_prod int,
nom_prod VARCHAR(20),
precio float,
constraint pk_cp PRIMARY KEY (clave_prod))

create table cliente(
clave_clie int,
nom_clie varchar(20),
constraint pk_cc PRIMARY KEY (clave_clie))

create table nota(
folio int,
clave_prod1 int,
clave_clie1 int,
cant int,
subtot float,
constraint fk_cp1 foreign key (clave_prod1) references producto (clave_prod),
constraint fk_cc1 foreign key (clave_clie1) references cliente (clave_clie))

insert into producto values (1,'papas',7)
insert into producto values (2,'refresco',9)
insert into producto values (3, 'galletas',9)

insert into cliente values (1,'ana')
insert into cliente values (2,'sergio')

insert into nota values (1,1,1,4,null)
insert into nota values (2,2,2,1,null)

/* Eliminando registros de una tabla */
delete from nota

/* Eliminando un registro */
delete from producto WHERE clave_prod=3

/* Eliminando registro que cumple con where */
delete from nota WHERE precio=9 and clave_prod=1

/* Eliminar tabla(toda la estructura) y resgistros */
drop table nota

/* Eliminar base de datos y datos  */
use master /* importante para obtener permisos y poder eliminar */
drop database modificar

/* Eliminar todos los registros de una tabla */
delete from nota /* elimina fila x fila */
truncate table nota /* elimina todo de una vez */

-- Eliminar un campo
alter table nombreTabla drop nombreCampo;

-- crear campo nuevo en tabla
alter table nombreTabla add column nombreCampo int (2);


--------------------------------------------------------------------------
/* Tercera forma nomal */
--------------------------------------------------------------------------
CREATE DATABASE TERCERFN
USE TERCERFN

--TABLAS SIMPLES
CREATE TABLE CARRERA(
NOCARRERA CHAR(3) PRIMARY KEY,
CARRERA VARCHAR(30),
CHECK (NOCARRERA LIKE 'C[0-9][0-9]'))

CREATE TABLE MATERIA(
NUMMATERIA CHAR(3) PRIMARY KEY,
MATERIA VARCHAR(30),
CHECK (NUMMATERIA LIKE 'M[0-9][0-9]'))

CREATE TABLE TIPO_TEL(
ID_TIPOTEL CHAR(3) PRIMARY KEY,
TIPOTEL VARCHAR(20),
CHECK (ID_TIPOTEL LIKE 'T[0-9][0-9]'))

CREATE TABLE DELEGACION(
ID_DELEGACION CHAR(5) PRIMARY KEY,
DELEGACION VARCHAR(30),
CHECK (ID_DELEGACION LIKE 'DE-[A-Z][0-9]'))

--TABLAS DEPENDIENTES
CREATE TABLE COLONIA(
ID_COLONIA CHAR(5) PRIMARY KEY,
COLONIA VARCHAR(40),
ID_DELEGACION2 CHAR(5) FOREIGN KEY REFERENCES DELEGACION (ID_DELEGACION),
CHECK (ID_COLONIA LIKE 'CO-[A-Z][0-9]'))

CREATE TABLE CALLE(
ID_CALLE CHAR(5) PRIMARY KEY,
CALLE VARCHAR(40),
ID_COLONIA2 CHAR(5) FOREIGN KEY REFERENCES COLONIA (ID_COLONIA),
CHECK (ID_CALLE LIKE 'CA-[A-Z][0-9]'))

CREATE TABLE ALUMNO(
MATRICULA_ALU CHAR(10) PRIMARY KEY,
NOMBRE_ALU VARCHAR(25),
APP_ALU VARCHAR(20),
APM_ALU VARCHAR(20),
ID_DELEGACION1 CHAR(5) FOREIGN KEY REFERENCES DELEGACION (ID_DELEGACION),
ID_COLONIA1 CHAR(5) FOREIGN KEY REFERENCES COLONIA (ID_COLONIA),
ID_CALLE1 CHAR(5) FOREIGN KEY REFERENCES CALLE (ID_CALLE),
NUM_INT VARCHAR(8),
NUM_EXT VARCHAR(8),
CP VARCHAR(5),
NOCARRERA1 CHAR(3) FOREIGN KEY REFERENCES CARRERA (NOCARRERA),
CHECK (MATRICULA_ALU LIKE 'ALU-[A-Z][0-9][0-9][0-9][A-D][D-Z]'))

--TABLAS INTERMEDIAS

CREATE TABLE ALUMNO_MATERIA(
MATRICULA_ALU1 CHAR(10) FOREIGN KEY REFERENCES ALUMNO (MATRICULA_ALU),
NUMMATERIA1 CHAR(3) FOREIGN KEY REFERENCES MATERIA (NUMMATERIA))

CREATE TABLE ALUMNO_TIPOTEL(
ID_TIPOTEL1 CHAR(3) FOREIGN KEY REFERENCES TIPO_TEL (ID_TIPOTEL),
MATRICULA_ALU2 CHAR(10) FOREIGN KEY REFERENCES ALUMNO (MATRICULA_ALU),
TELEFONO BIGINT,
CHECK (TELEFONO (menor que) 0))

-- Insert


--Carrera
INSERT INTO CARRERA VALUES ('C23','SISTEMAS')
INSERT INTO CARRERA VALUES ('C24','GASTRONOMIA')

--Materia
INSERT INTO MATERIA VALUES ('M12','CONTROL INTELIGENTE')
INSERT INTO MATERIA VALUES ('M13','ESTADISTICA')

--Tipo_tel
INSERT INTO TIPO_TEL VALUES ('T18','CELULAR')
INSERT INTO TIPO_TEL VALUES ('T19','CASA')

--Delegación
INSERT INTO DELEGACION VALUES ('DE-B1','BENITO JUAREZ')
INSERT INTO DELEGACION VALUES ('DE-I1','IZTACALCO')

--Colonia
INSERT INTO COLONIA VALUES ('CO-B1','ANZURES','DE-B1')
INSERT INTO COLONIA VALUES ('CO-B2','DEL VALLE','DE-I1')

--Calle
INSERT INTO CALLE VALUES ('CA-A1','ROSA','CO-B1')
INSERT INTO CALLE VALUES ('CA-B1','AZUL','CO-B2')

--Alumno
INSERT INTO ALUMNO VALUES ('ALU-A123BM','ANA','ORTIZ','ESTRADA','DE-B1','CO-B1','CA-A1','10A','204','89090','C23')

--Alumno_materia
INSERT INTO ALUMNO_MATERIA VALUES ('ALU-A123BM','M12')

--Alumno_tipotel
INSERT INTO ALUMNO_TIPOTEL VALUES ('T18','ALU-A123BM',67676767)
