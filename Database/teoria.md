### Transaccines y el test ACID en bases de datos

A => Atomic - atomica
la regla atomica habla de que todo ocurrre o nada ocurre

C => Consistent - consistente
debe dejar unn estado valido al principio y un estado valido al final (dada las reglas de las bases de datos)

I => Isolated - aislada
la transaccion bloquea los datos que intervienen en la transaccion(para que ninguna otra parte del sistema lo pueda utilizar)

D => Durable - durable
la transaccion se considere robusta cuando sin importar fallas externas como un posible corto en la energia y reinicie la transaccion debera haber sobrevivido

### Modelado de Bases de Datos mediante planificación

`Diagramas de Entidad Relacion`
1- Identificar las entidades
2- Realiza el diagrama de modelado de entidades(une las entidades)
3- utilizar un verdo para especificar la relación entre las entidades(rombos)

# Opciones de Relacion

1:1 => uno a uno
1:M => uno a muchos
N:M => muchos a muchos

### Normalización de Bases de Datos (1:NF - 2:NF - 3:NF)

1:FN
=> en las tablas no puede haber valores ni grupos repetidos
=> identificar si hay un grupo de repeticion sobre un mismo registro

2:FN
=> sin valores no claves basados en parte de una clave compuesta

3:FN
=> sin valores no claves que dependan de otros valores no claves

### Palabras SQL

SELECT
FROM
WHERE
ORDER BY
GROUP BY
JOIN
INSERT INTO
UPDATE
DELETE
HAVING
IN

### Operadores de Comparación

> mayor
> < menos
> = mayor igual
> <= menor igual
> <> no igual (diferente)

## WHERE

SELECT \*
FROM nombreTable
WHERE nameColumna LIKE 'Green%'; =>aqui buscamos que empiezen con'green

WHERE nameColumna LIKE 'sm_th'; =>aqui buscamos que tengan ese patron y el gion bajo indica cualquier letra

WHERE valor IS NULL; => indicamos un valor null
WHERE valor IS NOT NULL; => indicamos un valor no null

### Ordenando los resultados

SELECT Descripción,Precio,Color
FROM Producto
ORDER BY Precio(por defecto es ascendente)
ORDER BY Precio DESC; (para descendente)

SELECT Descripción,Precio,Color
FROM Producto
WHERE Salario > 50000
ORDER BY Apellido,Nombre (varios criterios de ordenación)

### Funciones Agregadas

SELECT COUNT(\*)
FROM Empleado
WHERE Salario > 50000
=> te da la cantidad total de empelados con un salirio > 50000

SELECT \*
FROM Producto
ORDER BY Precio DESC
=> todos los campos de productos con el orden de precio DESC

SELECT MAX(precio)
FROM Producto
=> devuelve el valor mas alto de los valores

SELECT MIN(precio)
FROM Producto
=> devuelve el valor mas minimo de los valores

SELECT AVG(precio)
FROM Producto
=> devuelve el promedio de precio de un producto

SELECT SUM(total)
FROM Pedido
WHERE idCliente = 854;
=> obtenemos la suma total de la tabal pedido donde el idCliente es

SELECT COUNT(\*), Color =>funcion, columna solo funciona c GROUP BY
FROM Producto
GROUP BY Color
=> todos los elementos y tambien el color de la tabla productos y agrupados por el color

SELECT \*
FROM Empleado
ORDER BY Apellido,Nombre;
=> todos las columnas de Empleado ordenado por Apellido y nombre

### Juntando tablas en bases de datos

<!--* Empleado.IDDepto (notacion del punto)solo se usa si tienes columnas con el mismo nombre en diferentes tablas -->
SELECT Nombre,Apellido,Fecha
Empleado.IDDepto, Nombre, Ubicacion ->(nombre y ubicacion desde otra tabla)
FROM Empleado JOIN Departamento ->(tabla Empleado con tabla Departamento)
ON Empleado.IDDepto = Departamento.IDDepto -> (indica que columna de una tabla se enlaza con que columna de que tabla)

<!--* mostramos el contenido elegido de las dos tablas aun que no halla posibilidad de JOIN Y en una no coincida los datos de una tabla con otra y aparezcan como NULL  -->
SELECT nombre,apellido,fecha
Empleado.IDDepto,Nombre,Ubicación
FROM Empleado RIGHT OUTER JOIN Departamento -> aqui manda la tabla derecha
ON Empleado.IDDepto = Departamento.IDDepto

SELECT nombre,apellido,fecha
Empleado.IDDepto,Nombre,Ubicación
FROM Empleado LEFT OUTER JOIN Departamento ->aqui manda la tabla izquierda
ON Empleado.IDDepto = Departamento.IDDepto

# Insert

INSERT <tabla>
(columna1,columna2,...)
VALUES (valor1,valor2)
-> campos no especificados se ponen en NULL si no es una fecha o PK

# Update

UPDATE tabla
SET columna = valor
WHERE condicion
-> la condicion es importante para evitar actualizar toda la tabla

# Delete

DELETE FROM <tabla>
WHERE <condicion>
-> utiliza un SELECT para evitar desastres
