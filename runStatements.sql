-- Zhi Lu
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

-- Zhi Lu
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