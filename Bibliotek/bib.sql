--drop table bok,laaner,forfatter,eksemplar,utlaan cascade;

CREATE TABLE laaner
(
    laanerid serial primary key,
    fornavn text not null,
    etternavn text not null,
    adresse text, 
    epost text,
    tlf text,
    kjonn text
);

CREATE TABLE forfatter
(
    forfatterid serial primary key,
    fornavn text not null,
    etternavn text not null,
    fødselsdato date,
    kjonn text check (
        kjonn = 'm'
        or kjonn = 'f'
    )
);

CREATE TABLE bok
(
    bokid serial primary key,
    tittel text not null,
    isbn text,
    antallsider int check (antallsider > 0),
    publikasjonsdato date,
    spraak text,
    sjanger text,
    forfatterid int references forfatter (forfatterid)
);

CREATE TABLE eksemplar
(
    eksemplarid serial primary key,
    tillstand text,
    bokid int
);

CREATE TABLE utlaan
(
    utnlaanid serial primary key,
    utlaansdato date,
    innlevert text default 'nei'check (
        innlevert = 'ja'
        or innlevert = 'nei'
    ),
    laanerid int,
    eksemplarid int
);
 

