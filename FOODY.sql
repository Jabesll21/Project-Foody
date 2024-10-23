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
dish VARCHAR(5) NOT NULL,
orderemp int NOT NULL,
PRIMARY KEY(dish,orderemp),
Foreign Key (dish) REFERENCES dish(code),
Foreign Key (orderemp) REFERENCES orderemp(num)
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

INSERT INTO employee(num, firstName, middleName, lastName, tel, email, factory, jobposition)
VALUES
(1,'Santiago','García','Roman', 6644216897, 'santiago.García@gmail.com', 'DULMEX', 'OPRD'),
(2,'Luis','Rodríguez','Sorte', 6647116666, 'luis.Rodríguez@gmail.com', 'FERROS', 'OPRC'),
(3,'Marta','Martínez','Mendoza', 6641178531, 'marta.Martínez@gmail.com', 'FERROS', 'INGN'),
(4,'Ángel','López','Chávez', 6648715471, 'ángel.López@gmail.com', 'FERROS', 'SCRT'),
(5,'Carmen','González','Aguilar', 6645781245, 'carmen.González@gmail.com', 'FERROS', 'GRNT'),
(6,'Hernán','Pérez','Rojas', 6641252549, 'hernán.Pérez@gmail.com', 'FERROS', 'ASTN'),
(7,'Antonia','Sánchez','Medina', 6644786655, 'antonia.Sánchez@gmail.com', 'FERROS', 'SPVR'),
(8,'Rodrigo','Ramírez','Delgado', 6648871478, 'rodrigo.Ramírez@gmail.com', 'FERROS', 'INTN'),
(9,'Norma','Torres','Soto', 6634785211, 'norma.Torres@gmail.com', 'FERROS', 'OPRD'),
(10,'Eduardo','Flores','Vega', 6642317743, 'eduardo.Flores@gmail.com', 'FERROS', 'OPRC'),
(11,'Fabiana','Rivera','Silva', 6641784785, 'fabiana.Rivera@gmail.com', 'DULMEX', 'INGN'),
(12,'Sebastián','Gómez','Salazar', 6443321476, 'sebastián.Gómez@gmail.com', 'DULMEX', 'SCRT'),
(13,'Maribel','Díaz','León', 6641478793, 'maribel.Díaz@gmail.com', 'ACEROS', 'GRNT'),
(14,'Iván','Vázquez','Cruz', 6635556871, 'iván.Vázquez@gmail.com', 'ACEROS', 'ASTN'),
(15,'Paloma','Romero','Navarro', 6645718745, 'paloma.Romero@gmail.com', 'ACEROS', 'SPVR'),
(16,'Rafael','Herrera','Fuentes', 6634578125, 'rafael.Herrera@gmail.com', 'ACEROS', 'INTN'),
(17,'Juana','Castro','Paredes', 6647486541, 'juana.Castro@gmail.com', 'ACEROS', 'OPRD'),
(18,'Mateo','Domínguez','Ramos', 6644419873, 'mateo.Domínguez@gmail.com', 'ACEROS', 'OPRC'),
(19,'Claudia','Morales','Valencia', 6641234777, 'claudia.Morales@gmail.com', 'ACEROS', 'INGN'),
(20,'Tomás','Ortiz','Acosta', 6648796551, 'tomás.Ortiz@gmail.com', 'ACEROS', 'SCRT'),
(21,'Fátima','Ruiz','Molina', 6647483214, 'fátima.Ruiz@gmail.com', 'ACEROS', 'GRNT'),
(22,'Jorge','Jiménez','Orozco', 6648798899, 'jorge.Jiménez@gmail.com', 'DULMEX', 'ASTN'),
(23,'Pilar','Mendoza','Ponce', 6641717781, 'pilar.Mendoza@gmail.com', 'DULMEX', 'SPVR'),
(24,'Damián','Chávez','Serrano', 6647779983, 'damián.Chávez@gmail.com', 'ALUMEX', 'INTN'),
(25,'Vanessa','Aguilar','Miranda', 6648752214, 'vanessa.Aguilar@gmail.com', 'ALUMEX', 'OPRD'),
(26,'Lucas','Rojas','Rivas', 6641475856, 'lucas.Rojas@gmail.com', 'ALUMEX', 'OPRC'),
(27,'Cristina','Medina','Cárdenas', 6647481444, 'cristina.Medina@gmail.com', 'ALUMEX', 'INGN'),
(28,'Joaquín','Delgado','Esquivel', 6641119874, 'joaquín.Delgado@gmail.com', 'ALUMEX', 'SCRT'),
(29,'Selene','Soto','Barrios', 6648987412, 'selene.Soto@gmail.com', 'ALUMEX', 'GRNT'),
(30,'Hugo','Vega','Reyes', 6648749886, 'hugo.Vega@gmail.com', 'ALUMEX', 'ASTN'),
(31,'Jimena','Silva','Palacios', 6647881236, 'jimena.Silva@gmail.com', 'ALUMEX', 'SPVR'),
(32,'Bruno','Salazar','Bautista', 6647772556, 'bruno.Salazar@gmail.com', 'ALUMEX', 'INTN'),
(33,'Regina','León','Zamora', 6641444786, 'regina.León@gmail.com', 'DULMEX', 'OPRD'),
(34,'Esteban','Cruz','Castañeda', 6648918745, 'esteban.Cruz@gmail.com', 'DULMEX', 'OPRC'),
(35,'Almudena','Navarro','Luna', 6648452132, 'almudena.Navarro@gmail.com', 'MADERB', 'INGN'),
(36,'César','Fuentes','Villanueva', 6644477851, 'césar.Fuentes@gmail.com', 'MADERB', 'SCRT'),
(37,'Gloria','Paredes','Montes', 6647844712, 'gloria.Paredes@gmail.com', 'MADERB', 'GRNT'),
(38,'Alexis','Ramos','Lara', 6644857892, 'alexis.Ramos@gmail.com', 'MADERB', 'ASTN'),
(39,'Sabrina','Valencia','Montero', 6647844444, 'sabrina.Valencia@gmail.com', 'MADERB', 'SPVR'),
(40,'Guillermo','Acosta','Mora', 6448882241, 'guillermo.Acosta@gmail.com', 'MADERB', 'INTN'),
(41,'Aitana','Sandoval','Olivares', 6641471147, 'aitana.Sandoval@gmail.com', 'MADERB', 'OPRD'),
(42,'Lorenzo','Peña','Salinas', 6647884561, 'lorenzo.Peña@gmail.com', 'MADERB', 'OPRC'),
(43,'Melisa','Escobar','Cordero', 6645556841, 'melisa.Escobar@gmail.com', 'MADERB', 'INGN'),
(44,'Álvaro','Carrillo','Núñez', 6648816937, 'álvaro.Carrillo@gmail.com', 'DULMEX', 'SCRT'),
(45,'Rosario','Márquez','Aguirre', 6641427411, 'rosario.Márquez@gmail.com', 'CMTNOR', 'GRNT'),
(46,'Enrique','Valdez','Peralta', 6637485487, 'enrique.Valdez@gmail.com', 'TEXTIL', 'ASTN'),
(47,'Daniela','Vargas','Santiago', 6634216741, 'daniela.Vargas@gmail.com', 'TEXTIL', 'SPVR'),
(48,'Samuel','Molina','Coronado', 6648448745, 'samuel.Molina@gmail.com', 'TEXTIL', 'INTN'),
(49,'Sonia','Orozco','Trujillo', 6631484718, 'sonia.Orozco@gmail.com', 'TEXTIL', 'OPRD'),
(50,'Marcelo','Ponce','Figueroa', 6634711123, 'marcelo.Ponce@gmail.com', 'TEXTIL', 'OPRC'),
(51,'Rosaura','Serrano','Padilla', 6647311124, 'rosaura.Serrano@gmail.com', 'TEXTIL', 'INGN'),
(52,'Julia','Miranda','Quiroz', 6635474785, 'julia.Miranda@gmail.com', 'TEXTIL', 'SCRT'),
(53,'Mireya','Rivas','Barrera', 6639879999, 'mireya.Rivas@gmail.com', 'TEXTIL', 'GRNT'),
(54,'Alicia','Cárdenas','Espinoza', 6649891578, 'alicia.Cárdenas@gmail.com', 'TEXTIL','ASTN')

INSERT INTO employee(num, firstName, middleName, lastName, tel, email, factory, jobposition)
VALUES
(55,'Yolanda','Esquivel', 'Meza',6648791451,'yolanda.Esquivel@gmail.com','CMTNOR','SPVR'),

/*INSERT en la tabla de jobposition*/
LOAD DATA LOCAL INFILE 'C:/Users/User/Desktop/UTT/BaseDeDatos/ImporteTablas/tablaJobposition.csv'
INTO TABLE jobposition
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(code,description);

select * from employee

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

select * from factory

select * from employee

/prueba/

select d.firstName, amountPayment
from purchaseorder as p
INNER join diningroommanager as d on p.diningroommanager = d.num
where d.num = 3

