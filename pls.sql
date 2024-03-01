--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pls; Type: SCHEMA; Schema: -; Owner: d79276
--

CREATE SCHEMA pls;


ALTER SCHEMA pls OWNER TO d79276;

--
-- Name: attr_type; Type: TYPE; Schema: pls; Owner: d79276
--

CREATE TYPE pls.attr_type AS ENUM (
    'string',
    'date',
    'number',
    'dict',
    'outer'
);


ALTER TYPE pls.attr_type OWNER TO d79276;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: entity; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.entity (
    entity_id integer NOT NULL,
    rentity_type_id integer
);


ALTER TABLE pls.entity OWNER TO d79276;

--
-- Name: COLUMN entity.rentity_type_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.entity.rentity_type_id IS 'ref_entity_type';


--
-- Name: entity_attr; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.entity_attr (
    entity_attr_id integer NOT NULL,
    rattr_id integer,
    entity_id integer,
    entity_attr_value character varying(255)
);


ALTER TABLE pls.entity_attr OWNER TO d79276;

--
-- Name: entity_attr_ent_attr_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.entity_attr_ent_attr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.entity_attr_ent_attr_id_seq OWNER TO d79276;

--
-- Name: entity_attr_ent_attr_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.entity_attr_ent_attr_id_seq OWNED BY pls.entity_attr.entity_attr_id;


--
-- Name: entity_ent_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.entity_ent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.entity_ent_id_seq OWNER TO d79276;

--
-- Name: entity_ent_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.entity_ent_id_seq OWNED BY pls.entity.entity_id;


--
-- Name: entity_stage; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.entity_stage (
    entity_stage_id integer NOT NULL,
    rstage_id integer
);


ALTER TABLE pls.entity_stage OWNER TO d79276;

--
-- Name: entity_stage_entity_stage_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.entity_stage_entity_stage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.entity_stage_entity_stage_id_seq OWNER TO d79276;

--
-- Name: entity_stage_entity_stage_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.entity_stage_entity_stage_id_seq OWNED BY pls.entity_stage.entity_stage_id;


--
-- Name: entity_status; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.entity_status (
    entity_status_id integer NOT NULL,
    entity_id integer,
    rstatus_id integer
);


ALTER TABLE pls.entity_status OWNER TO d79276;

--
-- Name: entity_status_entity_status_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.entity_status_entity_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.entity_status_entity_status_id_seq OWNER TO d79276;

--
-- Name: entity_status_entity_status_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.entity_status_entity_status_id_seq OWNED BY pls.entity_status.entity_status_id;


--
-- Name: ref_entity_type; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_entity_type (
    rentity_type_id integer NOT NULL,
    rentity_type_name character varying(255),
    rattr_group_id integer,
    rentity_type_label character varying(255),
    rstage_id integer
);


ALTER TABLE pls.ref_entity_type OWNER TO d79276;

--
-- Name: COLUMN ref_entity_type.rattr_group_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_entity_type.rattr_group_id IS 'текущая группа атрибутов по умолчанию для этой сущности';


--
-- Name: COLUMN ref_entity_type.rstage_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_entity_type.rstage_id IS 'с какого этапа начинается путь';


--
-- Name: entity_types_ent_type_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.entity_types_ent_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.entity_types_ent_type_id_seq OWNER TO d79276;

--
-- Name: entity_types_ent_type_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.entity_types_ent_type_id_seq OWNED BY pls.ref_entity_type.rentity_type_id;


--
-- Name: ref_attr; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_attr (
    rattr_id integer NOT NULL,
    rattr_name character varying(255),
    rattr_type pls.attr_type,
    rattr_label character varying(255),
    rattr_required boolean,
    rattr_system boolean,
    rattr_group_id integer,
    rattr_no smallint,
    rattr_view boolean
);


ALTER TABLE pls.ref_attr OWNER TO d79276;

--
-- Name: COLUMN ref_attr.rattr_label; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr.rattr_label IS 'отображаемое имя';


--
-- Name: COLUMN ref_attr.rattr_required; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr.rattr_required IS 'обязательный';


--
-- Name: COLUMN ref_attr.rattr_system; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr.rattr_system IS 'служебный';


--
-- Name: COLUMN ref_attr.rattr_group_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr.rattr_group_id IS 'группа атрибутов';


--
-- Name: COLUMN ref_attr.rattr_no; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr.rattr_no IS 'порядковый номер';


--
-- Name: COLUMN ref_attr.rattr_view; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr.rattr_view IS 'склеивать для отображения';


--
-- Name: entity_view_list; Type: VIEW; Schema: pls; Owner: d79276
--

CREATE VIEW pls.entity_view_list AS
 SELECT s.entity_id,
    string_agg((s.rattr_label)::text, ';'::text) AS attr_list,
    string_agg((s.entity_attr_value)::text, ';'::text) AS label_list
   FROM ( SELECT ent.entity_id,
            ea.entity_attr_value,
            ra.rattr_label
           FROM (((pls.entity ent
             LEFT JOIN pls.ref_entity_type ret ON ((ret.rentity_type_id = ent.rentity_type_id)))
             LEFT JOIN pls.entity_attr ea ON ((ea.entity_id = ent.entity_id)))
             LEFT JOIN pls.ref_attr ra ON ((ra.rattr_id = ea.rattr_id)))
          WHERE (ra.rattr_view = true)
          ORDER BY ent.entity_id, ra.rattr_no) s
  GROUP BY s.entity_id;


ALTER VIEW pls.entity_view_list OWNER TO d79276;

--
-- Name: ref_action; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_action (
    raction_id integer DEFAULT nextval(('pls.ref_action_raction_id_seq'::text)::regclass) NOT NULL,
    raction_name character varying(255),
    raction_label character varying(255)
);


ALTER TABLE pls.ref_action OWNER TO d79276;

--
-- Name: ref_action_raction_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.ref_action_raction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE pls.ref_action_raction_id_seq OWNER TO d79276;

--
-- Name: ref_actor; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_actor (
    ractor_id integer NOT NULL,
    ractor_auth_group_name character varying(255),
    ractor_label character varying(255)
);


ALTER TABLE pls.ref_actor OWNER TO d79276;

--
-- Name: COLUMN ref_actor.ractor_auth_group_name; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_actor.ractor_auth_group_name IS 'соответствие auth.auth_groups.name';


--
-- Name: ref_actor_ractor_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.ref_actor_ractor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.ref_actor_ractor_id_seq OWNER TO d79276;

--
-- Name: ref_actor_ractor_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.ref_actor_ractor_id_seq OWNED BY pls.ref_actor.ractor_id;


--
-- Name: ref_attr_actor; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_attr_actor (
    rattr_actor_id integer NOT NULL,
    rattr_id integer,
    ractor_id integer,
    rstage_id integer
);


ALTER TABLE pls.ref_attr_actor OWNER TO d79276;

--
-- Name: TABLE ref_attr_actor; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON TABLE pls.ref_attr_actor IS 'Какой атрибут на каком этапе может редактирвоать';


--
-- Name: COLUMN ref_attr_actor.rattr_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_actor.rattr_id IS 'какой атрибут';


--
-- Name: COLUMN ref_attr_actor.ractor_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_actor.ractor_id IS 'какой актор';


--
-- Name: COLUMN ref_attr_actor.rstage_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_actor.rstage_id IS 'на каком конкретном этапе (NULL=на всех)';


--
-- Name: ref_attr_actor_rattr_actor_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.ref_attr_actor_rattr_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.ref_attr_actor_rattr_actor_id_seq OWNER TO d79276;

--
-- Name: ref_attr_actor_rattr_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.ref_attr_actor_rattr_actor_id_seq OWNED BY pls.ref_attr_actor.rattr_actor_id;


--
-- Name: ref_attr_dict; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_attr_dict (
    rattr_dict_id integer NOT NULL,
    rattr_id integer,
    rattr_dict_no smallint,
    rattr_dict_name character varying(255),
    rattr_dict_label character varying(255)
);


ALTER TABLE pls.ref_attr_dict OWNER TO d79276;

--
-- Name: COLUMN ref_attr_dict.rattr_dict_no; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_dict.rattr_dict_no IS 'порядковый номер при отображении';


--
-- Name: COLUMN ref_attr_dict.rattr_dict_name; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_dict.rattr_dict_name IS '!! После использования нельзя редактировать. Именно это поле записывается в значения атрибутов';


--
-- Name: COLUMN ref_attr_dict.rattr_dict_label; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_dict.rattr_dict_label IS 'Отображаемый текст варианта выбора';


--
-- Name: ref_attr_dict_rattr_dict_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.ref_attr_dict_rattr_dict_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.ref_attr_dict_rattr_dict_id_seq OWNER TO d79276;

--
-- Name: ref_attr_dict_rattr_dict_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.ref_attr_dict_rattr_dict_id_seq OWNED BY pls.ref_attr_dict.rattr_dict_id;


--
-- Name: ref_attr_group; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_attr_group (
    rattr_group_id integer NOT NULL,
    rattr_group_name character varying(255),
    rattr_group_label character varying(255)
);


ALTER TABLE pls.ref_attr_group OWNER TO d79276;

--
-- Name: ref_attr_group_rag_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.ref_attr_group_rag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.ref_attr_group_rag_id_seq OWNER TO d79276;

--
-- Name: ref_attr_group_rag_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.ref_attr_group_rag_id_seq OWNED BY pls.ref_attr_group.rattr_group_id;


--
-- Name: ref_attr_outer; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_attr_outer (
    rattr_outer_id integer NOT NULL,
    rattr_id integer,
    rattr_outer_name character varying(255),
    rattr_outer_label character varying(255),
    rattr_outer_fields character varying(255),
    rattr_outer_path character varying(255),
    rattr_outer_key character varying(255),
    rattr_outer_sort character varying(255)
);


ALTER TABLE pls.ref_attr_outer OWNER TO d79276;

--
-- Name: COLUMN ref_attr_outer.rattr_outer_fields; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_outer.rattr_outer_fields IS 'какие поля показывать при выборе из справочника';


--
-- Name: COLUMN ref_attr_outer.rattr_outer_path; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_outer.rattr_outer_path IS 'где находится этот справочник';


--
-- Name: COLUMN ref_attr_outer.rattr_outer_key; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_outer.rattr_outer_key IS 'какое поле записывается в значение атрибута';


--
-- Name: COLUMN ref_attr_outer.rattr_outer_sort; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_attr_outer.rattr_outer_sort IS 'по каким полям сортируется при отображении справочника';


--
-- Name: ref_attr_outer_rattr_outer_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.ref_attr_outer_rattr_outer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.ref_attr_outer_rattr_outer_id_seq OWNER TO d79276;

--
-- Name: ref_attr_outer_rattr_outer_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.ref_attr_outer_rattr_outer_id_seq OWNED BY pls.ref_attr_outer.rattr_outer_id;


--
-- Name: ref_attr_rattr_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.ref_attr_rattr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.ref_attr_rattr_id_seq OWNER TO d79276;

--
-- Name: ref_attr_rattr_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.ref_attr_rattr_id_seq OWNED BY pls.ref_attr.rattr_id;


--
-- Name: ref_stage; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_stage (
    rstage_id integer NOT NULL,
    rstage_name character varying(255),
    rstage_label character varying(255),
    rstage_parent_id integer
);


ALTER TABLE pls.ref_stage OWNER TO d79276;

--
-- Name: COLUMN ref_stage.rstage_parent_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_stage.rstage_parent_id IS 'предшественник этого этапа (NULL=первый)';


--
-- Name: ref_stage_actor; Type: TABLE; Schema: pls; Owner: d79276
--

CREATE TABLE pls.ref_stage_actor (
    ref_stage_actor_id integer NOT NULL,
    rstage_id integer,
    ractor_id integer,
    raction_id integer
);


ALTER TABLE pls.ref_stage_actor OWNER TO d79276;

--
-- Name: COLUMN ref_stage_actor.rstage_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_stage_actor.rstage_id IS 'на каком этапе';


--
-- Name: COLUMN ref_stage_actor.ractor_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_stage_actor.ractor_id IS 'какой актор';


--
-- Name: COLUMN ref_stage_actor.raction_id; Type: COMMENT; Schema: pls; Owner: d79276
--

COMMENT ON COLUMN pls.ref_stage_actor.raction_id IS 'какое действие может выполнить';


--
-- Name: ref_stage_actor_ref_stage_actor_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.ref_stage_actor_ref_stage_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.ref_stage_actor_ref_stage_actor_id_seq OWNER TO d79276;

--
-- Name: ref_stage_actor_ref_stage_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.ref_stage_actor_ref_stage_actor_id_seq OWNED BY pls.ref_stage_actor.ref_stage_actor_id;


--
-- Name: ref_stage_rstage_id_seq; Type: SEQUENCE; Schema: pls; Owner: d79276
--

CREATE SEQUENCE pls.ref_stage_rstage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pls.ref_stage_rstage_id_seq OWNER TO d79276;

--
-- Name: ref_stage_rstage_id_seq; Type: SEQUENCE OWNED BY; Schema: pls; Owner: d79276
--

ALTER SEQUENCE pls.ref_stage_rstage_id_seq OWNED BY pls.ref_stage.rstage_id;


--
-- Name: request_view_list; Type: VIEW; Schema: pls; Owner: d79200
--

CREATE VIEW pls.request_view_list AS
 SELECT s.entity_id,
    string_agg((s.rattr_label)::text, ';'::text) AS label_list,
    string_agg((s.entity_attr_value)::text, ';'::text) AS attr_list
   FROM ( SELECT ent.entity_id,
            ea.entity_attr_value,
            ra.rattr_label
           FROM (((pls.entity ent
             LEFT JOIN pls.ref_entity_type ret ON ((ret.rentity_type_id = ent.rentity_type_id)))
             LEFT JOIN pls.entity_attr ea ON ((ea.entity_id = ent.entity_id)))
             LEFT JOIN pls.ref_attr ra ON ((ra.rattr_id = ea.rattr_id)))
          WHERE (((ret.rentity_type_name)::text = 'request'::text) AND (ra.rattr_view = true))
          ORDER BY ent.entity_id, ra.rattr_no) s
  GROUP BY s.entity_id;


ALTER VIEW pls.request_view_list OWNER TO d79200;

--
-- Name: entity entity_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.entity ALTER COLUMN entity_id SET DEFAULT nextval('pls.entity_ent_id_seq'::regclass);


--
-- Name: entity_attr entity_attr_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.entity_attr ALTER COLUMN entity_attr_id SET DEFAULT nextval('pls.entity_attr_ent_attr_id_seq'::regclass);


--
-- Name: entity_stage entity_stage_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.entity_stage ALTER COLUMN entity_stage_id SET DEFAULT nextval('pls.entity_stage_entity_stage_id_seq'::regclass);


--
-- Name: entity_status entity_status_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.entity_status ALTER COLUMN entity_status_id SET DEFAULT nextval('pls.entity_status_entity_status_id_seq'::regclass);


--
-- Name: ref_actor ractor_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_actor ALTER COLUMN ractor_id SET DEFAULT nextval('pls.ref_actor_ractor_id_seq'::regclass);


--
-- Name: ref_attr rattr_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr ALTER COLUMN rattr_id SET DEFAULT nextval('pls.ref_attr_rattr_id_seq'::regclass);


--
-- Name: ref_attr_actor rattr_actor_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr_actor ALTER COLUMN rattr_actor_id SET DEFAULT nextval('pls.ref_attr_actor_rattr_actor_id_seq'::regclass);


--
-- Name: ref_attr_dict rattr_dict_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr_dict ALTER COLUMN rattr_dict_id SET DEFAULT nextval('pls.ref_attr_dict_rattr_dict_id_seq'::regclass);


--
-- Name: ref_attr_group rattr_group_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr_group ALTER COLUMN rattr_group_id SET DEFAULT nextval('pls.ref_attr_group_rag_id_seq'::regclass);


--
-- Name: ref_attr_outer rattr_outer_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr_outer ALTER COLUMN rattr_outer_id SET DEFAULT nextval('pls.ref_attr_outer_rattr_outer_id_seq'::regclass);


--
-- Name: ref_entity_type rentity_type_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_entity_type ALTER COLUMN rentity_type_id SET DEFAULT nextval('pls.entity_types_ent_type_id_seq'::regclass);


--
-- Name: ref_stage rstage_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_stage ALTER COLUMN rstage_id SET DEFAULT nextval('pls.ref_stage_rstage_id_seq'::regclass);


--
-- Name: ref_stage_actor ref_stage_actor_id; Type: DEFAULT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_stage_actor ALTER COLUMN ref_stage_actor_id SET DEFAULT nextval('pls.ref_stage_actor_ref_stage_actor_id_seq'::regclass);


--
-- Data for Name: entity; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.entity (entity_id, rentity_type_id) FROM stdin;
4	2
3	2
1	2
5	4
6	4
\.


--
-- Data for Name: entity_attr; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.entity_attr (entity_attr_id, rattr_id, entity_id, entity_attr_value) FROM stdin;
2	1	1	Петров
5	5	1	Петр
7	6	1	07.03.1964
9	9	1	Петрович
4	1	3	Сидоров
6	5	3	Сидор
8	6	3	01.01.2000
10	9	3	Сидорович
11	7	1	Дни карьеры
12	7	3	Кандидат подразделения
13	10	5	001-23-0001
14	10	6	001-24-0002
15	14	5	05.03.2023
16	14	6	01.06.2024
\.


--
-- Data for Name: entity_stage; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.entity_stage (entity_stage_id, rstage_id) FROM stdin;
\.


--
-- Data for Name: entity_status; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.entity_status (entity_status_id, entity_id, rstatus_id) FROM stdin;
\.


--
-- Data for Name: ref_action; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_action (raction_id, raction_name, raction_label) FROM stdin;
4	rollback	Отправить на предыдущий этап
3	reject	Отклонить
2	approve	Утвердить
1	move	Отправить на следующий этап
\.


--
-- Data for Name: ref_actor; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_actor (ractor_id, ractor_auth_group_name, ractor_label) FROM stdin;
\.


--
-- Data for Name: ref_attr; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_attr (rattr_id, rattr_name, rattr_type, rattr_label, rattr_required, rattr_system, rattr_group_id, rattr_no, rattr_view) FROM stdin;
1	surname	string	Фамилия	t	f	1	1	t
5	name	string	Имя	\N	\N	1	2	t
7	source	string	Источник	\N	\N	1	5	t
9	patronymic	string	Отчество	\N	\N	1	3	t
6	birth_date	date	Дата рождения	\N	\N	1	4	t
10	request_no	string	Номер заявки	\N	\N	3	1	t
14	approve_date	date	Дата утверждения	\N	\N	3	2	t
11	division	string	Подразделение	\N	\N	3	3	\N
13	div_group	string	Структурное подразделение	\N	\N	3	4	\N
12	position_name	string	Наименование вакантной должности	\N	\N	3	5	\N
15	source	string	Источник вакансии	\N	\N	3	6	\N
\.


--
-- Data for Name: ref_attr_actor; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_attr_actor (rattr_actor_id, rattr_id, ractor_id, rstage_id) FROM stdin;
\.


--
-- Data for Name: ref_attr_dict; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_attr_dict (rattr_dict_id, rattr_id, rattr_dict_no, rattr_dict_name, rattr_dict_label) FROM stdin;
1	7	1	career_day	Дни карьеры
2	7	2	division_affilated	кандидат подразделения
\.


--
-- Data for Name: ref_attr_group; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_attr_group (rattr_group_id, rattr_group_name, rattr_group_label) FROM stdin;
1	candidate_attributes	Атрибуты кандидата
3	request_attributes	Атрибуты заявки
\.


--
-- Data for Name: ref_attr_outer; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_attr_outer (rattr_outer_id, rattr_id, rattr_outer_name, rattr_outer_label, rattr_outer_fields, rattr_outer_path, rattr_outer_key, rattr_outer_sort) FROM stdin;
\.


--
-- Data for Name: ref_entity_type; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_entity_type (rentity_type_id, rentity_type_name, rattr_group_id, rentity_type_label, rstage_id) FROM stdin;
2	candidate	1	Кандидат	\N
4	request	2	Заявка на подбор персонала	\N
\.


--
-- Data for Name: ref_stage; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_stage (rstage_id, rstage_name, rstage_label, rstage_parent_id) FROM stdin;
\.


--
-- Data for Name: ref_stage_actor; Type: TABLE DATA; Schema: pls; Owner: d79276
--

COPY pls.ref_stage_actor (ref_stage_actor_id, rstage_id, ractor_id, raction_id) FROM stdin;
\.


--
-- Name: entity_attr_ent_attr_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.entity_attr_ent_attr_id_seq', 16, true);


--
-- Name: entity_ent_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.entity_ent_id_seq', 6, true);


--
-- Name: entity_stage_entity_stage_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.entity_stage_entity_stage_id_seq', 1, false);


--
-- Name: entity_status_entity_status_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.entity_status_entity_status_id_seq', 1, false);


--
-- Name: entity_types_ent_type_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.entity_types_ent_type_id_seq', 4, true);


--
-- Name: ref_action_raction_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.ref_action_raction_id_seq', 4, true);


--
-- Name: ref_actor_ractor_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.ref_actor_ractor_id_seq', 1, false);


--
-- Name: ref_attr_actor_rattr_actor_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.ref_attr_actor_rattr_actor_id_seq', 1, false);


--
-- Name: ref_attr_dict_rattr_dict_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.ref_attr_dict_rattr_dict_id_seq', 2, true);


--
-- Name: ref_attr_group_rag_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.ref_attr_group_rag_id_seq', 3, true);


--
-- Name: ref_attr_outer_rattr_outer_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.ref_attr_outer_rattr_outer_id_seq', 1, false);


--
-- Name: ref_attr_rattr_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.ref_attr_rattr_id_seq', 15, true);


--
-- Name: ref_stage_actor_ref_stage_actor_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.ref_stage_actor_ref_stage_actor_id_seq', 1, false);


--
-- Name: ref_stage_rstage_id_seq; Type: SEQUENCE SET; Schema: pls; Owner: d79276
--

SELECT pg_catalog.setval('pls.ref_stage_rstage_id_seq', 1, false);


--
-- Name: entity_attr entity_attr_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.entity_attr
    ADD CONSTRAINT entity_attr_pkey PRIMARY KEY (entity_attr_id);


--
-- Name: entity entity_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (entity_id);


--
-- Name: entity_stage entity_stage_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.entity_stage
    ADD CONSTRAINT entity_stage_pkey PRIMARY KEY (entity_stage_id);


--
-- Name: entity_status entity_status_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.entity_status
    ADD CONSTRAINT entity_status_pkey PRIMARY KEY (entity_status_id);


--
-- Name: ref_entity_type entity_types_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_entity_type
    ADD CONSTRAINT entity_types_pkey PRIMARY KEY (rentity_type_id);


--
-- Name: ref_action ref_action_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_action
    ADD CONSTRAINT ref_action_pkey PRIMARY KEY (raction_id);


--
-- Name: ref_actor ref_actor_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_actor
    ADD CONSTRAINT ref_actor_pkey PRIMARY KEY (ractor_id);


--
-- Name: ref_attr_actor ref_attr_actor_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr_actor
    ADD CONSTRAINT ref_attr_actor_pkey PRIMARY KEY (rattr_actor_id);


--
-- Name: ref_attr_dict ref_attr_dict_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr_dict
    ADD CONSTRAINT ref_attr_dict_pkey PRIMARY KEY (rattr_dict_id);


--
-- Name: ref_attr_group ref_attr_group_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr_group
    ADD CONSTRAINT ref_attr_group_pkey PRIMARY KEY (rattr_group_id);


--
-- Name: ref_attr_outer ref_attr_outer_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr_outer
    ADD CONSTRAINT ref_attr_outer_pkey PRIMARY KEY (rattr_outer_id);


--
-- Name: ref_attr ref_attr_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_attr
    ADD CONSTRAINT ref_attr_pkey PRIMARY KEY (rattr_id);


--
-- Name: ref_stage_actor ref_stage_actor_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_stage_actor
    ADD CONSTRAINT ref_stage_actor_pkey PRIMARY KEY (ref_stage_actor_id);


--
-- Name: ref_stage ref_stage_pkey; Type: CONSTRAINT; Schema: pls; Owner: d79276
--

ALTER TABLE ONLY pls.ref_stage
    ADD CONSTRAINT ref_stage_pkey PRIMARY KEY (rstage_id);


--
-- Name: SCHEMA pls; Type: ACL; Schema: -; Owner: d79276
--

GRANT ALL ON SCHEMA pls TO please_role;


--
-- Name: TYPE attr_type; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TYPE pls.attr_type TO please_role;


--
-- Name: TABLE entity; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.entity TO please_role;


--
-- Name: TABLE entity_attr; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.entity_attr TO please_role;


--
-- Name: SEQUENCE entity_attr_ent_attr_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.entity_attr_ent_attr_id_seq TO please_role;


--
-- Name: SEQUENCE entity_ent_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.entity_ent_id_seq TO please_role;


--
-- Name: TABLE entity_stage; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.entity_stage TO please_role;


--
-- Name: SEQUENCE entity_stage_entity_stage_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.entity_stage_entity_stage_id_seq TO please_role;


--
-- Name: TABLE entity_status; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.entity_status TO please_role;


--
-- Name: SEQUENCE entity_status_entity_status_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.entity_status_entity_status_id_seq TO please_role;


--
-- Name: TABLE ref_entity_type; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_entity_type TO please_role;


--
-- Name: SEQUENCE entity_types_ent_type_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.entity_types_ent_type_id_seq TO please_role;


--
-- Name: TABLE ref_attr; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_attr TO please_role;


--
-- Name: TABLE ref_action; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_action TO please_role;


--
-- Name: SEQUENCE ref_action_raction_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.ref_action_raction_id_seq TO please_role;


--
-- Name: TABLE ref_actor; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_actor TO please_role;


--
-- Name: SEQUENCE ref_actor_ractor_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.ref_actor_ractor_id_seq TO please_role;


--
-- Name: TABLE ref_attr_actor; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_attr_actor TO please_role;


--
-- Name: SEQUENCE ref_attr_actor_rattr_actor_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT USAGE ON SEQUENCE pls.ref_attr_actor_rattr_actor_id_seq TO please_role;


--
-- Name: TABLE ref_attr_dict; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_attr_dict TO please_role;


--
-- Name: SEQUENCE ref_attr_dict_rattr_dict_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.ref_attr_dict_rattr_dict_id_seq TO please_role;


--
-- Name: TABLE ref_attr_group; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_attr_group TO please_role;


--
-- Name: SEQUENCE ref_attr_group_rag_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.ref_attr_group_rag_id_seq TO please_role;


--
-- Name: TABLE ref_attr_outer; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_attr_outer TO please_role;


--
-- Name: SEQUENCE ref_attr_outer_rattr_outer_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.ref_attr_outer_rattr_outer_id_seq TO please_role;


--
-- Name: SEQUENCE ref_attr_rattr_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.ref_attr_rattr_id_seq TO please_role;


--
-- Name: TABLE ref_stage; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_stage TO please_role;


--
-- Name: TABLE ref_stage_actor; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON TABLE pls.ref_stage_actor TO please_role;


--
-- Name: SEQUENCE ref_stage_actor_ref_stage_actor_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.ref_stage_actor_ref_stage_actor_id_seq TO please_role;


--
-- Name: SEQUENCE ref_stage_rstage_id_seq; Type: ACL; Schema: pls; Owner: d79276
--

GRANT ALL ON SEQUENCE pls.ref_stage_rstage_id_seq TO please_role;


--
-- Name: TABLE request_view_list; Type: ACL; Schema: pls; Owner: d79200
--

GRANT SELECT ON TABLE pls.request_view_list TO please_user;


--
-- PostgreSQL database dump complete
--

