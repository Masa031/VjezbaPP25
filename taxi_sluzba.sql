# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Korisnik\Documents\edunovapp25\VjezbaPP25\SQL\taxi_sluzba.sql

drop database if exists taxi_sluzba;
create database taxi_sluzba;
use taxi_sluzba;     
       
create table taxi_sluzba(
    sifra int primary key not null auto_increment,
    auti int not null, 
    vozac int not null,
    broj_putnika char(2) not null
);


create table vozilo(
    sifra int primary key not null auto_increment,
    marka_vozila varchar(50) not null,
    broj_sjedala char(2),
    vozac int
);

create table vozac(
   sifra int primary key not null auto_increment,
   ime  varchar(50) not null,
   prezime varchar(50) not null,
   vozilo  int not null,
   broj_mobitela char(11)
);


create table korisnik(
    sifra int primary key not null auto_increment,
    taxi_sluzba int,
    vrijeme_voznje datetime
);


alter table taxi_sluzba add foreign key (vozilo) references auto(sifra);
alter table taxi_sluzba add foreign key (vozac) references vozac(sifra);
alter table korisnik add foreign key (taxi_sluzba) references taxi_sluzba(sifra);
alter table auti add foreign key (vozac) references vozac(sifra);