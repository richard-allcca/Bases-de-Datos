### que es un dato?

atributo (información) que refleja el valor de una caracteristica
en un objeto

## dato cualitativo

indica cualidades como => textura, color

## dato cuantitativo

que se puede contar

### que es una base de datos ??

es un conjunto de datos almacenados organizados y relacionados entre si, el diseño de un DB se llama esquema de DB

estas cambian con el tiempo confome se inserte la informacion o se borre

## Tipos de Esquemas

Esquema fisico => describe un diseño fisico
Esquema logico => describe el diseño de DB en el nivel logico

### Partes de una tabla

filas => tuplas
columnas => campos
atributo => propiedades de las entidades
registro => datos de la tabla
grado => numero de columnas
cardinalidad => numero de filas (sin contar cabezera)

### Clave Primaria (Primary Key)

es una columna que identifica de forma UNICA un registro en la tabla
°

## Detalles de los Atributos

Atributos Compuestos => se convierten en campos (columnas)
Atributos multiples => se convierten en tabla con su Clave Primaria

### Tipos de Relacion

Binaria
Reflexiva
Temaria

### ejercicio ===

ejercicio

Los profesores de la asignatura de Bases de Datos de una Universidad deciden crear una,base de datos que contenga la información de los resultados de las pruebas realizadas a los
alumnos. Para realizar el diseño se sabe que:

Los alumnos están definidos por su n° de matrícula, nombre y el grupo al que asisten a clase.

Dichos alumnos realizan dos tipos de pruebas a lo largo del curso académico:

Exámenes escritos: cada alumno realiza varios a lo largo del curso, y se definen por el
n° de examen, el n° de preguntas de que consta y la fecha de realización (la misma
para todos los alumnos que realizan el mismo examen). Evidentemente, es importante
almacenar la nota de cada alumno por examen.

Prácticas: se realiza un n° indeterminado de ellas durante el curso académico, algunas serán en grupo y otras individuales. Se definen por un código de práctica, título y el grado de dificultad. En este caso los alumnos pueden examinarse de cualquier práctica cuando lo deseen, debiéndose almacenar la fecha y nota obtenida.

En cuanto a los profesores, únicamente interesa conocer (además de sus datos personales: CI y nombre), quien es el qué ha diseñado cada práctica, sabiendo que en el diseño de una práctica puede colaborar más de uno, y que un profesor puede diseñar más de una práctica. Interesa, además, la fecha en que ha sido diseñada cada práctica por el profesor
correspondiente.

### Pasos para construir la tabla

`1-Modelo Entidad Relacion`
`2-Modelo Relacional`
1° encontrar las tablas
=> Alumno Examen Practica Profesor (tablas)
2° encontrar los atributos de cada una de las tablas
=> alumno ([matricula]) (nombre) (grupo)
=> examen ([n°]) (n° preguntas) (fecha)
=> practica ([c.practica]) (titulo) (dificultad)
=> profesor ([CI]) (nombre)
3° ubicar atributos que no pueden ir en las tablas se colocan en la relación    

`en la relacion de 1:n (uno a muchos) la tabla de muchos debe tener las primary key de uno y de muchos (2 primary key)`

============================
# SEGUNDA PARTE DE TEORIA 
============================

### Modelo Relacional

Diagrama entidad relación
Diagrama entidad relación extendido [EER]

# Elementos del diagrama de entidad [EER]

rectangulo => Objeto contreto abstracto
ronbo => relacion entre entidades
circulo => Atributo
ovalo => Primay key o clave primaria
avalo medio => secundary key o atributo foraneo

# cardinalidad o mapeo - tipo de relacion entre entidades

1:1 => uno a uno
1:M => uno a muchos
1:0 => uno a ninguno o uno a uno opcional
M:1 => muchos a uno
N:M => muchos a muchos
M:0 => muchos a ninguno

# Ejercicio - Diagrama Entidad Relacion 

# Reglas de entidad relacion 1:N uno a muchos
1:N => la clave primaria de la entidad que tiene la relacion 1 pasa como clave foranea a la entidad que tiene la relacion muchos
`Clave foranea es Clave primaria de otra entidad siempre!`
`los atributos no pueden llamarse igual por eso la clave foranea le agregamos un numero`

# Regla de entidad relacion N:M muchos a muchos
2 N:M => crea una tabla intermedia con 2 claves foraneas de ambas entidades

### SQL

SQL => lenguaje estructurado de consultas se divide en 2
DDL => lenguaje de Definición de datos
DML => lenguaje de Manipulación de datos

# Modelo entidad relacion

`los nombres en bases de datos cambian en SQL`
Entidades => Tablas
Atributos => campos o columna
Registro => tuplas o fila
Cardinalidad => relaciones

# DDL

=> creamos una tabla con lenguaje de Definición de Datos

# DML

=> modificamos datos de una tabla o una DB con Lenguaje de Manipulación de Datos

### Normalización

=> Proceso de simplificación de los datos
`objetivos`

- Tener almacenado con el menos espacio posible
- Eliminar datos repetidos
- Eliminar errores lógicos
- Datos ordenados

1- => identificar si hay un grupo de repetición sobre el mismo registro(crear una tabla nueva a partir de esta)

2- => La tabla debe estar en 1NF(tiene una ecepción si tiene una clave primeria compuesta)video 13 de htmlrules

3- => identificar las dependencias Funcionales y Transitivas
y crear una tabla para las transitivas(que no deberian estar en la tabla)

### Normalizacion

proceso de aplicación de normas con el fin de ordenar y mejorar
una base de datos

===========================

### Primera forma normal

1. todos los atributos tienen valores "atomicos" (unicos)
2. no deben existir "registros duplicados"
3. no hay atributos "multiples"

`la regla de 1FN establece que las columnas repetidas deben separarse y colocarse en tablas separadas - echo esto deben compartir llave primaria para mantener la relación`

nota: cuando se comparte una llave primaria se llama LLAVE FORANEA y estas tampoco deven repetirse

============================

### Segunda forma normal

`elementos de dependencia - cuando unas columnas dependen de otras columnas`

=> para convertir de la 1FN a la 2°FN tienes que identificar las
dependencias (funcional o transitiva) entre columnas y de estas crear tablas que contengas las claves primarias de las tablas origen y actuen como foranea (sera una tabla intermedia)

`DATOS REPETIDOS, en caso se hallen datos repetidos,estas tuplas o filas deben simplificarse`

============================

### Tercera forma normal

`3FN nos dice que tenemos que eliminar cualquier columna no clave, que sea dependiente de otra columna no clave`

=> siempre deben haber atributos que dependan de claves primarias
=> determinar las columnas que solo dependen de otra columna no clave (que no son claves primaria)
=> crear una segunda tabla con esas columnas y con la columna no clave de la cual son dependientes