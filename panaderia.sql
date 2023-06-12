\c postgres;
create database panaderia;
\c panaderia;

--Tablas 


create table producto(
    id serial,
    nombre text,
    precioVenta numeric(6,2),
    constraint pk_producto primary key (id) 
);


create table localidad(
    id serial,
    nombre text,
    constraint pk_localidad primary key (id) 
);


create table empleado(
    id serial,
    nombre text,
    apellido text,
    localidad int,
    constraint pk_empleado primary key (id),
    constraint fk_localidad foreign key (localidad) references localidad (id)
);

create table cliente(
    id serial,
    nombre text,
    apellido text,
    localidad int,
    constraint pk_cliente primary key (id),
    constraint fk_localidad foreign key (localidad) references localidad (id)
);

create table venta(
    id serial,
    fecha date,
    hora time, 
    empleado int,
    cliente int, 
    constraint pk_venta primary key (id),
    constraint fk_empleado foreign key (empleado) references empleado (id),
    constraint fk_cliente foreign key (cliente) references cliente (id)
);


create table detalle_venta(
    id serial,
    venta int,
    cantidad int,
    producto int,
    constraint pk_detalle_venta primary key (id),
    constraint fk_venta foreign key (venta) references venta (id),
    constraint fk_producto foreign key (producto) references producto (id)
);


insert into producto values(default,'Pan',100), 
                           (default, 'Bizcocho', 25), 
                           (default, 'Medialuna', 150.5),
                           (default,'Chipa', 200);

insert into localidad values(default, 'Villa Maria'),
                            (default, 'Leones'), 
                            (default, 'Villa Nueva'), 
                            (default,'Las Perdices');

insert into empleado values(default,'Juan', 'Perez',1),
                           (default, 'Pedro', 'Sanchez',4), 
                           (default, 'Emiliano', 'Cabrera', 3),
                           (default,'Santiago','Aguero',2), 
                           (default,'Felipe', 'Sosa',3);

insert into cliente values (default, 'Emanuel', 'Villarreal', 1), 
                           (default, 'Roberto', 'Salera', 2), 
                           (default, 'Santiago', 'Rodriguez', 1), 
                           (default, 'Enzo', 'Fernandez', 3), 
                           (default, 'Carlos', 'Gomez', 4);

insert into venta values (default, '02-03-2023', '14:05', 1, 1), 
                         (default, '02-03-2023', '15:30', 2, 2), 
                         (default, '07-03-2023', '20:15', 1, 3), 
                         (default, '08-03-2023', '17:20', 3, 2), 
                         (default, '10-03-2023', '16:45', 4, 4), 
                         (default, '11-03-2023', '15:22', 5, 5);

insert into detalle_venta values (default,1,3,1),(default,1,2,2),
                                 (default,2,1,1),(default,2,10,2),(default,2,5,4),
                                 (default,3,10,1),
                                 (default,4,5,3),(default,4,10,4),
                                 (default,5,15,2),(default,5,5,3),
                                 (default,6,5,4),(default,6,3,3);


