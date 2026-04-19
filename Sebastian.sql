
--1. Horario con menos citas durante el día por peluquería, identificando la comuna.
--Con SELECT DISTINCT tomaremos solo la primera fila de cada peluqueria, la cual será la con menor citas
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



--2. Lista de clientes que gastan más dinero mensual por peluquería, indicando la
--comuna del cliente y de la peluquería, además de cuanto gasto el cliente.

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