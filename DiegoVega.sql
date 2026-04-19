4. Lista de clientes hombres que se cortan el pelo y la barba. 

SELECT DISTINCT c.nombre
FROM cliente c
JOIN cliente_pelu cp ON c.id_cliente = cp.id_cliente
JOIN cita ci ON cp.id_cliente_pelu = ci.id_cliente_pelu
JOIN detalle d ON ci.id_cita = d.id_cita
JOIN servicio_detalle sd ON d.id_detalle = sd.id_detalle
JOIN servicio s ON sd.id_servicio = s.id_servicio
WHERE c.genero = 'Masculino' 
  AND s.tipo_servicio = 'Corte con barbería';


7. Identificar al cliente por peluquería que ha tenido las citas más largas por mes.

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