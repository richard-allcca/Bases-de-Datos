/* 
DDL => Lenguae de Definición de Datos
crear DB
Usar DB
crear tabla
identificar las claves primarias y claves foraneas
mostrar diagramas
 */

=> crear base de datos y ubicarse en una taabla
create database escuela
  use escuela

=> crear tabla, columnas, clave primaria
create table carrera(
    clave_c int,
    nom_c varchar(50),
    durac_c float,
    constraint pk_cc primary key(clave_c)
  )
-- !=> otro ejemplo de clave primario (vida mmr)
create table nameTable(
  campo1 TIPO PRIMARY KEY,
  campo2 TIPO
  timestamp TIMESTAMP
)

=> crear tabla con clave foranea 
create table(
    mat_alu int,
    nom_alu varchar(150),
    edad_alu int,
    sem_alu int,/* semestre */
    gen_alu varchar(10),
    clave_c1 int
    constraint pk_calu primary key(mat_alu),
    constraint fk_fc1 foreign key(clave_c1) references carrera (clave_c)
  )
-- !=> otro ejemplo de clave foranea(vida mmr)
CREATE TABLE nombreTable(
  id INT NOT NULL PRIMARY KEY,
  usuario_id INT NOT NULL,
  evento_id INT NOT NULL,
  ->enlace de la 1° tabla con su id
  FOREIGN KEY fk_usuario_id(usuario_id)
  REFERENCES usuario(id),

  FOREIGN KEY fk_evento_id(evento_id)
  REFERENCES evento(id)

)

-- ? DML => Lenguae de Modificacion de 
-- ? Datos leer, insertar, actualizar, eliminar

-- forma de insertar datos

insert into nombreTabla (nombreColum) values(valor1,valor2)
  
-- insertamos datos en la tabla carrera

insert into carrera values (1,'Derecho',3)

-- ===========  SELECT ===========


=> para ver toda la tabla 
select * from carrera
select nombreColum nombreCampo from nombreTabla

=> contenido del ID en una tabla foranea(ejemplo tabla compras) 
SELECT * FROM `name_table`.`name_table` WHERE `id` = 1 
SELECT * FROM `curso_php`.`usuarios_pass` WHERE `id` = 1 

-- ===========  SELECT - INNER JOIN - WHERE ===========

-- !=> otro ejemplo de INNER JOIN
SELECT (col1,col2,...)
  FROM tabla1
  INNER JOIN tabla2
  ON tabla1.columna = tabla2.columna 
-- ! recuerda el nombre de la tabla y su columna en el ON 
SELECT * FROM compras 
INNER JOIN articulos 
ON compras.id = articulos.id 

SELECT * FROM compras 
INNER JOIN articulos ON compras.id = articulos.id 
INNER JOIN usuarios_pass ON compras.id = usuarios_pass.id 

SELECT usuarios_pass.usuarios,articulos.nombre_articulo   FROM compras 
INNER JOIN usuarios_pass ON compras.id = usuarios_pass.id 
INNER JOIN articulos ON compras.id = articulos.id 

-- =======================================
=> Accediendo a contenido de dos tabla INNER JOIN 
SELECT nom_alu, edad_alu,sem_alu,nom_c
FROM alumno 
INNER JOIN carrera ON alumno.clave_c1 = carrera.clave_c


=> Accediendo a contenido mas de 2 tabla INNER JOIN 
select nom_alu, edad_alu, sem_alu, nom_c, nom_p, nom_m

=>alumno se une a carrera mediante clave foranea y clave primaria 
from alumno INNER JOIN carrera on alumno.clave_c1=carrera.clave_c
=>unimos la tabla intermedia con la principal
INNER JOIN alu_pro on alu_pro.mat_alu1=alumnomat_alu
=>unimos la taabla donde se almacenan los datos
INNER JOIN profesor on profesor.clave_p=clave_p1
INNER JOIN mat_alu on mat_alu.mat_alu2=alumno.mat_alu
INNER JOIN materia on materia.clave_m=mat_alu.clave_m1

=> tambien usamos una condicion
WHERE edad_alu!=18

-- ====================================================

=> Actualizar datos
 update cliente /* la tabla */
 set nom_clie='ana'/* el campo o columna y el valor*/
 WHERE clave_clie=1 /* especifica una celda o id */

=> Actualizar datos obteniendo datos de diferentes tablas
update nota
set subtot=cant*precio
from nota INNER JOIN producto on producto.clave_prod=nota.clave_prod1


