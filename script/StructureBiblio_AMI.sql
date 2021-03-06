--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

-- Started on 2019-05-27 13:38:18 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13241)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 207 (class 1259 OID 699868)
-- Name: auteur; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE auteur (
    id integer NOT NULL,
    intitule_auteur character varying(255),
    description_auteur character varying(600),
    lienweb character varying(255)
);


ALTER TABLE auteur OWNER TO root;

--
-- TOC entry 205 (class 1259 OID 699860)
-- Name: editeur; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE editeur (
    id integer NOT NULL,
    intitule_editeur character varying(170),
    lienweb character varying(255)
);


ALTER TABLE editeur OWNER TO root;

--
-- TOC entry 213 (class 1259 OID 699901)
-- Name: edition_ouvrage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE edition_ouvrage (
    ouvrageid integer NOT NULL,
    editeurid integer NOT NULL,
    annee_editions date
);


ALTER TABLE edition_ouvrage OWNER TO root;

--
-- TOC entry 218 (class 1259 OID 699922)
-- Name: View; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW "View" AS
 SELECT auteur.intitule_auteur,
    auteur.description_auteur,
    edition_ouvrage.ouvrageid,
    editeur.intitule_editeur,
    editeur.lienweb,
    edition_ouvrage.annee_editions
   FROM ((auteur
     CROSS JOIN editeur)
     JOIN edition_ouvrage ON ((editeur.id = edition_ouvrage.editeurid)));


ALTER TABLE "View" OWNER TO root;

--
-- TOC entry 206 (class 1259 OID 699866)
-- Name: auteur_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auteur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auteur_id_seq OWNER TO root;

--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 206
-- Name: auteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auteur_id_seq OWNED BY auteur.id;


--
-- TOC entry 209 (class 1259 OID 699879)
-- Name: bibliotheque; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE bibliotheque (
    id integer NOT NULL,
    intitulebibliotheque character varying(255),
    adresse character varying(255),
    codepostal character varying(255),
    ville character varying(255),
    telephone character varying(255)
);


ALTER TABLE bibliotheque OWNER TO root;

--
-- TOC entry 208 (class 1259 OID 699877)
-- Name: bibliotheque_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE bibliotheque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bibliotheque_id_seq OWNER TO root;

--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 208
-- Name: bibliotheque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE bibliotheque_id_seq OWNED BY bibliotheque.id;


--
-- TOC entry 201 (class 1259 OID 699838)
-- Name: coordonnees; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE coordonnees (
    id integer NOT NULL,
    rue character varying(255),
    code_postale character varying(255),
    ville character varying(255),
    telephone character varying(255),
    email character varying(255),
    lecteurid integer
);


ALTER TABLE coordonnees OWNER TO root;

--
-- TOC entry 200 (class 1259 OID 699836)
-- Name: coordonnees_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE coordonnees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE coordonnees_id_seq OWNER TO root;

--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 200
-- Name: coordonnees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE coordonnees_id_seq OWNED BY coordonnees.id;


--
-- TOC entry 204 (class 1259 OID 699858)
-- Name: editeur_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE editeur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE editeur_id_seq OWNER TO root;

--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 204
-- Name: editeur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE editeur_id_seq OWNED BY editeur.id;


--
-- TOC entry 215 (class 1259 OID 699908)
-- Name: emprunt; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE emprunt (
    id integer NOT NULL,
    date_debut date NOT NULL,
    date_fin date NOT NULL,
    date_retour_effectif date,
    renouvellement character(1),
    situation_empruntid integer NOT NULL,
    exemplaireid integer NOT NULL,
    lecteurid integer NOT NULL
);


ALTER TABLE emprunt OWNER TO root;

--
-- TOC entry 214 (class 1259 OID 699906)
-- Name: emprunt_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE emprunt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emprunt_id_seq OWNER TO root;

--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 214
-- Name: emprunt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE emprunt_id_seq OWNED BY emprunt.id;


--
-- TOC entry 217 (class 1259 OID 699916)
-- Name: exemplaire; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE exemplaire (
    id integer NOT NULL,
    referenceinterne character varying(255),
    ouvrageid integer NOT NULL,
    bibliothequeid integer NOT NULL,
    status character varying(20)
);


ALTER TABLE exemplaire OWNER TO root;

--
-- TOC entry 216 (class 1259 OID 699914)
-- Name: exemplaire_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE exemplaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE exemplaire_id_seq OWNER TO root;

--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 216
-- Name: exemplaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE exemplaire_id_seq OWNED BY exemplaire.id;


--
-- TOC entry 203 (class 1259 OID 699849)
-- Name: genre; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE genre (
    id integer NOT NULL,
    intitule_genre character varying(255),
    description_genre character varying(255),
    webographie character varying(255)
);


ALTER TABLE genre OWNER TO root;

--
-- TOC entry 202 (class 1259 OID 699847)
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_id_seq OWNER TO root;

--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 202
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE genre_id_seq OWNED BY genre.id;


--
-- TOC entry 197 (class 1259 OID 699816)
-- Name: lecteur; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE lecteur (
    id integer NOT NULL,
    identifiant character varying(255),
    nom character varying(255),
    prenom character varying(255),
    motdepasse character varying(255),
    date_inscription date,
    date_de_naissance date,
    num_cni character varying(255)
);


ALTER TABLE lecteur OWNER TO root;

--
-- TOC entry 196 (class 1259 OID 699814)
-- Name: lecteur_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE lecteur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lecteur_id_seq OWNER TO root;

--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 196
-- Name: lecteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE lecteur_id_seq OWNED BY lecteur.id;


--
-- TOC entry 199 (class 1259 OID 699827)
-- Name: ouvrage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE ouvrage (
    id integer NOT NULL,
    intitule_ouvrage character(255),
    description character varying(900),
    photo character varying(255),
    num_isbn character varying(255),
    auteurid integer NOT NULL
);


ALTER TABLE ouvrage OWNER TO root;

--
-- TOC entry 212 (class 1259 OID 699896)
-- Name: ouvrage_genre; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE ouvrage_genre (
    ouvrageid integer NOT NULL,
    genreid integer NOT NULL
);


ALTER TABLE ouvrage_genre OWNER TO root;

--
-- TOC entry 198 (class 1259 OID 699825)
-- Name: ouvrage_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE ouvrage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ouvrage_id_seq OWNER TO root;

--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 198
-- Name: ouvrage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE ouvrage_id_seq OWNED BY ouvrage.id;


--
-- TOC entry 211 (class 1259 OID 699890)
-- Name: situation_emprunt; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE situation_emprunt (
    id integer NOT NULL,
    situation character varying(255)
);


ALTER TABLE situation_emprunt OWNER TO root;

--
-- TOC entry 210 (class 1259 OID 699888)
-- Name: situation_emprunt_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE situation_emprunt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE situation_emprunt_id_seq OWNER TO root;

--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 210
-- Name: situation_emprunt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE situation_emprunt_id_seq OWNED BY situation_emprunt.id;


--
-- TOC entry 219 (class 1259 OID 699926)
-- Name: view2; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW view2 AS
 SELECT auteur.lienweb AS lienweb2,
    auteur.intitule_auteur,
    auteur.description_auteur,
    ouvrage.intitule_ouvrage
   FROM (((((auteur
     JOIN ouvrage ON ((auteur.id = ouvrage.auteurid)))
     JOIN ouvrage_genre ON ((ouvrage.id = ouvrage_genre.ouvrageid)))
     JOIN edition_ouvrage ON ((ouvrage.id = edition_ouvrage.ouvrageid)))
     JOIN genre ON ((ouvrage_genre.genreid = genre.id)))
     JOIN editeur ON ((edition_ouvrage.editeurid = editeur.id)));


ALTER TABLE view2 OWNER TO root;

--
-- TOC entry 3068 (class 2604 OID 699871)
-- Name: auteur id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auteur ALTER COLUMN id SET DEFAULT nextval('auteur_id_seq'::regclass);


--
-- TOC entry 3069 (class 2604 OID 699882)
-- Name: bibliotheque id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY bibliotheque ALTER COLUMN id SET DEFAULT nextval('bibliotheque_id_seq'::regclass);


--
-- TOC entry 3065 (class 2604 OID 699841)
-- Name: coordonnees id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY coordonnees ALTER COLUMN id SET DEFAULT nextval('coordonnees_id_seq'::regclass);


--
-- TOC entry 3067 (class 2604 OID 699863)
-- Name: editeur id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY editeur ALTER COLUMN id SET DEFAULT nextval('editeur_id_seq'::regclass);


--
-- TOC entry 3071 (class 2604 OID 699911)
-- Name: emprunt id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY emprunt ALTER COLUMN id SET DEFAULT nextval('emprunt_id_seq'::regclass);


--
-- TOC entry 3072 (class 2604 OID 699919)
-- Name: exemplaire id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY exemplaire ALTER COLUMN id SET DEFAULT nextval('exemplaire_id_seq'::regclass);


--
-- TOC entry 3066 (class 2604 OID 699852)
-- Name: genre id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY genre ALTER COLUMN id SET DEFAULT nextval('genre_id_seq'::regclass);


--
-- TOC entry 3063 (class 2604 OID 699819)
-- Name: lecteur id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY lecteur ALTER COLUMN id SET DEFAULT nextval('lecteur_id_seq'::regclass);


--
-- TOC entry 3064 (class 2604 OID 699830)
-- Name: ouvrage id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY ouvrage ALTER COLUMN id SET DEFAULT nextval('ouvrage_id_seq'::regclass);


--
-- TOC entry 3070 (class 2604 OID 699893)
-- Name: situation_emprunt id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY situation_emprunt ALTER COLUMN id SET DEFAULT nextval('situation_emprunt_id_seq'::regclass);


--
-- TOC entry 3084 (class 2606 OID 699876)
-- Name: auteur auteur_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auteur
    ADD CONSTRAINT auteur_pkey PRIMARY KEY (id);


--
-- TOC entry 3086 (class 2606 OID 699887)
-- Name: bibliotheque bibliotheque_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY bibliotheque
    ADD CONSTRAINT bibliotheque_pkey PRIMARY KEY (id);


--
-- TOC entry 3078 (class 2606 OID 699846)
-- Name: coordonnees coordonnees_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coordonnees
    ADD CONSTRAINT coordonnees_pkey PRIMARY KEY (id);


--
-- TOC entry 3082 (class 2606 OID 699865)
-- Name: editeur editeur_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY editeur
    ADD CONSTRAINT editeur_pkey PRIMARY KEY (id);


--
-- TOC entry 3092 (class 2606 OID 699905)
-- Name: edition_ouvrage edition_ouvrage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY edition_ouvrage
    ADD CONSTRAINT edition_ouvrage_pkey PRIMARY KEY (ouvrageid, editeurid);


--
-- TOC entry 3094 (class 2606 OID 699913)
-- Name: emprunt emprunt_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY emprunt
    ADD CONSTRAINT emprunt_pkey PRIMARY KEY (id);


--
-- TOC entry 3096 (class 2606 OID 699921)
-- Name: exemplaire exemplaire_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY exemplaire
    ADD CONSTRAINT exemplaire_pkey PRIMARY KEY (id);


--
-- TOC entry 3080 (class 2606 OID 699857)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 3074 (class 2606 OID 699824)
-- Name: lecteur lecteur_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY lecteur
    ADD CONSTRAINT lecteur_pkey PRIMARY KEY (id);


--
-- TOC entry 3090 (class 2606 OID 699900)
-- Name: ouvrage_genre ouvrage_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY ouvrage_genre
    ADD CONSTRAINT ouvrage_genre_pkey PRIMARY KEY (ouvrageid, genreid);


--
-- TOC entry 3076 (class 2606 OID 699835)
-- Name: ouvrage ouvrage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY ouvrage
    ADD CONSTRAINT ouvrage_pkey PRIMARY KEY (id);


--
-- TOC entry 3088 (class 2606 OID 699895)
-- Name: situation_emprunt situation_emprunt_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY situation_emprunt
    ADD CONSTRAINT situation_emprunt_pkey PRIMARY KEY (id);


--
-- TOC entry 3098 (class 2606 OID 699931)
-- Name: coordonnees detient une adresse; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coordonnees
    ADD CONSTRAINT "detient une adresse" FOREIGN KEY (lecteurid) REFERENCES lecteur(id);


--
-- TOC entry 3105 (class 2606 OID 699976)
-- Name: emprunt fkemprunt514078; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY emprunt
    ADD CONSTRAINT fkemprunt514078 FOREIGN KEY (lecteurid) REFERENCES lecteur(id);


--
-- TOC entry 3104 (class 2606 OID 699971)
-- Name: emprunt fkemprunt887790; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY emprunt
    ADD CONSTRAINT fkemprunt887790 FOREIGN KEY (exemplaireid) REFERENCES exemplaire(id);


--
-- TOC entry 3107 (class 2606 OID 699981)
-- Name: exemplaire fkexemplaire130409; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY exemplaire
    ADD CONSTRAINT fkexemplaire130409 FOREIGN KEY (bibliothequeid) REFERENCES bibliotheque(id);


--
-- TOC entry 3106 (class 2606 OID 699966)
-- Name: exemplaire fkexemplaire201131; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY exemplaire
    ADD CONSTRAINT fkexemplaire201131 FOREIGN KEY (ouvrageid) REFERENCES ouvrage(id);


--
-- TOC entry 3101 (class 2606 OID 699956)
-- Name: edition_ouvrage l'ouvrage peut etre réedité ; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY edition_ouvrage
    ADD CONSTRAINT "l'ouvrage peut etre réedité " FOREIGN KEY (ouvrageid) REFERENCES ouvrage(id);


--
-- TOC entry 3103 (class 2606 OID 699936)
-- Name: emprunt situation de l'emprunt; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY emprunt
    ADD CONSTRAINT "situation de l'emprunt" FOREIGN KEY (situation_empruntid) REFERENCES situation_emprunt(id);


--
-- TOC entry 3100 (class 2606 OID 699951)
-- Name: ouvrage_genre un genre peut appartenir a plusieurs ouvrages; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY ouvrage_genre
    ADD CONSTRAINT "un genre peut appartenir a plusieurs ouvrages" FOREIGN KEY (genreid) REFERENCES genre(id);


--
-- TOC entry 3097 (class 2606 OID 699941)
-- Name: ouvrage un ouvrage est ecrit par un auteur; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY ouvrage
    ADD CONSTRAINT "un ouvrage est ecrit par un auteur" FOREIGN KEY (auteurid) REFERENCES auteur(id);


--
-- TOC entry 3102 (class 2606 OID 699961)
-- Name: edition_ouvrage un ouvrage peut avoir plusieurs editions; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY edition_ouvrage
    ADD CONSTRAINT "un ouvrage peut avoir plusieurs editions" FOREIGN KEY (editeurid) REFERENCES editeur(id);


--
-- TOC entry 3099 (class 2606 OID 699946)
-- Name: ouvrage_genre un ouvrage peut avoir plusieurs genres; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY ouvrage_genre
    ADD CONSTRAINT "un ouvrage peut avoir plusieurs genres" FOREIGN KEY (ouvrageid) REFERENCES ouvrage(id);


-- Completed on 2019-05-27 13:38:18 CEST

--
-- PostgreSQL database dump complete
--

