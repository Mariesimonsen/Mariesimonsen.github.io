CREATE TABLE passasjer
(
    passasjerid serial primary key,
    fornavn text not null,
    etternavn text not null,
    adresse text
);

CREATE TABLE fly
(
    flyid serial primary key,
    regnr text not null,
    selskap text,
    flytype text 
);

CREATE TABLE flytur
(
    flyturid serial primary key,
    pris text,
    avgang text,
    destinasjon text not null,
    passasjerid int references passasjer (passasjerid),
    flyid int references fly (flyid)
);

--spørringer

delete * from passasjer;

delete * from fly where flyid > 188;

insert into passasjer (fornavn,etternavn) values ('ole', 'olsen');
insert into passasjer (fornavn,etternavn) values ('kari','olsen');

select * from passasjer and flytype from fly;

select l.navn from laaner inner join bok from f.navn from forfatter f
    on (l.forfatterid = f.forfatterid)
    where f.navn ~ leo