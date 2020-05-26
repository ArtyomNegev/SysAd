use WoodyToys;

insert into Clients values ('C001','Berger','Belgique',1000);
insert into Clients values ('C002','De Cock','Belgique',-1000);
insert into Clients values ('C003','Scorniciel','Belgique',0);
insert into Clients values ('C004','Hornec','France',-0.42);
insert into Clients values ('C005','Kellerman','France',6.9);
insert into Clients values ('C006','Negev','Russie',666);

insert into Produits values ('KP001','KAPLA',75,50);
insert into Produits values ('CP001','CAMION DE POMPIER',12.0,35);
insert into Produits values ('JT001','JOUET A TRAINER',2.20,18);
insert into Produits values ('MK001','MOLKKY 12PIECES',10.5,9);
insert into Produits values ('MK002','MOLKKY 24PIECES',19,0);
insert into Produits values ('MK003','MOLKKY 48PIECES',35,12);

insert into Commandes values ('00001','C005','20191019');
insert into Commandes values ('00002','C004','20200313');
insert into Commandes values ('00003','C005','20200511');
insert into Commandes values ('00004','C006','20200525');

insert into Details values ('00001','KP001',2);
insert into Details values ('00002','MK001',1);
insert into Details values ('00002','MK003',1);
insert into Details values ('00003','KP001',3);
insert into Details values ('00004','CP001',2);
insert into Details values ('00004','JT001',5);

insert into Employes values ('E001','Miller','Belgique','20191019',1);
insert into Employes values ('E002','Bolgarov','France','20191019',1);
insert into Employes values ('E003','Nociv','France','20191019',1);
insert into Employes values ('E004','Livai','France','20191019',0);
insert into Employes values ('E005','Winter','France','20191019',0);
insert into Employes values ('E006','Deauclair','Belgique','20191019',1);
