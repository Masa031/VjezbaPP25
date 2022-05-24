# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\GitHub\Vjezba_PP25\zupanija.sql
drop database if exists regionalna_samouprava;
create database regionalna_samouprava default charset utf8mb4;
use regionalna_samouprava;

create table zupanija (
sifra int not null primary key auto_increment,
naziv varchar(50),
zupan varchar(50)
);

create table opcina (
    sifra int not null primary key auto_increment,
    zupanija int not null,
    naziv varchar(30)
    );

create table mjesto(
    sifra int not null primary key auto_increment,
    opcina int not null,
    naziv varchar(50),
    zupanija int not null
);
create table zupan(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    zupanija int not null
);

alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);
alter table zupan add foreign key (zupanija) references zupanija(sifra);


insert into zupanija (naziv)
values ('Brodsko-Posavska');
insert into zupanija (naziv, zupan)
values('Brodsko-Posavska','Danijel Marušić');
insert into opcina (zupanija, naziv)
values (1,'Bebrina');
insert into opcina (zupanija, naziv)
values (1,'Garčin');
insert into opcina (zupanija, naziv)
values (1,'Nova Kapela');

insert into mjesto (zupanija,opcina,naziv)
values (1,1,'Banovci');
insert into mjesto (zupanija,opcina,naziv)
values (1,2,'Selna');
insert into mjesto (zupanija,opcina,naziv)
values(1,3,'Batrina');


insert into zupanija (naziv)
values ('Vukovarsko-Srjemska');
insert into zupanija (naziv, zupan)
values ('Vukovarsko-Srjemska', 'Damir Dekanić');

insert into opcina (zupanija, naziv)
values (2,'Andrijaševci');
insert into opcina (zupanija, naziv)
values (2,'Stari Jankovci');
insert into opcina (zupanija, naziv)
values (2,'Trpinja');

insert into mjesto (zupanija,opcina,naziv)
values (2,1,'Rokovci ');
insert into mjesto (zupanija,opcina,naziv)
values (2,2,'Stari Jankovci');
insert into mjesto (zupanija,opcina,naziv)
values(2,3,'Ludvinci');



insert into zupanija (naziv)
values ('Požeško-Slavonska');
insert into zupanija (naziv, zupan)
values ('Požeško-Slavonska', 'Damir Dekanić');

insert into opcina (zupanija, naziv)
values (3,'Čaglin');
insert into opcina (zupanija, naziv)
values (3,'Kaptol');
insert into opcina (zupanija, naziv)
values (3,'Jakšić');

insert into mjesto (zupanija,opcina,naziv)
values (3,1,'Nova Lipovica');
insert into mjesto (zupanija,opcina,naziv)
values (3,2,'Novi Bešinci ');
insert into mjesto (zupanija,opcina,naziv)
values(3,3,'Bertelovci');