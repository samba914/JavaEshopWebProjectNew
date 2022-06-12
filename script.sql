drop database if exists eShoopProject;

create database eShoopProject;

use eShoopProject;

CREATE TABLE User(
        id     Int  Auto_increment  NOT NULL ,
        prenom Varchar (200) NOT NULL ,
        nom    Varchar (200) NOT NULL ,
        email  Varchar (200) NOT NULL ,
        mdp    Varchar (200) NOT NULL ,
        tel    Int ,
        adr    Varchar (500),
        role   Varchar (200)
	,CONSTRAINT User_PK PRIMARY KEY (id)
)ENGINE=InnoDB;

CREATE TABLE Produit(
        id    Int  Auto_increment  NOT NULL ,
        nom   Varchar (200) NOT NULL ,
        prix  DECIMAL (15,3)  NOT NULL ,
        photo Varchar (200),
	  stock Int
	,CONSTRAINT Produit_PK PRIMARY KEY (id)
)ENGINE=InnoDB;

CREATE TABLE Commande(
        num       Int  Auto_increment  NOT NULL ,
        idUser    Int NOT NULL ,
        idProduit Int NOT NULL ,
        quantite  Int NOT NULL ,
	  date DATETIME Not null,
	etat Varchar (200),
	CONSTRAINT Commande_PK PRIMARY KEY (num,idUser,idProduit)

	,CONSTRAINT Commande_User_FK FOREIGN KEY (idUser) REFERENCES User(id)
	,CONSTRAINT Commande_Produit_FK FOREIGN KEY (idProduit) REFERENCES Produit(id)
)ENGINE=InnoDB;

Insert into Produit (nom,prix,photo,stock) values ('Contemporary',15,'band_contemporary.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Leather',20,'band_leather_band.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Leather Deplayant',25,'band_leather-deployant.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Black Metal',30 , 'black_metal_frontSH_large.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Metal',35 ,'metal1.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Deploy',15 ,'Leather_deployant_band.png',0);
Insert into Produit (nom,prix,photo,stock) values ('Marriano One', 14,'Soffiano-Leather-Band.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Monochest',26 ,'monochest.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Pinck One',21 ,'pink.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Perfored',18 ,'perfored_leather_band.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Nylon Gold',20 ,'nylon-gold.jpg',0);
Insert into Produit  (nom,prix,photo,stock) values ('Saffiano', 25,'Saffiano_Leather_Band.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Ares',25,'ares_ga_front_large.jpg',0);
Insert into Produit (nom,prix,photo,stock) values ('Airpods',24 ,'airpods.jpg',0);
Insert into Produit (nom,prix,photo,stock)  values ('Foldup',22 ,'foldup_closed_gray_new_large.jpg',0);


