# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\Users\Korisnik\Documents\GitHub\Vjezba_PP25\postolar.sql

drop database if exists postolar;
create database postolar;
use postolar;

create table postolar(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50)
);

create table segrt(
    sifra int not null primary key auto_increment,
    osoba int not null,
    broj_ugovora varchar(10)
);

create table popravak(
    sifra int not null primary key auto_increment,
    trajanje int,
    cijena decimal(18,2)
);

create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    broj_mobitela varchar (15)

);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(100),
    oib char(11)
);

alter table postolar add foreign key (osoba) references osoba(sifra);
alter table segrt add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);

alter table korisnik add foreign key (popravak) references popravak(sifra);

insert into osoba (ime,prezime,email,oib)
values ('Jozo', 'Bubalo ','bubaloj@gmail.com', '02807047399');

insert into osoba (ime,prezime,email,oib)
values ('Petar', 'Perić', 'ppetar@gmail.com', '22237126092');

insert into osoba (ime,prezime,email,oib)
values ('Luka', 'Božić', 'lukab5@gmail.com', '59660832188');

insert into postolar(osoba,iban)
values (1,'HR1425000098675834814');

insert into segrt(osoba,broj_ugovora)
values(2,'107/2022');

insert into korisnik(osoba,broj_mobitela)
values(3,'0992518441');

insert into popravak(korisnik,cijena)
values (1,'150,oo');


