-- Ignacio Caro A.
-- 6. Identificar el horario más concurrido por peluquería durante el 2018 y 2019, desagregados por mes.

WITH ConteoCitasHorario AS (
    -- Conectar peluqueria con horarios, extrayendo los años y meses del horario de cada fecha volviendolas columnas
    SELECT 
        p.id_peluqueria,
        p.nombre AS nombre_peluqueria,
        EXTRACT(YEAR FROM h.fecha) AS anio,
        EXTRACT(MONTH FROM h.fecha) AS mes,
        h.id_horarios,
        h.fecha,
        COUNT(c.id_cita) AS total_citas
    FROM peluqueria p
    JOIN cliente_pelu cp ON p.id_peluqueria = cp.id_peluqueria
    JOIN cita c ON cp.id_cliente_pelu = c.id_cliente_pelu
    JOIN horarios h ON c.id_horario = h.id_horarios
    -- Filtrar solo por los años solicitados (2018 y 2019)
    WHERE EXTRACT(YEAR FROM h.fecha) IN (2018, 2019)
    -- Se agrupan las filas que tengan el mismo horario, mes y peluqueria y se crea la columna que cuenta cuantas citas hubo ahí.
    GROUP BY 
        p.id_peluqueria, 
        p.nombre, 
        anio, 
        mes, 
        h.id_horarios, 
        h.fecha
),
RankingHorarios AS (
    -- Crear la columna ranking de cada bloque horario que se genera al dividir por peluqueria, año y mes, y se ordenan de mayor a menor.
    SELECT 
        nombre_peluqueria,
        anio,
        mes,
        fecha,
        total_citas,
        ROW_NUMBER() OVER (
            PARTITION BY id_peluqueria, anio, mes 
            ORDER BY total_citas DESC
        ) as ranking
    FROM ConteoCitasHorario
)
-- Mostrar el nombre de la peluqueria, año, mes, le fecha completa junto a la cantidad de citas que tuvo el horario mas ocupado de cada mes, para cada peluqueria.
SELECT 
    nombre_peluqueria, 
    anio, 
    mes, 
    fecha, 
    total_citas
FROM RankingHorarios
WHERE ranking = 1;


-- Ignacio Caro A
-- 8. Identificar servicio más caro por peluquería.

WITH ServiciosPorPeluqueria AS (
    -- Conectar peluqueria con los servicios que presta.
    SELECT DISTINCT
        p.id_peluqueria,
        p.nombre AS nombre_peluqueria,
        s.tipo_servicio,
        s.precio_servicio
    FROM peluqueria p
    JOIN cliente_pelu cp ON p.id_peluqueria = cp.id_peluqueria
    JOIN cita c ON cp.id_cliente_pelu = c.id_cliente_pelu
    JOIN detalle d ON c.id_cita = d.id_cita
    JOIN servicio_detalle sd ON d.id_detalle = sd.id_detalle
    JOIN servicio s ON sd.id_servicio = s.id_servicio
),
RankingServicios AS (
    -- Separa los servicios por bloques segun la peluqueria a la que pertenecen (PARTITION BY) y ordena cada uno de esos bloques partiendo del más caro.
    SELECT
        nombre_peluqueria,
        tipo_servicio,
        precio_servicio,
        ROW_NUMBER() OVER (
            PARTITION BY id_peluqueria 
            ORDER BY precio_servicio DESC
        ) as ranking
    FROM ServiciosPorPeluqueria
)
-- Finalmente, se seleccionan las posiciones 1 de cada bloque y se muestra el nombre de la peluqueria al que pertenece, el servicio y el precio.
SELECT 
    nombre_peluqueria, 
    tipo_servicio, 
    precio_servicio
FROM RankingServicios
WHERE ranking = 1;