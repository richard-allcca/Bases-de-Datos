/* 
DDL => Lenguae de Definición de Datos
crear DB
Usar DB
crear tabla
identificar las claves primarias y claves foraneas
mostrar diagramas
 */

 create database escuela
  use escuela

  -- tabla carrera
  create table carrera(
    clave_c int,
    nom_c varchar(50),
    durac_c float,
    constraint pk_cc primary key(clave_c)
  )

  -- tabla materia
  create table materia(
  clave_m int,
  nom_m varchar(50),
  cred_m float,
  constraint pk_cm primary key(clave_m) 
  )

  -- tabla profesor
  create table profesor(
    clave_p int,
    nom_p  varchar(150),
    dir_p varchar(200),
    tel_p bigint,
    hor_p datetime,
    constraint pk_cp primary key(clave_p)
  )
  /* tabla alumno
  (con clave foranea) 
   */
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
   
  --  Alumno-Profesor
  create table alu_pro(
    mat_alu1 int,
    clave_p1 int,
    constraint fk_falu1 foreign key(mat_alu) references alumno(mat_alu),
    constraint fk_fp1 foreign key(clave_p1) references profesor(clave_p)
  )

  -- Materia-Alumno
  create table mat_alu(
    clave_m1 int,
    mat_alu2 int,
    constraint fk_fm1 foreign key (clave_m1) references materia (clave_m),
    constraint fk_falu2 foreign key (mat_alu2) references alumno (mat_alu)
  )

  -- Materia-Profesor
  create table mat_pro(
    clave_m1 int,
    clave_p2 int,
    constraint fk_fm2 foreign key(clave_m1) references materia(clave_m),
    constraint fk_fp2 foreign key(clave_p2) references profesor(clave_p)
  )