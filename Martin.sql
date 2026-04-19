5. Lista de clientes que se tiñen el pelo, indicando la comuna del cliente, la peluquería
donde se atendió y el valor que pagó.

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



10. Identificar lista de total de peluquerías por comuna, cantidad de peluquerías,
cantidad de clientes residentes en la comuna.

SELECT 
    com.nombre AS comuna,
    (SELECT COUNT(*) FROM peluqueria p WHERE p.id_comuna = com.id_comuna) AS cantidad_peluquerias,
    (SELECT COUNT(*) FROM cliente c WHERE c.id_comuna = com.id_comuna) AS cantidad_clientes_residentes
FROM comuna com
ORDER BY cantidad_peluquerias DESC;