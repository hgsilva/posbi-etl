PGDMP         3            	    x            labsdw    10.14    10.14 ,               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            !           1262    17555    labsdw    DATABASE     �   CREATE DATABASE labsdw WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE labsdw;
             postgres    false            
            2615    17558    dm    SCHEMA        CREATE SCHEMA dm;
    DROP SCHEMA dm;
             postgres    false                        2615    17559    dw    SCHEMA        CREATE SCHEMA dw;
    DROP SCHEMA dw;
             postgres    false                        2615    17557    ods    SCHEMA        CREATE SCHEMA ods;
    DROP SCHEMA ods;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            "           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        2615    17556    stg    SCHEMA        CREATE SCHEMA stg;
    DROP SCHEMA stg;
             postgres    false                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            #           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    17679 	   dim_local    TABLE       CREATE TABLE dw.dim_local (
    pk_local bigint NOT NULL,
    codmun double precision,
    coduf bigint,
    regiao character varying(200),
    estado text,
    municipio text,
    v_dat_insert timestamp without time zone,
    v_dat_upt timestamp without time zone
);
    DROP TABLE dw.dim_local;
       dw         postgres    false    6            �            1259    17677    dim_local_pk_local_seq    SEQUENCE     {   CREATE SEQUENCE dw.dim_local_pk_local_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE dw.dim_local_pk_local_seq;
       dw       postgres    false    6    202            $           0    0    dim_local_pk_local_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE dw.dim_local_pk_local_seq OWNED BY dw.dim_local.pk_local;
            dw       postgres    false    201            �            1259    17909    dim_reg_saude    TABLE     �   CREATE TABLE dw.dim_reg_saude (
    pk_reg_saude bigint NOT NULL,
    codregiaosaude integer,
    nomeregiaosaude character varying(200),
    v_dat_insert timestamp without time zone,
    v_dat_upt timestamp without time zone
);
    DROP TABLE dw.dim_reg_saude;
       dw         postgres    false    6            �            1259    17907    dim_reg_saude_pk_reg_saude_seq    SEQUENCE     �   CREATE SEQUENCE dw.dim_reg_saude_pk_reg_saude_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE dw.dim_reg_saude_pk_reg_saude_seq;
       dw       postgres    false    206    6            %           0    0    dim_reg_saude_pk_reg_saude_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE dw.dim_reg_saude_pk_reg_saude_seq OWNED BY dw.dim_reg_saude.pk_reg_saude;
            dw       postgres    false    205            �            1259    17917 	   dim_tempo    TABLE     �   CREATE TABLE dw.dim_tempo (
    pk_tempo bigint NOT NULL,
    data date,
    semanaepi bigint,
    dia integer,
    mes integer,
    ano integer,
    v_dat_insert timestamp without time zone,
    v_dat_upt timestamp without time zone
);
    DROP TABLE dw.dim_tempo;
       dw         postgres    false    6            �            1259    17835    dim_tempo_gen    TABLE     �  CREATE TABLE dw.dim_tempo_gen (
    sk_data date,
    ano integer,
    mes integer,
    diasemana integer,
    diames integer,
    diaano integer,
    trimestre integer,
    semanaano integer,
    semanaanonome character varying(20),
    mesnome character varying(9),
    diasemananome character varying(7),
    nometrimestre character varying(12),
    semestre character varying(1),
    nomesemestre character varying(11)
);
    DROP TABLE dw.dim_tempo_gen;
       dw         postgres    false    6            �            1259    17915    dim_tempo_pk_tempo_seq    SEQUENCE     {   CREATE SEQUENCE dw.dim_tempo_pk_tempo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE dw.dim_tempo_pk_tempo_seq;
       dw       postgres    false    208    6            &           0    0    dim_tempo_pk_tempo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE dw.dim_tempo_pk_tempo_seq OWNED BY dw.dim_tempo.pk_tempo;
            dw       postgres    false    207            �            1259    17934 	   fat_covid    TABLE     I  CREATE TABLE dw.fat_covid (
    sk_local integer,
    sk_reg_saude integer,
    sk_tempo integer,
    populacaotcu2019 bigint,
    casosacumulado bigint,
    casosnovos bigint,
    obitosacumulado bigint,
    obitosnovos bigint,
    recuperadosnovos bigint,
    emacompanhamentonovos bigint,
    interior_metropolitana bigint
);
    DROP TABLE dw.fat_covid;
       dw         postgres    false    6            �            1259    17621 
   base_covid    TABLE       CREATE TABLE stg.base_covid (
    regiao character varying(200),
    estado character varying(2),
    municipio character varying(200),
    coduf bigint,
    codmun bigint,
    codregiaosaude bigint,
    nomeregiaosaude character varying(200),
    data timestamp without time zone,
    semanaepi bigint,
    populacaotcu2019 bigint,
    casosacumulado bigint,
    casosnovos bigint,
    obitosacumulado bigint,
    obitosnovos bigint,
    recuperadosnovos bigint,
    emacompanhamentonovos bigint,
    interior_metropolitana bigint
);
    DROP TABLE stg.base_covid;
       stg         postgres    false    11            �            1259    17827 	   tmp_tempo    TABLE     �   CREATE TABLE stg.tmp_tempo (
    dat_completa timestamp without time zone,
    dia integer,
    mes integer,
    ano integer,
    semanaepi bigint,
    v_dat_insert timestamp without time zone
);
    DROP TABLE stg.tmp_tempo;
       stg         postgres    false    11            �
           2604    17682    dim_local pk_local    DEFAULT     p   ALTER TABLE ONLY dw.dim_local ALTER COLUMN pk_local SET DEFAULT nextval('dw.dim_local_pk_local_seq'::regclass);
 =   ALTER TABLE dw.dim_local ALTER COLUMN pk_local DROP DEFAULT;
       dw       postgres    false    202    201    202            �
           2604    17912    dim_reg_saude pk_reg_saude    DEFAULT     �   ALTER TABLE ONLY dw.dim_reg_saude ALTER COLUMN pk_reg_saude SET DEFAULT nextval('dw.dim_reg_saude_pk_reg_saude_seq'::regclass);
 E   ALTER TABLE dw.dim_reg_saude ALTER COLUMN pk_reg_saude DROP DEFAULT;
       dw       postgres    false    206    205    206            �
           2604    17920    dim_tempo pk_tempo    DEFAULT     p   ALTER TABLE ONLY dw.dim_tempo ALTER COLUMN pk_tempo SET DEFAULT nextval('dw.dim_tempo_pk_tempo_seq'::regclass);
 =   ALTER TABLE dw.dim_tempo ALTER COLUMN pk_tempo DROP DEFAULT;
       dw       postgres    false    207    208    208                      0    17679 	   dim_local 
   TABLE DATA               l   COPY dw.dim_local (pk_local, codmun, coduf, regiao, estado, municipio, v_dat_insert, v_dat_upt) FROM stdin;
    dw       postgres    false    202   �0                 0    17909    dim_reg_saude 
   TABLE DATA               k   COPY dw.dim_reg_saude (pk_reg_saude, codregiaosaude, nomeregiaosaude, v_dat_insert, v_dat_upt) FROM stdin;
    dw       postgres    false    206   1                 0    17917 	   dim_tempo 
   TABLE DATA               b   COPY dw.dim_tempo (pk_tempo, data, semanaepi, dia, mes, ano, v_dat_insert, v_dat_upt) FROM stdin;
    dw       postgres    false    208   #1                 0    17835    dim_tempo_gen 
   TABLE DATA               �   COPY dw.dim_tempo_gen (sk_data, ano, mes, diasemana, diames, diaano, trimestre, semanaano, semanaanonome, mesnome, diasemananome, nometrimestre, semestre, nomesemestre) FROM stdin;
    dw       postgres    false    204   @1                 0    17934 	   fat_covid 
   TABLE DATA               �   COPY dw.fat_covid (sk_local, sk_reg_saude, sk_tempo, populacaotcu2019, casosacumulado, casosnovos, obitosacumulado, obitosnovos, recuperadosnovos, emacompanhamentonovos, interior_metropolitana) FROM stdin;
    dw       postgres    false    209   ]1                 0    17621 
   base_covid 
   TABLE DATA               
  COPY stg.base_covid (regiao, estado, municipio, coduf, codmun, codregiaosaude, nomeregiaosaude, data, semanaepi, populacaotcu2019, casosacumulado, casosnovos, obitosacumulado, obitosnovos, recuperadosnovos, emacompanhamentonovos, interior_metropolitana) FROM stdin;
    stg       postgres    false    200   z1                 0    17827 	   tmp_tempo 
   TABLE DATA               V   COPY stg.tmp_tempo (dat_completa, dia, mes, ano, semanaepi, v_dat_insert) FROM stdin;
    stg       postgres    false    203   �1       '           0    0    dim_local_pk_local_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('dw.dim_local_pk_local_seq', 1, false);
            dw       postgres    false    201            (           0    0    dim_reg_saude_pk_reg_saude_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('dw.dim_reg_saude_pk_reg_saude_seq', 1, false);
            dw       postgres    false    205            )           0    0    dim_tempo_pk_tempo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('dw.dim_tempo_pk_tempo_seq', 1, false);
            dw       postgres    false    207            �
           1259    17687    idx_dim_local_lookup    INDEX     x   CREATE INDEX idx_dim_local_lookup ON dw.dim_local USING btree (codmun, coduf, regiao, estado, municipio, v_dat_insert);
 $   DROP INDEX dw.idx_dim_local_lookup;
       dw         postgres    false    202    202    202    202    202    202            �
           1259    17686    idx_dim_local_pk    INDEX     M   CREATE UNIQUE INDEX idx_dim_local_pk ON dw.dim_local USING btree (pk_local);
     DROP INDEX dw.idx_dim_local_pk;
       dw         postgres    false    202            �
           1259    17914    idx_dim_reg_saude_lookup    INDEX     w   CREATE INDEX idx_dim_reg_saude_lookup ON dw.dim_reg_saude USING btree (codregiaosaude, nomeregiaosaude, v_dat_insert);
 (   DROP INDEX dw.idx_dim_reg_saude_lookup;
       dw         postgres    false    206    206    206            �
           1259    17913    idx_dim_reg_saude_pk    INDEX     Y   CREATE UNIQUE INDEX idx_dim_reg_saude_pk ON dw.dim_reg_saude USING btree (pk_reg_saude);
 $   DROP INDEX dw.idx_dim_reg_saude_pk;
       dw         postgres    false    206            �
           1259    17922    idx_dim_tempo_lookup    INDEX     n   CREATE INDEX idx_dim_tempo_lookup ON dw.dim_tempo USING btree (data, semanaepi, dia, mes, ano, v_dat_insert);
 $   DROP INDEX dw.idx_dim_tempo_lookup;
       dw         postgres    false    208    208    208    208    208    208            �
           1259    17921    idx_dim_tempo_pk    INDEX     M   CREATE UNIQUE INDEX idx_dim_tempo_pk ON dw.dim_tempo USING btree (pk_tempo);
     DROP INDEX dw.idx_dim_tempo_pk;
       dw         postgres    false    208                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     