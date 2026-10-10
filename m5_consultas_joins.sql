-- ============================================
-- MÓDULO 5: CONSULTAS CON JOINs
-- Proyecto: RetailPro
-- Motor: Microsoft SQL Server (T-SQL)
-- Base de datos: Ventas_Tech_DB
-- ============================================

USE Ventas_Tech_DB;


-------- CONSULTA 1 ---------
----VISTA BASE DEL PROYECTO-----

SELECT 
      c.id_cliente,
      c.nombre,
      c.ciudad,
      v.fecha_venta,
      v.id_producto,
      p.nombre_producto,
      p.id_categoria,
      cat.nombre_categoria,
      cat.descripcion,
      v.cantidad,
      v.precio_unitario,
      v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
 ON v.id_cliente=c.id_cliente
INNER JOIN productos AS p
 ON v.id_producto=p.id_producto
INNER JOIN categorias AS cat
 ON p.id_categoria=cat.id_categoria;


--- CONSULTA 1: REGISTRO DE LAS 10 VENTAS REALIZADAS
-- Se obtuvieron 10 registros de ventas, con información de clientes, productos y categorías.



 --------- CONSULTA 2 ----------
 ------CLIENTES SIN VENTAS-------


 SELECT 
      c.nombre,
      c.email,
      c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
 ON c.id_cliente=v.id_cliente
 WHERE v.id_venta IS NULL;


--- CONSULTA 2: No se encontraron clientes sin ventas.
-- Todos los clientes registrados tienen al menos una compra en la base de datos.



--------- CONSULTA 3 -----------
-----PRODUCTOS SIN VENTAS------

SELECT 
     p.nombre_producto,
     cat.nombre_categoria,
     p.precio
FROM productos AS p
LEFT JOIN ventas AS v
ON p.id_producto=v.id_producto
LEFT JOIN categorias AS cat
ON p.id_categoria=cat.id_categoria
WHERE v.id_venta IS NULL;

-- CONSULTA 3: No se encontraron productos sin ventas.
-- Todos los productos del catálogo registran al menos una venta en la base de datos.


-------CONSULTA 4--------
----CONSOLIDADO POR ZONA GEOGRAFICA(CANAL)----

SELECT
     canal,
     SUM(total_venta) AS total_canal
FROM (
 SELECT 
     v.fecha_venta,
     v.cantidad*v.precio_unitario AS total_venta,
     'Buenos Aires' AS canal
 FROM ventas AS v
 INNER JOIN clientes AS c
 ON v.id_cliente=c.id_cliente
 WHERE c.ciudad='Buenos Aires'

  UNION ALL

 SELECT
    v.fecha_venta,
    v.cantidad*v.precio_unitario AS total_venta,
    'Interior' AS canal
 FROM ventas AS v
 INNER JOIN clientes AS c
 ON v.id_cliente=c.id_cliente
 WHERE c.ciudad<>'Buenos Aires'
) AS consolidado
GROUP BY canal;


-- CONSULTA 4: CONSOLIDADO POR ZONA GEOGRÁFICA
-- La columna canal, en mi caso, representa la zona geográfica.

-- Conclusion: El Interior registra una facturación de $3.804 (59,03% del total), 
-- mientras que Buenos Aires registra $2.640 (40,97%).
-- La facturación total consolidada es de $6.444.
