create DATABASE FOODY

use DATABASE FOODY

create table fabrica(
    codigo VARCHAR (5)PRIMARY key UNIQUE,
    nombre varchar (20) not null,
    tel int null,
    email VARCHAR (20) null,
    dirCalle varchar (20)null,
    dirNUm int null,
    dirColonia varchar(20),
    cantEmp int not null,
    ciudad varchar (20)
)

create table ciudad(
    codigo VARCHAR(5) PRIMARY KEY UNIQUE,
    nombre VARCHAR(20) not null UNIQUE,
)

create table administradorFabrica(
    num int PRIMARY KEY AUTO_INCREMENT,
    nombrePila VARCHAR(20) not null,
    apePat VARCHAR(20) not null,
    apeMat VARCHAR(20) null,
    tel int null,
    fabrica VARCHAR(20) not null
)

create table empleado(
    num int PRIMARY KEY AUTO_INCREMENT,
    nombrePila VARCHAR(20) not null,
    apePat VARCHAR(20) not null,
    apeMat VARCHAR(20) null,
    tel int null,
    correo VARCHAR(30) null,
    fabrica VARCHAR(20) not null,
    puesto VARCHAR(20) not null
) 

create table puesto(
    codigo VARCHAR (5),
    descripcion VARCHAR (20)
)

create table orden(
    num int PRIMARY KEY AUTO_INCREMENT,
    montoPago FLOAT not null,
    fecha date not null,
    empleado int not null,
    estado varchar not null
)

create table recibo(
    num int PRIMARY KEY AUTO_INCREMENT,
    total float not null,
    fecha date not null,
    reporte VARCHAR(30),
    orden VARCHAR (30)
)

create table reporte(
    num int PRIMARY KEY AUTO_INCREMENT,
    totalVenta int not null,
    fechaInicio  date not null,
    fechaFinal date not null,
    Periodo date not null
)

create table estado(
    codigo VARCHAR(5) PRIMARY KEY unique,
    descripcion VARCHAR(5) not null
)

create table categoria(
    codigo VARCHAR(5),
    nombre VARCHAR(20)
)

create table platillo(
    codigo VARCHAR(5)
)



