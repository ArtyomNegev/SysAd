create database WoodyToys;
use WoodyToys;

CREATE TABLE Clients
(
id_Client char(4) not null,
nom  varchar(12) not null,
adress varchar(20) not null,
localite varchar(12) not null,
compte decimal(9,2) not null,
primary key (id_Client)
) COMMENT='Table Clients';

CREATE TABLE Produits
(
id_Product  char(5) not null,
produit varchar(20) not null,
prix decimal(5,0) not null,
quantiteStock decimal(6,0) not null,
primary key (id_Product)
) COMMENT='Table Produits';

CREATE TABLE Commandes
(
id_Commande char(5) not null,
id_Client char(4) not null,
dateCommande datetime not null,
PRIMARY KEY (id_Commande, id_Client),
FOREIGN KEY (id_Client) REFERENCES Client(id_Client)
) COMMENT='Table Commandes';

create table Details
(
id_Commande char(5) not null,
id_Product char(5) not null,
quantiteCommande decimal(4,0) not null,
primary key (id_Commande,id_Product),
foreign key (id_Commande) references Commande(id_Commande),
foreign key (id_Product) references Produit(id_Product)
) COMMENT='Table Détails';

CREATE TABLE Employes
(
id_Employe char(4) not null,
nom varchar(25) NOT NULL,
adresse TEXT NOT NULL,
localite varchar(12) not null,
dateEngage DATETIME NOT NULL,
actif BIT NOT NULL DEFAULT 1,
PRIMARY KEY (id_Employe)
) COMMENT='Table Employés';

CREATE user 'webServer'@51.178.40.161 identified by 'webServer';
CREATE user 'admin'@'localhost' identified by 'admin';
grant all privileges on *.* TO 'webServer'@51.178.40.161;
grant all privileges on *.* TO 'admin'@'localhost';

flush privileges;
