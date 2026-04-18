--COMUNA (15 comunas de la RM)
-- IDs 1-15
INSERT INTO comuna (nombre) VALUES
('Providencia'),        -- 1
('Las Condes'),         -- 2
('Santiago Centro'),    -- 3
('San Miguel'),              -- 4
('Maipú'),              -- 5
('La Florida'),         -- 6
('Puente Alto'),        -- 7
('San Bernardo'),       -- 8
('Peñalolén'),          -- 9
('Recoleta'),           -- 10
('Independencia'),      -- 11
('Estación Central'),   -- 12
('Macul'),              -- 13
('Vitacura'),           -- 14
('La Reina');           -- 15

--SERVICIO
-- IDs: 1-8
-- Corte, Barba y Teñido para query 4 y 5
INSERT INTO servicio (tipo_servicio, precio_servicio) VALUES
('Corte Hombre', 15000),         -- 1
('Corte Mujer', 25500),          -- 2
('Corte con barbería', 20000),   -- 3
('Teñido', 45000),                -- 4
('Alisado', 15000),               -- 5
('Lavado', 5000),                 -- 6
('Lavado y secado', 15000),       -- 7
('Peinado fiesta', 25000);       -- 8

--PRODUCTO
-- IDs: 1-6
INSERT INTO producto (nombre_producto, precio_producto) VALUES
('Shampoo', 9000),              -- 1
('Acondicionador', 12000),      -- 2
('Tinte Básico', 15000),           -- 3
('Tinte Pro', 27000),              -- 4
('Spray Protector', 11000),        -- 5
('Pinches de Marca', 4000);        -- 6

--PELUQUERÍA
-- IDs: 1-4
INSERT INTO peluqueria (nombre, id_comuna, direccion) VALUES
('Estilo Genial', 1, 'Av. Providencia 1450'),        -- 1 (Providencia)
('La Barbería', 2,    'Av. Las Condes 10465'),       -- 2 (Las Condes)
('Salón Elegante', 3, 'Av. Libertador B. OHiggins 800'), -- 3 (Santiago Centro)
('Cortes y Color', 4, 'Av. Irarrázaval 1230');        -- 4 (San Miguel)

--CLIENTE 
-- IDs: 1-20
INSERT INTO cliente (nombre, genero, id_comuna) VALUES
('Carlos Muñoz', 'Masculino', 3),        -- 1
('Ana María Soto', 'Femenino', 1),       -- 2
('Roberto Jara', 'Masculino', 4),        -- 3
('Francisca López', 'Femenino', 2),      -- 4
('Diego Fernández', 'Masculino', 5),     -- 5
('Valentina Torres', 'Femenino', 6),     -- 6
('Matías Herrera', 'Masculino', 7),      -- 7
('Camila Rojas', 'Femenino', 8),         -- 8
('Sebastián Castro', 'Masculino', 1),    -- 9
('Javiera Reyes', 'Femenino', 3),        -- 10
('Andrés Morales', 'Masculino', 9),      -- 11
('Isidora Bravo', 'Femenino', 10),       -- 12
('Felipe Díaz', 'Masculino', 11),        -- 13
('Catalina Pizarro', 'Femenino', 12),    -- 14
('Nicolás Fuentes', 'Masculino', 2),     -- 15
('Martina Salazar', 'Femenino', 13),     -- 16
('Ignacio Vera', 'Masculino', 14),       -- 17
('Antonia Campos', 'Femenino', 15),      -- 18
('Gabriel Navarro', 'Masculino', 3),     -- 19
('Florencia Meza', 'Femenino', 4);       -- 20

--EMPLEADO (12 empleados, 3 por peluquería)
-- IDs: 1-12
INSERT INTO empleado (id_comuna, id_peluqueria, nombre) VALUES
--Peluquería 1 (Estilo Genial)
(1, 1, 'Marco Antonio'),      -- 1
(3, 1, 'Elena Nito'),         -- 2
(5, 1, 'Hugo Paredes'),       -- 3
--Peluquería 2 (La Barbería)
(2, 2, 'Juan Mecánico'),      -- 4
(4, 2, 'Patricia Núñez'),     -- 5
(7, 2, 'Eduardo Lagos'),      -- 6
--Peluquería 3 (Salón Elegante)
(6, 3, 'Sandra Muñoz'),       -- 7
(8, 3, 'Ricardo Tapia'),      -- 8
(9, 3, 'Lorena Cisternas'),   -- 9
--Peluquería 4 (Cortes y Color)
(10, 4, 'Fernando Guzmán'),   -- 10
(11, 4, 'Cecilia Aravena'),   -- 11
(12, 4, 'Pablo Jara');        -- 12

--SUELDO (historial mensual, 2021-2026)
-- Necesario para sentencia 3 (últimos 3 años)
INSERT INTO sueldo (monto, fecha, id_empleado) VALUES
-- 2021
(450000, '2021-01-31', 1), (420000, '2021-01-31', 2), (400000, '2021-01-31', 3),
(480000, '2021-01-31', 4), (430000, '2021-01-31', 5), (410000, '2021-01-31', 6),
(460000, '2021-01-31', 7), (430000, '2021-01-31', 8), (390000, '2021-01-31', 9),
(510000, '2021-01-31', 10), (440000, '2021-01-31', 11), (400000, '2021-01-31', 12),
(460000, '2021-06-30', 1), (430000, '2021-06-30', 2), (410000, '2021-06-30', 3),
(500000, '2021-06-30', 4), (440000, '2021-06-30', 5), (420000, '2021-06-30', 6),
(470000, '2021-06-30', 7), (440000, '2021-06-30', 8), (400000, '2021-06-30', 9),
(520000, '2021-06-30', 10), (450000, '2021-06-30', 11), (410000, '2021-06-30', 12),
(480000, '2021-12-31', 1), (450000, '2021-12-31', 4), (490000, '2021-12-31', 7),
(540000, '2021-12-31', 10),
-- 2022
(490000, '2022-03-31', 1), (460000, '2022-03-31', 2), (430000, '2022-03-31', 3),
(520000, '2022-03-31', 4), (470000, '2022-03-31', 5), (440000, '2022-03-31', 6),
(500000, '2022-03-31', 7), (470000, '2022-03-31', 8), (420000, '2022-03-31', 9),
(550000, '2022-03-31', 10), (480000, '2022-03-31', 11), (440000, '2022-03-31', 12),
(510000, '2022-07-31', 1), (490000, '2022-07-31', 4), (520000, '2022-07-31', 7),
(570000, '2022-07-31', 10),
(530000, '2022-11-30', 1), (500000, '2022-11-30', 4), (540000, '2022-11-30', 7),
(580000, '2022-11-30', 10),
-- 2023
(540000, '2023-02-28', 1), (480000, '2023-02-28', 2), (450000, '2023-02-28', 3),
(560000, '2023-02-28', 4), (490000, '2023-02-28', 5), (460000, '2023-02-28', 6),
(530000, '2023-02-28', 7), (500000, '2023-02-28', 8), (440000, '2023-02-28', 9),
(590000, '2023-02-28', 10), (510000, '2023-02-28', 11), (470000, '2023-02-28', 12),
(560000, '2023-06-30', 1), (520000, '2023-06-30', 4), (550000, '2023-06-30', 7),
(610000, '2023-06-30', 10),
(580000, '2023-10-31', 1), (540000, '2023-10-31', 4), (570000, '2023-10-31', 7),
(620000, '2023-10-31', 10),
-- 2024
(590000, '2024-01-31', 1), (500000, '2024-01-31', 2), (470000, '2024-01-31', 3),
(600000, '2024-01-31', 4), (520000, '2024-01-31', 5), (480000, '2024-01-31', 6),
(570000, '2024-01-31', 7), (530000, '2024-01-31', 8), (470000, '2024-01-31', 9),
(640000, '2024-01-31', 10), (540000, '2024-01-31', 11), (500000, '2024-01-31', 12),
(610000, '2024-06-30', 1), (560000, '2024-06-30', 4), (590000, '2024-06-30', 7),
(660000, '2024-06-30', 10),
(630000, '2024-11-30', 1), (580000, '2024-11-30', 4), (610000, '2024-11-30', 7),
(680000, '2024-11-30', 10),
-- 2025
(640000, '2025-03-31', 1), (550000, '2025-03-31', 2), (510000, '2025-03-31', 3),
(650000, '2025-03-31', 4), (560000, '2025-03-31', 5), (520000, '2025-03-31', 6),
(620000, '2025-03-31', 7), (580000, '2025-03-31', 8), (510000, '2025-03-31', 9),
(700000, '2025-03-31', 10), (580000, '2025-03-31', 11), (540000, '2025-03-31', 12),
-- 2026
(660000, '2026-01-31', 1), (570000, '2026-01-31', 2), (530000, '2026-01-31', 3),
(670000, '2026-01-31', 4), (580000, '2026-01-31', 5), (540000, '2026-01-31', 6),
(640000, '2026-01-31', 7), (600000, '2026-01-31', 8), (530000, '2026-01-31', 9),
(720000, '2026-01-31', 10), (600000, '2026-01-31', 11), (560000, '2026-01-31', 12);

--PELUQUERO 
-- (8 peluqueros, 2 por peluquería)
-- IDs: 1-8
INSERT INTO peluquero (id_empleado) VALUES
(1),   -- 1: Marco Antonio - Peluquería 1
(2),   -- 2: Elena Nito - Peluquería 1
(4),   -- 3: Juan Mecánico - Peluquería 2
(5),   -- 4: Patricia Núñez - Peluquería 2
(7),   -- 5: Sandra Muñoz - Peluquería 3
(8),   -- 6: Ricardo Tapia - Peluquería 3
(10),  -- 7: Fernando Guzmán - Peluquería 4
(11);  -- 8: Cecilia Aravena - Peluquería 4

--CLIENTE_PELU (clientes asociados a peluquerías)
-- IDs: 1-30
INSERT INTO cliente_pelu (id_cliente, id_peluqueria) VALUES
-- Clientes en Peluquería 1 (Estilo Genial)
(1, 1),    -- 1: Carlos
(2, 1),    -- 2: Ana María
(9, 1),    -- 3: Sebastián
(10, 1),   -- 4: Javiera
(19, 1),   -- 5: Gabriel
-- Clientes en Peluquería 2 (La Barbería)
(3, 2),    -- 6: Roberto
(4, 2),    -- 7: Francisca
(5, 2),    -- 8: Diego
(15, 2),   -- 9: Nicolás
(17, 2),   -- 10: Ignacio
-- Clientes en Peluquería 3 (Salón Elegante)
(6, 3),    -- 11: Valentina
(7, 3),    -- 12: Matías
(11, 3),   -- 13: Andrés
(12, 3),   -- 14: Isidora
(16, 3),   -- 15: Martina
-- Clientes en Peluquería 4 (Cortes y Color)
(8, 4),    -- 16: Camila
(13, 4),   -- 17: Felipe
(14, 4),   -- 18: Catalina
(18, 4),   -- 19: Antonia
(20, 4),   -- 20: Florencia
-- Clientes que van a una segunda peluquería
(1, 2),    -- 21: Carlos también va a La Barbería
(3, 4),    -- 22: Roberto también va a Cortes y Color
(5, 1),    -- 23: Diego también va a Estilo Genial
(7, 4),    -- 24: Matías también va a Cortes y Color
(11, 1),   -- 25: Andrés también va a Estilo Genial
(6, 4),    -- 26: Valentina también va a Cortes y Color
(9, 3),    -- 27: Sebastián también va a Salón Elegante
(13, 2),   -- 28: Felipe también va a La Barbería
(15, 3),   -- 29: Nicolás también va a Salón Elegante
(20, 1);   -- 30: Florencia también va a Estilo Genial

--HORARIOS
-- Fechas desde 2017 hasta 2026
-- duracion en horas (0.50 = 30min, 1.00 = 1hr, 2.00 = 2hrs)
-- IDs: 1-70
INSERT INTO horarios (fecha, duracion) VALUES
-- 2018 (IDs 1-8)
('2018-03-10', 0.50), ('2018-03-10', 1.00), ('2018-04-15', 0.75),
('2018-05-20', 1.50), ('2018-06-12', 0.50), ('2018-07-08', 1.00),
('2018-08-22', 2.00), ('2018-09-14', 0.50),
-- 2019 (IDs 9-16)
('2019-01-15', 0.50), ('2019-02-20', 1.00), ('2019-03-10', 1.50),
('2019-04-05', 0.75), ('2019-05-18', 2.00), ('2019-06-22', 0.50),
('2019-07-30', 1.00), ('2019-08-12', 0.50),
-- 2020 (IDs 17-24)
('2020-01-10', 0.50), ('2020-02-14', 1.00), ('2020-03-20', 1.50),
('2020-06-15', 0.75), ('2020-07-22', 2.00), ('2020-08-10', 0.50),
('2020-09-18', 1.00), ('2020-10-05', 0.50),
-- 2021 (IDs 25-36)
('2021-01-12', 0.50), ('2021-02-18', 1.00), ('2021-03-22', 2.50),
('2021-04-10', 0.75), ('2021-05-15', 1.50), ('2021-06-20', 0.50),
('2021-07-08', 1.00), ('2021-08-14', 0.50), ('2021-09-25', 2.00),
('2021-10-30', 0.75), ('2021-11-12', 1.00), ('2021-12-05', 0.50),
-- 2022 (IDs 37-44)
('2022-01-18', 0.50), ('2022-03-22', 1.50), ('2022-05-10', 0.75),
('2022-07-14', 1.00), ('2022-08-20', 2.00), ('2022-09-15', 0.50),
('2022-11-08', 1.00), ('2022-12-10', 0.75),
-- 2023 (IDs 45-52)
('2023-01-10', 0.75), ('2023-03-18', 1.00), ('2023-05-22', 1.50),
('2023-07-14', 0.50), ('2023-09-20', 2.00), ('2023-10-15', 0.75),
('2023-11-08', 1.00), ('2023-12-20', 0.50),
-- 2024 (IDs 53-58)
('2024-02-12', 1.00), ('2024-04-18', 0.50), ('2024-06-22', 1.50),
('2024-08-15', 0.75), ('2024-10-20', 2.00), ('2024-12-10', 0.50),
-- 2025 (IDs 59-62)
('2025-01-15', 0.75), ('2025-03-20', 1.00), ('2025-06-10', 1.50),
('2025-09-18', 0.50),
-- 2026 (IDs 63-66)
('2026-01-20', 0.75), ('2026-02-18', 1.00), ('2026-03-15', 1.50),
('2026-04-10', 0.50),
-- 2017 (IDs 67-70)
('2017-01-15', 0.50), ('2017-03-18', 1.50),
('2017-06-14', 0.75), ('2017-09-12', 1.00),
-- Citas adicionales para la consulta 9
('2021-01-20', 1.00),   -- 71
('2021-01-25', 0.50),   -- 72
('2021-02-10', 1.00),   -- 73
('2021-02-22', 0.75),   -- 74
('2021-03-05', 1.50),   -- 75
('2021-03-18', 0.50),   -- 76
('2021-04-08', 1.00),   -- 77
('2021-04-20', 0.75),   -- 78
('2021-05-06', 0.50),   -- 79
('2021-05-25', 1.00),   -- 80
('2021-06-10', 1.50),   -- 81
('2021-06-28', 0.50),   -- 82
('2021-07-15', 1.00),   -- 83
('2021-07-28', 0.75),   -- 84
('2021-08-05', 0.50),   -- 85
('2021-08-25', 1.00),   -- 86
('2021-09-10', 0.75),   -- 87
('2021-09-28', 1.50),   -- 88
('2021-10-15', 0.50),   -- 89
('2021-11-20', 1.00),   -- 90
('2021-01-08', 1.00),  -- 91
('2021-01-15', 0.50),  -- 92
('2021-01-22', 1.50),  -- 93
('2021-02-05', 0.75),  -- 94
('2021-02-12', 1.00),  -- 95
('2021-02-25', 0.50),  -- 96
('2021-03-08', 1.00),  -- 97
('2021-03-15', 0.75),  -- 98
('2021-03-25', 0.50),  -- 99
('2021-04-06', 1.00),  -- 100
('2021-04-14', 0.50),  -- 101
('2021-04-22', 1.50),  -- 102
('2021-05-04', 1.00),  -- 103
('2021-05-12', 0.75),  -- 104
('2021-05-20', 0.50),  -- 105
('2021-05-28', 1.00),  -- 106
('2021-06-04', 0.50),  -- 107
('2021-06-11', 1.00),  -- 108
('2021-06-18', 0.75),  -- 109
('2021-06-25', 1.50),  -- 110
('2021-07-05', 0.50),  -- 111
('2021-07-12', 1.00),  -- 112
('2021-07-19', 0.75),  -- 113
('2021-07-26', 0.50),  -- 114
('2021-08-03', 1.00),  -- 115
('2021-08-10', 0.75),  -- 116
('2021-08-17', 0.50),  -- 117
('2021-08-24', 1.00),  -- 118
('2021-09-06', 0.50),  -- 119
('2021-09-13', 1.00),  -- 120
('2021-09-20', 0.75),  -- 121
('2021-09-27', 1.50),  -- 122
('2021-10-05', 0.50),  -- 123
('2021-10-12', 1.00),  -- 124
('2021-10-19', 0.75),  -- 125
('2021-10-26', 0.50),  -- 126
('2021-11-03', 1.00),  -- 127
('2021-11-10', 0.75),  -- 128
('2021-11-17', 0.50),  -- 129
('2021-11-24', 1.00);  -- 130
--PAGO (58 pagos)
-- IDs: 1-58
INSERT INTO pago (tipo_pago, pago_monto) VALUES
('Efectivo', 12000),           -- 1
('Tarjeta Débito', 20000),     -- 2
('Tarjeta Crédito', 35000),    -- 3
('Efectivo', 8000),            -- 4
('Transferencia', 43000),      -- 5
('Tarjeta Débito', 18000),     -- 6
('Efectivo', 12000),           -- 7
('Tarjeta Crédito', 35000),    -- 8
('Transferencia', 20000),      -- 9
('Efectivo', 30000),           -- 10
('Tarjeta Débito', 38000),     -- 11
('Efectivo', 10000),           -- 12
('Tarjeta Crédito', 47000),    -- 13
('Transferencia', 8000),       -- 14
('Efectivo', 12000),           -- 15
('Tarjeta Débito', 35000),     -- 16
('Efectivo', 18000),           -- 17
('Tarjeta Crédito', 25000),    -- 18
('Transferencia', 12000),      -- 19
('Efectivo', 20000),           -- 20
('Tarjeta Débito', 43000),     -- 21
('Efectivo', 8000),            -- 22
('Tarjeta Crédito', 30000),    -- 23
('Transferencia', 35000),      -- 24
('Efectivo', 18000),           -- 25
('Tarjeta Débito', 12000),     -- 26
('Efectivo', 38000),           -- 27
('Tarjeta Crédito', 10000),    -- 28
('Transferencia', 47000),      -- 29
('Efectivo', 12000),           -- 30
('Tarjeta Débito', 35000),     -- 31
('Efectivo', 20000),           -- 32
('Tarjeta Crédito', 8000),     -- 33
('Transferencia', 25000),      -- 34
('Efectivo', 43000),           -- 35
('Tarjeta Débito', 18000),     -- 36
('Efectivo', 30000),           -- 37
('Tarjeta Crédito', 12000),    -- 38
('Transferencia', 35000),      -- 39
('Efectivo', 38000),           -- 40
('Tarjeta Débito', 10000),     -- 41
('Efectivo', 47000),           -- 42
('Tarjeta Crédito', 12000),    -- 43
('Transferencia', 20000),      -- 44
('Efectivo', 8000),            -- 45
('Tarjeta Débito', 43000),     -- 46
('Efectivo', 35000),           -- 47
('Tarjeta Crédito', 18000),    -- 48
('Transferencia', 25000),      -- 49
('Efectivo', 12000),           -- 50
('Tarjeta Débito', 30000),     -- 51
('Efectivo', 38000),           -- 52
('Tarjeta Crédito', 20000),    -- 53
('Transferencia', 12000),      -- 54
('Efectivo', 47000),           -- 55
('Tarjeta Débito', 35000),     -- 56
('Efectivo', 10000),           -- 57
('Tarjeta Crédito', 43000);    -- 58

-- CITA
-- estado: 'Completada', 'Cancelada', 'Pendiente'
-- IDs: 1-60
-- Canceladas: cita 18 (Antonia 2019) y cita 46 (Antonia 2022)
INSERT INTO cita (id_cliente_pelu, id_peluquero, id_horario, estado) VALUES
-- 2017 (citas 1-2) - horarios 67-68
(1, 1, 67, 'Completada'),   -- 1: Carlos en Pelu1
(6, 3, 68, 'Completada'),   -- 2: Roberto en Pelu2
-- 2018 (citas 3-10) - horarios 1-8
(1, 1, 1, 'Completada'),    -- 3: Carlos en Pelu1, peluquero Marco
(2, 2, 2, 'Completada'),    -- 4: Ana María en Pelu1, peluquero Elena
(6, 3, 3, 'Completada'),    -- 5: Roberto en Pelu2, peluquero Juan
(7, 4, 4, 'Completada'),    -- 6: Francisca en Pelu2, peluquero Patricia
(11, 5, 5, 'Completada'),   -- 7: Valentina en Pelu3, peluquero Sandra
(12, 6, 6, 'Completada'),   -- 8: Matías en Pelu3, peluquero Ricardo
(16, 7, 7, 'Completada'),   -- 9: Camila en Pelu4, peluquero Fernando
(17, 8, 8, 'Completada'),   -- 10: Felipe en Pelu4, peluquero Cecilia
-- 2019 (citas 11-18) - horarios 9-16
(3, 1, 9, 'Completada'),    -- 11: Sebastián en Pelu1, peluquero Marco
(4, 2, 10, 'Completada'),   -- 12: Javiera en Pelu1, peluquero Elena
(8, 3, 11, 'Completada'),   -- 13: Diego en Pelu2, peluquero Juan
(9, 4, 12, 'Completada'),   -- 14: Nicolás en Pelu2, peluquero Patricia
(13, 5, 13, 'Completada'),  -- 15: Andrés en Pelu3, peluquero Sandra
(14, 6, 14, 'Completada'),  -- 16: Isidora en Pelu3, peluquero Ricardo
(18, 7, 15, 'Completada'),  -- 17: Catalina en Pelu4, peluquero Fernando
(19, 8, 16, 'Cancelada'),   -- 18: Antonia en Pelu4 (CANCELADA)
-- 2020 (citas 19-26) - horarios 17-24
(1, 1, 17, 'Completada'),   -- 19: Carlos en Pelu1
(5, 2, 18, 'Completada'),   -- 20: Gabriel en Pelu1
(6, 3, 19, 'Completada'),   -- 21: Roberto en Pelu2
(10, 4, 20, 'Completada'),  -- 22: Ignacio en Pelu2
(11, 5, 21, 'Completada'),  -- 23: Valentina en Pelu3
(15, 6, 22, 'Completada'),  -- 24: Martina en Pelu3
(16, 7, 23, 'Completada'),  -- 25: Camila en Pelu4
(20, 8, 24, 'Completada'),  -- 26: Florencia en Pelu4
-- 2021 (citas 27-38) - horarios 25-36
(1, 1, 25, 'Completada'),   -- 27: Carlos en Pelu1
(2, 2, 26, 'Completada'),   -- 28: Ana María en Pelu1
(21, 3, 27, 'Completada'),  -- 29: Carlos en Pelu2 (segunda pelu)
(6, 3, 28, 'Completada'),   -- 30: Roberto en Pelu2
(8, 4, 29, 'Completada'),   -- 31: Diego en Pelu2
(12, 5, 30, 'Completada'),  -- 32: Matías en Pelu3
(13, 6, 31, 'Completada'),  -- 33: Andrés en Pelu3
(27, 5, 32, 'Completada'),  -- 34: Sebastián en Pelu3 (segunda pelu)
(17, 7, 33, 'Completada'),  -- 35: Felipe en Pelu4
(22, 8, 34, 'Completada'),  -- 36: Roberto en Pelu4 (segunda pelu)
(24, 7, 35, 'Completada'),  -- 37: Matías en Pelu4 (segunda pelu)
(26, 7, 36, 'Completada'),  -- 38: Valentina en Pelu4 (segunda pelu)
-- 2022 (citas 39-46) - horarios 37-44
(3, 1, 37, 'Completada'),   -- 39: Sebastián en Pelu1
(23, 1, 38, 'Completada'),  -- 40: Diego en Pelu1 (segunda pelu)
(9, 3, 39, 'Completada'),   -- 41: Nicolás en Pelu2
(28, 4, 40, 'Completada'),  -- 42: Felipe en Pelu2 (segunda pelu)
(14, 5, 41, 'Completada'),  -- 43: Isidora en Pelu3
(29, 6, 42, 'Completada'),  -- 44: Nicolás en Pelu3 (segunda pelu)
(18, 7, 43, 'Completada'),  -- 45: Catalina en Pelu4
(19, 8, 44, 'Cancelada'),   -- 46: Antonia en Pelu4 (CANCELADA)
-- 2023 (citas 47-54) - horarios 45-52
(1, 1, 45, 'Completada'),   -- 47: Carlos en Pelu1
(25, 2, 46, 'Completada'),  -- 48: Andrés en Pelu1 (segunda pelu)
(6, 3, 47, 'Completada'),   -- 49: Roberto en Pelu2
(10, 4, 48, 'Completada'),  -- 50: Ignacio en Pelu2
(12, 5, 49, 'Completada'),  -- 51: Matías en Pelu3
(15, 6, 50, 'Completada'),  -- 52: Martina en Pelu3
(17, 7, 51, 'Completada'),  -- 53: Felipe en Pelu4
(20, 8, 52, 'Completada'),  -- 54: Florencia en Pelu4
-- 2024 (citas 55-60) - horarios 53-58
(5, 1, 53, 'Completada'),   -- 55: Gabriel en Pelu1
(8, 3, 54, 'Completada'),   -- 56: Diego en Pelu2
(13, 5, 55, 'Completada'),  -- 57: Andrés en Pelu3
(16, 7, 56, 'Completada'),  -- 58: Camila en Pelu4
(30, 2, 57, 'Completada'),  -- 59: Florencia en Pelu1 (segunda pelu)
(11, 6, 58, 'Completada'),  -- 60: Valentina en Pelu3
-- Citas adicional para la consulta 9
-- Enero 2021
(2, 2, 71, 'Completada'),   -- 61: Ana María Pelu1, Elena
(6, 3, 72, 'Completada'),   -- 62: Roberto Pelu2, Juan
-- Febrero 2021
(7, 4, 73, 'Completada'),   -- 63: Francisca Pelu2, Patricia
(11, 5, 74, 'Completada'),  -- 64: Valentina Pelu3, Sandra
-- Marzo 2021
(12, 6, 75, 'Completada'),  -- 65: Matías Pelu3, Ricardo
(16, 7, 76, 'Completada'),  -- 66: Camila Pelu4, Fernando
-- Abril 2021
(3, 1, 77, 'Completada'),   -- 67: Sebastián Pelu1, Marco
(17, 8, 78, 'Completada'),  -- 68: Felipe Pelu4, Cecilia
-- Mayo 2021
(4, 2, 79, 'Completada'),   -- 69: Javiera Pelu1, Elena
(9, 4, 80, 'Completada'),   -- 70: Nicolás Pelu2, Patricia
-- Junio 2021
(13, 5, 81, 'Completada'),  -- 71: Andrés Pelu3, Sandra
(18, 7, 82, 'Completada'),  -- 72: Catalina Pelu4, Fernando
-- Julio 2021
(5, 1, 83, 'Completada'),   -- 73: Diego Pelu1, Marco
(10, 3, 84, 'Completada'),  -- 74: Ignacio Pelu2, Juan
-- Agosto 2021
(15, 6, 85, 'Completada'),  -- 75: Martina Pelu3, Ricardo
(20, 8, 86, 'Completada'),  -- 76: Florencia Pelu4, Cecilia
-- Septiembre 2021
(1, 1, 87, 'Completada'),   -- 77: Carlos Pelu1, Marco
(19, 8, 88, 'Completada'),  -- 78: Antonia Pelu4, Cecilia
-- Octubre 2021
(4, 2, 89, 'Completada'),   -- 79: Javiera Pelu1, Elena
-- Noviembre 2021
(9, 3, 90, 'Completada'),   -- 80: Nicolás Pelu2, Juan
-- Más citas
-- Enero 2021
(3, 1, 91, 'Completada'),   -- 81: Sebastián Pelu1, Marco
(4, 2, 92, 'Completada'),   -- 82: Javiera Pelu1, Elena
(5, 1, 93, 'Completada'),   -- 83: Gabriel Pelu1, Marco
-- Febrero 2021
(6, 3, 94, 'Completada'),   -- 84: Roberto Pelu2, Juan
(7, 4, 95, 'Completada'),   -- 85: Francisca Pelu2, Patricia
(8, 3, 96, 'Completada'),   -- 86: Diego Pelu2, Juan
-- Marzo 2021
(11, 5, 97, 'Completada'),  -- 87: Valentina Pelu3, Sandra
(12, 6, 98, 'Completada'),  -- 88: Matías Pelu3, Ricardo
(13, 5, 99, 'Completada'),  -- 89: Andrés Pelu3, Sandra
-- Abril 2021
(1, 1, 100, 'Completada'),  -- 90: Carlos Pelu1, Marco
(2, 2, 101, 'Completada'),  -- 91: Ana María Pelu1, Elena
(3, 1, 102, 'Completada'),  -- 92: Sebastián Pelu1, Marco
-- Mayo 2021
(6, 3, 103, 'Completada'),  -- 93: Roberto Pelu2, Juan
(9, 4, 104, 'Completada'),  -- 94: Nicolás Pelu2, Patricia
(8, 3, 105, 'Completada'),  -- 95: Diego Pelu2, Juan
(10, 4, 106, 'Completada'), -- 96: Ignacio Pelu2, Patricia
-- Junio 2021
(11, 5, 107, 'Completada'), -- 97: Valentina Pelu3, Sandra
(15, 6, 108, 'Completada'), -- 98: Martina Pelu3, Ricardo
(13, 5, 109, 'Completada'), -- 99: Andrés Pelu3, Sandra
(14, 6, 110, 'Completada'), -- 100: Isidora Pelu3, Ricardo
-- Julio 2021
(1, 1, 111, 'Completada'),  -- 101: Carlos Pelu1, Marco
(2, 2, 112, 'Completada'),  -- 102: Ana María Pelu1, Elena
(5, 1, 113, 'Completada'),  -- 103: Gabriel Pelu1, Marco
(4, 2, 114, 'Completada'),  -- 104: Javiera Pelu1, Elena
-- Agosto 2021
(16, 7, 115, 'Completada'), -- 105: Camila Pelu4, Fernando
(17, 8, 116, 'Completada'), -- 106: Felipe Pelu4, Cecilia
(18, 7, 117, 'Completada'), -- 107: Catalina Pelu4, Fernando
(20, 8, 118, 'Completada'), -- 108: Florencia Pelu4, Cecilia
-- Septiembre 2021
(6, 3, 119, 'Completada'),  -- 109: Roberto Pelu2, Juan
(8, 3, 120, 'Completada'),  -- 110: Diego Pelu2, Juan
(9, 4, 121, 'Completada'),  -- 111: Nicolás Pelu2, Patricia
(7, 4, 122, 'Completada'),  -- 112: Francisca Pelu2, Patricia
-- Octubre 2021
(11, 5, 123, 'Completada'), -- 113: Valentina Pelu3, Sandra
(12, 6, 124, 'Completada'), -- 114: Matías Pelu3, Ricardo
(13, 5, 125, 'Completada'), -- 115: Andrés Pelu3, Sandra
(15, 6, 126, 'Completada'), -- 116: Martina Pelu3, Ricardo
-- Noviembre 2021
(16, 7, 127, 'Completada'), -- 117: Camila Pelu4, Fernando
(17, 8, 128, 'Completada'), -- 118: Felipe Pelu4, Cecilia
(18, 7, 129, 'Completada'), -- 119: Catalina Pelu4, Fernando
(22, 8, 130, 'Completada'); -- 120: Roberto Pelu4, Cecilia

-- DETALLE (uno por cita completada)
-- Se omiten las citas canceladas (18 y 46)
-- IDs: 1-58
INSERT INTO detalle (id_pago, id_cita) VALUES
(1, 1),    -- 1:  Carlos Pelu1 (2017)
(2, 2),    -- 2:  Roberto Pelu2 (2017)
(3, 3),    -- 3:  Carlos Pelu1 (2018)
(4, 4),    -- 4:  Ana María Pelu1 (2018)
(5, 5),    -- 5:  Roberto Pelu2 (2018)
(6, 6),    -- 6:  Francisca Pelu2 (2018)
(7, 7),    -- 7:  Valentina Pelu3 (2018)
(8, 8),    -- 8:  Matías Pelu3 (2018)
(9, 9),    -- 9:  Camila Pelu4 (2018)
(10, 10),  -- 10: Felipe Pelu4 (2018)
(11, 11),  -- 11: Sebastián Pelu1 (2019)
(12, 12),  -- 12: Javiera Pelu1 (2019)
(13, 13),  -- 13: Diego Pelu2 (2019)
(14, 14),  -- 14: Nicolás Pelu2 (2019)
(15, 15),  -- 15: Andrés Pelu3 (2019)
(16, 16),  -- 16: Isidora Pelu3 (2019)
(17, 17),  -- 17: Catalina Pelu4 (2019)
(18, 19),  -- 18: Carlos Pelu1 (2020) - salta cita 18 cancelada
(19, 20),  -- 19: Gabriel Pelu1 (2020)
(20, 21),  -- 20: Roberto Pelu2 (2020)
(21, 22),  -- 21: Ignacio Pelu2 (2020)
(22, 23),  -- 22: Valentina Pelu3 (2020)
(23, 24),  -- 23: Martina Pelu3 (2020)
(24, 25),  -- 24: Camila Pelu4 (2020)
(25, 26),  -- 25: Florencia Pelu4 (2020)
(26, 27),  -- 26: Carlos Pelu1 (2021)
(27, 28),  -- 27: Ana María Pelu1 (2021)
(28, 29),  -- 28: Carlos Pelu2 (2021)
(29, 30),  -- 29: Roberto Pelu2 (2021)
(30, 31),  -- 30: Diego Pelu2 (2021)
(31, 32),  -- 31: Matías Pelu3 (2021)
(32, 33),  -- 32: Andrés Pelu3 (2021)
(33, 34),  -- 33: Sebastián Pelu3 (2021)
(34, 35),  -- 34: Felipe Pelu4 (2021)
(35, 36),  -- 35: Roberto Pelu4 (2021)
(36, 37),  -- 36: Matías Pelu4 (2021)
(37, 38),  -- 37: Valentina Pelu4 (2021)
(38, 39),  -- 38: Sebastián Pelu1 (2022)
(39, 40),  -- 39: Diego Pelu1 (2022)
(40, 41),  -- 40: Nicolás Pelu2 (2022)
(41, 42),  -- 41: Felipe Pelu2 (2022)
(42, 43),  -- 42: Isidora Pelu3 (2022)
(43, 44),  -- 43: Nicolás Pelu3 (2022)
(44, 45),  -- 44: Catalina Pelu4 (2022)
(45, 47),  -- 45: Carlos Pelu1 (2023) - salta cita 46 cancelada
(46, 48),  -- 46: Andrés Pelu1 (2023)
(47, 49),  -- 47: Roberto Pelu2 (2023)
(48, 50),  -- 48: Ignacio Pelu2 (2023)
(49, 51),  -- 49: Matías Pelu3 (2023)
(50, 52),  -- 50: Martina Pelu3 (2023)
(51, 53),  -- 51: Felipe Pelu4 (2023)
(52, 54),  -- 52: Florencia Pelu4 (2023)
(53, 55),  -- 53: Gabriel Pelu1 (2024)
(54, 56),  -- 54: Diego Pelu2 (2024)
(55, 57),  -- 55: Andrés Pelu3 (2024)
(56, 58),  -- 56: Camila Pelu4 (2024)
(57, 59),  -- 57: Florencia Pelu1 (2024)
(58, 60),  -- 58: Valentina Pelu3 (2024)
-- Citas adicionales para la consulta 9
(1, 61), (2, 62), (3, 63), (4, 64),
(5, 65), (6, 66), (7, 67), (8, 68),
(9, 69), (10, 70), (11, 71), (12, 72),
(13, 73), (14, 74), (15, 75), (16, 76),
(17, 77), (18, 78), (19, 79), (20, 80),
(1, 81),  (2, 82),  (3, 83),
(4, 84),  (5, 85),  (6, 86),
(7, 87),  (8, 88),  (9, 89),
(10, 90), (11, 91), (12, 92),
(13, 93), (14, 94), (15, 95), (16, 96),
(17, 97), (18, 98), (19, 99), (20, 100),
(21, 101),(22, 102),(23, 103),(24, 104),
(25, 105),(26, 106),(27, 107),(28, 108),
(29, 109),(30, 110),(31, 111),(32, 112),
(33, 113),(34, 114),(35, 115),(36, 116),
(37, 117),(38, 118),(39, 119),(40, 120);

-- SERVICIO_DETALLE
-- Servicios asociados a cada detalle
INSERT INTO servicio_detalle (id_servicio, id_detalle, cantidad_sd) VALUES
-- 2017
(1, 1, 1),   -- det1: Carlos Pelu1: Corte Hombre
(3, 1, 1),   -- det1: Carlos Pelu1: Corte con barbería
(1, 2, 1),   -- det2: Roberto Pelu2: Corte Hombre
-- 2018
(1, 3, 1),   -- det3: Carlos Pelu1: Corte Hombre
(3, 3, 1),   -- det3: Carlos Pelu1: Corte con barbería
(4, 4, 1),   -- det4: Ana María Pelu1: Teñido
(1, 5, 1),   -- det5: Roberto Pelu2: Corte Hombre
(3, 5, 1),   -- det5: Roberto Pelu2: Corte con barbería
(2, 6, 1),   -- det6: Francisca Pelu2: Corte Mujer
(4, 7, 1),   -- det7: Valentina Pelu3: Teñido
(1, 8, 1),   -- det8: Matías Pelu3: Corte Hombre
(3, 8, 1),   -- det8: Matías Pelu3: Corte con barbería
(5, 9, 1),   -- det9: Camila Pelu4: Alisado
(1, 10, 1),  -- det10: Felipe Pelu4: Corte Hombre
-- 2019
(1, 11, 1),  -- det11: Sebastián Pelu1: Corte Hombre
(3, 11, 1),  -- det11: Sebastián Pelu1: Corte con barbería
(7, 12, 1),  -- det12: Javiera Pelu1: Lavado y secado
(1, 13, 1),  -- det13: Diego Pelu2: Corte Hombre
(3, 13, 1),  -- det13: Diego Pelu2: Corte con barbería
(1, 14, 1),  -- det14: Nicolás Pelu2: Corte Hombre
(1, 15, 1),  -- det15: Andrés Pelu3: Corte Hombre
(3, 15, 1),  -- det15: Andrés Pelu3: Corte con barbería
(4, 16, 1),  -- det16: Isidora Pelu3: Teñido
(6, 17, 1),  -- det17: Catalina Pelu4: Lavado
(8, 17, 1),  -- det17: Catalina Pelu4: Peinado fiesta
-- 2020
(1, 18, 1),  -- det18: Carlos Pelu1: Corte Hombre
(3, 18, 1),  -- det18: Carlos Pelu1: Corte con barbería
(1, 19, 1),  -- det19: Gabriel Pelu1: Corte Hombre
(1, 20, 1),  -- det20: Roberto Pelu2: Corte Hombre
(3, 20, 1),  -- det20: Roberto Pelu2: Corte con barbería
(1, 21, 1),  -- det21: Ignacio Pelu2: Corte Hombre
(3, 21, 1),  -- det21: Ignacio Pelu2: Corte con barbería
(4, 22, 1),  -- det22: Valentina Pelu3: Teñido
(7, 23, 1),  -- det23: Martina Pelu3: Lavado y secado
(2, 24, 1),  -- det24: Camila Pelu4: Corte Mujer
(4, 25, 1),  -- det25: Florencia Pelu4: Teñido
-- 2021
(1, 26, 1),  -- det26: Carlos Pelu1: Corte Hombre
(3, 26, 1),  -- det26: Carlos Pelu1: Corte con barbería
(4, 27, 1),  -- det27: Ana María Pelu1: Teñido
(1, 28, 1),  -- det28: Carlos Pelu2: Corte Hombre
(3, 28, 1),  -- det28: Carlos Pelu2: Corte con barbería
(1, 29, 1),  -- det29: Roberto Pelu2: Corte Hombre
(1, 30, 1),  -- det30: Diego Pelu2: Corte Hombre
(3, 30, 1),  -- det30: Diego Pelu2: Corte con barbería
(1, 31, 1),  -- det31: Matías Pelu3: Corte Hombre
(3, 31, 1),  -- det31: Matías Pelu3: Corte con barbería
(1, 32, 1),  -- det32: Andrés Pelu3: Corte Hombre
(3, 32, 1),  -- det32: Andrés Pelu3: Corte con barbería
(1, 33, 1),  -- det33: Sebastián Pelu3: Corte Hombre
(1, 34, 1),  -- det34: Felipe Pelu4: Corte Hombre
(3, 34, 1),  -- det34: Felipe Pelu4: Corte con barbería
(1, 35, 1),  -- det35: Roberto Pelu4: Corte Hombre
(6, 36, 1),  -- det36: Matías Pelu4: Lavado
(4, 37, 1),  -- det37: Valentina Pelu4: Teñido
-- 2022
(1, 38, 1),  -- det38: Sebastián Pelu1: Corte Hombre
(3, 38, 1),  -- det38: Sebastián Pelu1: Corte con barbería
(1, 39, 1),  -- det39: Diego Pelu1: Corte Hombre
(1, 40, 1),  -- det40: Nicolás Pelu2: Corte Hombre
(3, 40, 1),  -- det40: Nicolás Pelu2: Corte con barbería
(1, 41, 1),  -- det41: Felipe Pelu2: Corte Hombre
(4, 42, 1),  -- det42: Isidora Pelu3: Teñido
(1, 43, 1),  -- det43: Nicolás Pelu3: Corte Hombre
(5, 44, 1),  -- det44: Catalina Pelu4: Alisado
-- 2023
(1, 45, 1),  -- det45: Carlos Pelu1: Corte Hombre
(3, 45, 1),  -- det45: Carlos Pelu1: Corte con barbería
(1, 46, 1),  -- det46: Andrés Pelu1: Corte Hombre
(3, 46, 1),  -- det46: Andrés Pelu1: Corte con barbería
(1, 47, 1),  -- det47: Roberto Pelu2: Corte Hombre
(3, 47, 1),  -- det47: Roberto Pelu2: Corte con barbería
(1, 48, 1),  -- det48: Ignacio Pelu2: Corte Hombre
(1, 49, 1),  -- det49: Matías Pelu3: Corte Hombre
(3, 49, 1),  -- det49: Matías Pelu3: Corte con barbería
(4, 50, 1),  -- det50: Martina Pelu3: Teñido
(1, 51, 1),  -- det51: Felipe Pelu4: Corte Hombre
(3, 51, 1),  -- det51: Felipe Pelu4: Corte con barbería
(4, 52, 1),  -- det52: Florencia Pelu4: Teñido
-- 2024
(1, 53, 1),  -- det53: Gabriel Pelu1: Corte Hombre
(3, 53, 1),  -- det53: Gabriel Pelu1: Corte con barbería
(1, 54, 1),  -- det54: Diego Pelu2: Corte Hombre
(3, 54, 1),  -- det54: Diego Pelu2: Corte con barbería
(1, 55, 1),  -- det55: Andrés Pelu3: Corte Hombre
(3, 55, 1),  -- det55: Andrés Pelu3: Corte con barbería
(2, 56, 1),  -- det56: Camila Pelu4: Corte Mujer
(4, 57, 1),  -- det57: Florencia Pelu1: Teñido
(4, 58, 1);  -- det58: Valentina Pelu3: Teñido

-- PRODUCTO_DETALLE
-- Productos vendidos en algunas citas
-- Productos: 1=Shampoo, 2=Acondicionador, 3=Tinte Básico,
--            4=Tinte Pro, 5=Spray Protector, 6=Pinches de Marca
INSERT INTO producto_detalle (id_producto, id_detalle, cantidad_pd) VALUES
(2, 1, 1),   -- Acondicionador en cita de Carlos (2017)
(3, 1, 1),   -- Tinte Básico en cita de Carlos (2017)
(4, 4, 1),   -- Tinte Pro en cita de Ana María (2018 teñido)
(1, 5, 1),   -- Shampoo en cita de Roberto (2018)
(3, 8, 1),   -- Tinte Básico en cita de Matías (2018)
(5, 9, 1),   -- Spray Protector en cita de Camila (2018)
(1, 11, 1),  -- Shampoo en cita de Sebastián (2019)
(3, 13, 1),  -- Tinte Básico en cita de Diego (2019)
(4, 16, 1),  -- Tinte Pro en cita de Isidora (2019 teñido)
(6, 17, 1),  -- Pinches de Marca en cita de Catalina (2019)
(2, 18, 1),  -- Acondicionador en cita de Carlos (2020)
(3, 21, 1),  -- Tinte Básico en cita de Ignacio (2020)
(4, 22, 1),  -- Tinte Pro en cita de Valentina (2020 teñido)
(1, 26, 1),  -- Shampoo en cita de Carlos (2021)
(3, 26, 1),  -- Tinte Básico en cita de Carlos (2021)
(4, 27, 1),  -- Tinte Pro en cita de Ana María (2021 teñido)
(2, 29, 1),  -- Acondicionador en cita de Roberto (2021)
(3, 30, 1),  -- Tinte Básico en cita de Diego (2021)
(1, 34, 1),  -- Shampoo en cita de Felipe (2021)
(4, 37, 1),  -- Tinte Pro en cita de Valentina (2021 pelu4 teñido)
(3, 38, 1),  -- Tinte Básico en cita de Sebastián (2022)
(4, 42, 1),  -- Tinte Pro en cita de Isidora (2022 teñido)
(1, 45, 1),  -- Shampoo en cita de Carlos (2023)
(3, 45, 1),  -- Tinte Básico en cita de Carlos (2023)
(4, 50, 1),  -- Tinte Pro en cita de Martina (2023 teñido)
(4, 52, 1),  -- Tinte Pro en cita de Florencia (2023 teñido)
(2, 53, 1),  -- Acondicionador en cita de Gabriel (2024)
(3, 54, 1),  -- Tinte Básico en cita de Diego (2024)
(4, 57, 1),  -- Tinte Pro en cita de Florencia pelu1 (2024 teñido)
(4, 58, 1);  -- Tinte Pro en cita de Valentina (2024 teñido)
