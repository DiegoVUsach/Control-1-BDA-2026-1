-- Pregunta 1:
-- Horario con menos citas durante el día por peluquería, identificando la comuna.
-- Con SELECT DISTINCT tomaremos solo la primera fila de cada peluqueria, la cual será la con menor citas
SELECT DISTINCT ON (p.id_peluqueria)
       p.nombre AS peluqueria, com.nombre AS comuna, h.fecha, COUNT(*) AS total_citas
FROM cita cit
-- JOIN con horarios con la llave id_horario
JOIN horarios h ON cit.id_horario = h.id_horarios
-- JOIN con cliente_pelu con llave id_cliente_pelu
JOIN cliente_pelu cp ON cit.id_cliente_pelu = cp.id_cliente_pelu
-- JOIN con peluqueria con llave id_peluqueria
JOIN peluqueria p ON cp.id_peluqueria = p.id_peluqueria
-- y JOIN con comuna para el nombre de comuna llave id_comuna
JOIN comuna com ON p.id_comuna = com.id_comuna
-- Solo consideramos citas completadas
WHERE cit.estado = 'Completada'
-- GROUP BY peluquería y fecha para contar citas por día
GROUP BY p.id_peluqueria, p.nombre, com.nombre, h.fecha
-- Ordeno por peluquería y luego por cantidad de citas ascendente
-- así DISTINCT ON se queda con la fecha que tuvo MENOS citas
ORDER BY p.id_peluqueria, total_citas ASC;



-- Pregunta 2:
-- Lista de clientes que gastan más dinero mensual por peluquería, indicando la
-- comuna del cliente y de la peluquería, además de cuanto gasto el cliente.
-- Toma solo la primera fila por cada peluquería (que va a ser la del cliente que más gastó)
SELECT DISTINCT ON (p.id_peluqueria)
       p.nombre AS peluqueria,
       comuna_pelu.nombre AS comuna_peluqueria,
       cl.nombre AS cliente,
       comuna_cli.nombre AS comuna_cliente,
       SUM(pag.pago_monto) AS total_gastado_mensual
FROM cita cit --cit
JOIN cliente_pelu cp ON cit.id_cliente_pelu = cp.id_cliente_pelu --cp
JOIN cliente cl ON cp.id_cliente = cl.id_cliente                 --cl
JOIN comuna AS comuna_cli ON cl.id_comuna = comuna_cli.id_comuna -- comuna_cli
JOIN peluqueria p ON cp.id_peluqueria = p.id_peluqueria          -- p
JOIN comuna AS comuna_pelu ON p.id_comuna = comuna_pelu.id_comuna--comuna_pelu
JOIN horarios h ON cit.id_horario = h.id_horarios                -- h
JOIN detalle d ON cit.id_cita = d.id_cita                        -- d
JOIN pago pag ON d.id_pago = pag.id_pago                         -- pag
WHERE cit.estado = 'Completada'  --Citas deben estar completadas
--Se agrupa: peluqueria y cliente para sumar lo que gastó el cliente en la peluqueria
GROUP BY p.id_peluqueria, p.nombre, comuna_pelu.nombre,
         cl.id_cliente, cl.nombre, comuna_cli.nombre
--ordenamos por peluqueria y luego en gasto descendente, 
--de forma que DISTINCT ON se queda con el cliente que más gastó de cada peluqueria
ORDER BY p.id_peluqueria, total_gastado_mensual DESC;



-- Pregunta 3:
-- Filtrar sueldos de los últimos 3 años
WITH sueldos_recientes AS (
    SELECT s.id_empleado, s.monto, TO_CHAR(s.fecha, 'YYYY-MM') AS mes
    FROM sueldo s
    WHERE s.fecha >= CURRENT_DATE - INTERVAL '3 years'
),

-- Asociar cada sueldo a su peluquero y peluquería
sueldos_por_peluquero AS (
    SELECT pr.nombre AS peluqueria, e.nombre AS peluquero, s.mes, SUM(s.monto) AS total_ganado
    FROM sueldos_recientes s
    JOIN empleado e ON s.id_empleado = e.id_empleado
    JOIN peluquero p ON p.id_empleado = e.id_empleado
    JOIN peluqueria pr ON e.id_peluqueria = pr.id_peluqueria
    GROUP BY pr.nombre, e.nombre, s.mes
),

-- Obtener el peluquero que más ganó por mes en cada peluqueria
top_peluquero AS (
    SELECT peluqueria, peluquero, mes, total_ganado
    FROM sueldos_por_peluquero
    WHERE total_ganado = (
        SELECT MAX(sp.total_ganado)
        FROM sueldos_por_peluquero sp
        WHERE sp.peluqueria = sueldos_por_peluquero.peluqueria
          AND sp.mes = sueldos_por_peluquero.mes
    )
)

-- Conseguir los peluqueros que han ganado más por mes en cada peluqueria
SELECT peluqueria, peluquero, mes, total_ganado
FROM top_peluquero
ORDER BY peluqueria, mes DESC;



-- Pregunta 4:
-- Lista de clientes hombres que se cortan el pelo y la barba. 

SELECT DISTINCT c.nombre
FROM cliente c
JOIN cliente_pelu cp ON c.id_cliente = cp.id_cliente
JOIN cita ci ON cp.id_cliente_pelu = ci.id_cliente_pelu
JOIN detalle d ON ci.id_cita = d.id_cita
JOIN servicio_detalle sd ON d.id_detalle = sd.id_detalle
JOIN servicio s ON sd.id_servicio = s.id_servicio
WHERE c.genero = 'Masculino' 
  AND s.tipo_servicio = 'Corte con barbería';



-- Pregunta 5:
-- Lista de clientes que se tiñen el pelo, indicando la comuna del cliente, la peluquería
-- donde se atendió y el valor que pagó.

SELECT c.nombre, com.nombre as comuna, p.nombre as peluqueria, pag.pago_monto
FROM cliente c
JOIN comuna com ON c.id_comuna = com.id_comuna
JOIN cliente_pelu cp ON c.id_cliente = cp.id_cliente
JOIN peluqueria p ON cp.id_peluqueria = p.id_peluqueria
JOIN cita ci ON cp.id_cliente_pelu = ci.id_cliente_pelu
JOIN detalle d ON ci.id_cita = d.id_cita
JOIN pago pag ON d.id_pago = pag.id_pago
JOIN servicio_detalle sd ON d.id_detalle = sd.id_detalle
JOIN servicio s ON sd.id_servicio = s.id_servicio
WHERE s.tipo_servicio ILIKE '%Tinte%';



-- Pregunta 6
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



-- Pregunta 7:
-- Identificar al cliente por peluquería que ha tenido las citas más largas por mes.

WITH RankingCitas AS (
    SELECT 
        p.nombre AS peluqueria,
        c.nombre AS cliente,
        EXTRACT(MONTH FROM h.fecha) AS mes,
        EXTRACT(YEAR FROM h.fecha) AS anio,
        h.duracion,
        ROW_NUMBER() OVER(
            PARTITION BY p.id_peluqueria, EXTRACT(YEAR FROM h.fecha), EXTRACT(MONTH FROM h.fecha) 
            ORDER BY h.duracion DESC
        ) as ranking
    FROM cliente c
    JOIN cliente_pelu cp ON c.id_cliente = cp.id_cliente
    JOIN peluqueria p ON cp.id_peluqueria = p.id_peluqueria
    JOIN cita ci ON cp.id_cliente_pelu = ci.id_cliente_pelu
    JOIN horarios h ON ci.id_horario = h.id_horarios
)
SELECT peluqueria, cliente, mes, anio, duracion
FROM RankingCitas
WHERE ranking = 1
ORDER BY anio DESC, mes DESC, peluqueria;



-- Pregunta 8:
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



-- Pregunta 9:
-- Filtrar solo las citas del 2021
WITH citas_2021 AS (
    SELECT c.id_cita, c.id_peluquero, h.fecha, TO_CHAR(h.fecha, 'YYYY-MM') AS mes
    FROM cita c
    JOIN horarios h ON c.id_horario = h.id_horarios
    WHERE EXTRACT(YEAR FROM h.fecha) = 2021
),

-- Contar las citas que tiene cada peluquero por mes
citas_por_peluquero AS (
    SELECT c.mes, e.nombre AS peluquero, COUNT(c.id_cita) AS total_citas
    FROM citas_2021 c
    JOIN peluquero p ON c.id_peluquero = p.id_peluquero
    JOIN empleado e ON p.id_empleado = e.id_empleado
    GROUP BY c.mes, e.nombre
),

-- Top peluquero de cada mes
top_peluquero AS (
    SELECT mes, peluquero, total_citas
    FROM citas_por_peluquero
    WHERE total_citas = (
        SELECT MAX(total_citas)
        FROM citas_por_peluquero cp
        WHERE cp.mes = citas_por_peluquero.mes
    )
)

-- Conseguir el peluquero que tiene más citas por mes
SELECT mes, peluquero, total_citas
FROM top_peluquero
ORDER BY mes;



-- Pregunta 10
-- Identificar lista de total de peluquerías por comuna, cantidad de peluquerías,
-- cantidad de clientes residentes en la comuna.

SELECT 
    com.nombre AS comuna,
    (SELECT COUNT(*) FROM peluqueria p WHERE p.id_comuna = com.id_comuna) AS cantidad_peluquerias,
    (SELECT COUNT(*) FROM cliente c WHERE c.id_comuna = com.id_comuna) AS cantidad_clientes_residentes
FROM comuna com
ORDER BY cantidad_peluquerias DESC;