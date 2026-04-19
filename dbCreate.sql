-- INSTRUCCIONES
-- EJECUTAR ESTAS DOS LINEAS SOLAS PRIMERO:
-- DROP DATABASE IF EXISTS peluquerias_db;
-- CREATE DATABASE peluquerias_db;
-- Se habrá creado la base de datos peluquerias_db
-- Conectarse a "peluquerias_db" y empezar a ejecutar este .sql

DROP TABLE IF EXISTS comuna CASCADE;
CREATE TABLE comuna (
    id_comuna SERIAL,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_comuna)
);

DROP TABLE IF EXISTS servicio CASCADE;
CREATE TABLE servicio (
    id_servicio SERIAL,
    tipo_servicio VARCHAR(100) NOT NULL,
    precio_servicio INT NOT NULL,
    PRIMARY KEY (id_servicio)
);

DROP TABLE IF EXISTS producto CASCADE;
CREATE TABLE producto (
    id_producto SERIAL,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_producto INT NOT NULL,
    PRIMARY KEY (id_producto)
);

DROP TABLE IF EXISTS pago CASCADE;
CREATE TABLE pago (
    id_pago SERIAL,
    tipo_pago VARCHAR(50) NOT NULL,
    pago_monto INT NOT NULL,
    PRIMARY KEY (id_pago)
);

DROP TABLE IF EXISTS horarios CASCADE;
CREATE TABLE horarios (
    id_horarios SERIAL,
    fecha DATE NOT NULL,
    duracion NUMERIC(5,2) NOT NULL,
    PRIMARY KEY (id_horarios)
);

DROP TABLE IF EXISTS cliente CASCADE;
CREATE TABLE cliente (
    id_cliente SERIAL,
    nombre VARCHAR(100) NOT NULL,
    genero VARCHAR(20) NOT NULL,
    id_comuna INT NOT NULL,
    PRIMARY KEY (id_cliente),
    FOREIGN KEY (id_comuna)
        REFERENCES comuna(id_comuna)
);

DROP TABLE IF EXISTS peluqueria CASCADE;
CREATE TABLE peluqueria (
    id_peluqueria SERIAL,
    nombre VARCHAR(100) NOT NULL,
    id_comuna INT NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_peluqueria),
    FOREIGN KEY (id_comuna)
        REFERENCES comuna(id_comuna)
);

DROP TABLE IF EXISTS empleado CASCADE;
CREATE TABLE empleado (
    id_empleado SERIAL,
    id_comuna INT NOT NULL,
    id_peluqueria INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_empleado),
    FOREIGN KEY (id_comuna)
        REFERENCES comuna(id_comuna),
    FOREIGN KEY (id_peluqueria)
        REFERENCES peluqueria(id_peluqueria)
);

DROP TABLE IF EXISTS cliente_pelu CASCADE;
CREATE TABLE cliente_pelu (
    id_cliente_pelu SERIAL,
    id_cliente INT NOT NULL,
    id_peluqueria INT NOT NULL,
    PRIMARY KEY (id_cliente_pelu),
    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_peluqueria)
        REFERENCES peluqueria(id_peluqueria)
);

DROP TABLE IF EXISTS sueldo CASCADE;
CREATE TABLE sueldo (
    id_sueldo SERIAL,
    monto INT NOT NULL,
    fecha DATE NOT NULL,
    id_empleado INT NOT NULL,
    PRIMARY KEY (id_sueldo),
    FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado)
);

DROP TABLE IF EXISTS peluquero CASCADE;
CREATE TABLE peluquero (
    id_peluquero SERIAL,
    id_empleado INT NOT NULL,
    PRIMARY KEY (id_peluquero),
    FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado)
);

DROP TABLE IF EXISTS cita CASCADE;
CREATE TABLE cita (
    id_cita SERIAL,
    id_cliente_pelu INT NOT NULL,
    id_peluquero INT NOT NULL,
    id_horario INT NOT NULL,
    estado VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_cita),
    FOREIGN KEY (id_cliente_pelu)
        REFERENCES cliente_pelu(id_cliente_pelu),
    FOREIGN KEY (id_peluquero)
        REFERENCES peluquero(id_peluquero),
    FOREIGN KEY (id_horario)
        REFERENCES horarios(id_horarios)
);

DROP TABLE IF EXISTS detalle CASCADE;
CREATE TABLE detalle (
    id_detalle SERIAL,
    id_pago INT NOT NULL,
    id_cita INT NOT NULL,
    PRIMARY KEY (id_detalle),
    FOREIGN KEY (id_pago)
        REFERENCES pago(id_pago),
    FOREIGN KEY (id_cita)
        REFERENCES cita(id_cita)
);

DROP TABLE IF EXISTS servicio_detalle CASCADE;
CREATE TABLE servicio_detalle (
    id_servicio_detalle SERIAL,
    id_servicio INT NOT NULL,
    id_detalle INT NOT NULL,
    cantidad_sd INT NOT NULL,
    PRIMARY KEY (id_servicio_detalle),
    FOREIGN KEY (id_servicio)
        REFERENCES servicio(id_servicio),
    FOREIGN KEY (id_detalle)
        REFERENCES detalle(id_detalle)
);

DROP TABLE IF EXISTS producto_detalle CASCADE;
CREATE TABLE producto_detalle (
    id_producto_detalle SERIAL,
    id_producto INT NOT NULL,
    id_detalle INT NOT NULL,
    cantidad_pd INT NOT NULL,
    PRIMARY KEY (id_producto_detalle),
    FOREIGN KEY (id_producto)
        REFERENCES producto(id_producto),
    FOREIGN KEY (id_detalle)
        REFERENCES detalle(id_detalle)
);