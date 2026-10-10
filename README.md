# Proyecto SQL - RetailPro

## Descripción

Proyecto desarrollado durante el curso de Análisis de Datos de Coderhouse.

El objetivo es trabajar con una base de datos de ventas de productos tecnológicos, aplicando SQL para obtener métricas comerciales, analizar el comportamiento de los clientes y generar información útil para la toma de decisiones.

## Tecnologías utilizadas

- Microsoft SQL Server.
- SQL Server Management Studio (SSMS).
- GitHub para el almacenamiento y versionado del proyecto.

Las consultas utilizan sintaxis compatible con SQL Server, como `MONTH()` en lugar de `EXTRACT()` y `TOP` en lugar de `LIMIT`.

## Base de datos

**Nombre:** `Ventas_Tech_DB`

La base contiene cuatro tablas principales:

- `clientes`: información de los clientes.
- `productos`: catálogo de productos.
- `categorias`: clasificación de los productos.
- `ventas`: registro de las operaciones comerciales.

## Ejecución

1. Abrir SQL Server Management Studio.
2. Ejecutar el script del Módulo 3 para crear y cargar la base de datos.
3. Seleccionar la base `Ventas_Tech_DB`.
4. Ejecutar las consultas de los módulos siguientes.

## Entregas

### Módulo 3 - Creación de la base de datos

Archivo: `ventas_tech_db.sql`

Creación de tablas, definición de claves primarias y foráneas, restricciones e inserción de datos de ejemplo.

### Módulo 4 - Consultas SQL de negocio

Archivo: `m4_consultas_negocio.sql`

Consultas para obtener métricas de facturación mensual, productos destacados, clientes recurrentes y comparación con el promedio mensual.

### Módulo 5 - Consultas con JOINs

Archivo: `m5_consultas_joins.sql`

Se desarrollaron cuatro consultas SQL para enriquecer el análisis comercial:

- Consulta 1 - INNER JOIN: integración de ventas, clientes, productos y categorías.

- Consulta 2 - LEFT JOIN: identificación de clientes sin compras registradas.

- Consulta 3 - LEFT JOIN: identificación de productos sin ventas.

- Consulta 4 - UNION ALL: consolidación de la facturación por zona geográfica, diferenciando Buenos Aires del Interior.

### Principales resultados

Se integraron los 10 registros de ventas con la información descriptiva de las demás tablas.

No se encontraron clientes ni productos sin ventas registradas.

Buenos Aires registró una facturación de $2.640 (40,97 %) y el Interior de $3.804 (59,03 %).

La facturación total consolidada fue de $6.444.
