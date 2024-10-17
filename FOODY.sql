-- Active: 1728454351625@@localhost@3306@foody
create DATABASE FOODY

use FOODY

rename table ingred_pursha to ingred_purcha

create table factory(
    code VARCHAR(8)PRIMARY key not null,
    name varchar(16) not null,
    tel int null,
    email VARCHAR (25) null UNIQUE,
    streetAddr varchar (15)null,
    numAddr int null,
    colonyAddr varchar(20),
    numberEmp int not null,
    city varchar(3) not null,
    Foreign Key (city) REFERENCES city(code)
)

create table city(
    code VARCHAR(5) PRIMARY KEY,
    name VARCHAR(20) not null UNIQUE
)

create table factoryAdmin(
    num int PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(20) not null,
    middleName VARCHAR(20) not null,
    lastName VARCHAR(20) null,
    tel int null,
    factory varchar(8) not null,
    Foreign Key (factory) REFERENCES factory(code)
)

create table diningRoomManager(
    num int PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(20) not null,
    middleName VARCHAR(20) not null,
    lastName VARCHAR(20) null,
    tel int null,
    diningRoom int not null,
    Foreign Key (diningRoom) REFERENCES diningRoom(num)
)

create table employee(
    num int PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(20) not null,
    middleName VARCHAR(20) not null,
    lastName VARCHAR(20) null,
    tel int null,
    email VARCHAR(30) null UNIQUE,
    factory VARCHAR(8) not null, 
    jobPosition VARCHAR(5) not null,
    Foreign Key (factory) REFERENCES factory(code),
    Foreign Key (jobPosition) REFERENCES jobPosition(code)
) 

create table jobPosition(
    code VARCHAR (5) PRIMARY KEY,
    description VARCHAR (20) UNIQUE
)

create table orderEmp(
    num int PRIMARY KEY AUTO_INCREMENT,
    paymentAmount FLOAT not null,
    dateOrde date not null,
    totalDiscount float not null,
    employee int not null,
    status VARCHAR(5) not null,
    Foreign Key (employee) REFERENCES employee(num),
    Foreign Key (status) REFERENCES status(code)
)

create table ticket(
    num int PRIMARY KEY AUTO_INCREMENT,
    total float not null,
    dateTick date not null,
    reportStatus VARCHAR(20) not null,
    report int not null,
    orderEmp int not null,
    Foreign Key (report) REFERENCES report(num),
    Foreign Key (orderEmp) REFERENCES orderEmp(num)
)

create table report(
    num int PRIMARY KEY AUTO_INCREMENT,
    totalSales int not null,
    dateStart  date not null,
    endDate date not null,
    productionDate date not null
)

create table status(
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(10) not null
)

create table category(
    code VARCHAR(5) PRIMARY KEY,
    name VARCHAR(20)
)

create table dish(
    code VARCHAR(5) PRIMARY KEY,
    name VARCHAR(50) not null,
    description VARCHAR(50) not null,
    price float not null,
    discountPercentage float not null,
    category VARCHAR(5) not null,
    menu VARCHAR(5) not null,
    Foreign Key (category) REFERENCES category(code),
    Foreign Key (menu) REFERENCES menu(code)
)

create table ingredients(
    num int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (20) not NULL,
    experitionDate date not NULL
)


create table purchaseOrder(
    num int PRIMARY KEY AUTO_INCREMENT,
    amountPayment FLOAT not NULL,
    datePurs date not null,
    diningroommanager int not null,
    supplier VARCHAR(7) not null,
    Foreign Key (diningroommanager) REFERENCES diningroommanager(num),
    Foreign Key (supplier) REFERENCES supplier(code)
)

create table supplier(
    code VARCHAR(7) PRIMARY KEY,
    name VARCHAR(25) not NULL,
    tel INT null,
    email VARCHAR (30) NULL UNIQUE
)

create table diningRoom(
    num int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) not NULL,
    ubication VARCHAR(30) not null,
    factory VARCHAR(8) not null,
    Foreign Key (factory) REFERENCES factory(code)
)

create table menu(
    code VARCHAR (5) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR (60) NOT NULL
)

create table dish_ingred(
    dish VARCHAR(5),
    ingredients int,
    numberIngred int not null,
    PRIMARY KEY(dish, ingredients),
    FOREIGN KEY (dish) references dish(code),
    FOREIGN KEY (ingredients) references ingredients(num)
)

create table ingred_pursha(
    ingredients int not null,
    purchaseOrder int not null,
    numberIngred int NOT NULL,
    PRIMARY KEY(ingredients,purchaseOrder),
    Foreign Key (purchaseOrder) REFERENCES purchaseOrder(num),
    Foreign Key (ingredients) REFERENCES ingredients(num)
)

create table dining_menu(
    diningRoom int not null,
    menu VARCHAR(5) not null,
    PRIMARY KEY(menu, diningRoom)
)

create table ord_dish(
numberDishes int NOT NULL,
amount int NOT NULL,
PRIMARY KEY(dish,order)
Foreign Key (dish) REFERENCES dish(code),
Foreign Key (order) REFERENCES order(num)
)

INSERT INTO factory (code, name, tel, email, streetAddr, numAddr, colonyAddr, numberEmp, city) VALUES
('FERROS', 'Ferros Inc', 6642588677, 'ferrostijuana@gmail.com', 'Brisa', 2, 'a',20,'TIJ'),
('ACEROS', 'Aceros del Norte', 6641589814, 'acerosnorte@gmail.com', 'Reforma', 5,'b', 20, 'ENS'),
('ALUMEX', 'Alumex Corp', 6643584872, 'aluminiosmexico@gmail.com','Insurgentes', 15,'c',20, 'TIJ'),
('MADERB', 'Maderas Benitez', 6641651487, 'madebenitez@gmail.com', 'Las Rosas', 14,'d', 20, 'ROS'),
('TEXTIL', 'Textiles SA', 6644585759, 'textilesssa@gmail.com','Alameda', 12 ,'e',20, 'MEX'),
('PLASTI', 'Plastica Mex', 6646585478, 'plasticosmex123@gmail.com','Blvd. Diaz Ordaz', 10 ,'f',20,'TIJ'),
('ELECTNO', 'Electro Nova', 6641243257, 'electronova142@gmail.com', 'Castaños', 54,'g',20, 'TIJ'),
('MUEBLES', 'Muebles Elvia', 6631478799, 'muebleselvia@gmail.com', 'Colinas', 72,'h', 20, 'ENS'),
('DULMEX', 'Dulmex Paletas', 6648498742, 'dulmexpaletas@gmail.com','Monterrey', 45,'i', 20, 'ROS'),
('CMTNOR', 'CMT Norte', 6634228879, 'CMTNORTE@gmail.com', 'Jamaica', 54, 'j', 20, 'MEX');

insert into city(code,) VALUES
("TIJ","Tijuana"),
("MEX","Mexicali"),
("ENS","Ensenada"),
("ROS","Rosarito");

INSERT INTO factoryAdmin(num, firstName, middleName, lastName, tel, factory) VALUES
(1, 'Javier', 'Diaz', 'Molina', '664-574-8912', 'FERROS'),
(2, 'Ernesto', 'Mendoza', 'Cardenas', '664-741-9988', 'ACEROS'),
(3, 'Marta', 'Figueroa', 'Castro', '664-158-7441', 'ALUMEX'),
(4, 'Alejandra', 'Alvarez', 'Cruz', '664-157-5863', 'MADERB'),
(5, 'Fernando', 'Ortega', 'Salinas', '664-236-8941', 'TEXTIL'),
(6, 'Carlos', 'Vasquez', 'Beltran', '663-222-5413', 'PLASTI'),
(7, 'Armando', 'Nuñes', 'Murillo', '664-789-4152', 'ELECTNO'),
(8, 'Rigoberta', 'Osuna', 'Valencia', '664-987-1420', 'MUEBLES'),
(9, 'Genaro', 'Brito', 'Canales', '664-021-1470', 'DULMEX'),
(10, 'Josefa', 'Hernandez', 'Ochoa', '663-799-1481', 'CMTNOR');

INSERT INTO employee(num, nombrePila, apePat, apeMat, tel, correo) VALUES
(1, 'Santiago', 'Garcia', 'Roman', '664-421-6897', 'santiago.Garcia@gmail.com'),
(2, 'Luis', 'Rodríguez', 'Sorte', '664-711-6666', 'luis.Rodríguez@gmail.com'),
(3, 'Marta', 'Martínez', 'Mendoza', '664-117-8531', 'marta.Martínez@gmail.com'),
(4, 'Ángel', 'López', 'Chávez', '664-871-5471', 'angel.López@gmail.com'),
(5, 'Carmen', 'González', 'Aguilar', '664-578-1245', 'carmen.González@gmail.com'),
(6, 'Fernando', 'Pérez', 'Rojas', '664-125-2549', 'hernán.Pérez@gmail.com'),
(7, 'Antonia', 'Sánchez', 'Medina', '664-478-6655', 'antonia.Sánchez@gmail.com'),
(8, 'Rodrigo', 'Ramírez', 'Delgado', '664-887-1478', 'rodrigo.Ramírez@gmail.com'),
(9, 'Norma', 'Torres', 'Soto', '664-378-1211', 'norma.Torres@gmail.com'),
(10, 'Eduardo', 'Flores', 'Vega', '664-422-5314', 'eduardo.Flores@gmail.com'),
(11, 'Fabiana', 'Rivera', 'Silva', '664-713-4745', 'fabiana.Rivera@gmail.com'),
(12, 'Sebastián', 'Gómez', 'Salazar', '644-332-1078', 'sebastián.Gómez@gmail.com'),
(13, 'Maribel', 'Díaz', 'León', '664-137-8799', 'maribel.Díaz@gmail.com'),
(14, 'Iván', 'Vázquez', 'Cruz', '663-555-6871', 'iván.Vázquez@gmail.com'),
(15, 'Paloma', 'Romero', 'Navarro', '664-571-8125', 'paloma.Romero@gmail.com'),
(16, 'Rafael', 'Herrera', 'Fuentes', '664-357-4785', 'rafael.Herrera@gmail.com'),
(17, 'Juana', 'Castro', 'Paredes', '664-745-6541', 'juana.Castro@gmail.com'),
(18, 'Mateo', 'Domínguez', 'Ramos', '664-141-9873', 'mateo.Domínguez@gmail.com'),
(19, 'Claudia', 'Morales', 'Valencia', '664-423-4777', 'claudia.Morales@gmail.com'),
(20, 'Tomás', 'Ortiz', 'Acosta', '664-879-6517', 'tomas.Ortiz@gmail.com'),
(21, 'Fátima', 'Ruiz', 'Molina', '664-748-2311', 'fátima.Ruiz@gmail.com'),
(22, 'Jorge', 'Jiménez', 'Orozco', '664-879-8999', 'jorge.Jiménez@gmail.com'),
(23, 'Pilar', 'Mendoza', 'Ponce', '664-171-1781', 'pilar.Mendoza@gmail.com'),
(24, 'Damián', 'Chávez', 'Serrano', '664-877-9983', 'damián.Chávez@gmail.com'),
(25, 'Vanessa', 'Aguilar', 'Miranda', '664-875-2214', 'vanesa.Aguilar@gmail.com'),
(26, 'Lucas', 'Rojas', 'Cárdenas', '664-147-1556', 'lucas.Rojas@gmail.com'),
(27, 'Cristina', 'Medina', 'Esquivel', '664-744-1444', 'cristina.Medina@gmail.com'),
(28, 'Joaquín', 'Delgado', 'Barrios', '664-111-9874', 'joaquín.Delgado@gmail.com'),
(29, 'Selene', 'Soto', 'Reyes', '664-874-9386', 'selene.Soto@gmail.com'),
(30, 'Hugo', 'Vega', 'Palacios', '664-478-1236', 'hugo.Vega@gmail.com'),
(31, 'Jimena', 'Silva', 'Bautista', '664-774-2356', 'jimena.Silva@gmail.com'),
(32, 'Bruno', 'Salazar', 'Zamora', '664-387-9511', 'bruno.Salazar@gmail.com'),
(33, 'Regina', 'León', 'Castañeda', '664-144-4786', 'regina.León@gmail.com'),
(34, 'Esteban', 'Cruz', 'Ramos', '664-897-5751', 'esteban.Cruz@gmail.com'),
(35, 'Almudena', 'Navarro', 'Luna', '664-845-2312', 'almudena.Navarro@gmail.com'),
(36, 'César', 'Fuentes', 'Villanueva', '664-447-4777', 'césar.Fuentes@gmail.com'),
(37, 'Gloria', 'Paredes', 'Montes', '664-784-7176', 'gloria.Paredes@gmail.com'),
(38, 'Alexis', 'Ramos', 'Lara', '664-485-7892', 'alexis.Ramos@gmail.com'),
(39, 'Sabrina', 'Valencia', 'Montero', '664-784-2344', 'sabrina.Valencia@gmail.com'),
(40, 'Guillermo', 'Acosta', 'Mora', '664-838-2241', 'guillermo.Acosta@gmail.com'),
(41, 'Aitana', 'Sandoval', 'Olivares', '664-478-1161', 'aitana.Sandoval@gmail.com'),
(42, 'Lorenzo', 'Peña', 'Salinas', '664-758-4561', 'lorenzo.Peña@gmail.com'),
(43, 'Melissa', 'Escobar', 'Cordero', '664-585-8144', 'melisa.Escobar@gmail.com'),
(44, 'Álvaro', 'Carrillo', 'Nuñez', '664-831-6937', 'álvaro.Carrillo@gmail.com'),
(45, 'Rosario', 'Muñoz', 'Aguirre', '664-788-6191', 'rosario.Muñoz@gmail.com'),
(46, 'Enrique', 'Vázquez', 'Peralta', '663-742-5487', 'enrique.Vázquez@gmail.com'),
(47, 'Daniela', 'Vargas', 'Santiago', '664-231-6741', 'daniela.Vargas@gmail.com'),
(48, 'Samuel', 'Molina', 'Coronado', '664-784-9386', 'samuel.Molina@gmail.com'),
(49, 'Sonia', 'Orozco', 'Trujillo', '663-148-3715', 'sonia.Orozco@gmail.com');

insert into diningRoom(name, ubication, factory)
VALUES
('Comiditas', 'area de comida', 'FERROS')

insert into diningroommanager(firstName, middleName, lastName, tel, diningroom)
values
('Julio', 'Camejo', 'Ortega', 6641870158, 1 )

insert into diningroommanager(firstName, middleName, lastName, tel, diningroom)
VALUES
('Juan', 'Martinez', 'Garcia', 6641871282, 2 )

insert into supplier(code, name, tel, email)
values('carne', 'Carniceria los pepes', 6641644789, 'carniceria.lospepes@gmail.com')

insert into purchaseOrder(amountPayment, datePurs, diningroommanager, supplier)
values(500, '2024-10-02', 1, 'carne' )

insert into purchaseorder(amountPayment, datePurs, diningroommanager, supplier)
values(420, '2024-10-02', 3, 'carne')


ALTER TABLE purchaseOrder
ADD CONSTRAINT diningroommanager
FOREIGN KEY (diningroommanager) REFERENCES diningroommanager(num);


select * from supplier

select * from diningroommanager

select * from factoryadmin

/*prueba*/

select d.firstName, amountPayment
from purchaseorder as p
INNER join diningroommanager as d on p.diningroommanager = d.num
where d.num = 3

