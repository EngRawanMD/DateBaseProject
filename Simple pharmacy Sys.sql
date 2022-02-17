CREATE DATABASE pharmacysys;
USE pharmacysys;

DROP TABLE IF EXISTS medicine;
CREATE TABLE IF NOT EXISTS medicine(
id int(10) NOT NULL auto_increment ,
comericailName VARCHAR(20),
scientificName VARCHAR(20),
price INT(10),
quintity INT(10)
primary key (id));

DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category(
id int(10) NOT NULL auto_increment ,
catname VARCHAR(20)
primary key (id));

DROP TABLE IF EXISTS pharmacy;
CREATE TABLE IF NOT EXISTS pharmacy(
id int(10) NOT NULL auto_increment ,
phone VARCHAR(9),
pharmaname VARCHAR(20),
address VARCHAR(30),
workingHours VARCHAR(30),
primary key (id));

DROP TABLE IF EXISTS branches;
CREATE TABLE IF NOT EXISTS branches(
id int(10) NOT NULL auto_increment ,
phone VARCHAR(9),
branchname VARCHAR(20),
address VARCHAR(30),
id_pharam int(10),
primary key (id));

DROP TABLE IF EXISTS pharmasist;
CREATE TABLE IF NOT EXISTS pharmasist(
id int(10) NOT NULL auto_increment ,
fname VARCHAR(9),
lname VARCHAR(20),
phoneNO VARCHAR(9),
email VARCHAR(20),
UNIQUE KEY email_UNIQUE (email),
password VARCHAR(20),
id_pharam int(10),
primary key (id));

DROP TABLE IF EXISTS links;
CREATE TABLE IF NOT EXISTS links(
id int(10) NOT NULL auto_increment ,
id_medicine int (10),
id_cat int (10),
id_pharmasist int (10),
primary key (id));

ALTER TABLE links
  ADD CONSTRAINT fk_medicine_has_cat FOREIGN KEY (id_medicine) REFERENCES medicine (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_cat_has_medicines FOREIGN KEY (id_cat) REFERENCES category (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_pharmasist_pharma FOREIGN KEY (id_pharmasist) REFERENCES pharmasist (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
ALTER TABLE pharmasist
  ADD CONSTRAINT fk_pharmasist_pharma FOREIGN KEY (id_pharma) REFERENCES pharmacy (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
ALTER TABLE branches
  ADD CONSTRAINT fk_branch_pharma FOREIGN KEY (id_pharma) REFERENCES pharmacy (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
  
INSERT INTO medicine (id, comericailName, scientificName, price, quintity) VALUES
(1, 'panadol', 'xxx', 2000, 1000),
(2, 'flotab', 'wx', 3000, 500),
(3, 'sprine', 'hxx', 2500, 1200);

INSERT INTO pharmacy (id , phone,pharmaname , address,workingHours) VALUES
(1,'777888999','hayan','haddah street','24'),
(2,'777555999','yemen','airport street','24'),
(3,'777444111','alshrooq','taiz street','24');

INSERT INTO branches (id , phone,branchaname , address,id_pharma) VALUES
(1,'777888999','hayan1','zubairy street','24',1),
(2,'777111255','yemen1','jeraf street','24',2),
(2,'777444111','alshrooq1','khawlan street','24',3); 

INSERT INTO category (id ,catname) VALUES
(1,'heart'),
(1,'bones'),
(2,'kids');  

INSERT INTO pharmasist (id , fname ,lname,phoneNO ,email ,password ,id_pharam) VALUES
(1,'user1','user1','777888333','user1@user.com','123',1),
(2,'user2','user2','777111255','user2@user.com','123',2),
(2,'user3','user3','777444111','user3@user.com','124',3); 

INSERT INTO links(id ,id_medicine,id_pharmasist) VALUES
(1,1,1),
(2,2,2),
(3,3,3);  
  
  
  
  


