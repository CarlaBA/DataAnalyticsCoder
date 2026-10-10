USE Ventas_Tech_DB;


------- CONSULTA 1 ---------

SELECT 
 MONTH(fecha_venta) AS mes,
 SUM(cantidad*precio_unitario) AS total_facturado,
 COUNT(id_venta) AS cantidad_pedidos,
 AVG(cantidad*precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- Se utiliza MONTH(fecha_venta) en lugar de
-- EXTRACT(MONTH FROM fecha_venta)
-- porque el motor utilizado es SQL Server.


------ CONSULTA 2 ---------

SELECT TOP 5
  id_producto,
  SUM(cantidad) AS unidades_vendidas,
  SUM(cantidad*precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


-------- CONSULTA 3 ----------

SELECT
  id_cliente,
  COUNT(*) AS cantidad_pedidos,
  SUM(cantidad*precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;



---------- CONSULTA 4 -------------

SELECT
  mes,
  total_facturado,
  CASE 
    WHEN total_facturado > (
      SELECT 
        AVG(total_mensual)
      FROM ( 
         SELECT SUM(cantidad*precio_unitario) AS total_mensual
         FROM ventas
         GROUP BY MONTH(fecha_venta)) AS promedios_mensuales)
  THEN 'Por encima'
  ELSE 'Por debajo'
   END AS comparacion_promedio
FROM ( SELECT MONTH(fecha_venta) AS mes,
              SUM(cantidad*precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)) AS ventas_mensuales
ORDER BY mes;


-- =========================================
-- HALLAZGOS
-- =========================================

-- 1. El producto 1 genero un total de $3.600 por 3 unidades vendidas, 
--    aproximadamente el 55,9% de la facturacion total registrada.

-- 2. El producto 2 fue el que registró la mayor cantidad de unidades vendidas dentro del Top 5,
--    con 13 unidades, aunque generó una facturación de solo $364.

-- 3. El cliente 1 fue el cliente recurrente con mayor gasto,
--    con 2 pedidos y un total gastado de $2.640.