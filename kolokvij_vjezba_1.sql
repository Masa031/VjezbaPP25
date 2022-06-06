# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8  <C:\Users\Korisnik\Documents\GitHub\VjezbaPP25\kolokvij_vjezba_1.sql
drop database if exists kolokvij1;
create database kolokvij1 default charset utf8mb4;
use kolokvij1;

create table muskarac(
    sifra int not null primary key ,
    bojaociju varchar (50),
    hlace varchar(30),
    modelnaocala varchar(43),
    zena int
);

create table sestra(
    sifra int not null primary key auto_increment,
    introvertni bit,
    haljina varchar (50),
    hlace varchar(46),
    narukvica int 
);

create table zena (
    sifra int not null primary key auto_increment,
    treciputa  datetime,
    hlace varchar (46),
    kratkamajica varchar(31),
    jmbg char(11),
    bojaociju varchar(39),
    haljina varchar (44),
    sestra int 
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int,
    svekar int
);

create table svekar(
    sifra int not null primary key auto_increment,
    prsten int ,
    bojaociju varchar(44),
    dukserica  varchar(41),
    lipa decimal (13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50),
    kuna  decimal(16,8),
    drugiput datetime,
    asocijalno bit,
    ekstroventno bit,
    dukserica varchar(50),
    muskarac int 
);
create table punac (
    sifra int not null primary key auto_increment,
    ogrlica int ,
    gustoca decimal(14,9),
    hlace varchar (50)
);

create table cura (
    novcica decimal (16,5),
    gustoca decimal (18,6),
    lipe  decimal (13,10),
    ogrlica int ,
    bojakose varchar(50),
    suknja varchar (44),
    punac int 
);



alter table muskarac add foreign key (zena) references zena(sifra); 
alter table   cura add foreign key (punac)  references punac (sifra);
alter table  mladic add foreign key (muskarac) references muskarac(sifra);
alter table zena add foreign key (sestra) references sestra (sifra);
alter table sestra_svekar add foreign key (sestra) references sestra (sifra);
alter table sestra_svekar add foreign key (svekar) references svekar (sifra);


select *from muskarac;
INSERT INTO muskarac
(sifra, bojaociju, hlace, modelnaocala,  zena)
VALUES(0, 'plava', 'kratke','sunčane', null);
INSERT INTO kolokvij1.muskarac
(sifra, bojaociju, hlace, modelnaocala, zena)
VALUES(1, 'smeđa', 'svečane', 'dioptrijske', NULL);
INSERT INTO kolokvij1.muskarac
(sifra, bojaociju, hlace, modelnaocala, zena)
VALUES(2, 'zelene', 'traperice', 'sunčane', null);




select * from zena;
INSERT INTO kolokvij1.zena
(treciputa, hlace, kratkamajica, jmbg, bojaociju, haljina, sestra)
VALUES(null, 'Kozne', 'Mustang', null, 'zelena',' kratka', 1);
INSERT INTO kolokvij1.zena
(treciputa, hlace, kratkamajica, jmbg, bojaociju, haljina, sestra)
VALUES(NULL, 'Traperice', 'Bijela', NULL, 'smeđa', 'svecana', 2);
INSERT into zena
(treciputa, hlace, kratkamajica, jmbg, bojaociju, haljina, sestra)
VALUES(NULL,' kratke', 'plava', NULL, 'plava', 'duga', 1);


select * from  sestra;
INSERT INTO sestra
(introvertni, haljina,  hlace, narukvica)
VALUES(NULL, 'svecana', 'traperice', null);
INSERT INTO sestra
(introvertni, haljina,  hlace, narukvica)
VALUES(NULL, 'kratka', 'kozne', null);


select* from sestra_svekar;
INSERT INTO sestra_svekar
(sestra, svekar)
VALUES(1, 1);
insert into sestra_svekar 
(sestra,svekar)
values(2,1);

select *from svekar;
INSERT INTO kolokvij1.svekar
(prsten, bojaociju, dukserica, lipa, eura, majica)
VALUES(NULL, 'plava', 'zuta', '00.55', '05.00', 'bjela');

select*from cura;
INSERT INTO kolokvij1.cura
(novcica, gustoca, lipe, ogrlica, bojakose, suknja, punac)
VALUES('20.00', NULL, '00.55', NULL, 'smeđa','karirana', NULL);
INSERT INTO kolokvij1.cura
(novcica, gustoca, lipe, ogrlica, bojakose, suknja, punac)
VALUES('50.00', NULL, '0.80', NULL, 'plava','crvena', NULL);
INSERT INTO kolokvij1.cura
(novcica, gustoca, lipe, ogrlica, bojakose, suknja, punac)
VALUES('100.00', NULL, '90', null, 'crna', 'crna', NULL);

update cura set gustoca=15.77;