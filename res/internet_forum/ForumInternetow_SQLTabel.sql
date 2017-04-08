/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     08.04.2017 22:17:02                          */
/*==============================================================*/


alter table DZIALY
   drop constraint FK_DZIALY_RELATIONS_UZYTKOWN;

alter table KOMENTARZE
   drop constraint FK_KOMENTAR_RELATIONS_UZYTKOWN;

alter table KOMENTARZE
   drop constraint FK_KOMENTAR_RELATIONS_WATEK;

alter table WATEK
   drop constraint FK_WATEK_RELATIONS_UZYTKOWN;

alter table WATEK
   drop constraint FK_WATEK_RELATIONS_DZIALY;

drop index "Relationship_1_FK";

drop table DZIALY cascade constraints;

drop index "Relationship_5_FK";

drop index "Relationship_3_FK";

drop table KOMENTARZE cascade constraints;

drop table UZYTKOWNICY cascade constraints;

drop index "Relationship_4_FK";

drop index "Relationship_2_FK";

drop table WATEK cascade constraints;

/*==============================================================*/
/* Table: DZIALY                                                */
/*==============================================================*/
create table DZIALY 
(
   ID_DZIALU            INTEGER              not null,
   ID_UZYTKOWNIKA       INTEGER              not null,
   NAZWA                VARCHAR2(150)        not null,
   constraint PK_DZIALY primary key (ID_DZIALU)
);

/*==============================================================*/
/* Index: "Relationship_1_FK"                                   */
/*==============================================================*/
create index "Relationship_1_FK" on DZIALY (
   ID_UZYTKOWNIKA ASC
);

/*==============================================================*/
/* Table: KOMENTARZE                                            */
/*==============================================================*/
create table KOMENTARZE 
(
   ID_KOMENTARZA        INTEGER              not null,
   ID_WATKU             INTEGER              not null,
   ID_UZYTKOWNIKA       INTEGER              not null,
   TRESC                CLOB                 not null,
   constraint PK_KOMENTARZE primary key (ID_KOMENTARZA)
);

/*==============================================================*/
/* Index: "Relationship_3_FK"                                   */
/*==============================================================*/
create index "Relationship_3_FK" on KOMENTARZE (
   ID_UZYTKOWNIKA ASC
);

/*==============================================================*/
/* Index: "Relationship_5_FK"                                   */
/*==============================================================*/
create index "Relationship_5_FK" on KOMENTARZE (
   ID_WATKU ASC
);

/*==============================================================*/
/* Table: UZYTKOWNICY                                           */
/*==============================================================*/
create table UZYTKOWNICY 
(
   ID_UZYTKOWNIKA       INTEGER              not null,
   NICK                 VARCHAR2(30)         not null,
   EMAIL                VARCHAR2(120),
   ADMIN                SMALLINT,
   constraint PK_UZYTKOWNICY primary key (ID_UZYTKOWNIKA)
);

/*==============================================================*/
/* Table: WATEK                                                 */
/*==============================================================*/
create table WATEK 
(
   ID_WATKU             INTEGER              not null,
   ID_DZIALU            INTEGER              not null,
   ID_UZYTKOWNIKA       INTEGER              not null,
   TYTUL                VARCHAR2(300)        not null,
   constraint PK_WATEK primary key (ID_WATKU)
);

/*==============================================================*/
/* Index: "Relationship_2_FK"                                   */
/*==============================================================*/
create index "Relationship_2_FK" on WATEK (
   ID_UZYTKOWNIKA ASC
);

/*==============================================================*/
/* Index: "Relationship_4_FK"                                   */
/*==============================================================*/
create index "Relationship_4_FK" on WATEK (
   ID_DZIALU ASC
);

alter table DZIALY
   add constraint FK_DZIALY_RELATIONS_UZYTKOWN foreign key (ID_UZYTKOWNIKA)
      references UZYTKOWNICY (ID_UZYTKOWNIKA);

alter table KOMENTARZE
   add constraint FK_KOMENTAR_RELATIONS_UZYTKOWN foreign key (ID_UZYTKOWNIKA)
      references UZYTKOWNICY (ID_UZYTKOWNIKA);

alter table KOMENTARZE
   add constraint FK_KOMENTAR_RELATIONS_WATEK foreign key (ID_WATKU)
      references WATEK (ID_WATKU);

alter table WATEK
   add constraint FK_WATEK_RELATIONS_UZYTKOWN foreign key (ID_UZYTKOWNIKA)
      references UZYTKOWNICY (ID_UZYTKOWNIKA);

alter table WATEK
   add constraint FK_WATEK_RELATIONS_DZIALY foreign key (ID_DZIALU)
      references DZIALY (ID_DZIALU);

