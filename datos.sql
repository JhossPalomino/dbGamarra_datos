-- creacion de la base de datos y uso de la misma
create database dbGamarraMarket;
use dbGamarraMarket;

-- creacion de tablas
create table cliente (
    id int,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool,
    constraint cliente_pk primary key (id)
);

create table venta (
   id int,
   fecha_hora timestamp,
   activo bool,
   cliente_id int,
   vendedor_id int,
   constraint venta_pk primary key (id)
);

create table venta_detalle(
    id int,
    cantidad int,
    venta_id int,
    prenda_id int,
    constraint venta_detalles_pk primary key (id)
);

create table vendedor(
	id int,
    tipo_documento char(3),
    numero_documento char(15),
    nombres varchar(60),
    apellidos varchar(90),
    salario decimal(8,2),
    celular char(9),
    email varchar(80),
    activo bool,
    constraint vendedor_pk primary key (id)
);

create table prenda(
   id int,
   descripcion varchar(90),
   marca varchar(60),
   cantidad int,
   talla varchar(10),
   precio decimal(8,2),
   activo bool,
   constraint prenda_pk primary key (id)
);

-- listar tablas
show tables;
show columns in cliente;
show columns in prenda;
show columns in vendedor;
show columns in venta;
show columns in venta_detalle;

-- creacion de relaciones
alter table venta
   add constraint venta_cliente foreign key (cliente_id)
   references cliente (id)
   on update cascade
   on delete cascade
;

alter table venta
   add constraint venta_vendedor foreign key (vendedor_id)
   references vendedor (id)
   on update cascade
   on delete cascade
;

alter table venta_detalle
   add constraint ventaDetalle_venta foreign key (venta_id)
   references venta (id)
   on update cascade
   on delete cascade
;

alter table venta_detalle
   add constraint ventaDetalle_prenda foreign key (prenda_id)
   references prenda (id)
   on update cascade
   on delete cascade
;

SELECT
    i.constraint_name, 
    k.table_name, 
    k.column_name,
    k.referenced_table_name, 
    k.referenced_column_name 

--listar relaciones
FROM
    information_schema.table_constraints i
LEFT JOIN 
    information_schema.key_column_usage k
ON 
    i.constraint_name = k.constraint_name
WHERE 
    i.constraint_type = 'FOREIGN KEY'
AND 
    i.table_schema = DATABASE();

---- insertar datos en la tabla cliente
    
INSERT INto cliente (id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo) VALUES 
(1, 'DNI', '7789955', 'Alberto', 'Solano Pariona', 'alberto.pariona@empresa.com', '998456103', '1970-02-10', 1),
(2, 'DNI', '45781233', 'Alicia', 'García Campos', '', '', '1980-03-20', 1),
(3, 'DNI', '31548792', 'Juana', 'Ávila Chumpitaz', 'juana.avila@gmail.com', '923568741', '1970-01-06', 1),
(4, 'CNE', '121166533', 'Ana', 'Enríquez Flores', 'ana.enriquez@empresa.com', '', '1970-02-10', 1),
(5, 'DNI', '088741592', 'Claudia', 'Perales Ortiz', 'claudia.perales@yahoo.com', '997845623', '1985-05-05', 1),
(6, 'DNI', '41525857', 'Mario', 'Barrios Martínez', 'mario.barrios@outlook.com', '963582571', '1980-06-06', 1),
(7, 'DNI', '45125897', 'Brunela', 'Tarazona Guerra', 'brunela.tarazona@gmail.com', '998745632', '1985-07-07', 1),
(8, 'DNI', '14152356', 'Alejandro', 'Jimenez Huayapa', '', '951452365', '1986-06-01', 1),
(9, 'DNI', '45125897', 'Claudia', 'Márquez Litano', 'claudia.marquez@gmail.com', '998745632', '1985-07-07', 1),
(10, 'CNE', '835772587', 'Mario', 'Rodríguez Mayo', 'mario.rodriguez@outlook.com', '916266257', '1980-11-14', 1),
(11, 'DNI', '45781234', 'Luisa', 'Guerra Huayta', 'luisa.guerra@yahoo.com', '997421536', '1988-12-11', 1),
(12, 'DNI', '45125897', 'Pedro', 'Candela Valenzuela', 'pedro.candela@gmail.com', '94148525', '1975-03-05', 1),
(13, 'DNI', '31548792', 'Ángel', 'Rojas Ávila', 'angel.rojas@outlook.com', '', '1975-03-02', 1),
(14, 'DNI', '7789955', 'Hilario', 'Ávila Huayapa', '', '951452365', '1986-06-01', 1),
(15, 'DNI', '754741286', 'Octavio', 'Márquez Osorio', 'octavio.marquez@yahoo.es', '966223141', '1970-09-22', 1),
(16, 'DNI', '556897310', 'Manolo', 'Vásquez Saravia', 'manolo.vasquez@outlook.com', '951452365', '1980-05-14', 1),
(17, 'DNI', '511552647', 'Genoveva', 'Ortiz Quispe', 'genoveva.ortiz@outlook.es', '95264137', '2003-04-12', 1),
(18, 'DNI', '45125897', 'Oscar', 'Quiroz Zavala', '', '982231345', '1980-05-14', 1),
(19, 'DNI', '49932217', 'Verónica', 'Romero Vargas', 'veronica.romero@yahoo.com', '', '2002-08-25', 1),
(20, 'DNI', '00253641', 'Eliseo', 'Prada Ortíz', 'eliseo.prada@yahoo.com', '', '1995-07-15', 1);

--- insertar datos en vendedor

insert into vendedor (id, tipo_documento, numero_documento, nombres, apellidos, salario, celular, email, activo) values 
(1, 'DNI', '85471236', 'Enrique', 'Pérez Manco', 1500.00, '96521873', 'enrique.perez@outlook.com', 1),
(2, 'DNI', '47259136', 'Sofía', 'Ávila Solís', 1350.00, '', '', 1),
(3, 'DNI', '61542280', 'Marcela', 'Napaico Cama', 1600.00, '965874357', 'marcela.napaico@gmail.com', 1),
(4, 'CNE', '742536140', 'Carmelo', 'Rodríguez Chauca', 1550.00, '', 'carmelo.rodriguez@yahoo.com', 1);

--- insertar datos en prenda

insert into prenda (id, descripcion, marca, cantidad, talla, precio, activo) values 
(1, 'Pantalon Jeans', 'Levis', 60, 28, 65.80, 1),
(2, 'Camisa manga corta', 'Adams', 75, 16, 55.00, 1),
(3, 'Polo sport', 'Australia', 100, 16, 40.00, 1),
(4, 'Camisa manga larga', 'Newport', 150, 16, 42.50, 1),
(5, 'Pijama para caballero', 'Adams', 180, 28, 79.50, 1),
(6, 'Corbata', 'Maxwell', 85, 16, 14.50, 1),
(7, 'Pijama para dama', 'Adams', 170, 24, 55.50, 1),
(8, 'Pantalon Jeans', 'Australia', 200, 28, 68.50, 1),
(9, 'Camisa Sport', 'John Holden', 85, 16, 88.50, 1),
(10, 'Shorts Jeans', 'Pepe Jeans', 185, 28, 77.20, 1);

--- insertar datos en venta

insert into venta (id, fecha_hora, activo, cliente_id, vendedor_id) values 
(1, '2023-05-01 19:04:08', 4, 1, 1),
(2, '2023-05-01 19:04:08', 6, 3, 1),
(3, '2023-05-01 19:04:08', 10, 1, 1),
(4, '2023-05-01 19:04:08', 18, 4, 1);

--- insertar datos en venta_detalle

insert into venta_detalle (id, cantidad, venta_id, prenda_id) values 
(1, 1, 6, 3),
(2, 1, 3, 5),
(3, 1, 2, 7),
(4, 2, 2, 3),
(5, 2, 7, 4),
(6, 3, 10, 6),
(7, 3, 3, 6),
(8, 3, 5, 7),
(9, 4, 2, 4),
(10, 4, 5, 3);

--- actualizar numeros telefonicos

update cliente set celular = '922881101' where id = 10;
update cliente set celular = '977226604' where id = 13;

--- Eliminar logicamente a clientes

update cliente set activo = '0' where id = 12;
update cliente set activo = '0' where id = 14;
update cliente set activo = '0' where id = 18;

update cliente set celular = '' where id = 9;
update cliente set celular = '' where id = 13;
update cliente set celular = '' where id = 17;

update cliente set activo = '1', email = 'oscar.quiroz@yahoo.es' where id = 18;

INSERT INTO cliente (id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo) VALUES 
(21, 'DNI', '88225463', 'Gustavo Tadeo', 'Quispe Solorzano', 'gustavo.quispe@gmail.com', '', '2001-10-13', 1),
(22, 'DNI', '15753955', 'Daniela', 'Solís Vargas', 'daniela.solis@outlook.com', '', '1993-11-09', 1),
(23, 'DNI', '76314895', 'Mitón Gregorio', 'Vásquez Iturrizaga', 'miton.gregorio@yahoo.es', '974815233', '2004-06-22', 1),
(24, 'DNI', '84725001', 'Verónica', 'Ancajima Araujo', 'veronica.ancajima@yahoo.com', '', '1980-11-07', 1),
(25, 'DNI', '11228514', 'Felicia', 'Marroquín Candela', 'felicia.marroquin@outlook.com', '966001472', '2006-06-06', 1),
(26, 'DNI', '51436952', 'Luhana', 'Ortíz Rodríguez', 'luhana.ortiz@outlook.com', '960405017', '1980-11-25', 1);

update prenda set precio = '45.00' where id = 3; 

update prenda set descripcion = 'Corbata Michi Elegante' where id = 6;

delete from prenda where id = 4;
delete from prenda where id = 9;
select * from prenda;

delete from vendedor where id = 3;
select * from vendedor;

delete from cliente where id = 8;
delete from cliente where id = 14;
select * from cliente;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM cliente
WHERE YEAR(fecha_nacimiento) = 1980;



