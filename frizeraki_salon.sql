 # C:\xampp\mysql\bin\mysql -uroot < C:\Users\Korisnik\Documents\edunovapp25\VjezbaPP25\SQL\frizeraki_salon.sql

drop database if exists frizerski_salon;
create database frizerski_salon;
use frizerski_salon;

create table djelatnica (
    sifra int primary key not null auto_increment,
    osoba int not null,
    iban varchar(50)
);

create table korisnik(
    sifra int primary key not null auto_increment,
    osoba int not null,
    usluga int not null,
    termin datetime,
    djelatnik int not null 
);

create table osoba(
   sifra int primary key not null auto_increment,
   ime varchar(30) not  null,
   prezime varchar (30) not null,
   email varchar(50),
   oib char(11)
);

create table usluga (
    sifra int primary key not null auto_increment,
    naziv_usluge varchar(50) not null,
    cijena decimal (6,2),
    trajanje int 
);

alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table djelatnik add foreign key (osoba) references osoba(sifra);

alter table korisnik add foreign key(djelatnik) references djelatnik(sifra);
alter table korisnik add foreign key (usluga) references usluga(sifra);


insert into osoba (ime,prezime,email,oib)
values ('Stjpan', 'Marić', 'Stjepan.maric@gmail.com', '59660832188');

insert into osoba (ime,prezime,email,oib)
values('Lana','Mišić','lmisic@gmail.com','61743737033');

insert into usluga(naziv_usluge,cijena)
values('Šišanje','30,00');

insert into usluga(naziv_usluge,cijena)
values('Pramenovi', '100');

insert into djelatnica(osoba,iban)
values (2,'HR5024840089285735826');

insert into korisnik(osoba,usluga,termin)
values(1,1,'2022-05-25 17:15:00');
