--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: calendar_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendar_events (
    id bigint NOT NULL,
    title character varying,
    "startDate" timestamp(6) without time zone,
    "endDate" timestamp(6) without time zone,
    color character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.calendar_events OWNER TO postgres;

--
-- Name: calendar_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calendar_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendar_events_id_seq OWNER TO postgres;

--
-- Name: calendar_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calendar_events_id_seq OWNED BY public.calendar_events.id;


--
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id bigint NOT NULL,
    name character varying,
    year integer,
    engine character varying,
    chassis character varying,
    races_won integer,
    pole_positions integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    podiums integer,
    championship_place character varying,
    battery character varying,
    horsepower integer,
    weight integer,
    fuel character varying,
    lubricants character varying,
    description character varying,
    team_slug character varying
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_id_seq OWNER TO postgres;

--
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    body text,
    post_id integer,
    author_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: devise_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devise_api_tokens (
    id bigint NOT NULL,
    resource_owner_type character varying NOT NULL,
    resource_owner_id bigint NOT NULL,
    access_token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer NOT NULL,
    revoked_at timestamp(6) without time zone,
    previous_refresh_token character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.devise_api_tokens OWNER TO postgres;

--
-- Name: devise_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devise_api_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devise_api_tokens_id_seq OWNER TO postgres;

--
-- Name: devise_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devise_api_tokens_id_seq OWNED BY public.devise_api_tokens.id;


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    id bigint NOT NULL,
    name character varying,
    age integer,
    number integer,
    height integer,
    nationality character varying,
    number_of_championships integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    number_of_wins integer,
    number_of_podiums integer,
    series_id integer,
    description text,
    team_id integer,
    slug character varying,
    team_slug character varying
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drivers_id_seq OWNER TO postgres;

--
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drivers_id_seq OWNED BY public.drivers.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id bigint NOT NULL,
    image_name character varying,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    team_slug character varying,
    description character varying,
    image_url character varying
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying,
    body text,
    author_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "like" integer DEFAULT 0
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.series (
    id bigint NOT NULL,
    name character varying,
    number_of_drivers integer,
    number_of_races integer,
    number_of_teams integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug character varying
);


ALTER TABLE public.series OWNER TO postgres;

--
-- Name: series_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_id_seq OWNER TO postgres;

--
-- Name: series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.series_id_seq OWNED BY public.series.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id bigint NOT NULL,
    name character varying,
    number_of_championships integer DEFAULT 0,
    number_of_races integer DEFAULT 0,
    headquarters_city character varying DEFAULT ''::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    technical_director character varying DEFAULT ''::character varying,
    first_win integer DEFAULT 0,
    last_championship_win integer DEFAULT 0,
    date_of_establishment integer DEFAULT 0,
    series_id integer,
    team_color character varying DEFAULT ''::character varying,
    slug character varying DEFAULT ''::character varying,
    description text DEFAULT ''::text
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying,
    country character varying,
    city character varying,
    length integer,
    turns integer,
    first_grand_prix integer,
    lap_record_in_seconds double precision,
    lap_record character varying,
    is_street_circuit boolean,
    description character varying,
    slug character varying
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracks_id_seq OWNER TO postgres;

--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    jti character varying NOT NULL,
    admin boolean DEFAULT false,
    username character varying,
    keresztnev character varying,
    vezeteknev character varying,
    fav_team character varying,
    fav_driver character varying,
    banned boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: calendar_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events ALTER COLUMN id SET DEFAULT nextval('public.calendar_events_id_seq'::regclass);


--
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: devise_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devise_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.devise_api_tokens_id_seq'::regclass);


--
-- Name: drivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers ALTER COLUMN id SET DEFAULT nextval('public.drivers_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: series id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series ALTER COLUMN id SET DEFAULT nextval('public.series_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	image	Image	167	1	2023-12-07 15:40:52.848067
3	image	Image	169	3	2023-12-14 20:17:26.529949
6	image	Image	172	6	2023-12-15 22:09:06.098578
7	image	Image	173	7	2023-12-23 09:43:55.36518
8	image	Image	174	8	2023-12-23 14:39:23.436636
9	image	Image	175	9	2023-12-23 14:44:25.100781
10	image	Image	176	10	2023-12-23 14:47:14.125252
11	image	Image	177	11	2023-12-23 14:55:27.161733
12	image	Image	178	12	2023-12-23 14:56:06.378431
13	image	Image	179	13	2023-12-23 14:56:52.373317
14	image	Image	180	14	2023-12-23 14:57:20.936066
15	image	Image	181	15	2023-12-23 14:58:33.779271
16	image	Image	182	16	2023-12-23 14:59:09.762344
17	image	Image	183	17	2023-12-23 15:00:14.113455
18	image	Image	184	18	2023-12-23 15:05:13.762881
19	image	Image	185	19	2023-12-23 15:06:54.00637
20	image	Image	186	20	2023-12-23 15:07:14.263709
21	image	Image	187	21	2023-12-23 15:09:25.984311
22	image	Image	188	22	2023-12-23 15:09:57.277098
23	image	Image	189	23	2023-12-23 15:10:30.718698
24	image	Image	190	24	2023-12-23 15:10:56.480409
25	image	Image	191	25	2023-12-23 15:11:50.288363
26	image	Image	192	26	2023-12-23 15:12:25.412335
27	image	Image	193	27	2023-12-28 13:57:35.869946
28	image	Image	194	28	2023-12-28 14:36:39.121658
29	image	Image	195	29	2023-12-28 14:47:56.129072
30	image	Image	196	30	2023-12-28 17:26:12.306757
31	image	Image	197	31	2023-12-28 17:28:06.383856
32	image	Image	198	32	2023-12-28 17:28:59.767509
33	image	Image	199	33	2023-12-28 17:31:44.87774
34	image	Image	200	34	2023-12-28 17:33:08.968402
35	image	Image	201	35	2023-12-28 17:34:08.495635
36	image	Image	202	36	2023-12-28 17:35:10.580188
37	image	Image	203	37	2023-12-28 17:36:38.312355
38	image	Image	204	38	2023-12-28 17:37:18.870055
39	image	Image	205	39	2023-12-28 17:37:58.026085
40	image	Image	206	40	2023-12-28 17:38:28.937213
41	image	Image	207	41	2023-12-28 17:39:10.042028
42	image	Image	208	42	2023-12-28 17:39:39.974585
43	image	Image	209	43	2023-12-28 17:40:09.489033
44	image	Image	210	44	2023-12-28 17:40:55.630358
45	image	Image	211	45	2023-12-28 17:41:41.766097
46	image	Image	212	46	2023-12-28 20:43:51.573183
47	image	Image	213	47	2023-12-28 20:49:51.935499
48	image	Image	214	48	2023-12-28 20:50:34.465097
49	image	Image	215	49	2023-12-28 20:51:48.391146
50	image	Image	216	50	2023-12-28 21:16:47.403149
51	image	Image	217	51	2023-12-28 21:25:24.758981
53	image	Image	219	53	2023-12-29 20:09:56.333686
54	image	Image	220	54	2023-12-29 20:10:41.80531
55	image	Image	221	55	2023-12-29 20:11:09.214516
56	image	Image	222	56	2023-12-29 20:11:55.280232
57	image	Image	223	57	2023-12-29 20:12:34.698609
58	image	Image	224	58	2023-12-29 20:14:07.80109
59	image	Image	225	59	2023-12-29 20:14:31.87301
60	image	Image	226	60	2023-12-29 20:15:23.056851
61	image	Image	227	61	2023-12-29 20:15:52.973573
62	image	Image	228	62	2023-12-29 20:17:05.456534
63	image	Image	229	63	2023-12-29 21:24:42.003655
64	image	Image	230	64	2023-12-30 10:29:39.153574
65	image	Image	231	65	2023-12-30 10:42:05.285917
66	image	Image	232	66	2023-12-30 11:02:56.952155
67	image	Image	233	67	2023-12-30 11:03:16.068374
68	image	Image	234	68	2023-12-30 11:03:35.785042
69	image	Image	235	69	2023-12-30 11:19:04.208619
70	image	Image	236	70	2023-12-30 11:19:40.714689
71	image	Image	237	71	2023-12-30 11:20:06.035699
72	image	Image	238	72	2023-12-30 11:20:28.006927
73	image	Image	239	73	2023-12-30 11:20:45.101799
74	image	Image	240	74	2023-12-30 11:21:05.780541
75	image	Image	241	75	2023-12-30 11:21:39.751066
76	image	Image	242	76	2023-12-30 11:22:02.406675
77	image	Image	243	77	2023-12-30 11:22:31.09372
78	image	Image	244	78	2023-12-30 11:23:55.072717
79	image	Image	245	79	2023-12-30 11:24:16.228497
80	image	Image	246	80	2023-12-30 11:24:36.199009
81	image	Image	247	81	2023-12-30 11:25:37.70764
82	image	Image	248	82	2023-12-30 11:25:59.593871
83	image	Image	249	83	2023-12-30 11:26:15.742955
84	image	Image	250	84	2023-12-30 11:26:45.550371
85	image	Image	251	85	2023-12-30 11:27:02.335712
86	image	Image	252	86	2023-12-30 11:27:14.916212
87	image	Image	253	87	2023-12-30 11:27:36.068844
88	image	Image	254	88	2023-12-30 11:27:53.246212
89	image	Image	255	89	2023-12-30 11:28:10.014778
90	image	Image	256	90	2023-12-30 11:28:56.363944
91	image	Image	257	91	2023-12-30 11:30:05.555962
92	image	Image	258	92	2023-12-30 11:30:29.245902
96	image	Image	262	96	2023-12-30 11:32:16.657343
97	image	Image	263	97	2023-12-30 11:32:50.600072
98	image	Image	264	98	2023-12-30 11:33:14.865054
99	image	Image	265	99	2023-12-30 11:33:31.412306
100	image	Image	266	100	2023-12-30 11:33:57.127807
101	image	Image	267	101	2023-12-30 11:34:38.232273
102	image	Image	268	102	2023-12-30 11:35:16.482824
103	image	Image	269	103	2023-12-30 11:35:39.125237
104	image	Image	270	104	2023-12-30 11:35:52.021241
105	image	Image	271	105	2023-12-30 11:36:23.135289
106	image	Image	272	106	2023-12-30 11:36:38.682264
107	image	Image	273	107	2023-12-30 11:36:56.274662
108	image	Image	274	108	2023-12-30 11:37:14.021651
109	image	Image	275	109	2023-12-30 11:37:46.375767
110	image	Image	276	110	2023-12-30 11:38:21.4971
111	image	Image	277	111	2023-12-30 11:38:42.310054
112	image	Image	278	112	2023-12-30 11:39:05.337534
113	image	Image	279	113	2023-12-30 11:39:30.662726
114	image	Image	280	114	2023-12-30 11:40:27.871904
115	image	Image	281	115	2023-12-30 11:40:51.552855
116	image	Image	282	116	2023-12-30 11:41:13.91866
117	image	Image	283	117	2023-12-30 11:41:48.132125
118	image	Image	284	118	2023-12-30 11:42:07.013728
119	image	Image	285	119	2023-12-30 11:42:24.605783
120	image	Image	286	120	2023-12-30 11:42:42.986326
121	image	Image	287	121	2023-12-30 11:43:05.917706
122	image	Image	288	122	2023-12-30 11:43:20.752989
123	image	Image	289	123	2023-12-30 11:43:35.943327
124	image	Image	290	124	2023-12-30 11:43:59.33317
125	image	Image	291	125	2023-12-30 11:44:17.985444
126	image	Image	292	126	2023-12-30 11:44:39.996358
127	image	Image	293	127	2023-12-30 11:44:58.293182
128	image	Image	294	128	2023-12-30 11:45:17.000636
129	image	Image	295	129	2023-12-30 11:45:34.77695
130	image	Image	296	130	2023-12-30 11:45:55.775878
131	image	Image	297	131	2023-12-30 11:46:09.887652
132	image	Image	298	132	2023-12-30 11:46:25.4806
133	image	Image	299	133	2023-12-30 11:46:50.955895
134	image	Image	300	134	2023-12-30 11:47:29.427517
135	image	Image	301	135	2023-12-30 11:47:45.311372
136	image	Image	302	136	2023-12-30 11:48:04.04197
137	image	Image	303	137	2023-12-30 11:49:56.510052
138	image	Image	304	138	2023-12-30 11:50:13.347766
139	image	Image	305	139	2023-12-30 11:50:31.741847
140	image	Image	306	140	2023-12-30 11:52:20.450297
141	image	Image	307	141	2023-12-30 11:53:07.161049
142	image	Image	308	142	2023-12-30 11:53:32.693972
143	image	Image	309	143	2023-12-30 11:53:55.190859
144	image	Image	310	144	2023-12-30 11:54:33.98809
145	image	Image	311	145	2023-12-30 11:55:10.347851
146	image	Image	312	146	2023-12-30 11:55:30.644036
147	image	Image	313	147	2023-12-30 11:55:56.072698
148	image	Image	314	148	2023-12-30 11:56:21.067781
149	image	Image	315	149	2023-12-30 11:56:47.167855
150	image	Image	316	150	2023-12-30 11:59:44.167404
151	image	Image	317	151	2023-12-30 12:00:08.797788
152	image	Image	318	152	2023-12-30 12:00:33.115149
153	image	Image	319	153	2023-12-30 12:00:59.303254
154	image	Image	320	154	2023-12-30 12:01:26.601262
155	image	Image	321	155	2023-12-30 12:01:50.771642
156	image	Image	322	156	2023-12-30 12:02:22.660681
157	image	Image	323	157	2023-12-30 12:02:46.853833
158	image	Image	324	158	2023-12-30 12:03:16.668616
159	image	Image	325	159	2023-12-30 12:03:51.944772
160	image	Image	326	160	2023-12-30 12:04:21.696874
161	image	Image	327	161	2023-12-30 12:04:52.144847
162	image	Image	328	162	2023-12-30 12:05:12.282779
163	image	Image	329	163	2023-12-30 12:05:37.17317
164	image	Image	330	164	2023-12-30 12:06:00.988202
165	image	Image	331	165	2023-12-30 13:03:09.240814
166	image	Image	332	166	2023-12-30 13:12:46.752049
167	image	Image	333	167	2023-12-30 13:13:53.735096
168	image	Image	334	168	2023-12-30 14:05:52.90676
169	image	Image	335	169	2023-12-30 14:06:16.246586
170	image	Image	336	170	2023-12-30 14:06:36.450899
171	image	Image	337	171	2023-12-30 14:07:02.101325
172	image	Image	338	172	2023-12-30 14:07:29.03804
173	image	Image	339	173	2023-12-30 14:07:59.679454
174	image	Image	340	174	2023-12-30 14:08:26.796634
175	image	Image	341	175	2023-12-30 14:08:48.517631
176	image	Image	342	176	2023-12-30 14:38:38.633823
177	image	Image	343	177	2023-12-30 14:40:14.798347
178	image	Image	344	178	2023-12-30 14:40:43.273986
179	image	Image	345	179	2023-12-30 14:41:11.289695
180	image	Image	346	180	2023-12-30 14:41:31.119902
181	image	Image	347	181	2023-12-30 14:41:51.511272
182	image	Image	348	182	2023-12-30 14:42:11.477501
183	image	Image	349	183	2023-12-30 14:42:33.890032
184	image	Image	350	184	2023-12-30 14:42:58.146807
185	image	Image	351	185	2023-12-30 19:41:59.477504
186	image	Image	352	186	2024-01-11 09:52:44.768233
187	image	Image	353	187	2024-01-11 10:28:32.525842
188	image	Image	354	188	2024-01-11 10:59:28.864718
189	image	Image	355	189	2024-01-11 11:02:03.90653
190	image	Image	356	190	2024-01-11 11:26:53.707222
191	image	Image	357	191	2024-01-11 11:34:35.895667
192	image	Image	358	192	2024-01-11 13:22:10.831236
193	image	Image	359	193	2024-01-11 13:24:04.669964
194	image	Image	360	194	2024-01-11 13:25:27.147797
195	image	Image	361	195	2024-01-11 13:35:27.031809
196	image	Image	362	196	2024-01-11 13:44:50.892391
197	image	Image	363	197	2024-01-11 14:16:36.056659
198	image	Image	364	198	2024-01-11 14:19:22.51516
199	image	Image	365	199	2024-01-13 10:26:13.079295
200	image	Image	366	200	2024-01-13 10:32:34.70737
201	image	Image	367	201	2024-01-13 10:38:46.878091
202	image	Image	368	202	2024-01-13 10:39:49.603466
203	image	Image	369	203	2024-01-13 10:41:43.215946
204	image	Image	370	204	2024-01-13 10:45:04.857219
205	image	Image	371	205	2024-01-13 10:47:12.11895
206	image	Image	372	206	2024-01-13 10:49:14.183036
207	image	Image	373	207	2024-01-13 10:50:36.917054
208	image	Image	374	208	2024-01-13 10:58:20.100284
209	image	Image	375	209	2024-01-13 10:59:33.459354
210	image	Image	376	210	2024-01-13 11:00:18.647999
211	image	Image	377	211	2024-01-13 11:13:47.132296
212	image	Image	378	212	2024-01-14 15:41:52.14772
213	image	Image	379	213	2024-01-14 16:04:32.418864
214	image	Image	380	214	2024-01-14 16:07:54.8578
215	image	Image	381	215	2024-01-14 16:14:06.758711
216	image	Image	382	216	2024-01-14 16:16:46.827405
217	image	Image	383	217	2024-01-14 16:20:27.733863
218	image	Image	384	218	2024-01-14 16:22:51.404366
219	image	Image	385	219	2024-01-14 16:25:46.146883
220	image	Image	386	220	2024-01-14 17:08:44.266349
221	image	Image	387	221	2024-01-14 17:10:53.275565
222	image	Image	388	222	2024-01-14 17:12:37.721059
223	image	Image	389	223	2024-01-14 17:14:40.420587
224	image	Image	390	224	2024-01-14 17:17:38.391498
225	image	Image	391	225	2024-01-14 17:19:30.950978
226	image	Image	392	226	2024-01-14 17:22:50.211635
227	image	Image	393	227	2024-01-14 17:25:06.61056
228	image	Image	394	228	2024-01-14 17:27:08.524297
229	image	Image	395	229	2024-01-14 17:30:28.081974
230	image	Image	396	230	2024-01-14 17:33:24.333121
231	image	Image	397	231	2024-01-14 17:35:29.542586
232	image	Image	398	232	2024-01-14 17:37:54.046095
233	image	Image	399	233	2024-01-14 17:39:23.387785
234	image	Image	400	234	2024-01-14 17:41:30.715969
235	image	Image	401	235	2024-01-14 17:44:16.383721
236	image	Image	402	236	2024-01-14 17:46:47.932523
237	image	Image	403	237	2024-01-14 17:48:44.150059
238	image	Image	404	238	2024-01-14 17:50:31.569301
239	image	Image	405	239	2024-01-14 17:52:11.106082
240	image	Image	406	240	2024-01-14 17:54:03.94442
241	image	Image	407	241	2024-01-15 09:54:23.939191
242	image	Image	408	242	2024-01-15 09:55:22.075479
243	image	Image	409	243	2024-01-15 09:55:52.526554
244	image	Image	410	244	2024-01-15 09:56:35.720069
245	image	Image	411	245	2024-01-15 09:57:25.202731
246	image	Image	412	246	2024-01-15 09:58:04.319337
247	image	Image	413	247	2024-01-15 09:59:07.878104
248	image	Image	414	248	2024-01-15 10:04:13.169352
249	image	Image	415	249	2024-01-15 10:05:03.349811
250	image	Image	416	250	2024-01-15 10:06:04.153427
251	image	Image	417	251	2024-01-15 10:06:28.96291
252	image	Image	418	252	2024-01-15 10:08:52.006932
253	image	Image	419	253	2024-01-15 10:09:16.133065
254	image	Image	420	254	2024-01-15 10:09:43.415216
255	image	Image	421	255	2024-01-15 10:10:14.990387
256	image	Image	422	256	2024-01-15 10:13:09.633624
257	image	Image	423	257	2024-01-17 14:36:50.684184
258	image	Image	424	258	2024-01-17 14:46:24.879337
259	image	Image	425	259	2024-01-17 14:46:52.346969
260	image	Image	426	260	2024-01-17 14:47:43.804661
261	image	Image	427	261	2024-01-17 14:48:16.72404
262	image	Image	428	262	2024-01-17 14:49:06.155131
263	image	Image	429	263	2024-01-17 14:49:33.910215
264	image	Image	430	264	2024-01-17 14:49:57.115386
265	image	Image	431	265	2024-01-17 14:50:29.709366
266	image	Image	432	266	2024-01-17 14:51:20.027596
267	image	Image	433	267	2024-01-17 14:51:50.41034
268	image	Image	434	268	2024-01-17 14:52:15.122503
269	image	Image	435	269	2024-01-17 14:52:40.869162
270	image	Image	436	270	2024-01-17 14:53:07.411078
271	image	Image	437	271	2024-01-17 14:54:09.142907
272	image	Image	438	272	2024-01-17 14:54:30.722581
273	image	Image	439	273	2024-01-17 14:54:51.48323
274	image	Image	440	274	2024-01-17 14:55:12.25883
275	image	Image	441	275	2024-01-17 14:55:33.283081
276	image	Image	442	276	2024-01-17 14:55:50.140441
277	image	Image	443	277	2024-01-17 15:58:35.432605
279	image	Image	445	279	2024-01-17 17:54:05.159987
280	image	Image	446	280	2024-01-17 17:54:51.471535
281	image	Image	447	281	2024-01-17 17:55:37.807033
282	image	Image	448	282	2024-01-17 17:56:07.054211
283	image	Image	449	283	2024-01-17 17:56:30.95538
284	image	Image	450	284	2024-01-17 17:56:52.775806
285	image	Image	451	285	2024-01-17 17:57:15.649557
286	image	Image	452	286	2024-01-17 17:57:36.586053
287	image	Image	453	287	2024-01-17 17:57:58.475275
288	image	Image	454	288	2024-01-17 17:58:24.345797
289	image	Image	455	289	2024-01-17 17:58:53.153414
290	image	Image	456	290	2024-01-17 17:59:14.31971
291	image	Image	457	291	2024-01-17 17:59:35.52004
292	image	Image	458	292	2024-01-17 17:59:57.950624
293	image	Image	459	293	2024-01-17 18:00:24.699318
294	image	Image	460	294	2024-01-17 18:00:51.404582
295	image	Image	461	295	2024-01-17 18:01:11.755866
296	image	Image	462	296	2024-01-17 18:01:36.336848
297	image	Image	463	297	2024-01-17 18:03:01.14566
298	image	Image	464	298	2024-01-17 18:03:29.891671
299	image	Image	465	299	2024-01-17 18:03:48.515617
300	image	Image	466	300	2024-01-17 18:04:32.32103
301	image	Image	467	301	2024-01-17 18:04:55.10646
302	image	Image	468	302	2024-01-17 18:05:18.839164
303	image	Image	469	303	2024-01-17 18:05:47.268104
304	image	Image	470	304	2024-01-17 18:06:09.59151
305	image	Image	471	305	2024-01-17 18:06:35.194423
329	image	Image	495	329	2024-01-17 18:31:47.256115
330	image	Image	496	330	2024-01-17 18:32:17.178545
331	image	Image	497	331	2024-01-17 18:35:06.928118
332	image	Image	498	332	2024-01-17 18:35:33.769181
333	image	Image	499	333	2024-01-17 18:35:56.967148
334	image	Image	500	334	2024-01-17 18:36:18.944684
335	image	Image	501	335	2024-01-17 18:36:37.631727
336	image	Image	502	336	2024-01-17 18:37:03.826639
337	image	Image	503	337	2024-01-17 18:37:24.208822
338	image	Image	504	338	2024-01-17 18:37:47.40311
339	image	Image	505	339	2024-01-17 18:38:24.194007
340	image	Image	506	340	2024-01-17 18:38:53.495139
341	image	Image	507	341	2024-01-17 18:39:12.544691
342	image	Image	508	342	2024-01-17 18:39:34.87666
343	image	Image	509	343	2024-01-17 18:39:57.07394
344	image	Image	510	344	2024-01-17 18:40:21.04926
345	image	Image	511	345	2024-01-17 18:40:50.692282
346	image	Image	512	346	2024-01-17 18:41:29.872505
347	image	Image	513	347	2024-01-17 18:41:55.331886
348	image	Image	514	348	2024-01-17 18:42:13.38285
349	image	Image	515	349	2024-01-17 18:42:35.462219
351	image	Image	517	351	2024-01-18 16:07:03.700093
352	image	Image	518	352	2024-01-18 21:36:41.221585
353	image	Image	519	353	2024-01-18 21:38:57.673195
354	image	Image	520	354	2024-01-18 21:43:03.339649
355	image	Image	521	355	2024-01-18 21:43:33.747176
357	image	Image	523	357	2024-01-18 21:48:11.597179
358	image	Image	524	358	2024-01-18 21:48:39.671146
359	image	Image	525	359	2024-01-18 21:49:06.914841
360	image	Image	526	360	2024-01-18 21:49:40.890768
361	image	Image	527	361	2024-01-18 21:50:17.411319
362	image	Image	528	362	2024-01-18 21:50:41.729904
363	image	Image	529	363	2024-01-18 21:51:06.987862
364	image	Image	530	364	2024-01-18 21:51:29.133871
365	image	Image	531	365	2024-01-18 22:04:29.779212
366	image	Image	532	366	2024-01-18 22:04:56.545934
367	image	Image	533	367	2024-01-18 22:05:39.209231
368	image	Image	534	368	2024-01-18 22:05:56.929009
369	image	Image	535	369	2024-01-18 22:06:31.048588
370	image	Image	536	370	2024-01-18 22:06:49.286016
372	image	Image	538	372	2024-01-18 22:07:41.93294
373	image	Image	539	373	2024-01-18 22:07:58.238863
374	image	Image	540	374	2024-01-18 22:08:13.138461
375	image	Image	541	375	2024-01-18 22:08:38.604834
376	image	Image	542	376	2024-01-18 22:08:59.197717
382	image	Image	548	382	2024-01-20 14:12:13.754772
383	image	Image	549	383	2024-01-20 19:52:36.318755
384	image	Image	550	384	2024-04-19 20:12:10.512692
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	lrzf0utkgevyoqrmvsrs6xtha0l9	alfaromeo-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	33929	femVhmR07FxF2U7GfJjPJg==	2023-12-07 15:40:52.845768
21	iyes40bx4hh1ktbaxiepfcbd1udj	ricciardo-profile.png	image/png	{"identified":true,"analyzed":true}	local	298553	YNBfQlYPY/LlBD97Md5yUA==	2023-12-23 15:09:25.981557
3	sl9aamyp3ch65nusoy1tgo4fbifd	formula1-logo.png	image/png	{"identified":true,"analyzed":true}	local	31809	sHpNJaLbbcMDwNhUzLt9ZA==	2023-12-14 20:17:26.524519
6	vhww8fce8wdlua7tbmsy2k1lvxqg	verstappen-profile.png	image/png	{"identified":true,"analyzed":true}	local	329572	sqQ53geN4YHQ69Q6CRy/3A==	2023-12-15 22:09:06.091209
7	pxeny72dl7i5h0znoyi4dh8ag8pz	formula3-logo.png	image/png	{"identified":true,"analyzed":true}	local	24448	G4Wqu/+PWcW7Y7iQweazTw==	2023-12-23 09:43:55.361425
8	k4zhri4176ytnhdktqaeiks500gs	perez-profile.png	image/png	{"identified":true,"analyzed":true}	local	282972	uWiwuvQaFuvBrJFL6kBTPw==	2023-12-23 14:39:23.433553
9	pm3y2j40xh1io6jrsq7z4p9wgt3r	sainz-profile.png	image/png	{"identified":true,"analyzed":true}	local	75517	L9jVYCVF/UZweGUBv7Kbbg==	2023-12-23 14:44:25.096392
10	nijqd0h1woilli85ouhpix9ywtkj	hamilton-profile.png	image/png	{"identified":true,"analyzed":true}	local	250913	06Kl1Zl5ZXBFtjfV39ya6A==	2023-12-23 14:47:14.121096
11	8gk6jtx81j4tvnasgg03h0jv9b2d	charles-profile.png	image/png	{"identified":true,"analyzed":true}	local	73366	0p7H8eNiy6DIU89kSv+DSw==	2023-12-23 14:55:27.159511
12	ltsvo8yyncfa9sn0uer3y7l8wm5x	russell-profile.png	image/png	{"identified":true,"analyzed":true}	local	241270	pWSe04nyP3MNW9j3NDRBzQ==	2023-12-23 14:56:06.375295
13	qs5a3pjx4t9ijz0j5cojrlrxqy91	norris-profile.png	image/png	{"identified":true,"analyzed":true}	local	72562	TRsOEq+kjmUfkYfl3LRw1A==	2023-12-23 14:56:52.37032
14	wfum0r9o10oe70uqmcrf3t5er5sm	oscar-profile.png	image/png	{"identified":true,"analyzed":true}	local	315413	CiMF+6ZFHQ6WnnfcSmNljg==	2023-12-23 14:57:20.932843
15	3tm16zqax96bo9lssus682cxv831	alonso-profile.png	image/png	{"identified":true,"analyzed":true}	local	127634	ZvRRSPgw/Z7Yt581g3FXHw==	2023-12-23 14:58:33.776349
16	y2kdxy1x1b98bj30mxv1bol0kao4	stroll-profile.png	image/png	{"identified":true,"analyzed":true}	local	333888	DhY4gb2QticmiyHCMJv1iQ==	2023-12-23 14:59:09.758059
17	k1w9n8i3csndl2rt6x17n057605f	ocon-profile.png	image/png	{"identified":true,"analyzed":true}	local	108921	pqAOo1gxqKe+561hk+zioQ==	2023-12-23 15:00:14.108987
18	tc84nmfz48bx4p5zcdc66sadryu9	pierre-profile.png	image/png	{"identified":true,"analyzed":true}	local	304721	OKxCKb9O3zmpu8/pvsE+vQ==	2023-12-23 15:05:13.759952
19	djsqcrlg1smkcwpi3hqevhf825e8	bottas-profile.png	image/png	{"identified":true,"analyzed":true}	local	271195	nYq7K2c5IHpOg1qr0lVTxQ==	2023-12-23 15:06:54.00307
20	ao9p2c6sgxwpmx954vblqt716l5a	zhou-profile.png	image/png	{"identified":true,"analyzed":true}	local	72602	kQFxm+0PKSewGTrMspftsg==	2023-12-23 15:07:14.260351
22	9a6xore1tcxwhipiggl0elc6qxb9	tsunoda-profile.png	image/png	{"identified":true,"analyzed":true}	local	288593	+zlRUfte28sPy9BuHNL57A==	2023-12-23 15:09:57.272685
23	r7wrzdy5bz1qljzgi6bkk6svuzkb	kevin-profile.png	image/png	{"identified":true,"analyzed":true}	local	74928	guBau/0FWzNeM2KICFlwTg==	2023-12-23 15:10:30.714325
24	gicp2tt63joqyilq87zuoeusxmt6	nico-profile.png	image/png	{"identified":true,"analyzed":true}	local	72053	RAOLYbeXVM7Q9nkLFada6g==	2023-12-23 15:10:56.475042
25	kvhy6n6tryeqxjhmnv5mpx04hsh7	albon-profile.png	image/png	{"identified":true,"analyzed":true}	local	74148	IsPSSw2ROZYIGR3Jc7f03A==	2023-12-23 15:11:50.28473
26	pbsqs9xja1luu1r76ogs7mmew98u	logan-profile.png	image/png	{"identified":true,"analyzed":true}	local	72627	WvpbIj+clvNI4OKyGm9png==	2023-12-23 15:12:25.409037
27	lxsl1w5vhyrkut76ciglmugj7o4o	formula1-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	39670	bsxmB6noF4wpqKkQrQr66w==	2023-12-28 13:57:35.86457
28	dqcvw1h92sfz64uf26or7kf955ft	hauger-profile.png	image/png	{"identified":true,"analyzed":true}	local	314372	BZUgq7b8UslxM3wAiqwDOw==	2023-12-28 14:36:39.117477
29	8njfeoc44ua3fmj2a1eualvpze1q	daruvala-profile.png	image/png	{"identified":true,"analyzed":true}	local	61990	8kRLnbsY+ul5xjtGKIqB5g==	2023-12-28 14:47:56.124756
30	5n9mkb1k6afbfecaggq5q8ol3ino	maloney-profile.png	image/png	{"identified":true,"analyzed":true}	local	144118	aAWW0f7ebFB71H9OiL8YYA==	2023-12-28 17:26:12.303753
31	xsibsw8lnljclxlzr41bxu9mjo42	fittipaldi-profile.png	image/png	{"identified":true,"analyzed":true}	local	40437	IOPMwloQK66ocCtbXZJ/Fw==	2023-12-28 17:28:06.380895
32	txljt3ei7tucp9lej6q1e9bgzybq	theo-profile.png	image/webp	{"identified":true,"analyzed":true}	local	102812	I5B4uIJtNwvKwLBYsHEbXQ==	2023-12-28 17:28:59.763066
33	y1556s8tkau928o3oiipwu23qht3	martins-profile.png	image/png	{"identified":true,"analyzed":true}	local	115902	0zIlbt9q5PaP+68MvWXIrw==	2023-12-28 17:31:44.86471
34	gay0bys8jpq4hydla3svqpb720ud	vesti-profile.png	image/png	{"identified":true,"analyzed":true}	local	64602	O6X/BI9FfTAsB7zLak1gaQ==	2023-12-28 17:33:08.963778
35	ot0svven6bp5hgxv2hehszi5322a	bearman-profile.png	image/png	{"identified":true,"analyzed":true}	local	145798	yPwGIp0xCxcjd5waATItcQ==	2023-12-28 17:34:08.492884
36	wu5e1ibarw525pq8o2g5w4cwc6jn	crawford-profile.png	image/png	{"identified":true,"analyzed":true}	local	42229	wMnLACgvk1OsfM2z/lM6Iw==	2023-12-28 17:35:10.576939
37	yv46xd2ffl2mved37m1yhhvlnrg4	hadjar-profile.png	image/png	{"identified":true,"analyzed":true}	local	236754	dsBCcGOsDK1fYMIMe2HWlA==	2023-12-28 17:36:38.309246
38	cdtyuivpdmrcpbuahd5cfspz92co	iwasa-profile.png	image/png	{"identified":true,"analyzed":true}	local	3171117	6VqPaKQd4dMoBIdV4fkTCg==	2023-12-28 17:37:18.866595
39	efnk2pkqoltscn6uexntclh1uk8p	leclerc-profile.png	image/png	{"identified":true,"analyzed":true}	local	111966	se5pIPOffr0zArB+h+VMtA==	2023-12-28 17:37:58.021774
40	h3tdczh3glxaliywodt1ntf9fbuc	dohaan-profile.png	image/png	{"identified":true,"analyzed":true}	local	9468077	OCnEA4Mz9wpu/HQqaO2kwA==	2023-12-28 17:38:28.935094
41	a56v6nu2fywnc5uw15phl70riq6o	cordeel-profile.png	image/png	{"identified":true,"analyzed":true}	local	315127	XbEoPa4BreCDMJWtK+Hkog==	2023-12-28 17:39:10.038743
42	7ydyxnf00w63cr1def5g2satjrqs	nissany-profile.png	image/png	{"identified":true,"analyzed":true}	local	147463	u1VpDxU5iGPusxTfVK1u0w==	2023-12-28 17:39:39.970253
43	85kuvamjuul48gncwo9aqahfa9cn	joshua-profile.png	image/png	{"identified":true,"analyzed":true}	local	119815	oLRgiPKPl2Rrb0PTFrv+uw==	2023-12-28 17:40:09.485383
44	16bzkldg50rjlex3g2quzzkujlxs	stanek-profile.png	image/png	{"identified":true,"analyzed":true}	local	455154	Edr9wTrHj6HSPw6F6qr4VQ==	2023-12-28 17:40:55.623746
45	x330sxiwhucr49b8x9pzvhow5x51	novalak-profile.png	image/png	{"identified":true,"analyzed":true}	local	11217995	BTmFVm83uxP8BlO2igc4Ug==	2023-12-28 17:41:41.763842
46	u4sh1tia91ip7w3te23f00291xrq	verschoor-profile.png	image/png	{"identified":true,"analyzed":true}	local	87819	lQzL5/bwSk1/pMN5MDEAoA==	2023-12-28 20:43:51.569512
47	dgabpmsfj8q021w7zfcqucs5q9zt	correa-profile.png	image/png	{"identified":true,"analyzed":true}	local	57612	sM7m2QdiX+QXKfT91NQAxQ==	2023-12-28 20:49:51.930948
48	opefghp4uehbkzex4la4sdqo6iti	maini-profile.png	image/png	{"identified":true,"analyzed":true}	local	129703	p1iIrensSYx9IS03nRn3Bg==	2023-12-28 20:50:34.459876
49	0pbhwnwyqkjxicuu0kjs5a9pa6yr	boschung-profile.png	image/png	{"identified":true,"analyzed":true}	local	195732	oGCAAAEG5v+FeXOEnE9ICw==	2023-12-28 20:51:48.388582
50	d3yx3e93btlk146hb8jmrwyxz45r	aron-profile.png	image/png	{"identified":true,"analyzed":true}	local	155137	fax0Ms2Succ/WhZgPJheOg==	2023-12-28 21:16:47.396982
51	womprx2a0hqmcchde1a68zrp4blc	beganovic-profile.png	image/png	{"identified":true,"analyzed":true}	local	89881	+taIRCNM7aIvkqUAGB1aPQ==	2023-12-28 21:25:24.755983
53	o7b2ty3nl0z3ikkmm5rpgsmgxsm8	ferrari-profile.png	image/png	{"identified":true,"analyzed":true}	local	242038	o1mAJ87GeftaOL+KuiFRkg==	2023-12-29 20:09:56.329407
54	mc0hihhkrxpfn37guk7egmx6dtf9	mclaren-profile.png	image/png	{"identified":true,"analyzed":true}	local	23734	V72urBZfLLO6NRSeIChXQw==	2023-12-29 20:10:41.800924
55	x6a79gfsh63bsk49be4py3v8hzbb	alpine-profile.png	image/png	{"identified":true,"analyzed":true}	local	89712	zW6I7oLzY50ADu/thi+kZQ==	2023-12-29 20:11:09.211476
56	2zqovwqpq2lrxgusw590meykly96	alfaromeo-profile.png	image/webp	{"identified":true,"analyzed":true}	local	32478	YWOIGqG7g6BGTew1clbT6A==	2023-12-29 20:11:55.276979
57	h2qmeortwph4agn4c5b1vzplgus7	mercedes-profile.png	image/png	{"identified":true,"analyzed":true}	local	256706	4qWX5WbuH2BHv5MZkj/hNg==	2023-12-29 20:12:34.695122
58	2k2ff10rj6m2f150p2lqvj3t5ukw	aston-profile.png	image/png	{"identified":true,"analyzed":true}	local	7978	PE0/+ljAV9jKEGFMCjh66g==	2023-12-29 20:14:07.797538
59	8kbhojmtzavq4ipgv8behepukjlr	redbull-profile.png	image/png	{"identified":true,"analyzed":true}	local	14756	ucBC+UDVfj4iIryEdPPFuA==	2023-12-29 20:14:31.868243
60	8qxr8b8xysd8q76rpvlqamgck3z8	alphatauri-profile.png	image/webp	{"identified":true,"analyzed":true}	local	20378	dPIchnWz21wVSfhZXDeuaA==	2023-12-29 20:15:23.053766
61	e7sxqgcvzhezwe260lojx2xb4zln	williams-profile.png	image/avif	{"identified":true,"analyzed":true}	local	30025	D+lYeyUYM6Ec+I+eYVc+yw==	2023-12-29 20:15:52.969257
62	5d7oufb3s3dx9o68pxel8tyssopz	haas-profile.png	image/png	{"identified":true,"analyzed":true}	local	97565	snBHCZqbmOTBUM0RgsVPUQ==	2023-12-29 20:17:05.452762
63	idsglgki4d18mflmt4sndkoe8ndo	red-bull-racing-1.png	image/webp	{"identified":true,"analyzed":true}	local	106130	jZMiTsbmyPijTZwaeam9lw==	2023-12-29 21:24:42.000421
64	npue3z5ektv133llqqv99c5evh3t	red-bull-racing-2.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	301644	J0n7pVBzWmgeFJUlfLFEWw==	2023-12-30 10:29:39.146508
65	mt8xb2me5bz9qnksgxs1aarczryd	red-bull-racing-3.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	90797	bmeIP0oAsAzw46Zs/sC7Fw==	2023-12-30 10:42:05.280022
66	uxac09rnntwdurq2z8klboo4f7vn	ferrari-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	37292	GD27rCESIMcoYGfN/xlA6A==	2023-12-30 11:02:56.949708
67	4z6x7eg5kho3p0sjfp5sujofhezb	ferrari-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	95883	R1iiM47Tizt6AnRkCUL84w==	2023-12-30 11:03:16.064704
68	n7u8cjbnvbvgg1xqtlwlh3h8rgsm	ferrari-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	112987	63MW0OL+fufj7U46/QQRVg==	2023-12-30 11:03:35.77995
69	6utm8ena0utjwonz5u3l43aau1xo	mercedes-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	55893	xedc1vTodWLy9hyklot+pA==	2023-12-30 11:19:04.204786
70	1kvh1b3gnio5woefvb28hp8suc5p	mercedes-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	45976	7tv8Y1MUOWjMe/qJV1O7mg==	2023-12-30 11:19:40.710744
71	2cogwigde6k2s014uo5ehgumet06	mercedes-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	28449	q0hrEwxn4JHAutZ79b8r4Q==	2023-12-30 11:20:06.032397
72	52nsqahqx3ja60w6idsv4i6g5jlo	mclaren-1.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	38224	y4dmTmbudFdM+yLg1R5MqA==	2023-12-30 11:20:28.002572
73	arljj8wo16kfo5qhta3ookeb4m4o	mclaren-2.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	66947	Sr1yxK/VPZ8xAN4DRhg4Kw==	2023-12-30 11:20:45.096205
74	bnlr3ywdz0pircoctniibeta06s5	mclaren-3.jpg	image/jpeg	{"identified":true,"analyzed":true}	local	56402	PuR646A49gqCymVoewoxwQ==	2023-12-30 11:21:05.775394
75	lf51tam388tto7djdac9zf1ftzfk	astonmartin-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	364542	FaXNWVT08EFqxf9W742vGg==	2023-12-30 11:21:39.745848
76	adz6701es0omg36uo6a8t213z5j4	astonmartin-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	100737	21G1hif8ucmVvfSDfmJ0SA==	2023-12-30 11:22:02.402041
77	o1lxy5zkdfypebevzhtvol7hlzaf	astonmartin-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	177909	s9MCl4eqsVISo6kvr4i/Yg==	2023-12-30 11:22:31.084588
78	f3w1yvgwdkqimh98id5utug8436h	alpine-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	28315	V2qi2E2XZ5OYZhARhaAgbQ==	2023-12-30 11:23:55.069341
79	a6v9ethekgnpj435da05p9czlqwi	alpine-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	37044	PDDfaIG7SIZkwg3DkX6ZNA==	2023-12-30 11:24:16.225142
80	98r3ipyeh4kz5vqy27d0pufedqxm	alpine-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	26304	31UkDyOWXadFKW0o7w7YYQ==	2023-12-30 11:24:36.195721
81	aeigcw5lv3jifmx8eksd3z3b5tns	alphatauri-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	255275	4MRhGFp4vPqqJHxSRcOahA==	2023-12-30 11:25:37.703746
82	2utpweunkf4npriin374go7jdiod	alphatauri-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	343589	vhnlkWuUzMv1SVEIk7i3sg==	2023-12-30 11:25:59.590068
83	obaon1kgrzr4vxp3qrgiu11pu25p	alphatauri-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	12161	vfMG2b4wjkLN4EYK/qp09w==	2023-12-30 11:26:15.739387
84	2sii9o9szy9wthfwlf5edeeyv5n8	alfaromeo-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	33929	femVhmR07FxF2U7GfJjPJg==	2023-12-30 11:26:45.545122
85	usr2aqe8xs4geyzadz00yky9c7le	alfaromeo-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	40462	9VCLKbTwd8EwmOUgaTOQHw==	2023-12-30 11:27:02.331345
86	o91x97y2s65vpgo8c6iapglhhh1t	alfaromeo-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	27942	7dZJy0lBdm2YX+rNUtfLug==	2023-12-30 11:27:14.91218
88	q6v8p23weoh9we5rqcts05qi2nzl	williams-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	72274	smG0vTadfjqa5k632sIkgA==	2023-12-30 11:27:53.242497
87	38m969akiztcajmueantppt77pkr	williams-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	61858	cNpfP34udT3QsEH9kJEI6Q==	2023-12-30 11:27:36.062724
89	tsyh7xdppw9gwif7r35vbyts0ka6	williams-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	66749	hwp5gppufswLlsH371kFVg==	2023-12-30 11:28:10.012024
90	wlfpnzh213hwre9ajdn13r9flyi0	haas-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	43369	czMvlt8ASzpRRTOj2o0iTQ==	2023-12-30 11:28:56.359539
91	t8beuj7hn0wvpyxg8wdqo23mv1w9	haas-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	95253	5V5IukkbN955Q8UJckNQdA==	2023-12-30 11:30:05.550905
92	j9sp0txotvadqj26oxbvrvad5mny	haas-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	101157	VCw8jzLiiw/RdPxqEAnxjg==	2023-12-30 11:30:29.24185
96	q44r0a27jew600mt7dwfw4an8j8j	mp-profile.png	image/png	{"identified":true,"analyzed":true}	local	72200	1JnRW7s4QpzONPsMHFGE3Q==	2023-12-30 11:32:16.653703
97	cy449rk8jqca66x0oks3nf60y6jl	carlin-profile.png	image/png	{"identified":true,"analyzed":true}	local	126179	uibPH2ohd3orMH1KcikCoQ==	2023-12-30 11:32:50.597226
98	nnerfpgcj16zihly6x8qt0b7x7dt	rodincarlin-1.jpeg	image/webp	{"identified":true,"analyzed":true}	local	72858	dic0Wly8mNoQ7H1hb7JSwg==	2023-12-30 11:33:14.862118
99	hubo0ztj5ycs28j3mzsx2d60sgr5	rodincarlin-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	180889	xEZqIUTaTZ7zLuYAcPLd1w==	2023-12-30 11:33:31.408821
100	uu75pru0atnfnpgfqsatve3uqwwd	rodincarlin-3.jpeg	image/webp	{"identified":true,"analyzed":true}	local	29928	KV4G0fbBPnTYX6WbD/yCBg==	2023-12-30 11:33:57.124211
101	57z9prouyech4tuq1fccfdnsvedx	art-profile.png	image/png	{"identified":true,"analyzed":true}	local	11407	a0a5VFD08A1rX+/0sKq6HQ==	2023-12-30 11:34:38.228931
102	5bz5erq40e5iwnmh92kt5k0rgcvu	art-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	137611	daxpzxSFYP3WCNf98UBjFQ==	2023-12-30 11:35:16.478763
103	ueb8fofne50g4153pn8l7fabcmxf	art-2.jpeg	image/png	{"identified":true,"analyzed":true}	local	727238	AiHmw8QRNR5ZdgG7TS2ZSw==	2023-12-30 11:35:39.121274
104	tet2ty6nhinsx9z76ty1xip0talg	art-3.jpeg	image/webp	{"identified":true,"analyzed":true}	local	53912	8PqviWA+m1kBiWUF8flv4w==	2023-12-30 11:35:52.01758
105	wzvjfb2um0h9zgxqashhtvtp8o5v	prema-profile.png	image/png	{"identified":true,"analyzed":true}	local	23493	4XLqmqNyWfxFmoTwuV+tnw==	2023-12-30 11:36:23.13089
106	ey07kjyhxv5lbuhmdqwuvs7p0tww	prema-1.jpeg	image/webp	{"identified":true,"analyzed":true}	local	128410	LmKYJuFtSSf10TurpvcPig==	2023-12-30 11:36:38.676636
107	in3ypn5todggrxjsobkqckhbbiky	prema-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	170893	5TjA1zLe9mIIZaRBh+6UDQ==	2023-12-30 11:36:56.272139
108	dgyhhfrsl1pr92de47bhyhhg737x	prema-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	394505	J7M/KlASsVkly7ciu1tDYQ==	2023-12-30 11:37:14.017318
109	dijyn4fu0pyer9hjf0243i83rfe9	hitech-profile.png	image/png	{"identified":true,"analyzed":true}	local	17279	G/tIt+ff0aeIgxzS+vnHfw==	2023-12-30 11:37:46.371994
110	neme2eorr3u1lte1rwwqewmkh5xq	hitech-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	75924	xD9l3GYy0ANOXNDvgHMwxw==	2023-12-30 11:38:21.481751
111	z0oyflyem6qgen6ydqocsbmyxxsu	hitech-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	345335	1RZ1mErPwgLmwppJ/n9Xzg==	2023-12-30 11:38:42.306353
112	g6xlrisd73d9gui9rujq44ufyqt6	hitech-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	78184	MZZO+BbjgIzGuTgHGR+YFQ==	2023-12-30 11:39:05.333438
113	1f264s073kqhd6hqb5j02e8s1cig	dams-profile.png	image/png	{"identified":true,"analyzed":true}	local	10739	MakD2j8BAr/TbOLnyq8p+A==	2023-12-30 11:39:30.65964
114	lm3kjy1lsd3hsrx117g4lzy2mf4u	dams-1.jpeg	image/webp	{"identified":true,"analyzed":true}	local	345018	eDvK3OFainmUfQUbhaAWWw==	2023-12-30 11:40:27.868275
115	5yfpsz5sfcsx0fel97egcpqv8ai3	dams-2.jpeg	image/webp	{"identified":true,"analyzed":true}	local	146722	57NUTIJ7blo2uLP66lTpXA==	2023-12-30 11:40:51.548993
116	5g599s4tl4yxe9yg02ciim6plfwf	dams-3.jpeg	image/webp	{"identified":true,"analyzed":true}	local	164042	5zzCXk/5DsmnpLplYMhvVw==	2023-12-30 11:41:13.913693
117	hgrarmw2c11rc0fq4sf2nok1tt3l	invicta-profile.png	image/png	{"identified":true,"analyzed":true}	local	45033	Mq8JN8K08xFWIEXRvU6BSA==	2023-12-30 11:41:48.128645
118	skwddmqol6cfedcf6txe3f74v5iq	invicta-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	78100	b6/gQi7r7zHbVuR6kHBQKQ==	2023-12-30 11:42:07.009678
119	24djodcrh4z9rdz6ih7l3fyx03ga	invicta-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	65089	F+GUGfNIr45sZN43QDgyuQ==	2023-12-30 11:42:24.601633
120	qxhbyb4z9h2vxfyj4z338qoqoy17	invicta-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	664021	7wrivRgLsPRmJwHfrh5RJQ==	2023-12-30 11:42:42.982879
121	ugg19lkpigh7tc6p2tuj9okc0tad	phm-profile.png	image/png	{"identified":true,"analyzed":true}	local	131823	TQa7gmmc++tz6r6R45MZ5A==	2023-12-30 11:43:05.913939
122	08sulzg853khkebujmhllteirqzo	phm-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	286261	thgvPqj2B8phh9tbYXCPIA==	2023-12-30 11:43:20.749216
123	lyc4siknwrmlvljddrh3i9wcd1p0	phm-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	75379	+qVCzpB81BOz/fkZQoyleQ==	2023-12-30 11:43:35.938165
124	02cruceaxqpuf51vcadw8uv8twkk	phm-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	1377679	yJmg0TnHIEn95fMpkKZDTQ==	2023-12-30 11:43:59.330471
125	d8gudqicq3plb7huy3pfq90d1jwy	trident-profile.png	image/png	{"identified":true,"analyzed":true}	local	114083	grmpj1voBBu5cYgV9n8i2w==	2023-12-30 11:44:17.981614
126	vwh7xv688p7jxirjy9kjpm792j4k	trident-1.jpeg	image/avif	{"identified":true,"analyzed":true}	local	116254	eB6Wym8Oll9lF5tGFk1U+A==	2023-12-30 11:44:39.991233
127	7152ivlabsoj73w9t0wrxq6bnhnd	trident-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	93796	aR66qdo6/SL0V0UHW5we+g==	2023-12-30 11:44:58.289722
128	neqve6tuacssbysxdgytfa1invwx	trident-3.jpeg	image/webp	{"identified":true,"analyzed":true}	local	27740	m0DCIlpQqlAv+cPgWS+7gA==	2023-12-30 11:45:16.996442
129	03il8x3j7vb0n6ypdvmi8jpdk7hm	var-profile.png	image/png	{"identified":true,"analyzed":true}	local	67096	eiALv4yZYB4FTh4mu0SmCg==	2023-12-30 11:45:34.773312
130	1mjbul5cbdhbj105qu3mwx3dtcaq	var-1.jpeg	image/avif	{"identified":true,"analyzed":true}	local	40021	ANEuDkdI025eA+wvbcP6UA==	2023-12-30 11:45:55.770397
131	yl0gwj11h6mf21jf4ffspawibmgk	var-2.jpeg	image/webp	{"identified":true,"analyzed":true}	local	25930	BU6lOwQn8YEC6MB15VgVUw==	2023-12-30 11:46:09.881265
132	k1nvh60qe6ncq9t7s93j8fg9c008	var-3.jpeg	image/webp	{"identified":true,"analyzed":true}	local	64048	dPPuVXkFzIGkQC4RpycGzA==	2023-12-30 11:46:25.477032
137	6rrvpr2v6yrrmxonxzxsifsv6o8b	mp-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	58753	zCIWBpXept8zEHbxLVHAKg==	2023-12-30 11:49:56.505784
138	cka7s919ttxxuy9w2s2zg2tvfud6	mp-2.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	45286	wmPaa9d8HPQZzVCqG4CDDQ==	2023-12-30 11:50:13.343965
140	0pfdjpzw1332zj94iqjropns8kg0	prema-profile.png	image/png	{"identified":true,"analyzed":true}	local	23493	4XLqmqNyWfxFmoTwuV+tnw==	2023-12-30 11:52:20.447018
143	hingq6iauslh59hiel9l4r2bacd9	mp-profile.png	image/png	{"identified":true,"analyzed":true}	local	72200	1JnRW7s4QpzONPsMHFGE3Q==	2023-12-30 11:53:55.187419
133	mwjencfmv0wtu0yhjozxwxx3quzl	campos-profile.png	image/png	{"identified":true,"analyzed":true}	local	63951	Tb3k/yxXwRlq6S0H1aRHsA==	2023-12-30 11:46:50.951646
134	9k4we5i6s1lywgv0so8hj0svtcr9	campos-1.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	101842	eNjvsbBOKp9UNAEfgL3uTQ==	2023-12-30 11:47:29.423293
135	jgp78uapvpphzyq3dtlitat0zc5m	campos-2.jpeg	image/webp	{"identified":true,"analyzed":true}	local	43746	MhKRcLfkd5rRPbxobePkpA==	2023-12-30 11:47:45.305699
136	cunz436z1slvulmju5al26740ij0	campos-3.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	267472	WSJRIi0l3WodmXTiyK/Vpg==	2023-12-30 11:48:04.038202
139	q3qhngveeevdj9908u6ydrt52cjk	mp-3.jpeg	image/png	{"identified":true,"analyzed":true}	local	1806438	fYlcAgfFkrhS4SmjB2j58g==	2023-12-30 11:50:31.737953
141	qksmhl92aptce0nmb8tru74y1cn2	trident-profile.png	image/png	{"identified":true,"analyzed":true}	local	114083	grmpj1voBBu5cYgV9n8i2w==	2023-12-30 11:53:07.158427
142	x45zjtez0zzzp79gjj8wuwnwn4r2	art-profile.png	image/png	{"identified":true,"analyzed":true}	local	11407	a0a5VFD08A1rX+/0sKq6HQ==	2023-12-30 11:53:32.688977
144	i7xvpjoc0cnx551bahb5quz80asp	hitech-profile.png	image/png	{"identified":true,"analyzed":true}	local	17279	G/tIt+ff0aeIgxzS+vnHfw==	2023-12-30 11:54:33.984339
145	e8q8wg4nvq4yiqe3z7xwbm99dmmd	var-profile.png	image/png	{"identified":true,"analyzed":true}	local	67096	eiALv4yZYB4FTh4mu0SmCg==	2023-12-30 11:55:10.344489
146	xzbg34rouqm60yluf3h50xa53ik0	carlin-profile.png	image/png	{"identified":true,"analyzed":true}	local	126179	uibPH2ohd3orMH1KcikCoQ==	2023-12-30 11:55:30.639361
147	o9ej5d4lgr3mlzlutzjkmz4hr6vq	campos-profile.png	image/png	{"identified":true,"analyzed":true}	local	63951	Tb3k/yxXwRlq6S0H1aRHsA==	2023-12-30 11:55:56.067895
148	ru2z823j2we9u237as4i5bayzy3a	jenzer-profile.png	image/png	{"identified":true,"analyzed":true}	local	14786	ojo+NyHYK/+TOX3bvKJchA==	2023-12-30 11:56:21.061447
149	4bsx6etdcrjltgte9xbvd4tdpc1p	phm-profile.png	image/png	{"identified":true,"analyzed":true}	local	131823	TQa7gmmc++tz6r6R45MZ5A==	2023-12-30 11:56:47.163041
150	mdtm16yuoqtac2fntacaoxmf9jww	sullivan-profile.png	image/png	{"identified":true,"analyzed":true}	local	76276	ncOzGbN4zszv9VsPyiq35w==	2023-12-30 11:59:44.163913
151	z2nhil250xsrf5scb80szhgvcua5	fornarolli-profile.png	image/png	{"identified":true,"analyzed":true}	local	93314	sGJsOm3OClaEuLL328QbZg==	2023-12-30 12:00:08.794368
152	dl05r6g7qa60u5abyqbmcmq7nocg	bortoleto-profile.png	image/png	{"identified":true,"analyzed":true}	local	146442	JmW10LTh6Tr8miL8Y3wa7g==	2023-12-30 12:00:33.111504
153	g1a6tr9qybbilpwzkoucxvpw9gub	goethe-profile.png	image/png	{"identified":true,"analyzed":true}	local	252181	0zz+E2kIqIDeuyv0lvCmig==	2023-12-30 12:00:59.299028
154	sgc46f8auxzfu2ozujm2m6oarog9	kaylen-profile.png	image/png	{"identified":true,"analyzed":true}	local	2189768	h4+ekS43Yrt7GZlNMwS3Vg==	2023-12-30 12:01:26.598554
155	5u2r73lkcageqm4f07hssx8y4pe3	saucy-profile.png	image/png	{"identified":true,"analyzed":true}	local	72334	gAtMvs6do4OlVn4cIrqI+A==	2023-12-30 12:01:50.767285
156	hy7jvboqx3i7y8shc5liv6cq1lp3	tsolov-profile.png	image/png	{"identified":true,"analyzed":true}	local	121108	7iNJniZ00iKBTe16Gofarg==	2023-12-30 12:02:22.656231
157	s19eko1g80jiz1jsgzw8kho4f5e6	colapinto-profile.png	image/png	{"identified":true,"analyzed":true}	local	189549	FO90R9w0EY3o8HNfKseiZQ==	2023-12-30 12:02:46.850285
158	oqda3noa46agi9cbkoamevuyzzrx	boya-profile.png	image/png	{"identified":true,"analyzed":true}	local	285359	C6WIrrbetnv1yc5lRmDVMg==	2023-12-30 12:03:16.665215
159	4z4z4qbv28lxp4ncupw11072hjr1	edgar-profile.png	image/png	{"identified":true,"analyzed":true}	local	169259	+v2s1X55wzj3ekXN44sQDA==	2023-12-30 12:03:51.939582
160	1j8j208qm0cc1i5ed7djrk5j8by3	montoya-profile.png	image/png	{"identified":true,"analyzed":true}	local	86674	BffcHKKGNNpGoWqJeBb6IA==	2023-12-30 12:04:21.693282
161	el5jt1zpt7kbmq8kb62szwc5ofb5	mini-profile.png	image/png	{"identified":true,"analyzed":true}	local	1797706	ap4C89nokdCEDniae649LQ==	2023-12-30 12:04:52.141412
162	y8lml12xcvxlco5dxtcozz0wavj4	luke-profile.png	image/png	{"identified":true,"analyzed":true}	local	155170	boWshkI6Q/JK3zUD2oScKg==	2023-12-30 12:05:12.269967
163	fazrqjet4ovtxh7ea5t5ebuwxiit	collet-profile.png	image/png	{"identified":true,"analyzed":true}	local	31205	yyUEhDgUUlKftWoKA16G3A==	2023-12-30 12:05:37.169579
164	ya6j7cr3ntnc8lvprul4g9q69bpk	rafael-profile.png	image/png	{"identified":true,"analyzed":true}	local	187244	wwhXOVjeuz/e7uKUUZASDQ==	2023-12-30 12:06:00.977381
165	asdkcp4up5dxqa6lmx16j88i0tim	max-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	72166	q/3mrm4hlt9DsTVxHsvrWA==	2023-12-30 13:03:09.236794
166	9g88p6l1402rljmn02y0pwm7s6cx	leclerc-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	176177	Si3b9r/DXuM6Zkt3TG6djA==	2023-12-30 13:12:46.748927
167	jbe4h21d96n2f4tplks1o7xg4fmy	perez-helmet.png	image/avif	{"identified":true,"analyzed":true}	local	34638	GafMXlf00eYf18saL23FXA==	2023-12-30 13:13:53.724175
168	7g2h7zs9mjli6pkztzrixg462u4d	sainz-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	47768	gde29xRLZwpd4TbNlGw4Zw==	2023-12-30 14:05:52.902581
169	xdfxi2yzv64xx9quw6as3z2xkccz	hamilton-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	776739	/4rTjsaBvVTOhHOSg7SUwg==	2023-12-30 14:06:16.244683
170	1pz39x0s0obw630m126sqo38o9an	russell-helmet.png	image/png	{"identified":true,"analyzed":true}	local	321174	AgNw7wkW3z9VJQS37j2D8Q==	2023-12-30 14:06:36.448682
171	b6uzhf2tb72pv2b1liezise0hqo2	norris-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	61089	Mo82dSvV2iQtr9u/LUcgcQ==	2023-12-30 14:07:02.096808
172	ex82ali1y2ct3o6ab251qusebcav	piastri-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	178908	CR6COuoIgyng53jZqmCrrA==	2023-12-30 14:07:29.031797
173	nah7x89vxhnz1wlpfcl8d5hqnfg2	alonso-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	55696	AieuMA7pPTST1JzS8+L1gQ==	2023-12-30 14:07:59.67545
174	d4xaf5o0e7nvkmu8eh1iyqesxr93	stroll-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	52328	gpHnrfQ6r1NuqAMjdCmEfg==	2023-12-30 14:08:26.791184
175	q52p32ln961f1a6qpvlark06fpoq	ocon-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	137871	IoGZGSwGUzDfxeTn47fK1A==	2023-12-30 14:08:48.514332
176	utgz274opm79y79xyo1u1bvdttib	gasly-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	53050	XQeJUfaJH0LMg6AEqhGBhQ==	2023-12-30 14:38:38.62964
177	uob80w9j4fjhb7zh3lj40ushcet8	bottas-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	98532	VCWy2ITHRIOy6gh/KkqoDw==	2023-12-30 14:40:14.789732
178	5a9snf95tze9dth4u1cadg2476v1	zhou-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	8858	kt0DywRDHUdA8E3NJqPh3Q==	2023-12-30 14:40:43.270617
179	jlw8gv903pho9eyw6y72lvslxp85	ricciardo-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	121921	W2ea8XbTA2qMie+twBM06w==	2023-12-30 14:41:11.284884
180	3c76grievr64szcanojvl6sokkoh	tsunoda-helmet.png	image/avif	{"identified":true,"analyzed":true}	local	62925	aqJJSL4Hj3sAnmFtUMNqVw==	2023-12-30 14:41:31.11364
181	e08ab9d7ynkqr0ockvzzhqanl4cg	magnussen-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	9567	Uk9B8CXKybID4MRlRfvgoQ==	2023-12-30 14:41:51.505977
182	c6ixbigfkg05aab6o9nmma6xo4v8	hulkenberg-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	101619	eGkhwa412UsT49vUvuTkJg==	2023-12-30 14:42:11.473713
183	geod5llbahqerq4qm7u2cee9jq10	albon-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	11946	spi23mHNzhZg7fnn2gfUEA==	2023-12-30 14:42:33.88402
184	r8py4rquclmsgv4eyjp6y71824by	sargeant-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	62398	HBQMdtZgl1TDgqNvRJFZ0Q==	2023-12-30 14:42:58.143023
185	37kqzpookgmj59okdvx67s5dx1tu	rb-19.png	image/avif	{"identified":true,"analyzed":true}	local	90495	m4sxz3gmYbMkVlm0NC0QiQ==	2023-12-30 19:41:59.472978
186	5zlluhughgnfmb0qap9copsbecpd	scuderia-ferrari-car.png	image/jpeg	{"identified":true,"analyzed":true}	local	38184	UsixFN4sjeAAyoAd4hVl2Q==	2024-01-11 09:52:44.764708
187	4qmghxyvjvplx60d4oyxabiyaw3m	mercedes-car.png	image/jpeg	{"identified":true,"analyzed":true}	local	79255	WjErnwFjGeo/8jnJlTDlSQ==	2024-01-11 10:28:32.523616
188	v9u48zvxiqmkpj20lmkdjyvv9ad5	scuderia-ferrari-car.png	image/png	{"identified":true,"analyzed":true}	local	374594	uE/Ks1sXo7367ot33SSeAg==	2024-01-11 10:59:28.862669
189	2ddake3s1cc63oumc4iwtxyciicb	mercedes-car.png	image/png	{"identified":true,"analyzed":true}	local	544715	aOrv1dMyLIslUhj39Ov5qQ==	2024-01-11 11:02:03.903037
190	3a5yycu3cs0j7opmz1nvonojwile	mclaren-car.png	image/png	{"identified":true,"analyzed":true}	local	246864	57Jmp+zikAQMBsPjN5akag==	2024-01-11 11:26:53.703362
191	kjsupd07qcx7dptbpmywkltupllc	aston-martin-car.png	image/png	{"identified":true,"analyzed":true}	local	479436	OVbP5TO+1zaqtyzTQEruuw==	2024-01-11 11:34:35.889771
192	gygz98se79ul50jpokzcoiurn8rv	alpine-car.png	image/png	{"identified":true,"analyzed":true}	local	235285	jyWEI1nOlYZ/OAh6U5ASCA==	2024-01-11 13:22:10.826513
193	pyjrg1rgzgkxwn9pclagnt2g9cx2	alphatauri-car.png	image/png	{"identified":true,"analyzed":true}	local	202298	8h9TBbb4y4gNloDD9YcXwA==	2024-01-11 13:24:04.663506
194	ebhumyldxnut2vft6g4tn3001i3b	alfa-romeo-car.png	image/png	{"identified":true,"analyzed":true}	local	239348	ZMn6B6QM+UX0kiUSNhoXfA==	2024-01-11 13:25:27.144274
195	1kyhikia9e1ogoi7z6lrjng7ooed	williams-car.png	image/png	{"identified":true,"analyzed":true}	local	238966	H1cXMj1qkfObwjkNHj+Tpg==	2024-01-11 13:35:27.02747
196	67x9h8wekzvj20976mdbsrhs6zve	haas-car.png	image/png	{"identified":true,"analyzed":true}	local	383689	DYHoyZC3TgPyRxjgI10vyw==	2024-01-11 13:44:50.888627
197	p6741lwum8cvcjfnt37hm0h7cimu	hauger-helmet.png	image/png	{"identified":true,"analyzed":true}	local	931900	L+YxSEopZWmg2QXbdAtb+A==	2024-01-11 14:16:36.053151
198	vczxfk2cg37o9r4grx5uzb7tsy48	mp-motorsport-car.png	image/png	{"identified":true,"analyzed":true}	local	672300	H2Z0F2cp4IvXMz02K3W3Zw==	2024-01-11 14:19:22.511135
199	ikqt4f6xdogii30q6o8sw3iilrnf	brendon-leigh-profile.png	image/png	{"identified":true,"analyzed":true}	local	753446	lkLyoNTznRXLI94X1yeI0w==	2024-01-13 10:26:13.074531
200	rnce0j5rrnfmbi6uqnbw5m00br3a	alfa-romeo-esport-logo.png	image/png	{"identified":true,"analyzed":true}	local	13118	eqJxLCaMWBD9D3787Z/aew==	2024-01-13 10:32:34.703872
201	n4wus587npxfcp9et4zh6oce0j0y	alpine-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	10771	R5Zkk+my2a93poCs0sudMA==	2024-01-13 10:38:46.875513
202	6f4i8789qqkvlqrx9e8k5wekkiga	aston-martin-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	18234	Xt6k385MWzOVeVQUmIVGDQ==	2024-01-13 10:39:49.600757
203	b99078hj4dn5o7vmstgevpxbceq4	mclaren-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	12467	dj2TjrlQ3OJy2h03JTzfTQ==	2024-01-13 10:41:43.212852
204	1rj7cujzrqtt70bz37ydyoi4kpyo	mercedes-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	17713	0iKorKpuV80fx7DrNtsH8g==	2024-01-13 10:45:04.852419
205	or6jkfc2pmrsjvf4j98nq0tamal9	haas-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	20873	nXZ8MnfDfrWJGQCdG4oeKg==	2024-01-13 10:47:12.111491
206	njw7238onbswiyo1jk51iwxz17qa	redbull-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	15270	YzQyb5lbKGdYwAtqQigDTw==	2024-01-13 10:49:14.178815
207	limzhacmd2h004qe6vtvm94tusrb	alphatauri-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	18402	ae6NRU+I5t9hC6+CY4berg==	2024-01-13 10:50:36.914279
208	wqtntdqy2jg44ut5rtp9li1j3s9n	ferrari-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	14652	PddKmySSC5CWqITNph2ejQ==	2024-01-13 10:58:20.094248
209	i1ff5m1rhwhrre27f976oe2b5257	williams-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	13809	XS7nFpThBnJ9Sq7RH1JEKA==	2024-01-13 10:59:33.453753
210	r4c3sgbpq5788tx10h0mnp0ubeuu	f1-esports-logo.png	image/png	{"identified":true,"analyzed":true}	local	31911	Xaz31EicPy6HEcEkwbX5Yg==	2024-01-13 11:00:18.644141
211	ibr0bg8u8xzb01r7n7mzs0zz4500	brendon-leigh-profile.png	image/png	{"identified":true,"analyzed":true}	local	714317	ojcIARYMyFzhwGn2+/ezHA==	2024-01-13 11:13:47.129739
212	icc83bwxfxribkf878or78uqt8gw	matthijs-van-erven-profile.png	image/png	{"identified":true,"analyzed":true}	local	652114	DD3v7cG1aN1gEIHvW1VBLg==	2024-01-14 15:41:52.144373
213	m7c2zse4i9p828si3el6s0sr6ppl	thomas-ronhaar-profile.png	image/png	{"identified":true,"analyzed":true}	local	681008	x8ilJ1U61M+DR9MmeyHVXQ==	2024-01-14 16:04:32.414429
214	028f2h0medzk0tvwqy3dx0cgbqi7	luke-smith-profile.png	image/png	{"identified":true,"analyzed":true}	local	708596	NpMPL4eT5DKxyD8grJXZ6Q==	2024-01-14 16:07:54.854722
215	vb0wfof4ezoiexbl88j36lr89nrn	patrik-sipos-profile.png	image/png	{"identified":true,"analyzed":true}	local	659406	JXnE8D0LaGxPOJyFmSETKQ==	2024-01-14 16:14:06.755872
216	d97cjz7p013z5nu88ukxmtajmhbs	ruben-pedreno-profile.png	image/png	{"identified":true,"analyzed":true}	local	613017	34lMR/e1iE0419GhJksr2Q==	2024-01-14 16:16:46.819944
217	eza0e3o8ew8whmsmau454lalpmlf	fabrizio-donoso-profile.png	image/png	{"identified":true,"analyzed":true}	local	677934	N6SR0WbSPyvwPhk2v+Xm5A==	2024-01-14 16:20:27.731257
218	ifbeqgnjt30ulwbzfkupb5e6rlw7	john-evans-profile.png	image/png	{"identified":true,"analyzed":true}	local	570629	QkxeBZ3IoAjv7k+HiIeP9A==	2024-01-14 16:22:51.401489
219	u80dv4pfmgwjz58hz1trn2pytzrs	simon-weigang-profile.png	image/png	{"identified":true,"analyzed":true}	local	678182	7YpzFJwjplbaZ80EdwIhag==	2024-01-14 16:25:46.143018
220	j9wqposcxjvgxkolk9ci969i95la	dani-moreno-profile.png	image/png	{"identified":true,"analyzed":true}	local	706896	e4GwsgHN0eqHqXobnUjW/w==	2024-01-14 17:08:44.262826
221	qigqd7ru53lvbq5qlqyua8a8pxwb	lucas-blakeley-profile.png	image/png	{"identified":true,"analyzed":true}	local	698823	1ii1QBAm8JYhrNivudj4LA==	2024-01-14 17:10:53.268139
222	c7zvccu57kcmjwo5o9ds7c4oies6	wilson-hughes-profile.png	image/png	{"identified":true,"analyzed":true}	local	738750	WuZRTiDmuq3fEgitX8q0BA==	2024-01-14 17:12:37.716807
223	izl1u9t2nbnv2aq0tpt1was9og88	daniel-bereznay-profile.png	image/png	{"identified":true,"analyzed":true}	local	580008	VfWrg1qMpjgMgAyw7R4kqQ==	2024-01-14 17:14:40.417324
224	xfoxpmo5kw0nq7hpka75fazgznce	jake-benham-profile.png	image/png	{"identified":true,"analyzed":true}	local	590791	dUAjKB/JEmjhYGh7k/DtUA==	2024-01-14 17:17:38.387802
225	1ieomf1w5lsosggazj1kt3kwo6ut	jarno-opmeer-profile.png	image/png	{"identified":true,"analyzed":true}	local	575650	fAPUPfZM9O5pXK5migvbGQ==	2024-01-14 17:19:30.927001
226	awfubzt58y5rkdujl9uwy6rty354	alfie-butcher-profile.png	image/png	{"identified":true,"analyzed":true}	local	637271	xcsQcrYjLvziH95mbQp+gw==	2024-01-14 17:22:50.2084
227	5ycy37z98d36anm5vfmt2wnl3tih	bence-szabo-konyi-profile.png	image/png	{"identified":true,"analyzed":true}	local	658185	LrL6j1iIMvHna/+rLDG6lg==	2024-01-14 17:25:06.607238
228	6vtr1lrg8588xu0ieg1guvm4wfod	ulas-ozyildirim-profile.png	image/png	{"identified":true,"analyzed":true}	local	639548	/vcNfLiu6ib4QqVwTIKmJw==	2024-01-14 17:27:08.520341
229	7bdp4tvli218nm6m95xu0abs53qk	frederik-rasmussen-profile.png	image/png	{"identified":true,"analyzed":true}	local	653047	TIdAR3sh1UaOm/T+4IiAPw==	2024-01-14 17:30:28.078885
230	9fjvaqqommi77ckthpktjxkim4om	josh-idowu-profile.png	image/png	{"identified":true,"analyzed":true}	local	653610	oVrB09TD2NWP4mQ5TT7k5Q==	2024-01-14 17:33:24.330221
231	x795twkvjh94d8mf34a6c7tn60io	sebastian-job-profile.png	image/png	{"identified":true,"analyzed":true}	local	714282	2KNHyZT8isdi0yAAau3rGg==	2024-01-14 17:35:29.536755
232	xrs97vrs48532i4lju1yc8nxlhmd	jed-norgrove-profile.png	image/png	{"identified":true,"analyzed":true}	local	634978	HzYSPzNHe4XzJW+jdLNNxQ==	2024-01-14 17:37:54.042508
233	gxo7mb6bl21jbdv6t0tnt7vawfdw	joni-tormala-profile.png	image/png	{"identified":true,"analyzed":true}	local	697699	1vQIman+zME2dz0/g1hBNg==	2024-01-14 17:39:23.383587
234	81d02tawpwrud4kwny6q1vfk7uew	tom-manley-profilepng.png	image/png	{"identified":true,"analyzed":true}	local	604880	/yXzrHd5tlcHcFqaA5iI3Q==	2024-01-14 17:41:30.713395
235	yfbr4kpxen2ov1iq3rgxyq8tec2p	bardia-broumand-profile.png	image/png	{"identified":true,"analyzed":true}	local	625919	rgQ7M1zPzKoyWxufhCOd0Q==	2024-01-14 17:44:16.379107
236	q90yatwxub5lj107jbeysc9d4a1a	istvan-puki-profile.png	image/png	{"identified":true,"analyzed":true}	local	656955	YhIdFFpGM1fcefxDz6xhqw==	2024-01-14 17:46:47.929073
237	3ty3bvn1hh4cdutamg3oxo1qhtqg	nicolas-longuet-profile.png	image/png	{"identified":true,"analyzed":true}	local	598154	kt0Fssx5Yf9rKLi4jEA3Eg==	2024-01-14 17:48:44.146943
238	fdvau2b4shpn11afkv77j279i2qb	alvaro-carreton-profile.png	image/png	{"identified":true,"analyzed":true}	local	748888	cCwU/r18KXVZAkcZlS3WGg==	2024-01-14 17:50:31.566738
239	1yh8j0kza4qiecf10yxbewuyclt9	ismael-fahssi-profile.png	image/png	{"identified":true,"analyzed":true}	local	710578	81RIzLaJfjE9h8jQLh4acw==	2024-01-14 17:52:11.103055
240	v9lpwop7rf943ijok8fdu1lbelop	marcel-kiefer-profile.png	image/png	{"identified":true,"analyzed":true}	local	814806	Ocb58b8sv+tzO3imIEylUg==	2024-01-14 17:54:03.940852
241	2730o21hqz9oquu97n8l3byn0f8g	beganovic-profile.png	image/png	{"identified":true,"analyzed":true}	local	89881	+taIRCNM7aIvkqUAGB1aPQ==	2024-01-15 09:54:23.934152
242	e35aid2ceubemqfh10taad4gmmzg	collet-profile.png	image/png	{"identified":true,"analyzed":true}	local	31205	yyUEhDgUUlKftWoKA16G3A==	2024-01-15 09:55:22.071161
243	gf1ukaaewx5k2ine22uytc3p7rx1	rafael-profile.png	image/png	{"identified":true,"analyzed":true}	local	187244	wwhXOVjeuz/e7uKUUZASDQ==	2024-01-15 09:55:52.52378
244	ovkxnib8lbeh7v8nfmb7gjxxdod2	smith-profile.png	image/png	{"identified":true,"analyzed":true}	local	97042	NVZplJ8ZgFIgGdlFiqBOcg==	2024-01-15 09:56:35.716268
245	u5o8b7hdmhlo382at4cq8y795cp3	gray-profile.png	image/png	{"identified":true,"analyzed":true}	local	139821	dibnXLDGDMoFt54xx+vmWg==	2024-01-15 09:57:25.198261
246	wdv5i2rn09j2etnoatrf2n5penyl	simonazzi-profile.png	image/png	{"identified":true,"analyzed":true}	local	141424	3WVe96Xe5QFUQh7tmPSuKQ==	2024-01-15 09:58:04.314601
247	0tpv05b5vql9jsbdzrvlt1tph80s	marti-profile.png	image/png	{"identified":true,"analyzed":true}	local	88652	DsfD/Vu/YP2qy07tkBWfiw==	2024-01-15 09:59:07.873825
248	8y8ci3rfhtgi4un0w2pu1mtrwmkw	cohen-profile.png	image/png	{"identified":true,"analyzed":true}	local	388195	ARPtkerK0M5rlCmwb8PdmQ==	2024-01-15 10:04:13.151638
249	tpubnk7o5u2ud3w4ym46mf15e3gy	mansell-profile.png	image/png	{"identified":true,"analyzed":true}	local	85340	cRaJ85ydXXrTpHhPVG3UEA==	2024-01-15 10:05:03.344857
250	tcssry3yf7dbu5y9hm2q30ixi707	dufek-profile.png	image/png	{"identified":true,"analyzed":true}	local	571648	CBVjl/rMzkOpmCoRpGqPqg==	2024-01-15 10:06:04.150848
251	ztkvwflfrpyri3cgkz6ziajiocmn	nikita-profile.png	image/png	{"identified":true,"analyzed":true}	local	70724	41lC5m6B9kyi/+JCcyKesg==	2024-01-15 10:06:28.958144
252	3grikui5ar7j4hu1krhmlu0atijy	garcia-profile.png	image/png	{"identified":true,"analyzed":true}	local	131284	kiJCTuJTFIKUsL8emOpq9g==	2024-01-15 10:08:52.003331
253	unh8dz36738abej22xy5xri4we03	sophia-profile.png	image/png	{"identified":true,"analyzed":true}	local	147108	sy/e/1Zc2kbUa5Nv3HSl6g==	2024-01-15 10:09:16.129141
254	d7hkpvei9q6xgj1isxxycj7esetu	roberto-profile.png	image/png	{"identified":true,"analyzed":true}	local	215548	/wK5KsOaVEtvAkQouAhtnw==	2024-01-15 10:09:43.41059
255	jlzzcaip05lnkpi7adqnjgsrgc48	shin-profile.png	image/png	{"identified":true,"analyzed":true}	local	89021	kI+gja6uBeAiv7tmEPoTUw==	2024-01-15 10:10:14.984347
256	neha2lmb9wsca47o2y7clt9h1a5i	barnard-profile.png	image/png	{"identified":true,"analyzed":true}	local	2418783	af+v7Bv4JevpGjqu+s3kMA==	2024-01-15 10:13:09.631356
257	5z5esc57l8ejvjtjx6mttj2vp07u	daruvala-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	11002	DZuTTwz4yZmWbq+TIj0Mzw==	2024-01-17 14:36:50.676985
258	t208ae394gkadavx6jncxs9eiyvf	maloney-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	11062	oo/4KEpnHGbNcuI0u7JVcA==	2024-01-17 14:46:24.874519
259	z0mqyrszg847axlwya8dddf6bpwt	fittipaldi-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	10717	6yxrJoWxG0wbTGoEJkLefg==	2024-01-17 14:46:52.342808
260	95zkvupdbq31gfv93c0wmb4m6msg	theo-helmet.jpeg	image/png	{"identified":true,"analyzed":true}	local	980861	wi/A+kRbf97pD7tS71M9Pg==	2024-01-17 14:47:43.802002
261	guguxzi438gh679nvjwcd33wexm2	martins-helmet.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	11063	SYidMaOI93aJtJk1NuntYw==	2024-01-17 14:48:16.719631
262	em5nhhyonpjt66h8a88uaen0v33d	vesti-helmet.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	9535	yKfggjCH18e5JQVV5Ys4Ow==	2024-01-17 14:49:06.148618
263	qqx1v44uubu6rxfkh3vb7mjrjso0	bearman-helmet.jpeg	image/png	{"identified":true,"analyzed":true}	local	819224	FWXYMHWP4hPpZoV0/us7Xw==	2024-01-17 14:49:33.905536
264	55xmpj3p5epexxcwksxjvxdau8e6	crawford-helmet.jpeg	image/png	{"identified":true,"analyzed":true}	local	923137	WKLh79heSxrXYEucja3SXQ==	2024-01-17 14:49:57.112474
265	wnezelceedsb6qtpn5fctl36hlp4	hadjar-helmet.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	10851	9tEEgeIEfHX5DDcdyBJGww==	2024-01-17 14:50:29.705371
266	y6g2ss6afaezmpxjgkd0pwhtywpi	iwasa-helmet.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	11079	aRF/GqawOfshhkOFhcABqA==	2024-01-17 14:51:20.022925
267	i46wncrfqf0b29hzjgg141u5c63k	arthurt-helmet.jpeg	image/png	{"identified":true,"analyzed":true}	local	955284	DCRguxsThB6yL1X5y0irZQ==	2024-01-17 14:51:50.4081
268	afcq18nl4rx63t7qfv621z6wpkeh	doohan-helmet.jpeg	image/webp	{"identified":true,"analyzed":true}	local	14070	/5c1H/vDk0Mthn1VEnb1vA==	2024-01-17 14:52:15.11851
269	l3ky3pjbw1fvrwrm5x6m2f9cfqze	cordeel-helmet.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	8692	PafCbd0V0GUutKjmHfcPfA==	2024-01-17 14:52:40.866055
270	nne0gc93wx4ug3x5d09aqxr85h6i	nissany-helmet.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	10765	0L9eRDcYUvFC7ixr0PfBBg==	2024-01-17 14:53:07.407567
271	jbgmn6b16uu6opm6kcp0wmg4d1bo	stanek-helmet.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	9265	d0JgGXfO+dNLaE1PW0WdLA==	2024-01-17 14:54:09.139145
272	5tcv45wdweiq7j65a7n6swj4x0b4	novalak-helmet.jpeg	image/png	{"identified":true,"analyzed":true}	local	930740	rMvabCmmc2Ew47C0jKd0nQ==	2024-01-17 14:54:30.718773
273	zyfhc4mdgv3msn68wyrwvuwlu2xt	verschoor-helmet.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	11691	9Gw2V1/ZlRsAQERKvlYuyg==	2024-01-17 14:54:51.480282
274	in4gbrihknenwo137w4lbb6r7pp6	correa-helmet.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	9578	x1rAwr64/zezkJ8qp+Q7XQ==	2024-01-17 14:55:12.254659
275	f96lrtigp7mkmnc49m62pa3wbh6j	maini-helmet.jpeg	image/png	{"identified":true,"analyzed":true}	local	968064	ab9dRQ0AjIU7vKQ0D5X68A==	2024-01-17 14:55:33.279963
276	i1n2h6u8u1zi1nu82y1sbt08uyql	boschung-helmet.jpeg	image/png	{"identified":true,"analyzed":true}	local	658380	0yc/iWTtoMTYbndGFcRTFw==	2024-01-17 14:55:50.135008
277	pxjhx0kisk8co846926gikd8a7h2	beganovic-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	12908	4UtQBpfEFeIvRJCN+qh23g==	2024-01-17 15:58:35.428248
279	p3562nimy75pfjsho5ky2c84n0au	aron-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	14914	nfylwGqRiPH00zzFZRuOsA==	2024-01-17 17:54:05.155285
280	hgq82ig750j9l06a5fz4kn8ivmvf	beganovic-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	12908	4UtQBpfEFeIvRJCN+qh23g==	2024-01-17 17:54:51.467421
281	6ynopc8r2t1p9mxfopigcr2glwy9	sullivan-helmet.png	image/png	{"identified":true,"analyzed":true}	local	891067	4eqcOR6HpNyTLK0XD5f/YQ==	2024-01-17 17:55:37.80157
282	4ttionp9blxp55z1yp8x4imv1vch	fornaroli-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	10276	nU4lhlaVvASI2A9K6zFmvA==	2024-01-17 17:56:07.050467
283	wmb5k1bngaup3dpql8bkmwwwpv3s	bortoleto-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	11594	gK0UNiBIbcNbHFTKHCAvNg==	2024-01-17 17:56:30.950684
284	gpw3s9qemusykl7a7dy047kld9y9	goethe-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	9478	R0/qq0ub0DFTXbO6xihpQQ==	2024-01-17 17:56:52.771194
285	fj580q6qfvb5j86a5gdokzqhnd45	frederik-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	7741	KMAgMnR5xp5CYKE1s9X7rg==	2024-01-17 17:57:15.640418
286	km6abeus9wxpmbrmu9qaoehhroku	saucy-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	10301	BUVUrNoVVAcpPSxXJIdaUA==	2024-01-17 17:57:36.582499
287	qubkvdc0klxnvlc3jwow2q8j0l2f	tsolov-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	7620	aJlOFuivM4loaoywprLjtg==	2024-01-17 17:57:58.470995
288	snwzk4605ynvgqzua8ftzaorb9ut	colapinto-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	9153	9bfT1Vk2h66YUmOogzv3ZA==	2024-01-17 17:58:24.340951
289	xie6278n37aor2srj23qawgplcpp	boya-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	11983	URfQArwX9pjrk6QIA1Zr3A==	2024-01-17 17:58:53.149583
290	oynrd1nkafdvhlbwns7cq4czdd6u	edgar-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	10237	3+YYW7lUpUy+cAbzkcRqRQ==	2024-01-17 17:59:14.317541
291	grkccwrjg2bfozxgiexlv8gik7jr	montoya-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	10594	IvP851dp3ppVK6VnUDVMZA==	2024-01-17 17:59:35.516271
292	sozrpjdiede5curfsa4nwd5t6va9	maini-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	12252	b4e7tAcWHVHqObfkChdwdw==	2024-01-17 17:59:57.946206
293	sncx8cl7c4e1g0hk91x8iqn3d94x	browning-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	9424	OSKXifGnYW1IM/8/BVsyaA==	2024-01-17 18:00:24.693525
294	cvtobaf0nfaxf5c6f4gcbqtm57j0	collet-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	10901	ZgvzjlhuXFdGaDAL7vpXPA==	2024-01-17 18:00:51.400556
295	1lwnzkxtnqbdk6fwf5y66fp2bbbf	villagomez-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	9093	LL0QAG/JWQuOnM3/KkZxcQ==	2024-01-17 18:01:11.750429
296	1m303oboxds52380q0dc9m4hihtm	gray-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	9018	DqXJYSi90bgf0Y+CkKHkYw==	2024-01-17 18:01:36.333506
297	m6k3qvsmxv1x1oloe14ie62hs4sr	simonazzi-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	10635	U7uzQ2SfAuoLOpvSFzvnPA==	2024-01-17 18:03:01.139109
298	9u8t9gi4b8la1coffzwg7imcqqq5	marti-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	8526	Lns0iKkg9n6FKoiqBqKsrw==	2024-01-17 18:03:29.88844
299	cp5kz9r8wghcimsxwps2hutj3mc0	mansell-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	10824	4eiMd4jepr4lLPT9sYtKuQ==	2024-01-17 18:03:48.511761
300	hg93eo36ek2ugm481jzwaw9cbhz4	nikita-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	11010	xJM1O+zAI05hzkU0Teir5g==	2024-01-17 18:04:32.317957
302	vdugklvu1p6zejke46890fuytgd1	garcia-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	10904	ogwU3yTcqGHSS7waQ4PSYA==	2024-01-17 18:05:18.835524
303	en45h17jomckixlgx5mctw3mqbbf	sophia-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	97662	1omT4F4Mf3UN7jlYhgD+pw==	2024-01-17 18:05:47.264402
304	gacmx608s952x9h6cghtlii364e5	roberto-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	11273	SJ65z3JIRD/kb8w7OJ2G2g==	2024-01-17 18:06:09.586884
329	rpc6oi9uwh7d7lruulo01wcvn6xy	mp-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	43542	R5hQJzolg5C3Ug7cAMo/ig==	2024-01-17 18:31:47.252262
331	fwvmdnt271zxjv3jghz1qh38nw82	rodin-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	39864	NQ40kqN6VSTuHFYvQ+hxkA==	2024-01-17 18:35:06.92471
332	2f5jysvg2sxktd8lvq7xpehk6uts	prema-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	38170	GRn62+Ikuu00g5T1EsaE2Q==	2024-01-17 18:35:33.764516
333	cf3fsi0z0if19n620ueztfxduuj6	hitech-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	39230	xv7QwxEibQ3Y48hvdQZYnQ==	2024-01-17 18:35:56.963112
334	l2kn9aj06a9mq2xe2nqpkqzhutca	dams-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	41480	tUKEh+bn8T0wdb+PU6glkg==	2024-01-17 18:36:18.94001
335	zubi7ipx7dmdofrr8m9nh9ypejh4	invicta-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	36708	h4ZP6356WHCvDf79O22bNg==	2024-01-17 18:36:37.628594
336	gq5ohhuvbvp6zoyd25pn9xo855r1	phm-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	40998	RZRX0uxgSHHWBix35Rkmpw==	2024-01-17 18:37:03.822319
301	y237xrld7btqaluwdyyi5e3moe8e	barnard-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	11568	r9Tm/ccmNAL+Ft2Dtl/2OA==	2024-01-17 18:04:55.101884
305	7e4xjlr9xi786ltogfr1tfx55fmk	shin-helmet.png	image/jpeg	{"identified":true,"analyzed":true}	local	9828	o2OGsKNO1V7q+nPuQ14iBQ==	2024-01-17 18:06:35.190073
353	plzb3ke25lo1fz3jt6ra98pupd4w	jeddah-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	30062	34YBWyTHwpi1G85Uk23rEw==	2024-01-18 21:38:57.670074
354	19y23a5jf1aeehbdu2e97bkl26hf	melbourne-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	27795	8ssf+ul2x8/WlzGH/GdnEA==	2024-01-18 21:43:03.337612
355	22axlych3qz4hvjl20h3k51opvya	suzuka-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	18965	nT46c4I8AAamDmIkAUQktw==	2024-01-18 21:43:33.741015
357	p3egm6zr1rol3kkqnw0387cwlz8k	shanghai-track.png	image/png	{"identified":true,"analyzed":true}	local	178928	je1Pv1PKNjzzRdMdXpSGpw==	2024-01-18 21:48:11.592977
358	sqt6tpwkztprn2726wrek4zuluzt	miami-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	27366	CrPDIyzehfItobUeRIJWcQ==	2024-01-18 21:48:39.667568
359	4vzvlyt622nyqzhxv3m5tk4v5br6	imola-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	23383	MpYCnZqW2A//rFgMBs+ByQ==	2024-01-18 21:49:06.899159
360	3gcgnnc15gacxnkdqx49sgh52ngw	monaco-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	19585	tkUZUgdKuEcP1bO/AbenDA==	2024-01-18 21:49:40.887057
361	n1rzzit6zssyvdgo8xgppyvqcu6b	kanada-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	25349	97vltcy9UmWSW9d8u5giXw==	2024-01-18 21:50:17.406928
330	54y821zjtcgmzn4aa284bj6du6xi	rodin-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	39864	NQ40kqN6VSTuHFYvQ+hxkA==	2024-01-17 18:32:17.175126
337	k5s7ehnkfpcj8lvxd6wamzdycfg9	trident-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	38082	2MKvKblXFfynLmSv7iy4QA==	2024-01-17 18:37:24.204835
338	1fr3rdtlvxifop75750j5lr1bxct	var-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	40654	QPphlDMWfJZZKlcswiEbJw==	2024-01-17 18:37:47.399616
339	r2nrlsmonvwm1gz1yn10n32jh21b	campos-f2-car.png	image/webp	{"identified":true,"analyzed":true}	local	41150	WAfF2xjQ7V8WWqXOZ1qL4Q==	2024-01-17 18:38:24.190453
340	9mpxvjrsctgesjktgtumumfnhffm	prema-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	38026	5BHOqYre00Vx6tKwKLk+sQ==	2024-01-17 18:38:53.490038
341	234igmfwk2ym1fmsj52cxgss5t2f	trident-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	38050	qjxKBAUnnKhF3C6gZCmN5A==	2024-01-17 18:39:12.539964
342	yttdcik9pg9k79umivwx00lqz3l8	art-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	35308	IJ079CJ0ZkyJCwu0yBiwNg==	2024-01-17 18:39:34.871899
343	vsyn7xd7gntd5api3eu2yh7llq9y	mp-motorsport-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	36124	qhwfuH5WsZHStBgfLniDzw==	2024-01-17 18:39:57.069089
344	1ak3e1gllk343jopwbgbh6505jit	hitech-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	33514	0LABZq2+v5fWMYbaRJpsQg==	2024-01-17 18:40:21.045517
345	2tealp94umae3pcnzphwxewlflwo	var-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	35650	VyJGDdAsvjB5W3GcTsggDQ==	2024-01-17 18:40:50.689335
346	a6jmi1hna92ym2diqjppheytg0hv	rodin-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	35050	DIlQVqCPEw4P6xsvLB++YA==	2024-01-17 18:41:29.868783
347	h8q5wfj2kvgn7n70doe5mtybs7nx	campos-racing-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	33898	7BNLTzHNqcGj7Qt/cQ8ZOg==	2024-01-17 18:41:55.328115
348	s3vpl6gobnygbswfj4m6c0099lfi	jenzer-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	37262	ea7iIpY4q9kbf/R4/9I/uA==	2024-01-17 18:42:13.378492
349	h7vs8zdwyci7gkbuk1q59e2amut1	phm-f3-car.png	image/webp	{"identified":true,"analyzed":true}	local	37536	OxWpEi0QCDoPGuYwoTvlFQ==	2024-01-17 18:42:35.45727
351	dhuej6r7ixx2tm0ce03h1vusp33f	spa-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	21348	NtzoPYQjC65I4JlWX5JsGQ==	2024-01-18 16:07:03.696928
352	znwc773llco29i2niabhulsogtvb	bahrain-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	21659	Z0N5gXhLzhgHu0TemEj7oQ==	2024-01-18 21:36:41.188921
362	f7nf0rdm1r4cdu3oxp9g7tdw2r4s	spanyol-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	23092	WiPgW1iNZ23e4yzcyZcD3w==	2024-01-18 21:50:41.725844
363	3qctug2pddsgobkalh78sb4j3rk3	red-bull-ring-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	28698	PeZYokjjHB9YUZXY7Uy4LA==	2024-01-18 21:51:06.984002
364	1shye22ur9gninul42d929oee8yn	silverstone-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	23497	BT+29ULsfIkPlKx2VVlFsA==	2024-01-18 21:51:29.126273
365	1atusa8y6sczp57r55luqv10d9rz	hungaroring-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	22633	2G0yDJgk/g4mZiEq/gHRtA==	2024-01-18 22:04:29.775664
366	mrbo7xebxiks1rve6b2au6fsc3b1	zandvoort-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	42072	0eIhzpD+LmKi6yuPr2eGIQ==	2024-01-18 22:04:56.539498
367	27ay5mzj9lv79wayg73m82250hd5	monza-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	15665	LB+i8z9dWE4P4eNqh2DdBQ==	2024-01-18 22:05:39.204633
368	fttbxqv1g25uxog97seklbxl5qut	baku-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	21255	K+2AGO308XWjEWF/8um0yA==	2024-01-18 22:05:56.924943
369	iwk8axnlawum6qr5vwny185yvnwl	singapore-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	25381	8OZFqRe8r2ih8hTpRcCVUg==	2024-01-18 22:06:31.045675
370	2fz64z7nu4m90dafsbf2nym79840	austin-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	23061	WNYgsaLquSC5wq0sl1HtPQ==	2024-01-18 22:06:49.282603
372	klsh2shgkc4zofi8ypc43n6qaq3p	mexiko-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	26537	U7SETa33+tTQK8HKNrDtpA==	2024-01-18 22:07:41.930415
373	5sto6yig4nf4c8qgzz2awb6q4gnb	brazil-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	24793	Zw+MzrjdvrptA90iXRioxQ==	2024-01-18 22:07:58.235048
374	ophmme1hu4f6x4xdxnchtcbpzxp9	las-vegas-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	13979	mVl3lonR9zgEOWJR+kMDNQ==	2024-01-18 22:08:13.134021
375	ee06wnx5vhpcbzwg8g3kj98bq9h0	katar-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	19864	iqlR9jmN1glcpFxc8S8kUQ==	2024-01-18 22:08:38.600542
376	bhiqoik8cffxbqhur2vzcsn04fmy	abu-dhabi-track.png	image/svg+xml	{"identified":true,"analyzed":true}	local	18416	4VntROk/NTWhjqGE3SsH7A==	2024-01-18 22:08:59.194643
382	zf0l0b8ty7hj0axqer35956uwjki	aron-helmet.png	image/webp	{"identified":true,"analyzed":true}	local	14914	nfylwGqRiPH00zzFZRuOsA==	2024-01-20 14:12:13.750968
383	oepxuhe5ld8rf2k6eha1gr0o3csy	formula2-logo.png	image/png	{"identified":true,"analyzed":true}	local	66750	UL6C2oZIzefQC1TJE/13xQ==	2024-01-20 19:52:36.314861
384	w4p7y6z3qv366kzm078t4qcnzuz8	IMG_1949.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	1070168	rho76C5AD+5KAe/Upo6nfg==	2024-04-19 20:12:10.509731
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-09-18 09:46:01.88983	2023-09-18 09:46:01.88983
\.


--
-- Data for Name: calendar_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calendar_events (id, title, "startDate", "endDate", color, created_at, updated_at) FROM stdin;
1	title1	2023-11-11 08:00:00	2023-11-11 08:45:00	\N	2023-11-11 09:17:16.834311	2023-11-11 09:35:04.872658
3	title1	2023-11-14 22:00:00	2023-11-14 23:00:00	\N	2023-11-12 13:29:51.25903	2023-11-12 20:49:58.501275
4	kjernth;kfjda;kgjfn	2023-11-13 22:00:00	2023-11-13 23:00:00	\N	2023-11-12 20:50:06.464181	2023-11-12 20:50:20.638669
2	title2	2023-11-13 07:00:00	2023-11-13 08:00:00	\N	2023-11-11 09:35:28.936196	2023-11-12 20:50:37.015865
5	verseny	2023-11-26 12:00:00	2023-11-26 13:00:00	\N	2023-11-26 17:01:42.323286	2023-11-26 17:01:47.682517
6	Haas autó bemutató	2024-01-30 04:00:00	2024-01-30 06:00:00	\N	2024-01-29 11:41:26.753363	2024-01-29 12:31:39.158561
\.


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, name, year, engine, chassis, races_won, pole_positions, created_at, updated_at, podiums, championship_place, battery, horsepower, weight, fuel, lubricants, description, team_slug) FROM stdin;
18	PHM Racing Car	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	0	0	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	0	3	Lithium-ion	620	795	Aramco 55% bio-sourced sustainable fuel	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	phm-racing-car
4	McLaren MCL60	2023	Mercedes M14 E PERFORMANCE 1.6Liter V6 Turbo	MCL60	0	0	2024-01-01 23:11:16.668	2024-01-01 23:11:19.635	9	4	McLaren Lithium-ion	1080	798	Petronas Primax	Petronas Syntium	A modell elődje az új szabályok szerint épített MCL36 volt. Az az autó a teszteken ígéretesen teljesített, de a fékek túlmelegedésével gondok voltak, és ez a 2022-es idény elején rémes startot eredményezett, mely az autó fejlesztését is megnehezítette. A felfüggesztés koncepciója változatlan volt, a csapat megtartotta az elöl vonórudas, hátul nyomórudas kialakítást. Az oldaldobozok szűkebbek lettek, merészebb alávágással a padlólemezen, és a motorhűtő beömlőnyílások is hosszabbak lettek. Ennek ellenére sem lett egy kiforrott koncepció, aminek köszönhetően a befejezését követően már készíteni is kezdték az első nagyobb fejlesztési csomagot.	mclaren-f1-team-car
7	AlphaTauri AT04	2023	Honda RBPTH001 1.6Liter V6 turbo	AT04	0	0	2024-01-02 22:42:23.369	2024-01-02 22:42:27.858	0	8	Honda Lithium-ion	1080	798	Mobil Synergy	Mobil 1	Ebben az évben a csapat - névleg - visszatért a Honda motorjaihoz, hasonlóan a Red Bull csapatához. Az autót 2023. február 11-én mutatták be New Yorkban egy divatshow keretein belül, lévén az AlphaTauri a Red Bull divatmárkája. Az előző idényhez képest változás volt néhány új szponzor érkezése, köztük a német olajcég Orlen. 2023-ban sokáig egyértelműen az AlphaTauri volt a mezőny leggyengébb csapata. A nyári szünetig Cunoda hatalmas teljesítményének köszönhető volt a mindössze három gyűjtött pont (és sokszor csak épphogy maradt le a pontszerzésről).	scuderia-alphatauri-car
13	Art Grand Prix Car	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	2	6	2024-01-11 19:00:32.988	2024-01-11 19:00:29.755	20	1	Lithium-ion	620	795	Aramco 55% bio-sourced sustainable fuel	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	art-grand-prix-car
23	Trident F3 Car	2023	Mecachrome V6 3.4Liter	Dallara Automobili	3	3	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	11	2	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az alváz nagyjából megegyezik a GP3/16 alvázéval, de néhány módosítással. Az alváz módosításai közé tartozik az új elülső rész, amely számos felfüggesztési beállítási lehetőséget és masszívabb oldalpaneleket tartalmaz a biztonság növelése érdekében. Az alvázon található a "halo" pilótafülke-védőberendezés is, egy, a monocoque-ra szerelt lengőkaros keret, amelynek célja, hogy baleset esetén elterelje a törmeléket a vezető fejéről. A hátsó szárny továbbra is magában foglalja a Drag Reduction Systems (DRS) hátsó szárnyszárnyat az előzést segítő manőverezéshez. Az F3 2019 ugyanazt a 3,4 literes V6-os szívómotort tartalmazza, amelyet a Mecachrome Motorsport fejlesztett ki, mint az elődjét, a GP3/16-ot, de a teljesítményt kissé csökkentették 300 kW-ról (400 LE) 280 kW-ra. (380 LE).	trident-f3-car
27	Van Amersfoort Racing F3 Car	2023	Mecachrome V6 3.4Liter	Dallara Automobili	1	0	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	4	7	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az alváz nagyjából megegyezik a GP3/16 alvázéval, de néhány módosítással. Az alváz módosításai közé tartozik az új elülső rész, amely számos felfüggesztési beállítási lehetőséget és masszívabb oldalpaneleket tartalmaz a biztonság növelése érdekében. Az alvázon található a "halo" pilótafülke-védőberendezés is, egy, a monocoque-ra szerelt lengőkaros keret, amelynek célja, hogy baleset esetén elterelje a törmeléket a vezető fejéről. A hátsó szárny továbbra is magában foglalja a Drag Reduction Systems (DRS) hátsó szárnyszárnyat az előzést segítő manőverezéshez. Az F3 2019 ugyanazt a 3,4 literes V6-os szívómotort tartalmazza, amelyet a Mecachrome Motorsport fejlesztett ki, mint az elődjét, a GP3/16-ot, de a teljesítményt kissé csökkentették 300 kW-ról (400 LE) 280 kW-ra. (380 LE).	van-amersfoort-racing-f3-car
31	PHM Racing F3	2023	Mecachrome V6 3.4Liter	Dallara Automobili	1	0	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	1	9	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az alváz nagyjából megegyezik a GP3/16 alvázéval, de néhány módosítással. Az alváz módosításai közé tartozik az új elülső rész, amely számos felfüggesztési beállítási lehetőséget és masszívabb oldalpaneleket tartalmaz a biztonság növelése érdekében. Az alvázon található a "halo" pilótafülke-védőberendezés is, egy, a monocoque-ra szerelt lengőkaros keret, amelynek célja, hogy baleset esetén elterelje a törmeléket a vezető fejéről. A hátsó szárny továbbra is magában foglalja a Drag Reduction Systems (DRS) hátsó szárnyszárnyat az előzést segítő manőverezéshez. Az F3 2019 ugyanazt a 3,4 literes V6-os szívómotort tartalmazza, amelyet a Mecachrome Motorsport fejlesztett ki, mint az elődjét, a GP3/16-ot, de a teljesítményt kissé csökkentették 300 kW-ról (400 LE) 280 kW-ra. (380 LE).	phm-racing-f3-car
1	RedBull RB19	2023	Honda RBPTH001 1.6Liter V6 turbo	Red Bull	21	14	2023-12-30 17:37:00.181	2023-12-30 17:37:03.733	30	1	Redbull Lithium-ion	1080	798	Mobil Synergy	Mobil 1	Már a szezon eleji teszteken is látszott, hogy az RB18 továbbfejlesztéseként tervezett autó egy nagyon jó konstrukció, ami aggodalommal töltötte el a riválisokat. Stabil volt, könnyen vezethető, és műszaki problémák sem hátráltatták őket. Az RB19 végül a Formula-1 történetének egyik legdominánsabb autója lett. Egy kivételével az összes versenyt (sorozatban az idény első 14 versenyét) és egy kivételével az összes sprintfutamot megnyerte (az előző idény utolsó versenyének megnyerése okán sorozatban 15 győzelmet arattak, ami abszolút rekord), a versenyben az élen töltött körök számában 1003 megtett körrel toronymagasan Max Verstappen volt az első, aki egymaga sorozatban tíz versenyt nyert meg, megdöntve ezzel egy újabb rekordot. 	oracle-red-bull-racing-car
2	Ferrari SF-23	2023	Ferrari 066/10 1.6Liter V6 Turbo	SF-23	1	7	2024-01-01 23:02:47.622	2024-01-01 23:02:51.355	9	3	Ferrari Lithium-ion	1080	798	Shell V-Power	Shell	Az előző évhez képest kisebb változtatásokat eszközöltek csak, főként a szabályok módosítása miatt. Habár az új csapatfőnök Frederic Vasseur lett, a fejlesztést még Mattia Binotto idejében fejezték be. Jelentősebb különbségnek az áttervezett oldaldobozok mondhatóak, amelyekkel a Ferrari feladta saját, egyedi elképzelését, és más csapatokhoz hasonlóan a Red Bull megoldását másolták le. A festés maradt az előző évi mélyvörös-fekete, Sainz autójának a tetején a bukókeret sárga színű lett a jobb megkülönböztethetőség érdekében. Az olasz nagydíjon az autók és a pilóták overallja is kapott egy sárga csíkot, diszkrétebben, mint 2022-ben.	scuderia-ferrari-car
3	Mercedes-AMG W14 E PERFORMANCE	2023	Mercedes M14 E PERFORMANCE 1.6Liter V6 Turbo	F1 W14	0	1	2024-01-01 21:51:50.676	2024-01-01 21:51:54.803	8	2	Mercedes Lithium-ion	1080	798	Petronas Primax	Petronas Syntium	Az előző évi W13-as modell, különösen a korábbi évek világbajnok autóihoz képest, egyértelmű kudarc volt, különösen a ground effect okozta állandó pattogás miatt. A W14-es tervezésekor ezeket a kritikus pontokat kezdték el áttervezni, többek között megemelték a hasmagasságot. Nem nyúltak viszont az oldaldobozokhoz, hanem megtartották a különleges, extrém kicsi kivitelt. A festés újra matt fekete lett, ám ezúttal nem egy mozgalom mellett való kiállás okán, hanem tömegcsökkentési okokból. A várt teljesítményjavulás azonban elmaradt, és a Mercedes, ha nem is küszködött annyira, mint 2022-ben, azért továbbra sem volt győzelemre esélyes. Ezért aztán fejlesztéseket hoztak, melyeket eredetileg Imolában szerettek volna bevetni, csak azt a futamot törölték a heves áradások miatt. Így Monacóban debütált pár újdonság, köztük a külsőre legjellegzetesebb, a riválisokéra emlékeztető oldaldoboz.	mercedes-amg-petronas-formula-one-team-car
5	Aston Martin AMR23	2023	Mercedes M12 E PERFORMANCE 1.6Liter V6 Turbo	AMR23	0	0	2024-01-01 23:19:41.043	2024-01-01 23:19:43.75	8	5	Mercedes Lithium-ion	1080	798	Petronas Primax	Petronas Syntium	Az Aston Martin csapatát tekintették a szezonkezdet előtt a bajnokság sötét lovának, ugyanis meglepően gyorsnak tűntek. Erre a titulusra rá is szolgáltak, ugyanis a szezonnyitó versenyen 23 pontot értek el - Alonso rögtön felállhatott a dobogóra, a csapat történetében mindössze másodszor, Stroll pedig a sérülése miatt iszonyatos fájdalmak közepette hozta be az autót a hatodik helyen. Ausztriától kezdődően azonban látványos formahanyatlás következett be, és bár ez nem járt együtt rossz eredményekkel, hiszen még mindig stabil pontszerzők voltak, de az erősorrendben több csapat is átugrotta őket.	aston-martin-aramco-cognizant-formula-one-team-car
6	Alpine A523	2023	Renault E-Tech RE23	A523	0	0	2024-01-01 23:22:56.192	2024-01-01 23:22:59.761	2	6	Alpine Lithium-ion	1080	798	BP Ultimate	Castrol	Apró szépséghiba volt, hogy a csapat főhadiszállása az angliai Enstone-ban volt, a motorgyártó üzem pedig a franciaországi Viry-Châtillonban, ez pedig nehézségeket okozott. Abban az idényben is már csak az Alpine használta a Renault motorjait (melyeket a Mecachrome szerelt össze), amik gyengébbek voltak, mint a riválisok erőforrásai. Emiatt a várt eredmények is elmaradtak, nemhogy javulás, hanem inkább visszalépés volt megfigyelhető az előző évhez képest. Az autó festése maradt az előző évi: mélykék, a főszponzor BWT rózsaszínjével. Az idény első három versenyén szinte teljesen rózsaszín autóval versenyeztek.	bwt-alpine-f1-team-car
8	Williams FW45	2023	Mercedes M14 E PERFORMANCE 1.6Liter V6 Turbo	FW45	0	0	2024-01-02 22:51:59.943	2024-01-02 22:52:04.203	0	7	Mercedes Lithium-ion	1080	798	Petronas Primax	Petronas Syntium	Egyértelműen jobb autó lett, mint az előd FW44, ugyanis már képes volt önerőből bejutni az időmérő edzéseken a Q3-ba és a rendszeres pontszerzésre is képes volt, habár ez Albon kiemelkedő teljesítményének is köszönhető volt. Azonban igazán jól csak a gyors pályákon működött, a lassú, technikás kanyarokkal tűzdelt pályákon ismét a mezőny hátsó traktusában végeztek. Ennek oka a kasztni kialakításában rejlett, de azt pontosan behatárolni nem igazán tudták. A festés lényegében az előző évi továbbalakítása volt, a felső légbeömlőnyíláson az egyik szponzor, a Duracell színeivel. Új szponzorként érkezett a Kraken kriptotőzsde, valamint a Gulf. A brit nagydíjon speciális, a 800. futamukra emlékező festéssel versenyeztek, a Gulffal való partnerség keretein belül pedig Szingapúrban, Japánban és Katarban a McLaren MCL36 előző évi festésére emlékeztető kékesszürke-narancsszínben.	williams-racing-car
9	Alfa Romeo C43	2023	Ferrari 066/10 1.6Liter V6 Turbo	C43	0	0	2024-01-02 23:00:29.892	2024-01-02 23:00:33.958	0	9	Ferrari Lithium-ion	1080	798	Shell V-Power	Shell	Ez volt az Alfa Romeo és a Sauber utolsó közös közreműködése, miután a márka bejelentette, hogy az év végével véget ér köztük a partnerkapcsolat. A csapat új, jellegzetes bordó-fekete festéssel kezdte meg az évet, az új főszponzor, a Stake.com színeiben. Mivel vannak országok, ahol a szerencsejáték reklámozása tilos, ezért ott a Kick streaming weboldal feliratai kerültek fel az autókra. Olaszországban több fehéret és zöldet tartalmazó, hagyományosabb Alfa-festéssel versenyeztek.Ebben az évben a csapat kevésbé jól teljesített, mint az előző évben. Csupán alkalmi pontszerzők voltak és visszazuhantak az alsóházba. A szezon csúcspontja a katari kettős pontszerzés volt.	alfa-romeo-f1-team-stake-car
10	Haas VF-23	2023	Ferrari 066/10 1.6Liter V6 Turbo	VF-23	0	0	2024-01-02 23:03:43.797	2024-01-02 23:03:40.137	0	10	Ferrari Lithium-ion	1080	798	Shell V-Power	Shell	Ebben az évben új névadó szponzora lett a csapatnak a Rich Energy és az Uralkali után: a MoneyGram pénzküldő szolgáltatás. Ennek köszönhetően a festés is változott: a csapat korai éveit megidéző fekete-fehér-piros lett. A nagy várakozásokkal ellentétben a csapat kiábrándítóan teljesített az idényben. Ennek oka az volt, hogy tervezési hiányosságok miatt az egykörös tempó ugyan rendkívül jó volt (rendszeres volt valamelyik autó szereplése a Q3-ban az időmérő edzéseken, sokszor igen előkelő helyeken), de a csapnivaló gumikezelés miatt a jó rajthelyekről fokozatosan visszaestek a mezőny hátsó traktusaiba a futamok során. Amerikában, utolsóként a csapatok közül, ők is lemásolták a Red Bull kasztniját, de ez nem sokat javított a teljesítményen.	moneygram-haas-f1-team-car
11	MP Motorsport car	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	2	0	2024-01-11 15:29:07.976	2024-01-11 15:29:10.968	2	6	Lithium-ion	620	795	FIA standard	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	mp-motorsport-car
12	Rodin Carlin Car	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	1	1	2024-01-11 18:56:30.053	2024-01-11 18:56:34.75	9	2	Lithium-ion	620	795	FIA standard	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	rodin-carlin-car
14	Prema Racing	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	10	5	2024-01-11 19:03:00.27	2024-01-11 19:03:03.612	16	2	Lithium-ion	620	795	Aramco 55% bio-sourced sustainable fuel	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	prema-racing car
15	Hitech Pulse-Eight Car	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	2	4	2024-01-11 19:03:00.27	2024-01-11 19:03:03.612	7	8	Lithium-ion	620	795	Aramco 55% bio-sourced sustainable fuel	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	hitech-pulse-eight-car
16	DAMS Car	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	3	1	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	7	4	Lithium-ion	620	795	Aramco 55% bio-sourced sustainable fuel	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	dams-car
17	Invicta Virtuosi Racing Car	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	3	3	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	5	5	Lithium-ion	620	795	Aramco 55% bio-sourced sustainable fuel	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	invicta-virtuosi-racing-car
19	Trident Car	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	1	0	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	1	10	Lithium-ion	620	795	Aramco 55% bio-sourced sustainable fuel	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	trident-car
20	Van Amersfoort Racing	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	1	1	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	3	7	Lithium-ion	620	795	Aramco 55% bio-sourced sustainable fuel	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	van-amersfoort-racing
21	Campos Racing Car	2023	Mecachrome V6 3.4Liter Single-Turbo	Dallara Automobili	1	3	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	3	9	Lithium-ion	620	795	Aramco 55% bio-sourced sustainable fuel	FIA standard	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	campos-racing
22	PREMA Racing F3 Car	2023	Mecachrome V6 3.4Liter	Dallara Automobili	5	2	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	13	1	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az autó kialakítása a Dallara GP2/11-hez képest alacsonyabb orrrészt, szélesebb és alacsonyabb hátsó szárnyat, valamint szélesebb és ívelt első szárnyat tartalmaz, mivel a sorozat esztétikusabb szabályozást alkalmaz a Forma-1-hez képest. The F2 2018 features a brand-new engine package built specifically for the car. Az öregedő Mecachrome 4,0 literes V8-as szívó, elektronikus, közvetett befecskendezéses motort – amelyet a GP2 sorozat 2005-ös szezonja óta használtak – egy takarékos, 3,4 literes (207 köbcentis) V6-osra cserélték. turbófeltöltős, közvetlen befecskendezéses motor, amelyet a Mecachrome Motorsport fejlesztett (V634 Turbo modell). A dizájn a „halo” pilótafülke-védőeszközt is tartalmazza, a monocoque-ra szerelt lengőkaros keretet, amely baleset esetén eltereli a törmeléket a versenyző fejéről. Az autó hátsó szárnya továbbra is tartalmazza a légellenállás-csökkentő rendszert (DRS) az előzési manőver segítése érdekében.	prema-racing-f3
24	Art Grand Prix F3 Car	2023	Mecachrome V6 3.4Liter	Dallara Automobili	0	1	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	2	8	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az alváz nagyjából megegyezik a GP3/16 alvázéval, de néhány módosítással. Az alváz módosításai közé tartozik az új elülső rész, amely számos felfüggesztési beállítási lehetőséget és masszívabb oldalpaneleket tartalmaz a biztonság növelése érdekében. Az alvázon található a "halo" pilótafülke-védőberendezés is, egy, a monocoque-ra szerelt lengőkaros keret, amelynek célja, hogy baleset esetén elterelje a törmeléket a vezető fejéről. A hátsó szárny továbbra is magában foglalja a Drag Reduction Systems (DRS) hátsó szárnyszárnyat az előzést segítő manőverezéshez. Az F3 2019 ugyanazt a 3,4 literes V6-os szívómotort tartalmazza, amelyet a Mecachrome Motorsport fejlesztett ki, mint az elődjét, a GP3/16-ot, de a teljesítményt kissé csökkentették 300 kW-ról (400 LE) 280 kW-ra. (380 LE).	art-grand-prix-f3-car
25	MP Motorsport F3 Car	2023	Mecachrome V6 3.4Liter	Dallara Automobili	3	2	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	7	3	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az alváz nagyjából megegyezik a GP3/16 alvázéval, de néhány módosítással. Az alváz módosításai közé tartozik az új elülső rész, amely számos felfüggesztési beállítási lehetőséget és masszívabb oldalpaneleket tartalmaz a biztonság növelése érdekében. Az alvázon található a "halo" pilótafülke-védőberendezés is, egy, a monocoque-ra szerelt lengőkaros keret, amelynek célja, hogy baleset esetén elterelje a törmeléket a vezető fejéről. A hátsó szárny továbbra is magában foglalja a Drag Reduction Systems (DRS) hátsó szárnyszárnyat az előzést segítő manőverezéshez. Az F3 2019 ugyanazt a 3,4 literes V6-os szívómotort tartalmazza, amelyet a Mecachrome Motorsport fejlesztett ki, mint az elődjét, a GP3/16-ot, de a teljesítményt kissé csökkentették 300 kW-ról (400 LE) 280 kW-ra. (380 LE).	mp-motorsport-f3-car
26	Hitech Pulse-Eight F3 Car	2023	Mecachrome V6 3.4Liter	Dallara Automobili	2	5	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	6	5	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az alváz nagyjából megegyezik a GP3/16 alvázéval, de néhány módosítással. Az alváz módosításai közé tartozik az új elülső rész, amely számos felfüggesztési beállítási lehetőséget és masszívabb oldalpaneleket tartalmaz a biztonság növelése érdekében. Az alvázon található a "halo" pilótafülke-védőberendezés is, egy, a monocoque-ra szerelt lengőkaros keret, amelynek célja, hogy baleset esetén elterelje a törmeléket a vezető fejéről. A hátsó szárny továbbra is magában foglalja a Drag Reduction Systems (DRS) hátsó szárnyszárnyat az előzést segítő manőverezéshez. Az F3 2019 ugyanazt a 3,4 literes V6-os szívómotort tartalmazza, amelyet a Mecachrome Motorsport fejlesztett ki, mint az elődjét, a GP3/16-ot, de a teljesítményt kissé csökkentették 300 kW-ról (400 LE) 280 kW-ra. (380 LE).	hitech-pulse-eight-f3-car
28	Rodin Carlin F3 Car	2023	Mecachrome V6 3.4Liter	Dallara Automobili	0	0	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	0	10	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az alváz nagyjából megegyezik a GP3/16 alvázéval, de néhány módosítással. Az alváz módosításai közé tartozik az új elülső rész, amely számos felfüggesztési beállítási lehetőséget és masszívabb oldalpaneleket tartalmaz a biztonság növelése érdekében. Az alvázon található a "halo" pilótafülke-védőberendezés is, egy, a monocoque-ra szerelt lengőkaros keret, amelynek célja, hogy baleset esetén elterelje a törmeléket a vezető fejéről. A hátsó szárny továbbra is magában foglalja a Drag Reduction Systems (DRS) hátsó szárnyszárnyat az előzést segítő manőverezéshez. Az F3 2019 ugyanazt a 3,4 literes V6-os szívómotort tartalmazza, amelyet a Mecachrome Motorsport fejlesztett ki, mint az elődjét, a GP3/16-ot, de a teljesítményt kissé csökkentették 300 kW-ról (400 LE) 280 kW-ra. (380 LE).	rodin-carlin-f3-car
29	Campos Racing F3 Car	2023	Mecachrome V6 3.4Liter	Dallara Automobili	3	5	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	6	4	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az alváz nagyjából megegyezik a GP3/16 alvázéval, de néhány módosítással. Az alváz módosításai közé tartozik az új elülső rész, amely számos felfüggesztési beállítási lehetőséget és masszívabb oldalpaneleket tartalmaz a biztonság növelése érdekében. Az alvázon található a "halo" pilótafülke-védőberendezés is, egy, a monocoque-ra szerelt lengőkaros keret, amelynek célja, hogy baleset esetén elterelje a törmeléket a vezető fejéről. A hátsó szárny továbbra is magában foglalja a Drag Reduction Systems (DRS) hátsó szárnyszárnyat az előzést segítő manőverezéshez. Az F3 2019 ugyanazt a 3,4 literes V6-os szívómotort tartalmazza, amelyet a Mecachrome Motorsport fejlesztett ki, mint az elődjét, a GP3/16-ot, de a teljesítményt kissé csökkentették 300 kW-ról (400 LE) 280 kW-ra. (380 LE).	campos-racing-f3-car
30	Jenzer Motorsport F3 Car	2023	Mecachrome V6 3.4Liter	Dallara Automobili	1	0	2024-01-12 11:39:28.599	2024-01-12 11:39:32.316	5	6	None	380	673	Aramco Advanced 55% sustainable fuel 	Aramco Orizon	Az alváz nagyjából megegyezik a GP3/16 alvázéval, de néhány módosítással. Az alváz módosításai közé tartozik az új elülső rész, amely számos felfüggesztési beállítási lehetőséget és masszívabb oldalpaneleket tartalmaz a biztonság növelése érdekében. Az alvázon található a "halo" pilótafülke-védőberendezés is, egy, a monocoque-ra szerelt lengőkaros keret, amelynek célja, hogy baleset esetén elterelje a törmeléket a vezető fejéről. A hátsó szárny továbbra is magában foglalja a Drag Reduction Systems (DRS) hátsó szárnyszárnyat az előzést segítő manőverezéshez. Az F3 2019 ugyanazt a 3,4 literes V6-os szívómotort tartalmazza, amelyet a Mecachrome Motorsport fejlesztett ki, mint az elődjét, a GP3/16-ot, de a teljesítményt kissé csökkentették 300 kW-ról (400 LE) 280 kW-ra. (380 LE).	jenzer-motorsport-f3-car
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, body, post_id, author_id, created_at, updated_at) FROM stdin;
1	elso komment	7	3	2023-11-25 17:48:15.475	2023-11-25 17:48:18.505
2	masodik komment, ez is ilyen hosszabb hogy megnezzuk hogy hogy nez ki egy hosszu komment es remelem nem tunik igy el semmi aminek nem kene.	7	3	2023-11-26 14:17:34.093	2023-11-26 14:17:38.731
3	hello	7	0	2023-11-26 14:23:01.548979	2023-11-26 14:23:01.548979
4	kommentkomment	7	0	2023-11-26 14:23:34.578217	2023-11-26 14:23:34.578217
5	\N	4	2	2023-12-22 10:21:05.237453	2023-12-22 10:21:05.237453
6	helloszia	4	2	2023-12-22 10:30:45.595445	2023-12-22 10:30:45.595445
7	1	4	2	2023-12-22 10:38:02.192028	2023-12-22 10:38:02.192028
8	xddddd	8	7	2024-01-20 21:10:38.605948	2024-01-20 21:10:38.605948
9	azta	8	7	2024-01-20 21:10:52.765107	2024-01-20 21:10:52.765107
10	xd	9	7	2024-01-21 14:30:12.742745	2024-01-21 14:30:12.742745
11	lasdhfklajhdlkfjhasdlfjkaésdlkfjaéslkdjféalksdjfélaksjdfélaksjdéflkajsdfélkjadélfkjasdélfkjasdélkfjasdélfkjasédlkfjadlékfjaéldkfjaélkfjaéldkfjaldskfjaldkjflskdjflkdjfksk\nlskdfjlsdf\nslkdfjsdf\nsldkfjsdf\nlskdfjlskdjf\nsldéfksélkdfj\nalésdkfaélskdjfa\nasdlfkasdálkfj\nasldfkjasédflkja\nasédlkfjaslkdjf\nalsékdfjalskdjf\n	9	7	2024-01-22 12:05:01.358858	2024-01-22 12:05:01.358858
12	xdd	9	7	2024-01-25 20:58:23.265273	2024-01-25 20:58:23.265273
14	xd	9	7	2024-02-17 21:07:01.276418	2024-02-17 21:07:01.276418
15	lkasdflaksjdflkajsdflkajsdflkjasdlfkjasdlfkjalsdkjflaskdjflaksjdf	2	2	2024-04-20 19:35:15.862576	2024-04-20 19:35:15.862576
\.


--
-- Data for Name: devise_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devise_api_tokens (id, resource_owner_type, resource_owner_id, access_token, refresh_token, expires_in, revoked_at, previous_refresh_token, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drivers (id, name, age, number, height, nationality, number_of_championships, created_at, updated_at, number_of_wins, number_of_podiums, series_id, description, team_id, slug, team_slug) FROM stdin;
15	Daniel Ricciardo	34	3	179	Ausztrália	0	2023-10-13 13:44:08.181111	2023-10-13 13:44:08.181111	8	32	1	A saját stílusú „Honey Badger” kívülről homályos, belül pedig fergeteges. A sofőrök óvakodjanak, mert Ricciardo laza személyisége és nagy vigyora mögött egy borotvaéles versenyző áll egy harapással.\nAz ausztrál ötvözi a maximális sebességet lenyűgöző versenyjármánnyal. Soha nem fél attól, hogy a korlátokig feszegesse, ha ez azt jelenti, hogy kikap egy továbbjutást, Ricciardo bizonyítottan futamgyőztes, aki a megfelelő gépezet mellett képes folyamatosan a bajnoki tabellán üzleti végén végezni.	7	daniel-ricciardo	scuderia-alphatauri
13	Valtteri Bottas	34	77	173	Finnország	0	2023-10-13 13:44:08.174334	2023-10-13 13:44:08.174334	10	67	1	A finn jeges és havas utakon tanulta mesterségét, és Grand Prix versenyzőnek született.\nBottas elmagyarázza, hogy ha lehet vezetni szülőföldjének fagyos útjain, akkor bárhová vezethet. Aztán ott van a finn mentalitás – visszafogott, szorgalmas és nyugodt az F1 gyorssávja nem zavarja.\n2013-ban a Williamsszel debütált az F1-ben, Bottas hamarosan a család tagja lett. Pontok és dobogós helyezések következtek, a megbízható versenyző pedig győzelem nélkül is összegyűjtötte a legtöbb pontot. Ez a rekord neheztelt, de ez megmutatta képességeit. Az a tény, hogy a finn egy ilyen pontgép volt, hirtelen az F1 legvágyottabb ülésére – Nico Rosberg megüresedett bajnoki címére a Mercedesnél – előléptették.	8	valtteri-bottas	alfa-romeo-f1-team-stake
83	Lucas Blakeley	22	88	0	Nagy Britannia	1	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	6	12	4	lucas-blakeley	35	lucas-blakeley	mclaren-shadow
3	Charles Leclerc	25	16	180	Monaco	0	2023-10-13 13:44:08.155039	2023-10-13 13:44:08.155039	5	27	1	Charles Leclerc monacói autóversenyző. A 2016-os GP3-szezon és a 2017-es FIA Formula–2 szezon bajnoka. 2018-ban az Alfa Romeo Sauber csapat pilótájaként szerepelt először a Formula–1-ben. 2019-től a Scuderia Ferrari versenyzője.	2	charles-leclerc	scuderia-ferrari
6	George Russell	25	63	185	Nagy Britannia	0	2023-10-13 13:44:08.132589	2023-10-13 13:44:08.132589	1	10	1	Ő a sofőr, akinek a mottója: „If in doubt, go flat out”. George Russell eddigi F1-es pályafutása során ezzel élt: újonc szezonjában mind a 21 Nagydíjon kihagyta a kvalifikációt tapasztalt csapattársát, Robert Kubicát, 2021-ben a Williamst ismét a dobogóra helyezte, és 2022-ben megszerezte első futamgyőzelmét a Mercedesszel. Ez a zseniális alapsebesség jól szolgálta Russellnek, amikor bajnoki címeket szerzett a Forma-1-be vezető úton.	3	george-russell	mercedes-amg-petronas-formula-one-team
7	Lando Norris	23	4	175	Nagy Britannia	0	2023-10-13 13:44:08.1353	2023-10-13 13:44:08.1353	0	9	1	A McLaren két évig tartotta a könyveiben a brit tinédzsert, mielőtt 2019-ben bekerült az F1 sztárgalaxisába. Norris, aki fiatal karrierje során petárdázott, hajlamos a pole pozíciókra és a kerék-kerék elleni küzdelemre, nem engedte. le őket. A magasan jegyzett – és sokkal tapasztaltabb – Carlos Sainzcal párosítva az újonc szezonja lenyűgöző volt: Norris megelőzte a spanyolt a fej-fej elleni selejtező csatában, 11-szer szerzett pontot, és csak kis híján maradt ki a legjobb 10-ből. bajnoki helyezés.	4	lando-norris	mclaren-f1-team
10	Lance Stroll	24	18	182	Kanada	0	2023-10-13 13:44:08.163845	2023-10-13 13:44:08.163845	0	3	1	Nincs olyan, hogy túl korán van Stroll, egy tinédzser szenzáció, aki a nedves időjárást kedveli. A rajtrács egyik menő gyerekét, Strollt nem sokkal a 18. születésnapja után mutatta be Williams – mielőtt befejezte a középiskolát és megszerezte a közúti jogosítványát.\nSéta a debütáló 2017-es szezonban az üzletet jelentette, és rekordokat döntött útközben. Opportunista versenyzőként a legfiatalabb újoncként Bakuban a dobogóra lépett. Egy gazdag vállalkozó fiaként Stroll hozzászokott a pezsgős életmódhoz, de most már tudja, hogy a pezsgés még édesebb a szószéken. Aztán Monzában úrrá lett a felhőszakadásokon, és ő lett a történelem legfiatalabb versenyzője, aki beállt az első sorba.	5	lance-stroll	aston-martin-aramco-cognizant-formula-one-team
18	Nico Hulkenberg	36	27	184	Németország	0	2023-10-13 13:44:08.188969	2023-10-13 13:44:08.188969	0	0	1	Ő a Szuperhős, akinek tehetsége van ahhoz, hogy versenyautó-szupersztár legyen – ha csak egy topcsapatnál tudja megmozgatni az izmait. Az F1-es „Hulk” hihetetlen erőt és kitartást mutatott a Williams, a Force India, a Sauber, a Renault, a Racing Point és az Aston Martin középpályás martalócaként a 2010-ig tartó pályafutása során – és most újra a rajtrácsra került a Haasszal.\nAz újonc szezonban Hulkenberg elsajátította a változó pályaviszonyokat, és ragyogó pole pozíciót szerzett Brazíliában, megmutatva, hogy van esze és ereje is. Azóta nagyra becsült csapatjátékossá tette, hogy folyamatosan feldobja a pontokat. 2015-ben hírneve ismét nőtt, amikor egy hétköznapi munkájától távol eső hétvégén első kérésre megnyerte a klasszikus Le Mans-i 24 órás versenyt a Porsche-nak.	10	nico-hulkenberg	moneygram-haas-f1-team
84	Wilson Hughes	19	13	0	Nagy Britannia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	wilson-hughes	35	wilson-hughes	mclaren-shadow
85	Daniel Bereznay	23	15	0	Magyarország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	5	14	4	daniel-bereznay	36	daniel-bereznay	mercedes-amg-petronas-esports-team
86	Jake Benham	17	25	0	Nagy Britannia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	jake-benham	36	jake-benham	mercedes-amg-petronas-esports-team
87	Jarno Opmeer	23	5	0	Hollandia	2	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	11	24	4	jarno-opmeer	36	jarno-opmeer	mercedes-amg-petronas-esports-team
88	Alfie Butcher	16	41	0	Nagy Britannia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	alfie-butcher	37	alfie-butcher	moneygram-haas-f1-team-esports
89	Bence Szabó-Kónyi	20	37	0	Magyarország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	bence-szabo-konyi	37	bence-szabo-konyi	moneygram-haas-f1-team-esports
4	Carlos Sainz Jr.	29	55	178	Spanyolország	0	2023-10-13 13:44:08.157792	2023-10-13 13:44:08.157792	2	17	1	Ő a madridi versenyautó matador. Miután 2015-ben a Toro Rossónál Max Verstappen párosával belépett az F1-es Bull Ringbe, Sainz gyorsan megmutatta harci szellemét. Kitartó versenyző, aki a szélére állítja az autót, miközben áthalad a falkán. Nem csoda, hogy Sainz kiérdemelte a Chilli becenevet. Sainz a dupla rali-világbajnok fia, egyben névrokonja, és apa vezetési képességeiből is elhozta az F1-es pályára.	2	carlos-sainz-jr	scuderia-ferrari
90	Ulas Ozyildirim	18	95	0	Törökország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	ulas-ozyildirim	37	ulas-ozyildirim	moneygram-haas-f1-team-esports
27	Frederik Vesti	21	7	184	Dánia	0	2023-10-17 20:24:03.08029	2023-10-17 20:24:03.08029	1	5	2	Három évet töltött azzal, hogy meggyőzze a Mercedes Pilóta Akadémiát, hogy szerződtesse őt, és egy bajnoki címmel jutalmazta őket a Forma-3-ban, és negyedik lett az ART Grand Prix-szel. Vesti, aki a francia csapatnál szerzett feljutást, 2018 óta az első junior Mercedes-es pilóta, aki versenyez a Forma-2-ben.\nA dán a Formula Fordban 2016-ban debütált. Az áttörést jelentő szezonja 2019-ben köszöntött vissza, amikor 24 futamon 20 dobogóval, köztük 13 győzelemmel megnyerte a Formula Regionális Európa-bajnoki címet.	14	frederik-vesti	prema-racing
41	Kush Maini	23	24	171	India	0	2023-10-17 20:24:03.141371	2023-10-17 20:24:03.141371	0	0	2	Kush Maini, az indiai versenyző, aki a száguldás iránti szenvedélyét már fiatal korában megmutatta. Jelenleg a Campos Racing csapatával versenyez az 2023-as Formula 2 Bajnokságban1. Korábban versenyzett az F4-ben, a Formula Renault Eurokupában, a FIA World Endurance Championship -ben, a brit F3-ban és legutoljára az Formula–3 -ban1. A két alkalommal Forma-1 világbajnok Mika Häkkinen is mentorálja1. 	21	kush-maini	campos-racing
22	Jehan Daruvala	25	2	176	India	0	2023-10-17 20:24:03.035463	2023-10-17 20:24:03.035463	4	14	2	A 2019-es Forma-3-as kampány során a PREMA Racing bajnoki kihívója, Jehan Daruvala harmadik évére visszatér az olasz csapathoz, miután az elmúlt két szezont Carlinnál töltötte.\nDaruvala a harmadik helyen végzett a PREMA-n két győzelemmel és további öt dobogós helyezéssel az F3-ban, amivel bekerült a Red Bull Driver Academy-be. A Carlinnal együtt az F2-be lépett Daruvala újonc évében két dobogós helyezést ért el, köztük egy győzelmet, majd a 12. helyen végzett a bajnokságban.	11	jehan-daruvala	mp-motorsport
25	Théo Pourchaire	20	5	185	Franciaország	0	2023-10-17 20:24:03.071948	2023-10-17 20:24:03.071948	6	20	2	Csak az elmúlt 18 hónapban Théo Pourchaire lett a Forma-2 és a Forma-3 valaha volt legfiatalabb futamgyőztese, megszerezte a pole-t Monacóban, és kapcsolatba került egy F1-es üléssel. 2022-ben azt reméli, hogy a Forma-2-es címet felveheti erre a listára.\nA 18 éves játékos először az ART csapatában hajtott a 2020-as F3-as bajnokságban, ahol másodikként végzett újonc szezonjában, két győzelemmel és nyolc dobogós hellyel. A Spielberg Sprint Race-en aratott győzelmével ő lett az FIA F3 legfiatalabb győztese.	13	theo-pourchaire	art-grand-prix
26	Victor Martins	22	6	173	Franciaország	0	2023-10-17 20:24:03.076056	2023-10-17 20:24:03.076056	1	6	2	Victor Martins egy francia-portugál autóversenyző, aki 2001. június 16-án született Quincy-sous-Sénart-ban1. Jelenleg az ART Grand Prix csapatával versenyez a 2023-as FIA Formula 2 bajnokságban, és az Anthoine Hubert-díj legjobb újonc kategóriájában versenyez, amelyet a szezon utolsó fordulójáig megnyerhet2. Martins megnyerte a 2020-as Formula Renault Eurocup-ot és a 2022-es FIA Formula 3-bajnokságot1. Karrierje során több karting versenyt is nyert, beleértve a CIK-FIA világbajnokságot is 2016-ban1.	13	victor-martins	art-grand-prix
28	Oliver Bearman	18	8	177	Nagy Britannia	0	2023-10-17 20:24:03.084892	2023-10-17 20:24:03.084892	4	4	2	Oliver Bearman egy francia-portugál autóversenyző, aki 2005. május 8-án született Chelmsfordban, Angliában1. Jelenleg a Prema Racing csapatával versenyez a 2023-as FIA Formula 2 bajnokságban, és tagja a Ferrari Driver Academy-nek12. Bearman megnyerte az olasz F4 bajnokságot és az ADAC Formula 4 bajnokságot 2021-ben, valamint a 2022-es FIA Formula 3-ban harmadik helyezést ért el1.	14	oliver-bearman	prema-racing
29	Jak Crawford	18	9	183	USA	0	2023-10-17 20:24:03.089234	2023-10-17 20:24:03.089234	1	4	2	Carlton Jackston “Jak” Crawford egy amerikai autóversenyző, aki jelenleg a Hitech Grand Prix csapatával versenyez a 2023-as FIA Formula 2 bajnokságban. Crawford az olasz F4 bajnokságot és az ADAC Formula 4 bajnokságot is megnyerte 2021-ben, valamint a 2022-es FIA Formula 3-ban harmadik helyezést ért el. A Red Bull Junior Team tagja és az év újonca díjjal jutalmazták 2020-ban. Crawford karrierje során több karting versenyt is nyert, beleértve a CIK-FIA világbajnokságot is 2016-ban. Az amerikai versenyzőt a Ferrari Driver Academy is támogatja1.	15	jak-crawford	hitech-pulse-eight
32	Arthur Leclerc	23	12	180	Monaco	0	2023-10-17 20:24:03.102352	2023-10-17 20:24:03.102352	3	5	2	Arthur 2000. október 14-én született Monacóban. 2018-ban indult először együléses autóval a francia Forma-4-es bajnokságban. Az egész szezonban folyamatosan fejlődött, két győzelmet aratott Le Castelletben és Zandvoortban, egy második helyet, egy pole pozíciót és két leggyorsabb versenykört. , 2023-ra feljutott a Forma-2-be a DAMS csapatával.	16	arthur-leclerc	dams
38	Clément Novalak	23	21	177	Franciaország	0	2023-10-17 20:24:03.127538	2023-10-17 20:24:03.127538	0	0	2	Az MP Motorsport csapatánál a 2021-es szezon utolsó két fordulójában Clément Novalak francia versenyző élvezte azt a plusz előnyt, hogy nemcsak a vártnál korábban debütált a Forma-2-ben, hanem azzal a csapattal is, amelyért 2022-ben versenyzett.\nNovalak annak a bajnokságnak a hátterében lépett fel a Forma-3-ból, amelynek során négy dobogóra állt fel, és harmadik helyen végzett a bajnokságban a Trident csapatával.	19	clement-novalak	trident
33	Jack Doohan	20	14	183	Ausztrália	0	2023-10-17 20:24:03.106389	2023-10-17 20:24:03.106389	0	0	2	Küzdött az újonc F3-szezonban, nem szerzett pontot, de megfiatalodott a Tridentre váltás miatt. Dennis Hauger legerősebb bajnoki kihívójaként négyszer nyert és hét dobogós helyezést ért el egy áttörést jelentő évben.\nAz ötszörös Moto GP-világbajnok, Mick Doohan fia, 2022 volt az ausztrál első teljes éve az F2-ben, 2021 utolsó két fordulójában vett részt, ahol az első öt helyen végzett, a kvalifikációban pedig második lett.\nAz ázsiai F3-ban (2019-ben és 2020-ban) kétszeres második helyezett Doohan a brit F4-ben és az Euroformula Openen is rendelkezik együléses tapasztalattal.	17	jack-doohan	invicta-virtuosi-racing
93	Sebastian Job	23	13	0	Nagy Britannia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	1	4	sebastian-job	38	sebastian-job	oracle-red-bull-sim-racing
91	Frederik Rasmussen	23	19	0	Norvégia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	12	35	4	frederik-rasmussen	38	frederik-rasmussen	oracle-red-bull-sim-racing
92	Josh Idowu	20	52	0	Nagy Britannia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	2	4	josh-idowu	38	josh-idowu	oracle-red-bull-sim-racing
94	Jed Norgrove	20	79	0	Nagy Britannia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	jed-norgrove	39	jed-norgrove	scuderia-alphatauri-orlen-esports-team
95	Joni Tormala	27	51	0	Svédország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	4	4	joni-tormala	39	joni-tormala	scuderia-alphatauri-orlen-esports-team
97	Bardia Broumand	20	7	0	Irán	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	1	8	4	bardia-broumand	40	bardia-broumand	scuderia-ferrari-esports
53	Mari Boya	19	11	0	Spanyolország	0	2023-10-18 20:17:37.549326	2023-10-18 20:17:37.549326	0	1	3	Jelenleg az MP Motorsport csapatával versenyez az 2023-as Formula 3 Bajnokságban és az 2023-as Eurocup-3 szezonban1. Korábban versenyzett a Formula Regional European Championshipben 2021-ben és 2022-ben, és a 2020-as Spanish F4 bajnokságban lett a második.	25	mari-boya	mp-motorsport-f3
63	Ido Cohen	22	22	180	Izrael	0	2023-10-18 20:17:37.589271	2023-10-18 20:17:37.589271	0	0	3	Korábban versenyzett az Italian F4-ben és az ADAC Formula 4-ben1. 2019-ben megnyerte a Formula 4 kategóriát az FIA Motorsport Games-en.	28	ido-cohen	rodin-carlin-f3
59	Rafael Villagómez	22	18	168	Mexikó	0	2023-10-18 20:17:37.57391	2023-10-18 20:17:37.57391	0	0	3	A mexikói 2023-ban tért vissza a bajnokságba, ismét a Van Amersfoort Racing csapatánál. A 2023-as Formula Regionális Közel-Kelet Bajnokságon is részt vett a VAR-ral, még a fő kampány kezdete előtt.	27	rafael-villagomez	van-amersfoort-racing-f3
61	Oliver Gray	18	20	0	Nagy Britannia	0	2023-10-18 20:17:37.581494	2023-10-18 20:17:37.581494	0	0	3	Korábban versenyzett az F4 Brit Bajnokságban, ahol 2022-ben második helyezést ért el1. 2022 óta tagja a Williams Driver Academy-nak	28	oliver-gray	rodin-carlin-f3
58	Caio Collet	21	17	176	Brazília	0	2023-10-18 20:17:37.570067	2023-10-18 20:17:37.570067	3	11	3	Jelenleg a Van Amersfoort Racing csapatával versenyez az 2023-as Formula 3 Bajnokságban1. Korábban versenyzett a Formula Renault Eurocupban és az ADAC Formula 4-ben1. 2018-ban megnyerte a francia F4 bajnokságot1.	27	caio-collet	van-amersfoort-racing-f3
66	Joshua Dufek	19	25	0	Svájc	0	2023-10-18 20:17:37.6015	2023-10-18 20:17:37.6015	0	0	3	Dufeket a Campos Racing hívta be a 2023-as FIA Forma-3-as bajnokság utolsó, monzai fordulójára, Hugh Barter helyére.  Miután kipördült a kvalifikációból, mindkét futamban a 14. helyen végzett, ami elég ahhoz, hogy a 29. helyre emelje a tabellán, hat másik pilótát megelőzve. Ezután tesztelt a PHM Racingben a szezon utáni teszt során.	29	joshua-dufek	campos-racing-f3
68	Taylor Barnard	19	27	0	Nagy Britannia	0	2023-10-18 20:17:37.609483	2023-10-18 20:17:37.609483	1	3	3	Taylor Barnard brit autóversenyző, aki utoljára a Jenzer Motorsport csapatánál versenyzett az FIA Formula 3-ban. Ő az ADAC Formula 4 uralkodó második helyezettje, valamint a Forma-1 világbajnokának, Nico Rosbergnek egykori pártfogoltja. 	30	taylor-barnard	jenzer-motorsport-f3
31	Ayumu Iwasa	22	11	166	Japán	0	2023-10-17 20:24:03.098022	2023-10-17 20:24:03.098022	2	5	2	A Red Bull junior és Honda Formula Dream Project pilótája, Ayumu Iwasa karrierje azóta is felfelé ível, hogy első európai versenyszezonjában megnyerte a francia Forma-4-es bajnoki címet. \nA japán pilóta a tavalyi Hitech Nagydíjjal erősíti meg a stabil újonc bajnokságot az F3-ban. Iwasa a 12. helyen végzett a pilóták bajnokságában két dobogós helyezéssel, köztük egy budapesti győzelemmel.	16	ayumu-iwasa	dams
34	Amaury Cordeel	21	15	172	Belgium	0	2023-10-17 20:24:03.111085	2023-10-17 20:24:03.111085	0	0	2	Amaury Cordeel az újonc Van Amersfoort Racinggel lépett fel a Forma-2-be 2022-ben.\nA belga csak az elmúlt szezonban ugrott be az F3-ba a Campos Racinggel – ahol a legjobb 11. helyezést érte el –, miután 2020-ban három fronton versenyzett, a Formula Renault Eurocupban, a Castrol Toyota Racing Seriesben és az F3 Asiaban.	17	amaury-cordeel	invicta-virtuosi-racing
43	Paul Aron	19	1	171	Észtország	0	2023-10-18 20:17:37.512109	2023-10-18 20:17:37.512109	1	4	3	Jelenleg a Prema Racing csapatával versenyez az 2023-as Formula 3 Bajnokságban1. Korábban versenyzett a Formula Regional European Championshipben és a Formula Renault Eurocupban1. 2019-ben megnyerte a kezdők kupáját az olasz F4 bajnokságban és harmadik helyen végzett az általános értékelésben1.	22	paul-aron	prema-racing-f3
44	Dino Beganovic	19	2	173	Svédország	0	2023-10-18 20:17:37.518354	2023-10-18 20:17:37.518354	0	4	3	Jelenleg a Prema Racing csapatával versenyez az 2023-as Formula 3 Bajnokságban1. Korábban versenyzett az Italian F4 Championshipben és a Formula Regional European Championshipben1. 2022-ben megnyerte a Formula Regional European bajnokságot1.	22	dino-beganovic	prema-racing-f3
46	Leonardo Fornaroli	18	4	173	Olaszország	0	2023-10-18 20:17:37.522441	2023-10-18 20:17:37.522441	0	3	3	A 2004-ben született Leonardo Fornaroli rövid karrierje ellenére már fontos eredményeket ért el. A Formula Regional by Alpine téli tesztjei után 2023-ban a Trident színeivel igazolt a Forma-3-ba.	23	leonardo-fornaroli	trident-f3
48	Oliver Goethe	19	6	173	Dánia	0	2023-10-18 20:17:37.530337	2023-10-18 20:17:37.530337	1	2	3	2023-ban Oliver teljes szezont futott a Forma-3-ban a Trident Motorsporttal.\nCsillagosan rajtolt a szezonban Bahreinben a vasárnapi Feature Race második helyével.\nOliver látványos módon megszerezte első FIA F3-as győzelmét a Silverstone-i futamon.\nÚjonc szezonját a nyolcadik helyen zárta a 35 induló közül az összetettben.	23	oliver-goethe	trident-f3
50	Grégoire Saucy	23	8	180	Svájc	0	2023-10-18 20:17:37.53792	2023-10-18 20:17:37.53792	0	3	3	Grégoire Saucy egy autóversenyző, aki jelenleg is hírnevet szerez magának a Forma-3-ban. 2020 óta fejezi ki tehetségét az ART Grand Prix csapaton belül számos győzelemmel és dobogós helyezéssel különböző együléses kategóriákban, valamint 2021-ben az Alpine Formula Regional bajnoka címmel.	24	gregoire-saucy	art-grand-prix-f3
1	Max Verstappen	26	1	181	Hollandia	3	2023-10-13 13:44:08.122438	2023-10-13 13:44:08.122438	48	92	1	Verstappen a Forma-1-ben is versenyző Jos Verstappen és Sophie Kumpen fia. Sikeres volt futballban, junior gokart és együléses kategóriákban (KF3, a WSK World Series, a KZ2 és a European Formula 3), melyekben számos rekordot megdöntött. A 2015-ös Ausztrál Nagydíjon 17 évesen, 166 naposan ő lett a legfiatalabb versenyző, aki versenyen indult a Forma-1-ben. Miután a 2015-ös szezont a Scuderia Toro Rossónál töltötte, Verstappen 2016-os szezonját az olasz csapatnál kezdte, majd négy futam után az anyacsapat Red Bull Racing istálóba szerződtették Daniil Kvyat helyett. 18 évesen megnyerte a 2016-os Spanyol Nagydíjat, amikor debütált a Red Bull Racingben, ezzel a valaha volt legfiatalabb- és az első holland pilóta, aki megnyerte a Forma-1-es nagydíjat.	1	max-verstappen	oracle-red-bull-racing
8	Oscar Piastri	22	81	182	Ausztrália	0	2023-10-13 13:44:08.151971	2023-10-13 13:44:08.151971	0	1	1	A Melbourne-ben született, mindössze egy kőhajításnyira az Ausztrál Nagydíj helyszínétől. A fiatal Oscar Piastri álmait, hogy egy napon versenyezzen a Forma-1-ben, lángra lobbantották a sportág sztárpilótái, akik helyi utcáin, más néven Albert Parkban üvöltöttek.\nDe hatalmas elköteleződést és áldozatot követelne meg, hogy ezt az álmot valóra váltsuk, és Európába költözve – olyan honfitársaik, mint Mark Webber és Daniel Ricciardo előtte – az egyetlen módja annak, hogy szembeszálljunk a legjobbakkal és felkeltsük a figyelmet. a sportág döntéshozói közül.	4	oscar-piastri	mclaren-f1-team
9	Fernando Alonso	42	14	171	Spanyolország	2	2023-10-13 13:44:08.16032	2023-10-13 13:44:08.16032	32	105	1	Michael Schumacher a Forma-1 vitathatatlan királya volt a 2000-es évek elején, és olyan ütemben aratott győzelmeket és bajnoki címeket, amelyekről akkoriban egyszerűen nem volt szó. Valaki nagyon különleges emberre volt szükség ahhoz, hogy ledöntse a Ferrari legendáját a trónjáról – és hogy Fernando Alonso volt az, aki ezt megtette, mindent elmond, amit a spanyolról tudni kell.\nA kiélezett versenyben Alonso nem szégyelli a tehetségét, 9/10-re értékeli magát „mindenben”, és kevesen értenek egyet azzal, hogy az F1-ben nyújtott teljesítményét hólyagos sebesség, briliáns taktikai gondolkodás, példaértékű versenyzés, borotva jellemezte. -éles szem a részletekre és könyörtelen elszántság a győzelemre.	5	fernando-alonso	aston-martin-aramco-cognizant-formula-one-team
11	Esteban Ocon	27	31	186	Franciaország	0	2023-10-13 13:44:08.167389	2023-10-13 13:44:08.167389	1	3	1	Ha van egy szó, ami uralja Esteban Ocon karrierjét, az az „áldozat”.\nAmikor Ocon még csak egy ígéretes gokartos volt, a szülei eladták a házukat, felfüggesztették a munkájukat, és úton-útfélen éltek, lakókocsiban éltek, és körről körre utaztak, hogy támogassák fiuk virágzó karrierjét.\nÁldozat, lásd – de sikerült. 2014-ben Ocon áttört az együlésesek világában, ugyanis egy bizonyos Max Verstappent verte meg az Európai F3-as címért. A Mercedes támogatásával a következő évben megnyerte a GP3-as bajnoki címet, 2016-ban pedig a DTM-szezon felénél járt, amikor felajánlották neki, hogy a Belga Nagydíjtól kezdve Rio Haryantót helyettesítse a kis Manor csapatánál.	6	esteban-ocon	bwt-alpine-f1-team
12	Pierre Gasly	27	10	177	Franciaország	0	2023-10-13 13:44:08.170803	2023-10-13 13:44:08.170803	1	4	1	Ha van valaki, aki tudja, mekkora hullámvasút lehet egy F1-es pilóta karrierje, az Pierre Gasly!\nA repülő franciát behívták 2017-ben Malajziába, Daniil Kvyat helyére, és miután bizonyította rátermettségét, a következő évben a Toro Rosso versenyzőjének nevezték ki. Újabb 21 futam után Gasly ismét feljebb került – ezúttal a Red Bull nagyágyúja, Daniel Ricciardo helyére.\nÚgy tűnt, Gasly rendelkezik azzal a képességgel, hogy a megfelelő helyen legyen a megfelelő időben – ez a tulajdonság a pályán egyaránt hasznos. A Toro Rosso 2018-as lenyűgöző teljesítményeinek sorozata – köztük egy ragyogó negyedik hely Bahreinben – izgalmas ígéretet tett arra vonatkozóan, hogy mit tehet az „A” csapattal 2019-ben.	6	pierre-gasly	bwt-alpine-f1-team
17	Kevin Magnussen	30	20	174	Dánia	0	2023-10-13 13:44:08.186553	2023-10-13 13:44:08.186553	0	1	1	Nevezzük mesterkéltnek, de Magnussen egyetlen okból – versenyzés céljából – visszatért a Forma-1-be.\nLehet, hogy egy második generációs F1-es pilóta – apját, Jant követve a rajtrácsra –, de Magnussen bálványai a nagydíjas versenyzés „aranykorszakából” származnak, amikor olyanok, mint Juan Manuel Fangio és Stirling Moss mindent kockára tettek a szerelemért. a sportágról.\nA roskildei versenyző saját képességeit a McLaren debütálása során bizonyította, amely végigvezette őt a juniorok között, amikor a 2014-es Ausztrál Nagydíjon a legjobb három közé cirkált, és ő lett az első dán, aki dobogóra állhatott az F1-ben.	10	kevin-magnussen	moneygram-haas-f1-team
16	Yuki Tsunoda	23	22	159	Japán	0	2023-10-13 13:44:08.184064	2023-10-13 13:44:08.184064	0	0	1	A Forma-1 teljes története során egyetlen japán pilóta sem nyert világbajnoki nagydíjat. Yuki Tsunoda lehet az első? A Red Bull minden bizonnyal így gondolja, mivel a fiatal már nagyon úton van a felnőtt csapatuk felé, ha továbbra is lenyűgözi, ahogy az elmúlt években tette.\nTsunoda feljutása a motorsport legfelső szintjére elképesztően gyors volt: a japán F4-es versenyzésből alig több mint három év alatt Formula-1-es üléssé vált AlphaTaurival, miután 2019-ben úgy érkezett Európába, hogy nem tudott a pályákról.	7	yuki-tsunoda	scuderia-alphatauri
2	Sergio Pérez	33	11	173	Mexikó	0	2023-10-13 13:44:08.126654	2024-02-12 17:18:42.5225	6	34	1	Checo Perez mexikói autóversenyző, a 2007-es brit Formula–3-as bajnokság national class értékelésének győztese, valamint a 2010-es GP2-es szezon ezüstérmese. 2011-től 2012-ig a Sauber Motorsport versenyzője volt a Formula–1-es világbajnokságon. 2013-ban a McLarennél folytatta pályafutását, 2014-től 2018-ig a Force India pilótája volt. 2019-től 2020-ig a Racing Point F1 Team pilótája. 2021-től Max Verstappen csapattársa a Red Bullnál. A Formula–1 történetének legsikeresebb mexikói versenyzője.	1	sergio-perez	oracle-red-bull-racing
5	Lewis Hamilton	38	44	174	Nagy Britannia	7	2023-10-13 13:44:08.129502	2024-04-07 17:09:04.055312	103	196	1	„Still I Rise” – ezek a szavak Lewis Hamilton sisakjának hátulján, vállára tetoválva, és amióta 2007-ben az F1 történetének egyik legnagyobb újonc teljesítményével semmisítette meg a várakozásokat, szó szerint csak ennyit tett: felemelkedett. minden idők pole pozícióinak első helyén hősét, Ayrton Sennát megelőzve a győzelmek oszlopában az első helyre ugrott be, megelőzve az utánozhatatlan Michael Schumachert, majd megmérkőzött a legendás német hét világbajnoki címével.	3	lewis-hamilton	mercedes-amg-petronas-formula-one-team
19	Alexander Albon	27	23	186	Thaiföld	0	2023-10-13 13:44:08.191504	2023-10-13 13:44:08.191504	0	2	1	A londoni születésű, de Thaiföld zászlaja alatt versenyző Alexander Albon első szava valójában olasz volt. Ez a szó a Ferrari volt – bár egy másik olasz csapatnál érte el a nagy F1-es szünetet.\nA Michael Schumachert bálványozó és egy nap Forma-1-es versenyzésről álmodozó ifjú Albont egy bizonyos Charles Leclerc a 2016-os GP3-as címhez juttatta. Ezt követően felhagyott George Russell pályaparti barátságával, mivel túl komolyan vette a 2018-as Forma-2-es címért folytatott küzdelmet.\nA 2019-ben egy másik kortárssal – Lando Norrissal – az F1-es nagyligába érő Albon a Toro Rossóval a pályán beszélt a nyitófutamokon, így a szezon közbeni feljutást a Red Bull Racinghez.	9	alexander-albon	williams-racing
20	Logan Sargeant	22	2	181	USA	0	2023-10-13 13:44:08.193943	2023-10-13 13:44:08.193943	0	0	1	Logan Sargeant majdnem nyolc év után az első amerikai pilóta lett az F1-ben, amikor a 2023-as szezonban feláll a rajtrácsra, így ismét hazai kedvence lesz az országnak.\nA gokartban eredményes címgyőztes, a bajnoki dicsőség elkerülte Sargeant, miután áttért az együléses versenyzésre, de a pole pozíciók és a futamgyőzelmek szinte minden kategóriában, amelyen megküzdött, rávilágítottak nyers sebességére és potenciáljára.\nValójában az F4 második helyezése az Egyesült Arab Emírségekben, harmadik a brit F4-ben és harmadik az F3-ban (a tekintélyes Makaói Nagydíjon is dobogóra állva) azt mutatta, hogy ott lehet ott vagy ott a különböző bajnokságokban, és rengeteg lehetőség van még kihasználatlan legyen.	9	logan-sargeant	williams-racing
35	Roy Nissany	28	16	176	Izrael	0	2023-10-17 20:24:03.115165	2023-10-17 20:24:03.115165	0	1	2	Az az ember, akinek a mottója: "The sky's not the limit, the mind is." Roy Nissany 2022-ben is a DAMS-nél maradt, miután eddigi legerősebb szezonját élvezte a francia csapatnál. A 16. helyen végzett Nissany megszerezte első dobogós helyezését a Forma-2-ben, és további két helyezést ért el a legjobb 10 között.\nAz izraeli először 2020-ban tért vissza az F2-be, miután egy év kihagyott a versenyzéstől - részben egy váratlan edzéssérülés miatt. A Tel-Avivban született és Franciaországban nevelkedett Nissany kapcsolatban áll a Forma-1-gyel is.	18	roy-nissany	phm-racing
36	Joshua Mason	21	17	176	Nagy-Britannia	0	2023-10-17 20:24:03.119339	2023-10-17 20:24:03.119339	0	0	2	Joshua Mason Akinwunmi egy brit autóversenyző, aki jelenleg a PHM Racing by Charouz csapatával versenyez a 2023-as FIA Formula 2 bajnokságban. Az év újonca díjjal jutalmazták 2020-ban, és az FR European Rookie Championship-et is megnyerte. Mason több karting versenyt is nyert.	18	joshua-mason	phm-racing
37	Roman Stanek	19	20	180	Csehország	0	2023-10-17 20:24:03.123262	2023-10-17 20:24:03.123262	0	0	2	Roman Staněk Jr. egy cseh autóversenyző, aki jelenleg a Trident csapatával versenyez a 2023-as FIA Formula 2 bajnokságban. A fiatal versenyző már három szezont teljesített az FIA Formula 3-ban, ahol 2022-ben az ötödik helyezést érte el, és 2019-ben megnyerte az ADAC Formula 4 újoncok bajnokságát.	19	roman-stanek	trident
39	Richard Verschoor	22	22	187	Hollandia	0	2023-10-17 20:24:03.132008	2023-10-17 20:24:03.132008	2	5	2	Hat év után az MP Motorsport különböző bajnokságokban, Richard Verschoor tavaly az ismeretlenbe lépett a Tridenttel. Bár minden bizonnyal segít, hogy "szereti" Olaszországot.\nVerschoornak a rajtrács utolsó szerzőjeként kevés ideje volt a felkészülésre, de semmi, ha nem alkalmazkodóképes. Csupán egy fordulóba telt Tridenttel, hogy megszerezze a csapat legjobb kvalifikációs pozícióját az elmúlt több mint egy évben, a kilencedik helyen Bahreinben.\nA holland együléses tapasztalatok széles tárházával rendelkezik: az autóversenyzés első évében, még 2016-ban megnyerte az SMP-t és a spanyol Forma-4-es bajnokságot MP-vel.	20	richard-verschoor	van-amersfoort-racing
40	Juan Manuel Correa	24	23	184	USA	0	2023-10-17 20:24:03.136705	2023-10-17 20:24:03.136705	0	0	2	Juan Manuel Correa, a száguldó amerikai-ecuadori versenyző, aki a szívét és lelkét adja minden egyes versenyéért. 2023-ban az FIA Formula 2 Bajnokságban és az FIA Világbajnokságon is részt vesz, a Van Amersfoort Racing és a Prema Racing csapatokkal1. A versenyzés iránti szenvedélye már korán megmutatkozott, amikor 2008-ban elkezdett profi gokartozni, és számos bajnoki címet szerzett Ecuadorban és az Egyesült Államokban1. Súlyos balesetet szenvedett 2019-ben, de lenyűgöző erővel és elszántsággal tért vissza a versenypályára2.	20	juan-manuel-correa	van-amersfoort-racing
42	Ralph Boschung	26	25	186	Svájc	0	2023-10-17 20:24:03.145402	2023-10-17 20:24:03.145402	0	4	2	Jelenleg a Campos Racing csapatával versenyez az 2023-as Formula 2 Bajnokságban1. Korábban versenyzett a GP3-ban, az ADAC Formel Mastersben és a Formula BMW Talent Cupban1. 2017 óta versenyez a Formula 2-ben, a Campos, MP Motorsport és Trident csapatokkal1. 	21	ralph-boschung	campos-racing
45	Zak O'Sullivan	18	3	180	Nagy Britannia	0	2023-10-18 20:17:37.512	2023-10-18 20:17:37.512	4	7	3	Zak 2022-ben Carlinnal debütált az FIA Formula 3-ban, két dobogós helyezést és pole pozíciót ért el hazai versenyén, és ezzel a 11. helyen végzett a ranglistán. A Williams Racing Academy pilótája a PREMA színeiben versenyzik a 2023-as FIA Forma-3-as bajnokságban.	22	zak-o-sullivan	prema-racing-f3
47	Gabriel Bortoleto	19	5	173	Brazília	1	2023-10-18 20:17:37.526376	2023-10-18 20:17:37.526376	2	6	3	Gabriel Bortoleto Oliveira brazil autóversenyző, a 2023-as FIA Formula–3 bajnokság győztese. Jeleneleg a McLaren utánpótlás-csapatának tagja. 2022 szeptemberében csatlakozott a kétszeres F1-es világbajnok Fernando Alonso által menedzselt ügynökséghez. 2023 októberében bejelentették, hogy a McLaren utánpótlás-csapatának tagja lett.	23	gabriel-bortoleto	trident-f3
49	Kaylen Frederick	21	7	175	USA	0	2023-10-18 20:17:37.534105	2023-10-18 20:17:37.534105	0	0	3	Kaylen 2021-ben bekerült az FIA F3-as bajnokságába, azonban a Red Bull Ringen történt balesetet és sérülést követően Kaylen hét futamot hagyott ki a sorozatból. A következő évben, 2022-ben Kaylen több versenyszámban is a legjobb 10 között végzett, azonban a pályaincidensek és az autós problémák korlátozták a bajnoki pontokat, Kaylen pedig a 17. helyen végzett, annak ellenére, hogy erősen indult az évben.	24	kaylen-frederick	art-grand-prix-f3
74	Matthijs van Erven	20	72	0	Hollandia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	matthijs-van-erven	32	matthijs-van-erven	alfa-romeo-f1-team-kick-esports
76	Luke Smith	18	75	0	Nagy Britannia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	luke-smith	33	luke-smith	alpine-esports
75	Thomas Ronhaar	18	39	0	Hollandia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	3	8	4	thomas-ronhaar	32	thomas-ronhaar	alfa-romeo-f1-team-kick-esports
77	Patrik Sipos	20	80	0	Magyarország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	patrik-sipos	33	patrik-sipos	alpine-esports
55	Sebastián Montoya	18	14	0	Kolumbia	0	2023-10-18 20:17:37.558166	2023-10-18 20:17:37.558166	0	0	3	2022 rendkívül mozgalmasnak bizonyult Sebastian számára, mivel négy különböző sorozatban versenyzett. Sebastian a 2022-es IMSA SportsCar Bajnokság alatt debütált az állóképességi versenyeken, és először szerepelt az FIA Formula 3 bajnokságban Zandvoortban, a Campos Racing számára.	26	sebastian-montoya	hitech-pulse-eight-f3
21	Dennis Hauger	20	1	181	Norvégia	0	2023-10-17 20:24:03.027748	2023-10-17 20:24:03.027748	4	8	2	Nehéz debütáló szezonja volt a Forma-3-ban, ugyanakkor a második évében vágtában megnyerte a címet. Az elejétől a végéig vezetett a PREMA Racinggel, 20 versenyen három pole pozíciót és kilenc dobogós helyezést, köztük négy győzelmet.\nA Red Bull junior együléses pályafutása 2018-ban kezdődött a gokart trófeával megrakott rekordja mögött. Megnyerte az olasz F4-et és második lett 2019-ben az ADAC F4-ben, majd 2020-ban feljutott az F3-ba. A Hitech Nagydíjon autózva Hauger első dobogóra állt Budapesten, de újonc szezonját a 17. helyen zárta 14 ponttal, mielőtt átváltott volna az F3-ba. PREMA.\nA PREMA-val feljutott az F2-be, ahol a 2021-es bajnok Oscar Piastri leváltása lesz a feladata.	11	dennis-hauger	mp-motorsport
52	Franco Colapinto	20	10	174	Argentína	0	2023-10-18 20:17:37.545622	2023-10-18 20:17:37.545622	4	10	3	Franco Colapinto egy 20 éves, argentin Williams Racing Driver Academy pilóta, aki az FIA Formula 3-ban versenyez az MP Motorsport csapatával. A 2023-as szezonra Francót a Williams Racing Pilóta Akadémia szerződtette, és az FIA Formula 3 bajnokságban versenyez az MP Motorsporttal.	25	franco-colapinto	mp-motorsport-f3
54	Jonny Edgar	19	12	177	Nagy Britannia	0	2023-10-18 20:17:37.553562	2023-10-18 20:17:37.553562	1	1	3	Jelenleg az MP Motorsport csapatával versenyez az 2023-as Formula 3 Bajnokságban1. Korábban versenyzett az ADAC Formula 4-ben és a Formula Renault Eurocupban1. 2020-ban megnyerte az ADAC Formula 4 bajnokságot.	25	jonny-edgar	mp-motorsport-f3
56	Gabriele Minì	18	15	0	Olaszország	0	2023-10-18 20:17:37.562192	2023-10-18 20:17:37.562192	2	4	3	2022 szeptemberében Minì részt vett az FIA Formula 3 utószezoni tesztjén Jerezben, a Hitech Nagydíjon, és az első napon a leggyorsabb kört érte el. Még abban a novemberben Minì bejelentette, hogy a 2023-as FIA Forma-3-as bajnokságon a brit csapatnál fog vezetni.\nRészt vett a szezon utáni teszteken a Prema Racinggel. Az imolai teszt során mindkét napon a leggyorsabb kört érte el. Minì a Makaói Nagydíjon is részt vett a Premával.	26	gabriele-mini	hitech-pulse-eight-f3
57	Luke Browning	21	16	0	Nagy Britannia	0	2023-10-18 20:17:37.566155	2023-10-18 20:17:37.566155	0	1	3	Luke Browning a brit motorsportok egyik feltörekvő sztárja, aki eddigi lenyűgöző versenyzői karrierje során figyelnivalóként jelölte meg magát. 2023-ra az FIA F3-as arénájába költözve Luke-nak lehetősége volt bemutatni tudását az F1-es támogatási csomag részeként, amely egy második szezonra kiterjesztette kapcsolatát a Hitech-fel. Luke ezentúl a Williams F1-es csapatával is együtt fog dolgozni, miután feliratkozott a Driver Academy programjába.	26	luke-browning	hitech-pulse-eight-f3
60	Tommy Smith	21	19	0	Ausztrália	0	2023-10-18 20:17:37.577736	2023-10-18 20:17:37.577736	0	0	3	Thomas Smith egy ausztrál autóversenyző, aki legutóbb a 2023-as FIA Forma-3-as bajnokságban vett részt a Van Amersfoort Racinggel. Korábban a Douglas Motorsporttal versenyzett a GB3 bajnokságban, egy futamot nyert és két dobogós helyezést ért el.	27	tommy-smith	van-amersfoort-racing-f3
62	Francesco Simonazzi	19	21	0	Olaszország	0	2023-10-18 20:17:37.585327	2023-10-18 20:17:37.585327	2	11	3	Simonazzi bejelentette, hogy a 2023-as FIA Formula 3 bajnokságban Rodin Carlinnal indul az utolsó két fordulóban, Max Esterson helyére, aki visszatért a GB3 bajnokságba.	28	francesco-simonazzi	rodin-carlin-f3
64	Josep María Martí	18	23	185	Spanyolország	0	2023-10-18 20:17:37.592855	2023-10-18 20:17:37.592855	3	4	3	2023-ban a Formula 3-ban három futamot is megnyert, beleértve a hazai, barcelonai versenyét, a bajnokságban pedig végül ötödik helyezést ért el.\n\n2023 augusztusában csatlakozott a Red Bull Junior Teamhez.	29	josep-maria-marti	campos-racing-f3
78	Ruben Pedreno	17	93	0	Spanyolország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	ruben-pedreno	33	ruben-pedreno	alpine-esports
70	Sophia Floersch	22	29	173	Németország	0	2023-10-18 20:17:37.617193	2023-10-18 20:17:37.617193	0	0	3	Flörsch visszatért a FIA Formula–3 bajnokságba az újjáalakult PHM Racing by Charouz csapattal, az Alpine versenyzői akadémia tagjaként. 2023. július 2-án az osztrák Red Bull Ring főfutamán 9. lett, ezzel pedig történelmet írt, ugyanis ő lett az első női résztvevő, aki bajnoki pontokat szerzett a sorozatban. Pár órával később azonban utólag kizárták a végeredményből, mivel autója nem felelt meg az FIA technikai átvizsgálásain.	31	sophia-floersch	phm-racing-f3
69	Alejandro García	20	28	0	Mexikó	0	2023-10-18 20:17:37.613344	2023-10-18 20:17:37.613344	0	0	3	García a Jenzer Motorsport csapatánál vezetett a 2022-es FIA Forma-3-as bajnokság 3 napos szezon utáni tesztjén, Nikita Bedrin és Taylor Barnard újoncokkal együtt. 2023. január 27-én szerződtette a svájci csapat a 2023-as szezonra.	30	alejandro-garcia	jenzer-motorsport-f3
79	Fabrizio Donoso	24	8	0	Chile	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	2	4	fabrizio-donoso	34	fabrizio-donoso	aston-martin-aramco-cognizant-f1-esports
80	John Evans	19	3	0	Nagy Britannia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	john-evans	34	john-evans	aston-martin-aramco-cognizant-f1-esports
81	Simon Weigang	26	30	0	Németország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	simon-weigang	34	simon-weigang	aston-martin-aramco-cognizant-f1-esports
82	Dani Moreno	23	26	0	Spanyolország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	1	3	4	dani-moreno	35	dani-moreno	mclaren-shadow
67	Nikita Bedrin	17	26	0	Olaszország	0	2023-10-18 20:17:37.605452	2023-10-18 20:17:37.605452	0	2	3	Nyikita Vjacseszlavovics Bedrin orosz származású, olasz liszensszel rendelkező autóversenyző, jelenleg a Formula–3-ban a PHM Racing versenyzője.  2022-ben a Formula 4 arab bajnokságban negyedik helyen végzett. 2022-ben debütált a Formula–3-ban, tesztpilótaként. 2023-ban pedig már teljes jogú versenyzőként is indult.	30	nikita-bedrin	jenzer-motorsport-f3
23	Zane Maloney	20	3	165	Barbadosz	0	2023-10-17 20:24:03.040769	2023-10-17 20:24:03.040769	0	3	2	Zane Maloney egy barbadosi autóversenyző, aki 2003. október 2-án született1. Jelenleg a 2023-as FIA Formula 2 bajnokságban versenyez a Carlin csapatával12. Maloney megnyerte a 2019-es brit F4 bajnokságot, és a 2022-es FIA Formula 3-ban a Trident csapatával lett második1. 2022 decemberében bejelentették, hogy Maloney csatlakozik a Red Bull Junior Teamhez, és tartalékversenyzője lesz a Red Bull Racingnek 2023-ban1. Maloney 12 éves korában kezdett versenyezni Észak-Amerikában, és miután több karting címet nyert Barbadosban és Amerikában, hamarosan átment Európába, hogy a Ricky Flynn Motorsport színeiben versenyezzen1.	12	zane-maloney	rodin-carlin
24	Enzo Fittipaldi	22	4	168	Brazília	0	2023-10-17 20:24:03.06703	2023-10-17 20:24:03.06703	1	10	2	Enzo Fittipaldi, akit szenvedélyes rajongói légiója „kis cápának” nevezett, a Forma-2 első teljes szezonját támadja meg a Charouz Racing System-el.\nA brazil – a kétszeres Forma-1-es bajnok Emerson Fittipaldi unokája – a szezon 5. fordulójában, Monzában debütált a Forma-2-ben a cseh csapattal, mielőtt az utolsó előtti fordulóban megszerezte első pontjait Szaúd-Arábiában.\nFittipaldi 2021-ben az F3-as dobogós is volt, a második helyen végzett a budapesti Race 2-ben a cseh csapattal, mielőtt az F2-be lépett volna.	12	enzo-fittipaldi	rodin-carlin
30	Isack Hadjar	19	10	167	Franciaország	0	2023-10-17 20:24:03.093929	2023-10-17 20:24:03.093929	3	5	2	Isack Alexandre Hadjar egy francia-algériai autóversenyző, aki jelenleg a Hitech Pulse–Eight csapatával versenyez a 2023-as FIA Formula 2 bajnokságban. Hadjar az év újonca díjjal jutalmazták 2021-ben, miután megnyerte az FR European Rookie Championship-et. A Red Bull Junior Team tagjaként Hadjar a Formula Regional European Championship-ben is versenyzett, és első pontjait Imolában szerezte meg. A fiatal versenyzőnek több karting címe is van, beleértve a CIK-FIA világbajnokságot is 2016-ban1.	15	isack-hadjar	hitech-pulse-eight
51	Nikola Tsolov	16	9	180	Bulgária	0	2023-10-18 20:17:37.541762	2023-10-18 20:17:37.541762	0	0	3	2022 szeptemberében Solov részt vett az FIA Forma-3 szezon utáni tesztjén, az ART Nagydíjon. December 19-én bejelentették, hogy a 2023-as szezonban az ART Grand Prix egyik pilótája lesz. Szolov két pontot ért el a sprintversenyeken Spa-Francorhampsban és Monzában. A szezont a 22. helyen zárta. Tsolov 2022 márciusában lett az Alpine Affiliate program tagja. 2023. február 14-én az Alpine Academy rendes tagjává léptették elő.	24	nikola-tsolov	art-grand-prix-f3
14	Zhou Guanyu	24	24	175	Kína	0	2023-10-13 13:44:08.177814	2023-10-13 13:44:08.177814	0	0	1	Kína soha nem büszkélkedhetett Nagydíj-indulóval polgárai körében – de Zhou Guanyu pilótát bíztak meg a helyzet megváltoztatásával, miután megkapta a felkérést, hogy 2022-ben debütáljon az Alfa Romeóban az F1-ben.\nA sanghaji születésű versenyző 2004-ben, ötévesen részt vett szülővárosa nyitó Nagydíján, ahol hősének, Fernando Alonsónak szurkolt. Ám miután elkapta a versenyhibát, a kínai pilóta azt az ambiciózus célt tűzte ki maga elé, hogy országa első F1-es versenyzője legyen – olyan bravúrt valósítva meg, amely Ma Csinghuának, az egyetlen kínai versenyzőnek, aki részt vett a Forma-1-es hétvégén, soha nem sikerült.	8	zhou-guanyu	alfa-romeo-f1-team-stake
65	Christian Mansell	18	24	0	Ausztrália	0	2023-10-18 20:17:37.596835	2023-10-18 20:17:37.596835	0	2	3	November 28-án Mansellt a Campos Racing főállású versenyzőjeként mutatták be a 2023-as F3-as szezonban. Majd kijelentette, hogy 2022-es cameo-szereplése után "éhes volt a saját és a Campos Racing teljes potenciáljának maximalizálására". Bahreinben mindkét futamot a 13. helyen zárta. Melbourne-ben a kilencedik helyen szerezte meg első pontjait, miután három előtte álló pilótát a sprint futam után kizártak.	29	christian-mansell	campos-racing-f3
71	Roberto Faria	19	30	0	Brazília	0	2023-10-18 20:17:37.621482	2023-10-18 20:17:37.621482	0	0	3	2022 szeptemberében Faria részt vett az FIA Formula 3 utószezoni tesztjén a Van Amersfoort Racinggel az első napon. 2023 februárjában a Charouz a PHM Racing versenyzőjeként jelentette be Fariát a 2023-as FIA Formula 3-as bajnokságban.	31	roberto-faria	phm-racing-f3
72	Woohyun Shin	19	31	0	Korea	0	2023-10-18 20:17:37.625269	2023-10-18 20:17:37.625269	0	0	3	Shin Woohyun, aki a versenypályán Michael Shin néven is ismert, nem csak egy átlagos versenyző1. 2004. augusztus 23-án született Dél-Koreában, és már fiatal korában elkezdett érdeklődni az autóversenyzés iránt1. Az FIA Formula 3 bajnokságban is részt vett, ahol a PHM Racing by Charouz csapatával versenyzett2. Woohyun nem csak a versenypályán, hanem azon kívül is kitűnik: ő az első dél-koreai versenyző, aki részt vett az FIA Formula 3 bajnokságban1. 	31	woohyun-shin	phm-racing-f3
73	Brendon Leigh	24	48	0	Nagy Britannia	2	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	6	13	4	brendon-leigh	32	brendon-leigh	alfa-romeo-f1-team-kick-esports
96	Tom Manley	18	6	0	Nagy Britannia	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	tom-manley	39	tom-manley	scuderia-alphatauri-orlen-esports-team
98	István Puki	22	62	0	Magyarország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	istvan-puki	40	istvan-puki	scuderia-ferrari-esports
99	Nicolas Longuet	21	40	0	Franciaország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	3	2	4	nicolas-longuet	40	nicolas-longuet	scuderia-ferrari-esports
100	Alvaro Carreton	22	9	0	Spanyolország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	3	4	alvaro-carreton	41	alvaro-carreton	williams-esports
101	Ismael Fahssi	17	54	0	Spanyolország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	0	0	4	ismael-fahssi	41	ismael-fahssi	williams-esports
102	Marcel Kiefer	25	42	0	Németország	0	2023-10-18 20:17:37.625	2023-10-18 20:17:37.625	3	15	4	marcel-kiefer	41	marcel-kiefer	williams-esports
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, image_name, created_at, updated_at, team_slug, description, image_url) FROM stdin;
230	oracle-red-bull-racing	2023-12-30 10:29:39.115973	2023-12-30 10:29:39.157005	oracle-red-bull-racing	Oracle Red Bull Racing	\N
232	scuderia-ferrari	2023-12-30 11:02:56.929853	2023-12-30 11:02:56.953879	scuderia-ferrari	Scuderia Ferrari	\N
234	scuderia-ferrari	2023-12-30 11:03:35.762043	2023-12-30 11:03:35.789681	scuderia-ferrari	Scuderia Ferrari	\N
235	mercedes-amg-petronas-formula-one-team	2023-12-30 11:19:04.173833	2023-12-30 11:19:04.212132	mercedes-amg-petronas-formula-one-team	Mercedes-AMG Petronas Formula One Team	\N
238	mclaren-f1-team	2023-12-30 11:20:27.977684	2023-12-30 11:20:28.010311	mclaren-f1-team	McLaren F1 Team	\N
178	george-russell	2023-12-23 14:56:06.36239	2023-12-23 14:56:06.380984	mercedes-amg-petronas-formula-one-team	George Russell	\N
179	lando-norris	2023-12-23 14:56:52.356708	2023-12-23 14:56:52.376709	mclaren-f1-team	Lando Norris	\N
180	oscar-piastri	2023-12-23 14:57:20.915026	2023-12-23 14:57:20.938756	mclaren-f1-team	Oscar Piastri	\N
181	fernando-alonso	2023-12-23 14:58:33.758166	2023-12-23 14:58:33.784878	aston-martin-aramco-cognizant-formula-one-team	Fernando Alonso	\N
184	pierre-gasly	2023-12-23 15:05:13.735477	2023-12-23 15:05:13.767114	bwt-alpine-f1-team	Pierre Gasly	\N
174	sergio-perez	2023-12-23 14:39:23.410391	2023-12-23 14:39:23.440039	oracle-red-bull-racing	Sergio Perez	\N
177	charles-leclerc	2023-12-23 14:55:27.148562	2023-12-23 14:55:27.163166	scuderia-ferrari	Charles Leclerc	\N
194	dennis-hauger	2023-12-28 14:36:39.094511	2023-12-28 14:36:39.125136	mp-motorsport	Dennis Hauger	\N
169	formula1	2023-12-14 20:17:26.452642	2023-12-14 20:17:26.537226	1	Formula 1 Logo	\N
173	formula-3	2023-12-23 09:43:55.323833	2023-12-23 09:43:55.367791	3	Formula 3 Logo	\N
239	mclaren-f1-team	2023-12-30 11:20:45.076883	2023-12-30 11:20:45.106617	mclaren-f1-team	McLaren F1 Team	\N
240	mclaren-f1-team	2023-12-30 11:21:05.760283	2023-12-30 11:21:05.786792	mclaren-f1-team	McLaren F1 Team	\N
241	aston-martin-aramco-cognizant-formula-one-team	2023-12-30 11:21:39.727512	2023-12-30 11:21:39.754003	aston-martin-aramco-cognizant-formula-one-team	Aston Martin Aramco Cognizant Formula One Team	\N
196	zane-maloney	2023-12-28 17:26:12.279988	2023-12-28 17:26:12.30873	rodin-carlin	Zane Maloney	\N
198	theo-pourchaire	2023-12-28 17:28:59.740106	2023-12-28 17:28:59.770741	art-grand-prix	Théo Pourchaire	\N
199	victor-martins	2023-12-28 17:31:44.835326	2023-12-28 17:31:44.88278	art-grand-prix	Victor Martins	\N
202	jak-crawford	2023-12-28 17:35:10.561767	2023-12-28 17:35:10.583701	hitech-pulse-eight	Jak Crawford	\N
204	ayumu-iwasa	2023-12-28 17:37:18.849023	2023-12-28 17:37:18.872892	dams	Ayumu Iwasa	\N
206	jack-doohan	2023-12-28 17:38:28.924271	2023-12-28 17:38:28.939926	invicta-virtuosi-racing	Jack Doohan	\N
207	amaury-cordeel	2023-12-28 17:39:10.025284	2023-12-28 17:39:10.044789	invicta-virtuosi-racing	Amaury Cordeel	\N
208	roy-nissany	2023-12-28 17:39:39.943504	2023-12-28 17:39:39.977597	phm-racing	Roy Nissany	\N
209	joshua-mason	2023-12-28 17:40:09.468938	2023-12-28 17:40:09.49405	phm-racing	Joshua Mason	\N
210	roman-stanek	2023-12-28 17:40:55.605432	2023-12-28 17:40:55.633674	trident	Roman Stanek	\N
211	clement-novalak	2023-12-28 17:41:41.751097	2023-12-28 17:41:41.76791	trident	Clément Novalak	\N
212	richard-verschoor	2023-12-28 20:43:51.542706	2023-12-28 20:43:51.577228	van-amersfoort-racing	Richard Verschoor	\N
214	kush-maini	2023-12-28 20:50:34.439146	2023-12-28 20:50:34.47082	campos-racing	Kush Maini	\N
193	formula1-esport	2023-12-28 13:57:35.826861	2023-12-28 13:57:35.873995	4	Formula 1 Esport Series Logo	\N
219	scuderia-ferrari	2023-12-29 20:09:56.307687	2023-12-29 20:09:56.337336	scuderia-ferrari	Scuderia Ferrari	\N
224	aston-martin-aramco-cognizant-formula-one-team	2023-12-29 20:14:07.775928	2023-12-29 20:14:07.804411	aston-martin-aramco-cognizant-formula-one-team	Aston Martin Aramco Cognizant Formula One Team	\N
226	scuderia-alphatauri	2023-12-29 20:15:23.036081	2023-12-29 20:15:23.059751	scuderia-alphatauri	Scuderia AlphaTauri	\N
229	oracle-red-bull-racing	2023-12-29 21:24:41.984138	2023-12-29 21:24:42.007249	oracle-red-bull-racing	Oracle Red Bull Racing	\N
242	aston-martin-aramco-cognizant-formula-one-team	2023-12-30 11:22:02.387825	2023-12-30 11:22:02.409643	aston-martin-aramco-cognizant-formula-one-team	Aston Martin Aramco Cognizant Formula One Team	\N
244	bwt-alpine-f1-team	2023-12-30 11:23:55.048288	2023-12-30 11:23:55.077173	bwt-alpine-f1-team	BWT Alpine F1 Team	\N
248	scuderia-alphatauri	2023-12-30 11:25:59.577428	2023-12-30 11:25:59.597184	scuderia-alphatauri	Scuderia AlphaTauri	\N
250	alfa-romeo-f1-team-stake	2023-12-30 11:26:45.524375	2023-12-30 11:26:45.554728	alfa-romeo-f1-team-stake	Alfa Romeo F1 Team Stake	\N
253	williams-racing	2023-12-30 11:27:36.04478	2023-12-30 11:27:36.071928	williams-racing	Williams Racing	\N
255	williams-racing	2023-12-30 11:28:09.993102	2023-12-30 11:28:10.017301	williams-racing	Williams Racing	\N
258	moneygram-haas-f1-team	2023-12-30 11:30:29.217414	2023-12-30 11:30:29.250298	moneygram-haas-f1-team	MoneyGram Haas F1 team	\N
262	mp-motorsport	2023-12-30 11:32:16.636276	2023-12-30 11:32:16.660945	mp-motorsport	MP Motorsport	\N
263	rodin-carlin	2023-12-30 11:32:50.579967	2023-12-30 11:32:50.602497	rodin-carlin	Rodin Carlin	\N
264	rodin-carlin	2023-12-30 11:33:14.846664	2023-12-30 11:33:14.867308	rodin-carlin	Rodin Carlin	\N
266	rodin-carlin	2023-12-30 11:33:57.105423	2023-12-30 11:33:57.130966	rodin-carlin	Rodin Carlin	\N
267	art-grand-prix	2023-12-30 11:34:38.203668	2023-12-30 11:34:38.234802	art-grand-prix	Art Grand Prix	\N
268	art-grand-prix	2023-12-30 11:35:16.461431	2023-12-30 11:35:16.485707	art-grand-prix	Art Grand Prix	\N
269	art-grand-prix	2023-12-30 11:35:39.103063	2023-12-30 11:35:39.128284	art-grand-prix	Art Grand Prix	\N
270	art-grand-prix	2023-12-30 11:35:51.998422	2023-12-30 11:35:52.024625	art-grand-prix	Art Grand Prix	\N
271	prema-racing	2023-12-30 11:36:23.112854	2023-12-30 11:36:23.139109	prema-racing	Prema Racing	\N
275	hitech-pulse-eight	2023-12-30 11:37:46.353135	2023-12-30 11:37:46.379592	hitech-pulse-eight	Hitech Pulse-Eight	\N
280	dams	2023-12-30 11:40:27.842801	2023-12-30 11:40:27.875167	dams	DAMS	\N
281	dams	2023-12-30 11:40:51.529099	2023-12-30 11:40:51.556287	dams	DAMS	\N
282	dams	2023-12-30 11:41:13.894899	2023-12-30 11:41:13.92223	dams	DAMS	\N
283	invicta-virtuosi-racing	2023-12-30 11:41:48.113084	2023-12-30 11:41:48.135336	invicta-virtuosi-racing	Invicta Virtuosi Racing	\N
284	invicta-virtuosi-racing	2023-12-30 11:42:06.990261	2023-12-30 11:42:07.01798	invicta-virtuosi-racing	Invicta Virtuosi Racing	\N
285	invicta-virtuosi-racing	2023-12-30 11:42:24.583746	2023-12-30 11:42:24.608957	invicta-virtuosi-racing	Invicta Virtuosi Racing	\N
287	phm-racing	2023-12-30 11:43:05.895359	2023-12-30 11:43:05.921012	phm-racing	PHM Racing	\N
289	phm-racing	2023-12-30 11:43:35.912834	2023-12-30 11:43:35.946617	phm-racing	PHM Racing	\N
290	phm-racing	2023-12-30 11:43:59.314205	2023-12-30 11:43:59.337249	phm-racing	PHM Racing	\N
294	trident	2023-12-30 11:45:16.978836	2023-12-30 11:45:17.004304	trident	Trident	\N
295	van-amersfoort-racing	2023-12-30 11:45:34.756858	2023-12-30 11:45:34.779886	van-amersfoort-racing	Van Amersfoort Racing	\N
296	van-amersfoort-racing	2023-12-30 11:45:55.750869	2023-12-30 11:45:55.780577	van-amersfoort-racing	Van Amersfoort Racing	\N
297	van-amersfoort-racing	2023-12-30 11:46:09.857474	2023-12-30 11:46:09.893731	van-amersfoort-racing	Van Amersfoort Racing	\N
298	van-amersfoort-racing	2023-12-30 11:46:25.464207	2023-12-30 11:46:25.484622	van-amersfoort-racing	Van Amersfoort Racing	\N
303	mp-motorsport	2023-12-30 11:49:56.486816	2023-12-30 11:49:56.515654	mp-motorsport	MP Motorsport	\N
305	mp-motorsport	2023-12-30 11:50:31.719468	2023-12-30 11:50:31.744106	mp-motorsport	MP Motorsport	\N
307	trident-f3	2023-12-30 11:53:07.145567	2023-12-30 11:53:07.163445	trident-f3	Trident F3	\N
231	oracle-red-bull-racing	2023-12-30 10:42:05.253492	2023-12-30 10:42:05.29287	oracle-red-bull-racing	Oracle Red Bull Racing	\N
233	scuderia-ferrari	2023-12-30 11:03:16.046113	2023-12-30 11:03:16.073239	scuderia-ferrari	Scuderia Ferrari	\N
236	mercedes-amg-petronas-formula-one-team	2023-12-30 11:19:40.686157	2023-12-30 11:19:40.718383	mercedes-amg-petronas-formula-one-team	Mercedes-AMG Petronas Formula One Team	\N
197	enzo-fittipaldi	2023-12-28 17:28:06.349679	2023-12-28 17:28:06.386623	rodin-carlin	Enzo Fittipaldi	\N
200	frederik-vesti	2023-12-28 17:33:08.944912	2023-12-28 17:33:08.971865	prema-racing	Frederik Vesti	\N
201	oliver-bearman	2023-12-28 17:34:08.477932	2023-12-28 17:34:08.498254	prema-racing	Oliver Bearman	\N
182	lance-stroll	2023-12-23 14:59:09.739023	2023-12-23 14:59:09.769414	aston-martin-aramco-cognizant-formula-one-team	Lance Stroll	\N
183	esteban-ocon	2023-12-23 15:00:14.092499	2023-12-23 15:00:14.116049	bwt-alpine-f1-team	Esteban Ocon	\N
185	valtteri-bottas	2023-12-23 15:06:53.980952	2023-12-23 15:06:54.010877	alfa-romeo-f1-team-stake	Valtteri Bottas	\N
176	lewis-hamilton	2023-12-23 14:47:14.105865	2023-12-23 14:47:14.127821	mercedes-amg-petronas-formula-one-team	Lewis Hamilton	\N
186	zhou-guanyu	2023-12-23 15:07:14.238366	2023-12-23 15:07:14.269858	alfa-romeo-f1-team-stake	Zhou Guanyu	\N
188	yuki-tsunoda	2023-12-23 15:09:57.252965	2023-12-23 15:09:57.28034	scuderia-alphatauri	Yuki Tsunoda	\N
189	kevin-magnussen	2023-12-23 15:10:30.690083	2023-12-23 15:10:30.722007	moneygram-haas-f1-team	Kevin Magnussen	\N
190	nico-hulkenberg	2023-12-23 15:10:56.454321	2023-12-23 15:10:56.484963	moneygram-haas-f1-team	Nico Hulkenberg	\N
191	alexander-albon	2023-12-23 15:11:50.268509	2023-12-23 15:11:50.291619	williams-racing	Alexander Albon	\N
192	logan-sargeant	2023-12-23 15:12:25.391575	2023-12-23 15:12:25.415616	williams-racing	Logan Sargeant	\N
175	carlos-sainz-jr	2023-12-23 14:44:25.071033	2023-12-23 14:44:25.105472	scuderia-ferrari	Carlos Sainz	\N
195	jehan-daruvala	2023-12-28 14:47:56.109715	2023-12-28 14:47:56.133241	mp-motorsport	Jehan Daruvala	\N
203	isack-hadjar	2023-12-28 17:36:38.294339	2023-12-28 17:36:38.315353	hitech-pulse-eight	Isack Hadjar	\N
213	juan-manuel-correa	2023-12-28 20:49:51.909272	2023-12-28 20:49:51.938979	van-amersfoort-racing	Juan Manuel Correa	\N
215	ralph-boschung	2023-12-28 20:51:48.37797	2023-12-28 20:51:48.393389	campos-racing	Ralph Boschung	\N
216	paul-aron	2023-12-28 21:16:47.374991	2023-12-28 21:16:47.408004	prema-racing-f3	Paul Aron	\N
225	oracle-red-bull-racing	2023-12-29 20:14:31.850698	2023-12-29 20:14:31.877092	oracle-red-bull-racing	Oracle Red Bull Racing Logo	\N
237	mercedes-amg-petronas-formula-one-team	2023-12-30 11:20:06.014567	2023-12-30 11:20:06.038868	mercedes-amg-petronas-formula-one-team	Mercedes-AMG Petronas Formula One Team	\N
220	mclaren-f1-team	2023-12-29 20:10:41.773942	2023-12-29 20:10:41.808625	mclaren-f1-team	McLaren F1 Team	\N
221	bwt-alpine-f1-team	2023-12-29 20:11:09.192277	2023-12-29 20:11:09.217065	bwt-alpine-f1-team	BWT Alpine F1 Team	\N
222	alfa-romeo-f1-team-stake	2023-12-29 20:11:55.261115	2023-12-29 20:11:55.283442	alfa-romeo-f1-team-stake	Alfa Romeo F1 Team Stake	\N
223	mercedes-amg-petronas-formula-one-team	2023-12-29 20:12:34.679433	2023-12-29 20:12:34.701578	mercedes-amg-petronas-formula-one-team	Mercedes-AMG Petronas Formula One Team	\N
227	williams-racing	2023-12-29 20:15:52.942593	2023-12-29 20:15:52.977272	williams-racing	Williams Racing	\N
228	moneygram-haas-f1-team	2023-12-29 20:17:05.423138	2023-12-29 20:17:05.46007	moneygram-haas-f1-team	MoneyGram Haas F1 team	\N
243	aston-martin-aramco-cognizant-formula-one-team	2023-12-30 11:22:31.067847	2023-12-30 11:22:31.09653	aston-martin-aramco-cognizant-formula-one-team	Aston Martin Aramco Cognizant Formula One Team	\N
245	bwt-alpine-f1-team	2023-12-30 11:24:16.206205	2023-12-30 11:24:16.232308	bwt-alpine-f1-team	BWT Alpine F1 Team	\N
246	bwt-alpine-f1-team	2023-12-30 11:24:36.178116	2023-12-30 11:24:36.202582	bwt-alpine-f1-team	BWT Alpine F1 Team	\N
247	scuderia-alphatauri	2023-12-30 11:25:37.68461	2023-12-30 11:25:37.711398	scuderia-alphatauri	Scuderia AlphaTauri	\N
249	scuderia-alphatauri	2023-12-30 11:26:15.724836	2023-12-30 11:26:15.745934	scuderia-alphatauri	Scuderia AlphaTauri	\N
251	alfa-romeo-f1-team-stake	2023-12-30 11:27:02.309767	2023-12-30 11:27:02.338865	alfa-romeo-f1-team-stake	Alfa Romeo F1 Team Stake	\N
252	alfa-romeo-f1-team-stake	2023-12-30 11:27:14.89429	2023-12-30 11:27:14.919346	alfa-romeo-f1-team-stake	Alfa Romeo F1 Team Stake	\N
254	williams-racing	2023-12-30 11:27:53.225997	2023-12-30 11:27:53.249045	williams-racing	Williams Racing	\N
256	moneygram-haas-f1-team	2023-12-30 11:28:56.338833	2023-12-30 11:28:56.367635	moneygram-haas-f1-team	MoneyGram Haas F1 team	\N
257	moneygram-haas-f1-team	2023-12-30 11:30:05.532178	2023-12-30 11:30:05.559843	moneygram-haas-f1-team	MoneyGram Haas F1 team	\N
308	art-grand-prix-f3	2023-12-30 11:53:32.670597	2023-12-30 11:53:32.696786	art-grand-prix-f3	Art Grand Prix F3	\N
265	rodin-carlin	2023-12-30 11:33:31.390473	2023-12-30 11:33:31.41544	rodin-carlin	Rodin Carlin	\N
272	prema-racing	2023-12-30 11:36:38.658655	2023-12-30 11:36:38.69572	prema-racing	Prema Racing	\N
273	prema-racing	2023-12-30 11:36:56.260313	2023-12-30 11:36:56.277041	prema-racing	Prema Racing	\N
274	prema-racing	2023-12-30 11:37:14.000325	2023-12-30 11:37:14.02548	prema-racing	Prema Racing	\N
276	hitech-pulse-eight	2023-12-30 11:38:21.464323	2023-12-30 11:38:21.50141	hitech-pulse-eight	Hitech Pulse-Eight	\N
277	hitech-pulse-eight	2023-12-30 11:38:42.288129	2023-12-30 11:38:42.314185	hitech-pulse-eight	Hitech Pulse-Eight	\N
278	hitech-pulse-eight	2023-12-30 11:39:05.314321	2023-12-30 11:39:05.341493	hitech-pulse-eight	Hitech Pulse-Eight	\N
279	dams	2023-12-30 11:39:30.642531	2023-12-30 11:39:30.665769	dams	DAMS	\N
286	invicta-virtuosi-racing	2023-12-30 11:42:42.964623	2023-12-30 11:42:42.990262	invicta-virtuosi-racing	Invicta Virtuosi Racing	\N
288	phm-racing	2023-12-30 11:43:20.728599	2023-12-30 11:43:20.757652	phm-racing	PHM Racing	\N
291	trident	2023-12-30 11:44:17.963355	2023-12-30 11:44:17.989417	trident	Trident	\N
292	trident	2023-12-30 11:44:39.968639	2023-12-30 11:44:40.001274	trident	Trident	\N
293	trident	2023-12-30 11:44:58.264277	2023-12-30 11:44:58.296569	trident	Trident	\N
299	campos-racing	2023-12-30 11:46:50.935226	2023-12-30 11:46:50.959387	campos-racing	Campos Racing	\N
300	Campos Racing	2023-12-30 11:47:29.391808	2023-12-30 11:47:29.430727	campos-racing	campos-racing	\N
301	campos-racing	2023-12-30 11:47:45.284384	2023-12-30 11:47:45.3164	campos-racing	Campos Racing	\N
302	campos-racing	2023-12-30 11:48:04.02062	2023-12-30 11:48:04.045361	campos-racing	Campos Racing	\N
304	mp-motorsport	2023-12-30 11:50:13.327919	2023-12-30 11:50:13.350231	mp-motorsport	MP Motorsport	\N
306	prema-racing-f3	2023-12-30 11:52:20.432609	2023-12-30 11:52:20.453036	prema-racing-f3	PREMA Racing F3	\N
309	mp-motorsport-f3	2023-12-30 11:53:55.173993	2023-12-30 11:53:55.192826	mp-motorsport-f3	MP Motorsport F3	\N
310	hitech-pulse-eight-f3	2023-12-30 11:54:33.964471	2023-12-30 11:54:33.992248	hitech-pulse-eight-f3	Hitech Pulse-Eight F3	\N
311	van-amersfoort-racing-f3	2023-12-30 11:55:10.327342	2023-12-30 11:55:10.350269	van-amersfoort-racing-f3	Van Amersfoort Racing F3	\N
312	rodin-carlin-f3	2023-12-30 11:55:30.604386	2023-12-30 11:55:30.647085	rodin-carlin-f3	Rodin Carlin F3	\N
313	campos-racing-f3	2023-12-30 11:55:56.046753	2023-12-30 11:55:56.077888	campos-racing-f3	Campos Racing F3	\N
314	jenzer-motorsport-f3	2023-12-30 11:56:21.032105	2023-12-30 11:56:21.073892	jenzer-motorsport-f3	Jenzer Motorsport F3	\N
315	phm-racing-f3	2023-12-30 11:56:47.145723	2023-12-30 11:56:47.170783	phm-racing-f3	PHM Racing F3	\N
316	zak-o-sullivan	2023-12-30 11:59:44.147402	2023-12-30 11:59:44.171479	prema-racing-f3	Zak O'Sullivan	\N
317	leonardo-fornaroli	2023-12-30 12:00:08.774095	2023-12-30 12:00:08.800592	trident-f3	Leonardo Fornaroli	\N
318	gabriel-bortoleto	2023-12-30 12:00:33.092248	2023-12-30 12:00:33.118592	trident-f3	Gabriel Bortoleto	\N
319	oliver-goethe	2023-12-30 12:00:59.281631	2023-12-30 12:00:59.306136	trident-f3	Oliver Goethe	\N
321	gregoire-saucy	2023-12-30 12:01:50.746553	2023-12-30 12:01:50.775909	art-grand-prix-f3	Grégoire Saucy	\N
325	jonny-edgar	2023-12-30 12:03:51.921137	2023-12-30 12:03:51.950357	mp-motorsport-f3	Jonny Edgar	\N
327	gabriele-mini	2023-12-30 12:04:52.124137	2023-12-30 12:04:52.14817	hitech-pulse-eight-f3	Gabriele Minì	\N
330	rafael-villagomez	2023-12-30 12:06:00.960787	2023-12-30 12:06:00.992744	van-amersfoort-racing-f3	Rafael Villagómez	\N
320	kaylen-frederick	2023-12-30 12:01:26.577853	2023-12-30 12:01:26.604577	art-grand-prix-f3	Kaylen Frederick	\N
322	nikola-tsolov	2023-12-30 12:02:22.63701	2023-12-30 12:02:22.664275	art-grand-prix-f3	Nikola Tsolov	\N
323	franco-colapinto	2023-12-30 12:02:46.833233	2023-12-30 12:02:46.856578	mp-motorsport-f3	Franco Colapinto	\N
324	mari-boya	2023-12-30 12:03:16.647987	2023-12-30 12:03:16.672328	mp-motorsport-f3	Mari Boya	\N
326	sebastian-montoya	2023-12-30 12:04:21.676356	2023-12-30 12:04:21.701565	hitech-pulse-eight-f3	Sebastián Montoya	\N
328	luke-browning	2023-12-30 12:05:12.252248	2023-12-30 12:05:12.286317	hitech-pulse-eight-f3	Luke Browning	\N
329	caio-collet	2023-12-30 12:05:37.149409	2023-12-30 12:05:37.176677	van-amersfoort-racing-f3	Caio Collet	\N
331	max-verstappen	2023-12-30 13:03:09.214399	2023-12-30 13:03:09.245332	oracle-red-bull-racing	Max Verstappen Helmet	\N
172	max-verstappen	2023-12-15 22:09:06.034515	2023-12-15 22:09:06.104206	oracle-red-bull-racing	Max Verstappen	\N
187	daniel-ricciardo	2023-12-23 15:09:25.967084	2023-12-23 15:09:25.98724	scuderia-alphatauri	Daniel Ricciardo	\N
332	charles-leclerc	2023-12-30 13:12:46.729674	2023-12-30 13:12:46.758136	scuderia-ferrari	Charles Leclerc Helmet	\N
333	sergio-perez	2023-12-30 13:13:53.706163	2023-12-30 13:13:53.739643	oracle-red-bull-racing	Sergio Perez Sisak	\N
334	carlos-sainz-jr	2023-12-30 14:05:52.873687	2023-12-30 14:05:52.910885	scuderia-ferrari	Carlos Sainz Sisak	\N
335	lewis-hamilton	2023-12-30 14:06:16.2319	2023-12-30 14:06:16.248316	mercedes-amg-petronas-formula-one-team	Lewis Hamilton	\N
336	george-russell	2023-12-30 14:06:36.436219	2023-12-30 14:06:36.459722	mercedes-amg-petronas-formula-one-team	George Russell	\N
337	lando-norris	2023-12-30 14:07:02.07792	2023-12-30 14:07:02.105601	mclaren-f1-team	Lando Norris	\N
338	oscar-piastri	2023-12-30 14:07:29.013345	2023-12-30 14:07:29.041724	mclaren-f1-team	Oscar Piastri	\N
339	fernando-alonso	2023-12-30 14:07:59.654295	2023-12-30 14:07:59.683553	aston-martin-aramco-cognizant-formula-one-team	Fernando Alonso Sisak	\N
340	lance-stroll	2023-12-30 14:08:26.769266	2023-12-30 14:08:26.801839	aston-martin-aramco-cognizant-formula-one-team	Lance Stroll Sisak	\N
341	esteban-ocon	2023-12-30 14:08:48.502462	2023-12-30 14:08:48.521046	bwt-alpine-f1-team	Esteban Ocon	\N
342	pierre-gasly	2023-12-30 14:38:38.60978	2023-12-30 14:38:38.638647	bwt-alpine-f1-team	Pierre Gasly	\N
343	valtteri-bottas	2023-12-30 14:40:14.772162	2023-12-30 14:40:14.80677	alfa-romeo-f1-team-stake	Valtteri Bottas	\N
344	zhou-guanyu	2023-12-30 14:40:43.25268	2023-12-30 14:40:43.276525	alfa-romeo-f1-team-stake	Zhou Guanyu	\N
345	daniel-ricciardo	2023-12-30 14:41:11.26657	2023-12-30 14:41:11.300765	scuderia-alphatauri	Daniel Ricciardo	\N
346	yuki-tsunoda	2023-12-30 14:41:31.094218	2023-12-30 14:41:31.123691	scuderia-alphatauri	Yuki Tsunoda	\N
347	kevin-magnussen	2023-12-30 14:41:51.477472	2023-12-30 14:41:51.516398	moneygram-haas-f1-team	Kevin Magnussen	\N
348	nico-hulkenberg	2023-12-30 14:42:11.455601	2023-12-30 14:42:11.481129	moneygram-haas-f1-team	Nico Hulkenberg	\N
349	alexander-albon	2023-12-30 14:42:33.861308	2023-12-30 14:42:33.894122	williams-racing	Alexander Albon	\N
350	logan-sargeant	2023-12-30 14:42:58.120797	2023-12-30 14:42:58.15032	williams-racing	Logan Sargeant	\N
355	mercedes-amg-petronas-formula-one-team-car	2024-01-11 11:02:03.88119	2024-01-11 11:02:03.909606	mercedes-amg-petronas-formula-one-team	Mercedes W14	\N
356	mclaren-f1-team-car	2024-01-11 11:26:53.668537	2024-01-11 11:26:53.710532	mclaren-f1-team	McLaren MCL60	\N
351	oracle-red-bull-racing-car	2023-12-30 19:41:59.423152	2023-12-30 19:41:59.482605	oracle-red-bull-racing	RedBull RB19	\N
354	scuderia-ferrari-car	2024-01-11 10:59:28.841654	2024-01-11 10:59:28.866064	scuderia-ferrari	Ferrari SF-23	\N
357	aston-martin-aramco-cognizant-formula-one-team-car	2024-01-11 11:34:35.871716	2024-01-11 11:34:35.899026	aston-martin-aramco-cognizant-formula-one-team	Aston Martin AMR23	\N
358	bwt-alpine-f1-team-car	2024-01-11 13:22:10.777707	2024-01-11 13:22:10.842991	bwt-alpine-f1-team	Alpine A523	\N
359	scuderia-alphatauri-car	2024-01-11 13:24:04.637136	2024-01-11 13:24:04.675256	bwt-alpine-f1-team	AlphaTauri AT02	\N
360	alfa-romeo-f1-team-stake-car	2024-01-11 13:25:27.126171	2024-01-11 13:25:27.152127	alfa-romeo-f1-team-stake	Alfa Romeo C43	\N
361	williams-racing-car	2024-01-11 13:35:27.005994	2024-01-11 13:35:27.035092	williams-racing	Williams FW45	\N
362	moneygram-haas-f1-team-car	2024-01-11 13:44:50.864156	2024-01-11 13:44:50.895994	moneygram-haas-f1-team	Haas VF23	\N
205	arthur-leclerc	2023-12-28 17:37:58.004262	2023-12-28 17:37:58.031739	dams	Arthur Leclerc	\N
217	dino beganovic	2023-12-28 21:25:24.737722	2023-12-28 21:25:24.762042	prema-racing-f3	Dino Beganovic	\N
363	dennis-hauger	2024-01-11 14:16:36.035835	2024-01-11 14:16:36.061898	mp-motorsport	Dennis Hauger Helmet	\N
364	mp-motorsport-car	2024-01-11 14:19:22.491326	2024-01-11 14:19:22.519054	mp-motorsport	MP Motorsport car	\N
366	alfa-romeo-f1-team-kick-esports	2024-01-13 10:32:34.68817	2024-01-13 10:32:34.71025	alfa-romeo-f1-team-kick-esports	Alfa Romeo Esports logo	\N
367	alpine-esports	2024-01-13 10:38:46.861926	2024-01-13 10:38:46.880769	alpine-esports	alpine-esports-logo	\N
368	aston-martin-aramco-cognizant-f1-esports	2024-01-13 10:39:49.584561	2024-01-13 10:39:49.606105	aston-martin-aramco-cognizant-f1-esports	aston-martin-aramco-cognizant-f1-esports	\N
369	mclaren-shadow	2024-01-13 10:41:43.183658	2024-01-13 10:41:43.219551	mclaren-shadow	mclaren-shadow	\N
370	mercedes-amg-petronas-esports-team	2024-01-13 10:45:04.833226	2024-01-13 10:45:04.860616	mercedes-amg-petronas-esports-team	mercedes-amg-petronas-esports-team	\N
371	moneygram-haas-f1-team-esports	2024-01-13 10:47:12.093938	2024-01-13 10:47:12.121825	moneygram-haas-f1-team-esports	moneygram-haas-f1-team-esports	\N
372	oracle-red-bull-sim-racing	2024-01-13 10:49:14.163507	2024-01-13 10:49:14.185207	oracle-red-bull-sim-racing	oracle-red-bull-sim-racing	\N
373	scuderia-alphatauri-orlen-esports-team	2024-01-13 10:50:36.900815	2024-01-13 10:50:36.919434	scuderia-alphatauri-orlen-esports-team	scuderia-alphatauri-orlen-esports-team	\N
374	scuderia-ferrari-esports	2024-01-13 10:58:20.075272	2024-01-13 10:58:20.103301	scuderia-ferrari-esports	scuderia-ferrari-esports	\N
375	williams-esports	2024-01-13 10:59:33.426002	2024-01-13 10:59:33.47712	williams-esports	williams-esports	\N
378	matthijs-van-erven	2024-01-14 15:41:52.119738	2024-01-14 15:41:52.150953	alfa-romeo-f1-team-kick-esports	Matthijs van Erven	\N
376	formula1-esports	2024-01-13 11:00:18.628169	2024-01-13 11:00:18.65138	4	Formula 1 Esports logo	\N
377	brendon-leigh	2024-01-13 11:13:47.115423	2024-01-13 11:13:47.134544	alfa-romeo-f1-team-kick-esports	Brendon Leigh	\N
379	thomas-ronhaar	2024-01-14 16:04:32.401043	2024-01-14 16:04:32.421141	alfa-romeo-f1-team-kick-esports	Thomas Ronhaar	\N
380	luke-smith	2024-01-14 16:07:54.839942	2024-01-14 16:07:54.860766	alpine-esports	Luke Smith	\N
381	patrik-sipos	2024-01-14 16:14:06.742591	2024-01-14 16:14:06.761296	alpine-esports	Patrik Sipos	\N
382	ruben-pedreno	2024-01-14 16:16:46.792754	2024-01-14 16:16:46.83071	alpine-esports	Ruben Pedreno	\N
383	fabrizio-donoso	2024-01-14 16:20:27.717727	2024-01-14 16:20:27.736069	aston-martin-aramco-cognizant-f1-esports	Fabrizio Donoso	\N
384	john-evans	2024-01-14 16:22:51.385967	2024-01-14 16:22:51.407124	aston-martin-aramco-cognizant-f1-esports	John Evans	\N
385	simon-weigang	2024-01-14 16:25:46.127853	2024-01-14 16:25:46.149863	aston-martin-aramco-cognizant-f1-esports	Simon Weigang	\N
386	dani-moreno	2024-01-14 17:08:44.237367	2024-01-14 17:08:44.269639	mclaren-shadow	Dani Moreno	\N
387	lucas-blakeley	2024-01-14 17:10:53.248492	2024-01-14 17:10:53.284649	mclaren-shadow	Lucas Blakeley	\N
388	wilson-hughes	2024-01-14 17:12:37.694283	2024-01-14 17:12:37.724206	mclaren-shadow	Wilson Hughes	\N
389	daniel-bereznay	2024-01-14 17:14:40.401325	2024-01-14 17:14:40.423446	mercedes-amg-petronas-esports-team	Daniel Bereznay	\N
392	alfie-butcher	2024-01-14 17:22:50.192832	2024-01-14 17:22:50.214939	moneygram-haas-f1-team-esports	Alfie Butcher	\N
394	ulas-ozyildirim	2024-01-14 17:27:08.504195	2024-01-14 17:27:08.52808	moneygram-haas-f1-team-esports	Ulas Ozyildirim	\N
395	frederik-rasmussen	2024-01-14 17:30:28.062563	2024-01-14 17:30:28.084212	oracle-red-bull-sim-racing	Frederik Rasmussen	\N
397	sebastian-job	2024-01-14 17:35:29.513201	2024-01-14 17:35:29.545608	oracle-red-bull-sim-racing	Sebastian Job	\N
398	jed-norgrove	2024-01-14 17:37:54.028919	2024-01-14 17:37:54.048784	scuderia-alphatauri-orlen-esports-team	Jed Norgrove	\N
401	bardia-broumand	2024-01-14 17:44:16.360979	2024-01-14 17:44:16.386842	scuderia-ferrari-esports	Bardia Broumand	\N
403	nicolas-longuet	2024-01-14 17:48:44.132526	2024-01-14 17:48:44.152845	scuderia-ferrari-esports	Nicolas Longuet	\N
390	jake-benham	2024-01-14 17:17:38.369126	2024-01-14 17:17:38.394677	mercedes-amg-petronas-esports-team	Jake Benham	\N
391	jarno-opmeer	2024-01-14 17:19:30.899215	2024-01-14 17:19:30.953172	mercedes-amg-petronas-esports-team	Jarno Opmeer	\N
393	bence-szabo-konyi	2024-01-14 17:25:06.591967	2024-01-14 17:25:06.61302	moneygram-haas-f1-team-esports	Bence Szabó-Kónyi	\N
396	josh-idowu	2024-01-14 17:33:24.312267	2024-01-14 17:33:24.336108	oracle-red-bull-sim-racing	Josh Idowu	\N
399	joni-tormala	2024-01-14 17:39:23.365014	2024-01-14 17:39:23.390934	scuderia-alphatauri-orlen-esports-team	Joni Tormala	\N
400	tom-manley	2024-01-14 17:41:30.702578	2024-01-14 17:41:30.718515	scuderia-alphatauri-orlen-esports-team	Tom Manley	\N
402	istvan-puki	2024-01-14 17:46:47.91142	2024-01-14 17:46:47.93628	scuderia-ferrari-esports	István Puki	\N
404	alvaro-carreton	2024-01-14 17:50:31.550779	2024-01-14 17:50:31.577227	williams-esports	Alvaro Carreton	\N
405	ismael-fahssi	2024-01-14 17:52:11.086467	2024-01-14 17:52:11.109404	williams-esports	Ismael Fahssi	\N
406	marcel-kiefer	2024-01-14 17:54:03.918437	2024-01-14 17:54:03.94782	williams-esports	Marcel Kiefer	\N
407	dino-beganovic	2024-01-15 09:54:23.906719	2024-01-15 09:54:23.943857	prema-racing-f3	Dino Beganovic	\N
408	caio-collet	2024-01-15 09:55:22.045945	2024-01-15 09:55:22.079815	van-amersfoort-racing-f3	Caio Collet	\N
409	rafael-villagomez	2024-01-15 09:55:52.50075	2024-01-15 09:55:52.529911	van-amersfoort-racing-f3	Rafael Villagómez	\N
410	tommy-smith	2024-01-15 09:56:35.699665	2024-01-15 09:56:35.722413	van-amersfoort-racing-f3	Tommy Smith	\N
411	oliver-gray	2024-01-15 09:57:25.179773	2024-01-15 09:57:25.206322	rodin-carlin-f3	Oliver Gray	\N
412	francesco-simonazzi	2024-01-15 09:58:04.297582	2024-01-15 09:58:04.322341	rodin-carlin-f3	Francesco Simonazzi	\N
413	josep-maria-marti	2024-01-15 09:59:07.851897	2024-01-15 09:59:07.881537	campos-racing-f3	Josep María Martí	\N
414	ido-cohen	2024-01-15 10:04:13.132051	2024-01-15 10:04:13.184465	rodin-carlin-f3	Ido Cohen	\N
415	christian-mansell	2024-01-15 10:05:03.320976	2024-01-15 10:05:03.353174	campos-racing-f3	Christian Mansell	\N
416	joshua-dufek	2024-01-15 10:06:04.124685	2024-01-15 10:06:04.155692	campos-racing-f3	Joshua Dufek	\N
417	nikita-bedrin	2024-01-15 10:06:28.935249	2024-01-15 10:06:28.96694	jenzer-motorsport-f3	Nikita Bedrin	\N
418	alejandro-garcia	2024-01-15 10:08:51.980705	2024-01-15 10:08:52.009769	jenzer-motorsport-f3	Alejandro García	\N
419	sophia-floersch	2024-01-15 10:09:16.114541	2024-01-15 10:09:16.13708	phm-racing-f3	Sophia Floersch	\N
420	roberto-faria	2024-01-15 10:09:43.386406	2024-01-15 10:09:43.421015	phm-racing-f3	Roberto Faria	\N
421	woohyun-shin	2024-01-15 10:10:14.958381	2024-01-15 10:10:14.993811	phm-racing-f3	Woohyun Shin	\N
422	taylor-barnard	2024-01-15 10:13:09.614557	2024-01-15 10:13:09.635569	jenzer-motorsport-f3	Taylor Barnard	\N
424	zane-maloney	2024-01-17 14:46:24.855056	2024-01-17 14:46:24.883909	none	Zane Maloney	\N
425	enzo-fittipaldi	2024-01-17 14:46:52.324342	2024-01-17 14:46:52.350276	none	Enzo Fittipaldi Helmet	\N
426	theo-pourchaire	2024-01-17 14:47:43.786512	2024-01-17 14:47:43.80831	none	Théo Pourchaire helmet	\N
427	victor-martins	2024-01-17 14:48:16.695483	2024-01-17 14:48:16.727682	none	Victor Martins helmet	\N
428	frederik-vesti	2024-01-17 14:49:06.126714	2024-01-17 14:49:06.158433	none	Frederik Vesti helmet	\N
429	oliver-bearman	2024-01-17 14:49:33.87844	2024-01-17 14:49:33.915354	none	Oliver Bearman Helmet	\N
430	jak-crawford	2024-01-17 14:49:57.099163	2024-01-17 14:49:57.117637	none	Jak Crawford	\N
431	isack-hadjar	2024-01-17 14:50:29.687463	2024-01-17 14:50:29.714124	none	Isack Hadjar helmet	\N
432	ayumu-iwasa	2024-01-17 14:51:20.000171	2024-01-17 14:51:20.039513	none	Ayumu Iwasa helmet	\N
433	arthur-leclerc	2024-01-17 14:51:50.397495	2024-01-17 14:51:50.412628	none	Arthur Leclerc helmet	\N
434	jack-doohan	2024-01-17 14:52:15.098001	2024-01-17 14:52:15.126678	none	Jack Doohan helmet	\N
435	amaury-cordeel	2024-01-17 14:52:40.851227	2024-01-17 14:52:40.871876	none	Amaury Cordeel helmet	\N
436	roy-nissany	2024-01-17 14:53:07.373907	2024-01-17 14:53:07.415093	none	Roy Nissany helmet	\N
437	roman-stanek	2024-01-17 14:54:09.115075	2024-01-17 14:54:09.149193	none	Roman Stanek helmet	\N
438	clement-novalak	2024-01-17 14:54:30.69948	2024-01-17 14:54:30.725319	none	Clément Novalak helmet	\N
439	richard-verschoor	2024-01-17 14:54:51.465685	2024-01-17 14:54:51.485912	none	Richard Verschoor helmet	\N
440	juan-manuel-correa	2024-01-17 14:55:12.234631	2024-01-17 14:55:12.263365	none	Juan Manuel Correa helmet	\N
441	kush-maini	2024-01-17 14:55:33.264658	2024-01-17 14:55:33.285674	none	Kush Maini helmet	\N
442	ralph-boschung	2024-01-17 14:55:50.114852	2024-01-17 14:55:50.143802	none	Ralph Boschung	\N
443	dino-beganovic	2024-01-17 15:58:35.399066	2024-01-17 15:58:35.438436	none	Dino Beganovic helmet	\N
445	paul-aron	2024-01-17 17:54:05.130229	2024-01-17 17:54:05.171905	none	Paul Aron helmet	\N
423	jehan-daruvala	2024-01-17 14:36:50.638945	2024-01-17 14:36:50.692038	none	Jehan Daruvala helmet	\N
446	dino-beganovic	2024-01-17 17:54:51.450811	2024-01-17 17:54:51.476846	none	Dino Beganovic helmet	\N
447	zak-o-sullivan	2024-01-17 17:55:37.769646	2024-01-17 17:55:37.810873	none	Zak O'Sullivan helmet	\N
448	leonardo-fornaroli	2024-01-17 17:56:07.028757	2024-01-17 17:56:07.057116	none	Leonardo Fornaroli helmet	\N
449	gabriel-bortoleto	2024-01-17 17:56:30.911622	2024-01-17 17:56:30.95905	none	Gabriel Bortoleto helmet	\N
450	oliver-goethe	2024-01-17 17:56:52.752479	2024-01-17 17:56:52.779153	none	Oliver Goethe helmet	\N
451	kaylen-frederick	2024-01-17 17:57:15.610473	2024-01-17 17:57:15.654167	none	Kaylen Frederick helmet	\N
452	gregoire-saucy	2024-01-17 17:57:36.56618	2024-01-17 17:57:36.589254	none	Grégoire Saucy helmet	\N
453	nikola-tsolov	2024-01-17 17:57:58.446715	2024-01-17 17:57:58.478933	none	Nikola Tsolov helmet	\N
454	franco-colapinto	2024-01-17 17:58:24.317763	2024-01-17 17:58:24.365951	none	Franco Colapinto helmet	\N
455	mari-boya	2024-01-17 17:58:53.129987	2024-01-17 17:58:53.15838	none	Mari Boya	\N
456	jonny-edgar	2024-01-17 17:59:14.288924	2024-01-17 17:59:14.321485	none	Jonny Edgar helmet	\N
457	sebastian-montoya	2024-01-17 17:59:35.490004	2024-01-17 17:59:35.523578	none	Sebastián Montoya helmet	\N
458	gabriele-mini	2024-01-17 17:59:57.928904	2024-01-17 17:59:57.956664	none	Gabriele Minì helmet	\N
459	luke-browning	2024-01-17 18:00:24.668439	2024-01-17 18:00:24.702695	none	Luke Browning helmet	\N
460	caio-collet	2024-01-17 18:00:51.380654	2024-01-17 18:00:51.408829	none	Caio Collet helmet	\N
461	rafael-villagomez	2024-01-17 18:01:11.72725	2024-01-17 18:01:11.762282	none	Rafael Villagómez helmet	\N
462	oliver-gray	2024-01-17 18:01:36.313018	2024-01-17 18:01:36.339955	none	Oliver Gray helmet	\N
467	taylor-barnard	2024-01-17 18:04:55.078649	2024-01-17 18:04:55.110728	none	Taylor Barnard helmet	\N
463	francesco-simonazzi	2024-01-17 18:03:01.123729	2024-01-17 18:03:01.149925	none	Francesco Simonazzi helmet	\N
550	max@verstappen.com	2024-04-19 20:12:10.455469	2024-04-19 20:12:10.514632	none	\N	\N
520	melbourne-grand-prix-circuit	2024-01-18 21:43:03.308148	2024-01-18 21:43:03.341256	none	Melbourne Grand Prix Circuit	\N
521	suzuka-international-racing-course	2024-01-18 21:43:33.695737	2024-01-18 21:43:33.75029	none	Suzuka International Racing Course	\N
523	shanghai-international-circuit	2024-01-18 21:48:11.571961	2024-01-18 21:48:11.60079	none	Shanghai International Circuit	\N
524	miami-international-autodrome	2024-01-18 21:48:39.646199	2024-01-18 21:48:39.676028	none	Miami International Autodrome	\N
525	autodromo-enzo-e-dino-ferrari	2024-01-18 21:49:06.875345	2024-01-18 21:49:06.935504	none	Autodromo Enzo e Dino Ferrari	\N
526	circuit-de-monaco	2024-01-18 21:49:40.870976	2024-01-18 21:49:40.89432	none	Circuit de Monaco	\N
527	circuit-gilles-villeneuve	2024-01-18 21:50:17.391151	2024-01-18 21:50:17.414527	none	Circuit Gilles-Villeneuve	\N
528	circuit-de-barcelona-catalunya	2024-01-18 21:50:41.705275	2024-01-18 21:50:41.73796	none	Circuit de Barcelona-Catalunya	\N
529	red-bull-ring	2024-01-18 21:51:06.965777	2024-01-18 21:51:06.991591	none	Red Bull Ring	\N
530	silverstone-circuit	2024-01-18 21:51:29.094968	2024-01-18 21:51:29.138633	none	Silverstone Circuit	\N
531	hungaroring	2024-01-18 22:04:29.750602	2024-01-18 22:04:29.782292	none	Hungaroring	\N
495	mp-motorsport-car	2024-01-17 18:31:47.229814	2024-01-17 18:31:47.258821	mp-motorsport	MP Motorsport car	\N
496	rodin-carlin-car	2024-01-17 18:32:17.158232	2024-01-17 18:32:17.181627	rodin-carlin	Rodin Carlin Car	\N
498	prema-racing car	2024-01-17 18:35:33.747076	2024-01-17 18:35:33.773541	prema-racing	Prema Racing	\N
499	hitech-pulse-eight-car	2024-01-17 18:35:56.945204	2024-01-17 18:35:56.970393	hitech-pulse-eight	Hitech Pulse-Eight Car	\N
500	dams-car	2024-01-17 18:36:18.913272	2024-01-17 18:36:18.947196	dams	DAMS Car	\N
501	invicta-virtuosi-racing-car	2024-01-17 18:36:37.6123	2024-01-17 18:36:37.634083	invicta-virtuosi-racing	Invicta Virtuosi Racing Car	\N
502	phm-racing-car	2024-01-17 18:37:03.797294	2024-01-17 18:37:03.829614	phm-racing	PHM Racing Car	\N
503	trident-car	2024-01-17 18:37:24.186672	2024-01-17 18:37:24.213185	trident	Trident Car	\N
504	van-amersfoort-racing	2024-01-17 18:37:47.383411	2024-01-17 18:37:47.405785	van-amersfoort-racing	Van Amersfoort Racing	\N
505	campos-racing	2024-01-17 18:38:24.173126	2024-01-17 18:38:24.204843	campos-racing	Campos Racing Car	\N
506	prema-racing-f3	2024-01-17 18:38:53.453573	2024-01-17 18:38:53.500336	prema-racing-f3	PREMA Racing F3 Car	\N
507	trident-f3-car	2024-01-17 18:39:12.523896	2024-01-17 18:39:12.548955	trident-f3	Trident F3 Car	\N
508	art-grand-prix-f3-car	2024-01-17 18:39:34.853488	2024-01-17 18:39:34.880853	art-grand-prix-f3	Art Grand Prix F3 Car	\N
509	mp-motorsport-f3-car	2024-01-17 18:39:57.051622	2024-01-17 18:39:57.079404	mp-motorsport-f3	MP Motorsport F3 Car	\N
510	hitech-pulse-eight-f3-car	2024-01-17 18:40:21.027356	2024-01-17 18:40:21.052297	hitech-pulse-eight-f3	Hitech Pulse-Eight F3 Car	\N
511	van-amersfoort-racing-f3-car	2024-01-17 18:40:50.65862	2024-01-17 18:40:50.695717	van-amersfoort-racing-f3	Van Amersfoort Racing F3 Car	\N
512	rodin-carlin-f3-car	2024-01-17 18:41:29.849839	2024-01-17 18:41:29.876112	rodin-carlin-f3	Rodin Carlin F3 Car	\N
513	campos-racing-f3-car	2024-01-17 18:41:55.309324	2024-01-17 18:41:55.335441	campos-racing-f3	Campos Racing F3 Car	\N
514	jenzer-motorsport-f3-car	2024-01-17 18:42:13.364711	2024-01-17 18:42:13.386485	jenzer-motorsport-f3	Jenzer Motorsport F3 Car	\N
515	phm-racing-f3-car	2024-01-17 18:42:35.438065	2024-01-17 18:42:35.466478	phm-racing-f3	PHM Racing F3	\N
517	circuit-de-spa-francorchamps	2024-01-18 16:07:03.672402	2024-01-18 16:07:03.703327	none	Spa track	\N
518	bahrain-international-circuit	2024-01-18 21:36:41.150844	2024-01-18 21:36:41.232863	none	Bahrain International Circuit	\N
519	jeddah-corniche-circuit	2024-01-18 21:38:57.651306	2024-01-18 21:38:57.676157	none	Jeddah Corniche Circuit	\N
532	circuit-zandvoort	2024-01-18 22:04:56.517039	2024-01-18 22:04:56.550101	none	Circuit Zandvoort	\N
533	autodromo-nazionale-monza	2024-01-18 22:05:39.18145	2024-01-18 22:05:39.212825	none	Autodromo Nazionale Monza	\N
534	baku-city-circuit	2024-01-18 22:05:56.900486	2024-01-18 22:05:56.934781	none	Baku City Circuit	\N
535	marina-bay-street-circuit	2024-01-18 22:06:31.028583	2024-01-18 22:06:31.051711	none	Marina Bay Street Circuit	\N
536	circuit-of-the-americas	2024-01-18 22:06:49.265544	2024-01-18 22:06:49.289662	none	Circuit of The Americas	\N
497	art-grand-prix-car	2024-01-17 18:35:06.910123	2024-01-17 18:35:06.931608	art-grand-prix	Art Grand Prix Car	\N
538	autodromo-hermanos-rodriguez	2024-01-18 22:07:41.916741	2024-01-18 22:07:41.937194	none	Autódromo Hermanos Rodríguez	\N
539	autodromo-jose-carlos-pace	2024-01-18 22:07:58.19285	2024-01-18 22:07:58.241742	none	Autódromo José Carlos Pace	\N
540	las-vegas-strip-circuit	2024-01-18 22:08:13.114843	2024-01-18 22:08:13.141788	none	Las Vegas Strip Circuit	\N
541	lusail-international-circuit	2024-01-18 22:08:38.579471	2024-01-18 22:08:38.608771	none	Lusail International Circuit	\N
542	yas-marina-circuit	2024-01-18 22:08:59.18089	2024-01-18 22:08:59.200935	none	Yas Marina Circuit	\N
464	josep-maria-marti	2024-01-17 18:03:29.846681	2024-01-17 18:03:29.895993	none	Josep María Martí helmet	\N
465	christian-mansell	2024-01-17 18:03:48.492254	2024-01-17 18:03:48.518944	none	Christian Mansell	\N
466	nikita-bedrin	2024-01-17 18:04:32.296135	2024-01-17 18:04:32.324053	none	Nikita Bedrin helmet	\N
468	alejandro-garcia	2024-01-17 18:05:18.813225	2024-01-17 18:05:18.842132	none	Alejandro García helmet	\N
548	admin@admin.com	2024-01-20 14:12:13.736977	2024-01-20 14:12:13.757183	none	\N	\N
469	sophia-floersch	2024-01-17 18:05:47.237597	2024-01-17 18:05:47.271141	none	 Sophia Floersch helmet	\N
470	roberto-faria	2024-01-17 18:06:09.563611	2024-01-17 18:06:09.59596	none	Roberto Faria helmet	\N
549	formula2	2024-01-20 19:52:36.292261	2024-01-20 19:52:36.322322	2	Formula 2 Logo	\N
471	woohyun-shin	2024-01-17 18:06:35.150731	2024-01-17 18:06:35.199938	none	Woohyun Shin helmet	\N
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (id, user_id, post_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, title, body, author_id, created_at, updated_at, "like") FROM stdin;
2	;alkdfjsasldkfja	;aldkfjalds;kfjadlsfk	7	2024-04-19 12:49:07.555402	2024-04-19 13:00:50.827311	1
1	laskfjlaskdjflaskdjflaskdjf	hellohellohellohelloohello	7	2024-04-19 12:44:52.72643	2024-04-19 13:18:42.662596	0
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20230918094537
20230918123400
20230923100523
20230923101723
20230929103026
20230930130425
20230930130925
20230930141201
20230930142457
20230930173552
20231005135821
20231005140334
20231005141414
20231005141759
20231010184342
20231013132522
20231015125812
20231016200401
20231019193745
20231019195530
20231021135015
20231023215712
20231024171901
20231028132052
20231101103446
20231101185057
20231106215056
20231107214637
20231108202727
20231108203425
20231110102413
20231110151235
20231110195010
20231118204627
20231119164538
20231125162312
20231125164253
20231126192146
20231126192735
20231204130453
20231227111543
20231228140418
20231228171930
20231230105649
20231230160959
20231230162019
20231230163348
20240109090025
20240115161401
20240115161736
20240115163604
20240117171635
20240121104850
20240121110535
20240121112906
20240125175533
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.series (id, name, number_of_drivers, number_of_races, number_of_teams, created_at, updated_at, slug) FROM stdin;
1	Formula 1	20	24	10	2023-10-13 13:36:52.891188	2023-10-13 13:36:52.891188	formula-1
2	Formula 2	22	14	11	2023-10-13 13:36:52.894516	2023-10-13 13:36:52.894516	formula-2
3	Formula 3	30	18	10	2023-10-13 13:36:52.896354	2023-10-13 13:36:52.896354	formula-3
4	Formula 1 Esport	30	12	10	2023-10-13 13:36:52.891	2023-10-13 13:36:52.891	formula-1-esport
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, name, number_of_championships, number_of_races, headquarters_city, created_at, updated_at, technical_director, first_win, last_championship_win, date_of_establishment, series_id, team_color, slug, description) FROM stdin;
1	Oracle Red Bull Racing	6	365	Milton Keynes	2023-10-13 13:36:52.914454	2023-10-13 13:36:52.914454	Adrian Newey	2009	2023	2004	1	0F2485	oracle-red-bull-racing	A Red Bull számára – mint szponzorok – nem volt idegen az F1, mielőtt 2004-ben hivatalosan is beléptek volna a csapatok közé. Mindazonáltal a következő évtizedben elért sikerek mértéke megdöbbentő volt. A 2006-os első dobogó után a csapat 2009-ben lépett előre, hat győzelmet aratott és második a konstruktőri rangsorban. 2010 és 2013 között egymást követő páros címet szereztek, Sebastian Vettel pedig a sportág legfiatalabb négy világbajnoki címmel rendelkető  bajnoka lett. Most egy hasonlóan izgalmas tehetséggel szerzik vissza ezt a dicsőséget – akit Max Verstappennek hívnak…
2	Scuderia Ferrari	16	1067	Maranello	2023-10-13 13:36:52.91703	2023-10-13 13:36:52.91703	Frédéric Vasseur	1951	2008	1929	1	A6051A	scuderia-ferrari	Sokak számára a Ferrari és a Forma-1-es versenyzés elválaszthatatlanná vált. Az egyetlen csapat, amely a világbajnokság kezdete óta minden szezonban részt vett, Enzo Ferrari szerény álmából nőtte ki magát a világ egyik legikonikusabb és legelismertebb márkájává. A siker gyorsan jött Alberto Ascari és John Surtees révén, és folytatódott – a soványabb időkben – Niki Laudával az 1970-es években, majd Michael Schumacherrel a 2000-es években, amikor a Ferrari akkoriban példátlan öt egymást követő bajnoki címet szerzett, ezzel bebiztosítva státuszát. az F1 történetének legsikeresebb és legkiválóbb csapata
6	BWT Alpine F1 Team	0	52	Enstone	2023-10-13 13:36:52.939035	2023-10-13 13:36:52.939035	Pat Fry	2021	0	1986	1	fd4bc7	bwt-alpine-f1-team	Az Alpine viszonylag új név lehet a Forma-1-ben, de a Renault híres motorsport-örökséggel rendelkezik. A csapat 2021-es átnevezése jelentette a következő lépést a Renault F1-es újjáéledésében, amely 2016-ban kezdődött az akkori Lotus csapat átvételével. A már futamgyőztesek új köntösben, a szokásos dobogó és a címdőlés lehet a következő céljuk.
9	Alfa Romeo F1 Team Stake	0	200	Hinwill	2023-10-13 13:36:52.942717	2023-10-13 13:36:52.942717	Jan Monchaux	1950	0	1950	1	a50f2d	alfa-romeo-f1-team-stake	Az Alfa Romeo név a bajnokság 1950-es kezdetéig nyúlik vissza a Forma-1-hez. A 21. századig előrehaladva az olasz fellángolás egyesül a svájci érzékenységgel a korábban Sauber néven ismert csapat új korszakában.
14	Prema Racing	2	191	Veneto	2023-10-14 21:39:31.053049	2023-10-14 21:39:31.053049	René Rosin	2017	2021	1983	2	da3627	prema-racing	Az Angelo Rosin és Giorgio Piccolo által 1983-ban alapított PREMA Racing a junior együléses versenyzés éllovasává vált. Széles körben az olasz motorsport harmadik erejeként tartják számon, méretét, eredményeit és versenyprofilját tekintve közvetlenül az F1-es csapatok, a Ferrari és az Alpha Tauri mögött.
17	Invicta Virtuosi Racing	0	72	Norfolk	2023-10-14 21:39:31.059354	2023-10-14 21:39:31.059354	Andy Roche	2019	0	2012	2	fcfc58	invicta-virtuosi-racing	Az Invicta Virtuosi Racing jelenlegi formájában még 2012-ben indult, és azóta is sikeres alappillére az együléses létrán. A 2023-as szezonban az Invicta Virtuosi Racing folytatja sikeres szereplését az FIA Formula 2-ben, és második éve versenyez az FIA Brit Forma-4-es bajnokságban, miután 2022-ben stabil újonc szezonnak örvendett.
26	Hitech Pulse-Eight F3	0	90	Silverstone	2023-10-15 11:01:33.619509	2023-10-15 11:01:33.619509	Oliver Oakes	2019	0	2002	3	b34637	hitech-pulse-eight-f3	Az első szezonban a Hitech öt pole pozíciót és hat dobogós helyezést ért el Danny Watts és Eric Salignon pilótáival. Andrew Thompson is hozzájárult néhány pontszerzéshez. Watts a brit F3-bajnokságot az 5. helyen zárta egy olyan szezonban, amely emlékezetes Castle Combe-i győzelmet is tartalmazott. A Koreai Szuperdíjon Richard Antinucci vendégpilóta megszerezte a Hitech első nemzetközi futamgyőzelmét.\n
20	Van Amersfoort Racing	0	48	Zeewolde	2023-10-14 21:39:31.079508	2023-10-14 21:39:31.079508	Frist van Amersfoort	2023	0	1975	2	e1683c	van-amersfoort-racing	2021 végén bejelentették, hogy 2022-től a VAR váltja fel a HWA Racelabot az FIA Formula 2 és FIA Formula 3 rajtrácsain. A Van Amersfoort Racing egy hollandiai székhelyű autóversenyző csapat. A csapat jelenleg a Forma-2-es bajnokságban, a Forma-3-as bajnokságban, a Formula Regionális Európa-bajnokságban és az olasz F4-bajnokságban versenyez.
27	Van Amersfoort Racing F3	0	36	Zeewolde	2023-10-15 11:01:33.621699	2023-10-15 11:01:33.621699	Frist van Amersfoort	2022	0	1975	3	e1683c	van-amersfoort-racing-f3	2021 végén bejelentették, hogy 2022-től a VAR váltja fel a HWA Racelabot az FIA Formula 2 és FIA Formula 3 rajtrácsain. A Van Amersfoort Racing egy hollandiai székhelyű autóversenyző csapat. A csapat jelenleg a Forma-2-es bajnokságban, a Forma-3-as bajnokságban, a Formula Regionális Európa-bajnokságban és az olasz F4-bajnokságban versenyez.
30	Jenzer Motorsport F3	0	90	Lyss	2023-10-15 11:01:33.628098	2023-10-15 11:01:33.628098	Andreas Jenzer	2019	0	1993	3	5ea9d5	jenzer-motorsport-f3	A Jenzer Motorsport egy svájci székhelyű autóversenyző csapat. Az Andreas Jenzer által 1993-ban alapított csapat jelenleg az FIA Formula 3-ban, az olasz F4-ben és az F4-ben versenyez, és számos olyan pilótája volt, akik sikeresek lettek volna a motorsportban, ezek közül a legfontosabb a Forma-1-es pilóta, Yuki Tsunoda.
64	hellooo	0	0	igenigen	2024-04-15 18:38:04.560417	2024-04-15 18:38:04.560417	igenigen	1950	1950	1950	1	000000	hellooo	al;kdsjf;alkdjf;alkdsjf;lakdjf;alkdjf;lakdjfla;kdfjla;ksdfj
65	helloooo	0	0	igenigen	2024-04-15 19:01:48.359323	2024-04-15 19:01:48.359323	igenigen	1950	1950	1950	1	000000	helloooo	al;kdsjf;alkdjf;alkdsjf;lakdjf;alkdjf;lakdjfla;kdfjla;ksdfj
66	lololol	0	0	igenigen	2024-04-15 19:02:02.05432	2024-04-15 19:02:02.05432	igenigen	1950	1950	1950	1	000000	lololol	al;kdsjf;alkdjf;alkdsjf;lakdjf;alkdjf;lakdjfla;kdfjla;ksdfj
3	Mercedes-AMG Petronas Formula One Team	8	279	Brackley	2023-10-13 13:36:52.91878	2023-10-13 13:36:52.91878	Toto Wolff	1954	2021	1954	1	00A19C	mercedes-amg-petronas-formula-one-team	A Mercedes modern F1-es újjáéledése azzal kezdődött, hogy 2010-re létrehoztak egy munkacsapatot. A csapat óriási izgalmakat váltott ki Michael Schumacher szenzációs visszatérésével. Három dobogós helyezés a bemutatkozó szezonban, mindezt Nico Rosberg révén – aki aztán 2012-ben áttörést jelentő pole/győzelem duplát szerzett Kínában. a következő szezonban Lewis Hamiltonnal párosították, a duó néhány epikus címcsatát vívott, miközben az Ezüstnyilak mindent elsöpörtek előttük, hogy a modern F1-es korszak egyik legdominánsabb erejévé váljanak. És mivel Hamilton partnere a feltörekvő George Russell, a Mercedes továbbra is az a csapat, amelyet mindenki meg akar győzni…
5	Aston Martin Aramco Cognizant Formula One Team	0	55	Silverstone	2023-10-13 13:36:52.937087	2023-10-13 13:36:52.937087	Andrew Green	0	0	2018	1	00594f	aston-martin-aramco-cognizant-formula-one-team	Az Aston Martin eredeti Forma-1-es betörése – több mint fél évszázaddal ezelőtt – mindössze öt futamig tartott. Ezúttal azonban ez komoly. Ennek az F1-es alakulatnak nem ismeretlen a siker, hiszen eredeti formájában Jordan, legutóbb pedig Racing Point néven nyert 2020-ban. Híresek arról, hogy képesek felülmúlni a súlyukat, és most egy kétszeres bajnok vezeti pilótasorukat.
7	Scuderia AlphaTauri	0	77	Faenza	2023-10-13 13:36:52.94093	2023-10-13 13:36:52.94093	Jody Egginton	2020	0	2006	1	00293f	scuderia-alphatauri	A 2006-ban alapított alakulat, amelyben a Red Bull csodálatos tehetségtárának fiatal pilótái vághatták a fogukat az F1-ben, az AlphaTauri – eredeti nevén Toro Rosso – a csípős Minardi csapat hamvaiból alakult. Sebastian Vettel szinte azonnal érvényesítette ezt a megközelítést, 2008-ban mesebeli győzelmet aratott, mielőtt a Red Bull Racing szülőcsapatával világbajnoki sikert aratott volna. A tehetséggondozás szellemisége ma is érvényes, bár az olasz alakulat már nem egyszerűen „B-csapat”, hanem önálló konstruktőr.
10	MoneyGram Haas F1 team	0	152	Kannapolis	2023-10-13 13:36:52.946276	2023-10-13 13:36:52.946276	Simone Resta	0	0	2016	1	f62039	moneygram-haas-f1-team	A rajtrács legfiatalabb csapata, a Haas lenyűgözően debütált 2016-ban, és ezzel három évtized után az első teljesen amerikai vezetésű F1-es csapat lett. Gene Haas iparos alapította őket, és az Egyesült Államokban, ugyanabban a kannapolisi észak-karolinai létesítményben székelnek, mint a NASCAR Sprint Cup Series bajnoki győztes csapata, a Stewart-Haas Racing. A karizmatikus Guenther Steiner vezette Ferrari-motoros csapatnak szintén van brit gyára Banburyben.
12	Rodin Carlin	0	470	Farnham	2023-10-14 21:39:31.049154	2023-10-14 21:39:31.049154	Matthew Gaze	2018	0	1996	2	d1c385	rodin-carlin	A csapat történelmi sikere az együléses, GT3-as és LMP2-es kategóriákra terjed ki, beleértve: British F3, Porsche Supercup, World Series by Nissan, Formula Renault 3.5, A1GP, FIA Formula 3 Európa-bajnokság, GP3 Series. GP2 Series, FIA Formula 2 és European Le Mans Series.
13	Art Grand Prix	0	169	Villeneuve-la-Guyard	2023-10-14 21:39:31.051139	2023-10-14 21:39:31.051139	Clément Sudre	0	0	1996	2	000000	art-grand-prix	Az ART Grand Prix egy francia csapat, mely jelenleg az FIA Formula–2 bajnokságban, az FIA Formula–3 bajnokságban és a Formula Regionális Európa-bajnokság-ban van jelen. A csapatot 2005-ben alapította Frédéric Vasseur és Jean Todt fia, Nicolas Todt azzal a céllal, hogy részt vegyenek az újonnan alakult GP2-es szériában.
15	Hitech Pulse-Eight	0	99	Silverstone	2023-10-14 21:39:31.055014	2023-10-14 21:39:31.055014	Oliver Oakes	2020	0	2002	2	b34637	hitech-pulse-eight	Az első szezonban a Hitech öt pole pozíciót és hat dobogós helyezést ért el Danny Watts és Eric Salignon pilótáival. Andrew Thompson is hozzájárult néhány pontszerzéshez. Watts a brit F3-bajnokságot az 5. helyen zárta egy olyan szezonban, amely emlékezetes Castle Combe-i győzelmet is tartalmazott. A Koreai Szuperdíjon Richard Antinucci vendégpilóta megszerezte a Hitech első nemzetközi futamgyőzelmét.\n
16	DAMS	1	167	Silverstone	2023-10-14 21:39:31.057267	2023-10-14 21:39:31.057267	Yannick Hubert	2017	2019	1988	2	f6ca4d	dams	A DAMS egy francia autóversenyző csapat, amely a motorsport számos területén érintett. A DAMS-t 1988-ban alapította Jean-Paul Driot és René Arnoux korábbi Forma-1-es pilóta. 2022-ben Charles Pic volt F1-es pilóta vásárolta meg. Székhelye Le Mans közelében található, mindössze 2 km-re a Bugatti versenypályától.\nA DAMS mind a pilóták, mind a csapatbajnokságok sikereinek örvend számos formula-sorozatban szerte a világon,  és számos előkelő pilóta karrierjének beindításában segített.
22	PREMA Racing F3	3	72	Grisignano Di Zocco	2023-10-15 11:01:33.610134	2023-10-15 11:01:33.610134	René Rosin	2019	2022	1983	3	da3627	prema-racing-f3	Az Angelo Rosin és Giorgio Piccolo által 1983-ban alapított PREMA Racing a junior együléses versenyzés éllovasává vált. Széles körben az olasz motorsport harmadik erejeként tartják számon, méretét, eredményeit és versenyprofilját tekintve közvetlenül az F1-es csapatok, a Ferrari és az Alpha Tauri mögött.
24	Art Grand Prix F3	0	90	Saint Pierre du Perray	2023-10-15 11:01:33.615672	2023-10-15 11:01:33.615672	Sébastien Philippe	2010	0	2005	3	000000	art-grand-prix-f3	Az ART Grand Prix egy francia csapat, mely jelenleg az FIA Formula–2 bajnokságban, az FIA Formula–3 bajnokságban és a Formula Regionális Európa-bajnokság-ban van jelen. A csapatot 2005-ben alapította Frédéric Vasseur és Jean Todt fia, Nicolas Todt azzal a céllal, hogy részt vegyenek az újonnan alakult GP2-es szériában.
25	MP Motorsport F3	0	90	Westmaas	2023-10-15 11:01:33.617596	2023-10-15 11:01:33.617596	Sander Dorsman	2020	0	1995	3	f86304	mp-motorsport-f3	Az MP Motorsport egy holland autóversenyző csapat, amely jelenleg az FIA Formula 2 bajnokságban, a FIA Formula 3 bajnokságban, a Formula Regional European by Alpine Bajnokságban, az Eurocup 3-ban, a Spanyol Forma 4 bajnokságban és az újonnan alapított F1 Academy 2023-ban indul. az Auto GP-ben, az Eurocup Formula Renault 2.0-ban és a Formula Renault 2.0 Észak-Európa Kupában a Manor Competition-szel együtt, a múltban a Manor MP Motorsport nevet használva.
999	None	0	0		2024-01-17 19:14:47.156	2024-01-17 19:14:51.641	\N	0	0	0	0	0	none	Other
28	Rodin Carlin F3	0	470	Farnham	2023-10-15 11:01:33.623838	2023-10-15 11:01:33.623838	Stephanie Carlin	2018	0	1996	3	d1c385	rodin-carlin-f3	A csapat történelmi sikere az együléses, GT3-as és LMP2-es kategóriákra terjed ki, beleértve: British F3, Porsche Supercup, World Series by Nissan, Formula Renault 3.5, A1GP, FIA Formula 3 Európa-bajnokság, GP3 Series. GP2 Series, FIA Formula 2 és European Le Mans Series.
18	PHM Racing	0	6	Berlin	2023-10-14 21:39:31.061573	2023-10-14 21:39:31.061573	Paul Muller	0	0	2021	2	eeb793	phm-racing	Az együléses programját 2021 végén felfüggesztő Mücke Motorsport hamvaiból született PHM Racinget Paul Müller alapította, főként a Mücke Motorsport egykori mérnökeiből álló csapattal, és célja, egy non-profit csapat létrehozása volt. A csapat 2022-ben tette meg első lépést a Egyesült Arab Emírségek-i Formula–4-bajnokságban, Nikita Bedrinnel, Jonas Rieddel és Taylor Barnarddal versenyezve. A csapat első futamgyőzelmét Barnard érte el, majd pár versennyel később Bedrinnel közösen kettős győzelmet arattak, ezt követően Paul Müller, a csapat tulajdonosa bejelentette, hogy beszállnak az olasz és a német F4-es bajnokságba is.
19	Trident	0	232	Milano	2023-10-14 21:39:31.063667	2023-10-14 21:39:31.063667	Maurizio Salvadori	2006	0	2006	2	363d8d	trident	Élvonalbeli technikai és szervezeti felépítésével a Trident egy olyan csapat, amely a Formula 2, Formula 3 e Formula Regional Championships versenyeken indul, és amely hatékonyságával és találékonyságával tűnik ki. Fiatal és dinamikus csapat, amely mindig is nagy figyelmet fordított a kutatásra és fejlesztésre, a sporteredmények elérése érdekében. A csapat 2006-ban debütált a GP2-ben, Maurizio Salvadori szenvedélyének és vállalkozói képességének köszönhetően, aki a show-bizniszben arról ismert, hogy számos hazai és nemzetközi művészt felfedezett és irányított.
21	Campos Racing	0	111	Valencia	2023-10-14 21:39:31.081772	2023-10-14 21:39:31.081772	Adrián Campos Jr.	2019	0	1998	2	ffffff	campos-racing	A Campos Racing egy spanyol autóversenyző csapat, amely az elmúlt évben indított versenyzőket a WTCC-ben, a GP2-ben és GP3-ban. Campos 2014-ben átvette az Addax Team-et. A csapat pilótái Arthur Pic és Szató Kimija voltak. Szatót a szezon felénél Alexander Rossi váltotta. A következő szezonra megtartották Pic-et, továbbá leszerződtették Rio Haryanto-t, aki az év végén az összesített 4. helyen végzett.\n
23	Trident F3	1	138	Milano	2023-10-15 11:01:33.613831	2023-10-15 11:01:33.613831	Maurizio Salvadori	2013	2021	2006	3	363d8d	trident-f3	Élvonalbeli technikai és szervezeti felépítésével a Trident egy olyan csapat, amely a Formula 2, Formula 3 e Formula Regional Championships versenyeken indul, és amely hatékonyságával és találékonyságával tűnik ki. Fiatal és dinamikus csapat, amely mindig is nagy figyelmet fordított a kutatásra és fejlesztésre, a sporteredmények elérése érdekében. A csapat 2006-ban debütált a GP2-ben, Maurizio Salvadori szenvedélyének és vállalkozói képességének köszönhetően, aki a show-bizniszben arról ismert, hogy számos hazai és nemzetközi művészt felfedezett és irányított.
29	Campos Racing F3	0	90	Valencia	2023-10-15 11:01:33.626047	2023-10-15 11:01:33.626047	Adrián Campos Jr.	2021	0	1998	3	ffffff	campos-racing-f3	A Campos Racing egy spanyol autóversenyző csapat, amely az elmúlt évben indított versenyzőket a WTCC-ben, a GP2-ben és GP3-ban. Campos 2014-ben átvette az Addax Team-et. A csapat pilótái Arthur Pic és Szató Kimija voltak. Szatót a szezon felénél Alexander Rossi váltotta. A következő szezonra megtartották Pic-et, továbbá leszerződtették Rio Haryanto-t, aki az év végén az összesített 4. helyen végzett.\n
31	PHM Racing F3	0	4	Berlin	2023-10-15 11:01:33.644101	2023-10-15 11:01:33.644101	Paul Muller	0	0	2021	3	eeb793	phm-racing-f3	Az együléses programját 2021 végén felfüggesztő Mücke Motorsport hamvaiból született PHM Racinget Paul Müller alapította, főként a Mücke Motorsport egykori mérnökeiből álló csapattal, és célja, egy non-profit csapat létrehozása volt. A csapat 2022-ben tette meg első lépést a Egyesült Arab Emírségek-i Formula–4-bajnokságban, Nikita Bedrinnel, Jonas Rieddel és Taylor Barnarddal versenyezve. A csapat első futamgyőzelmét Barnard érte el, majd pár versennyel később Bedrinnel közösen kettős győzelmet arattak, ezt követően Paul Müller, a csapat tulajdonosa bejelentette, hogy beszállnak az olasz és a német F4-es bajnokságba is.
8	Williams Racing	9	808	Oxfordshire, Grove	2023-10-13 13:36:52.944364	2023-10-13 13:36:52.944364	Pat Fry	1979	1997	1977	1	00a3e0	williams-racing	A néhai Sir Frank Williams ragyogásától és szenvedélyétől vezérelve a Williams szerény kezdeteiből a Forma-1-es lovaggá nőtte ki magát, akivel a Ferrari és a McLaren kivételével mindenki páratlan a tartós sikerek tekintetében. Az elmúlt négy évtizedben a csapat Grand Prix-győzelmeket és bajnoki címeket gyűjtött, és eközben a sportág legnagyszerűbb tehetségeit nevelte a pilótaüléseiben. És miután a Williams család úgy döntött, hogy lemond a csapat 2020-as eladásáról a Dorilton Capitalnak, egy új korszak kezdődött.
32	Alfa Romeo F1 Team Kick Esports	0	58	Hinwil, Zürich	2024-01-12 14:18:04.801	2024-01-12 14:18:08.325	-	2018	2020	2018	4	a50f2d	alfa-romeo-f1-team-kick-esports	Az Alfa Romeo KICK F1 Esports csapat a Sauber Esports és a KICK, egy ambiciózus streaming oldal partnerségében jött létre. A csapat célja, hogy versenyezzen az F1 Esports Pro Championshipben. Az Alfa Romeo F1 Team KICK Esports pilótái kizárólag a KICK-en streamelnek. A csapat partnerséget kötött a R8G e-Sports Sim Racing Team-mel is, melyet a korábbi Formula-1-es sztár, Romain Grosjean vezet.
40	Scuderia Ferrari Esports	0	58	Maranello	2024-01-12 14:18:04.801	2024-01-12 14:18:04.801	-	2019	0	2018	4	A6051A	scuderia-ferrari-esports	ferrari
38	Oracle Red Bull Sim Racing	2	58	Milton Keynes	2024-01-12 14:18:04.801	2024-01-12 14:18:04.801	-	2019	2020	2018	4	0F2485	oracle-red-bull-sim-racing	redbull
33	Alpine Esports	0	58	Paris	2024-01-12 14:18:04.801	2024-01-12 14:18:08.325	-	2019	0	2018	4	fd4bc7	alpine-esports	Az Alpine F1 Esports csapat 2018-ban alakult, hogy áthidalja a valóság és a virtuális világ közötti szakadékot1. A csapat célja, hogy részt vegyen a legnagyobb virtuális versenyeken, miközben megőrzi az Alpine Racing kizárólagosságát és elkötelezettségét1. Az Alpine F1 Esports csapat versenyzői között található Luke Smith, Patrik Sipos és Rubén Pedreño2. A csapatot Grégory Ballati, Jurgen Van Bergen és Richard Arnaud menedzseli2. Az Alpine F1 Esports csapat a versenyek mellett nagy hangsúlyt fektet a jövőre, mind a pályán, mind azon kívül1.
34	Aston Martin Aramco Cognizant F1 Esports	0	58	Silverstone	2024-01-12 14:18:04.801	2024-01-12 14:18:08.325	-	2019	0	2018	4	00594f	aston-martin-aramco-cognizant-f1-esports	Az Aston Martin F1 Esports csapat a virtuális világban is különleges energiát hoz létre, és elszántan versenyez a szimulációs versenyek egyedülálló környezetében¹. 2023-ban a csapat elsősorban az F1 Esports Pro Championship-re összpontosít, azzal a céllal, hogy építkezzen a 2022-es teljesítményén¹. A csapat versenyzői között található Manuel Biancolilla, John Evans és Simon Weigang¹. Fabrizio Donoso, aki már nyert a Daytona 24 órás versenyen az iRacingben és második lett a 2017-es F1 Esports Series-ben, szintén a csapat tagja¹. A csapat fejlesztő versenyzője Duncan Hofland, aki 2022-ben csatlakozott a csapathoz¹. Az Aston Martin F1 Esports csapat nagy hangsúlyt fektet a jövőre, mind a pályán, mind azon kívül¹.\n\nForrás: Beszélgetés a Binggel, 12/01/2024\n(1) Esports - Aston Martin F1 Team. https://www.astonmartinf1.com/en-GB/esports.\n(2) News (Esports) - Aston Martin F1 Team. https://www.astonmartinf1.com/en-GB/news/esports.\n(3) 2022 F1 Esports Pro Championship line-up confirmed - Aston Martin F1 Team. https://www.astonmartinf1.com/en-GB/news/announcement/2022-f1-esports-pro-championship-line-up-confirmed.\n(4) Aston Martin Cognizant F1 Team extends EPOS partnership. https://esportsinsider.com/2021/05/aston-martin-cognizant-f1-team-extends-epos-partnership.\n(5) Esports - Aston Martin F1 Team. https://www.astonmartinf1.com/esports.
35	McLaren Shadow	1	58	Woking	2024-01-12 14:18:04.801	2024-01-12 14:18:08.325	-	2022	2022	2018	4	ff8000	mclaren-shadow	A McLaren Shadow F1 Esports csapat a McLaren Racing család öt versenycsapatának egyike1. A csapat tagjai között található Lucas Blakeley, Dani Moreno és Wilson Hughes
36	Mercedes-AMG PETRONAS Esports Team	2	58	Brackley	2024-01-12 14:18:04.801	2024-01-12 14:18:08.325	-	2018	2021	2018	4	00A19C	mercedes-amg-petronas-esports-team	A Mercedes-AMG PETRONAS Esports csapat a virtuális világban vezeti a ezüst nyilakat1. A csapat Brackley-ben található, a Mercedes-AMG PETRONAS Formula One Team területén, ahol egy célra épített e-sport edzőközpont biztosítja a csapat versenyzőinek a világosztályú létesítményeket és a legmodernebb eszközöket2
37	MoneyGram Haas F1 Team Esports	0	58	Kannapolis	2024-01-12 14:18:04.801	2024-01-12 14:18:04.801	-	2022	0	2018	4	f62039	moneygram-haas-f1-team-esports	haas
39	Scuderia Alphatauri Orlen Esports Team	0	58	Faenza	2024-01-12 14:18:04.801	2024-01-12 14:18:04.801	-	2018	0	2018	4	00293f	scuderia-alphatauri-orlen-esports-team	alphatauri
41	Williams Esports	0	58	Grove	2024-01-12 14:18:04.801	2024-01-12 14:18:04.801	-	0	0	2018	4	00a3e0	williams-esports	williams
4	McLaren F1 Team	8	931	Woking	2023-10-13 13:36:52.934885	2024-02-14 12:08:39.662248	James Key	1969	1998	1964	1	ff8000	mclaren-f1-team	Amióta 1966-ban belépett a sportba, a névadó alapító, Bruce vezetésével és nyugtalan igyekezetével, a McLaren sikere nem volt más, mint lélegzetelállító. Öt csillogó évtized számtalan győzelmet, pole pozíciót és dobogós helyezést hozott, nem beszélve a nyolc konstruktőri bajnokságról. Sőt, a sportág legkiválóbb pilótái közül néhányan felvették a névjegyüket a csapattal, köztük Emerson Fittipaldi, Ayrton Senna, Mika Hakkinen és Lewis Hamilton
\.


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracks (id, created_at, updated_at, name, country, city, length, turns, first_grand_prix, lap_record_in_seconds, lap_record, is_street_circuit, description, slug) FROM stdin;
2	2024-01-15 17:40:30.335	2024-01-15 17:40:34.013	Jeddah Corniche Circuit	Szaúd-Arábia	Jeddah	6174	27	2021	90.734	Lewis Hamilton	f	A leggyorsabb utcai pálya. A német Carsten Tilke tervezte, aki a Formula–1 legismertebb pályatervezője.  A versenyt teljes egészében este rendezik mesterséges fényviszonyok között. Az F1-es Ross Brawn így nyilatkozott a pályáról: „Amit látni szeretnénk, az egy versenypálya. Nem akarunk Miki egér pályákat. Nem akarjuk azokat a régi, klasszikus utcai pályákat 90 fokos kanyarokkal. Gyors pályákat akarunk, olyan pályákat, amelyek kihívást jelentenek a versenyzőknek – és ők ezt imádni fogják.”	jeddah-corniche-circuit
22	2024-01-15 19:05:24.437	2024-01-15 19:05:26.759	Las Vegas Strip Circuit	USA	Las Vegas	6201	17	2023	95.49	Oscar Piastri	t	A 2023-as Forma-1-es szezonban a pilóták egy teljesen új pályára léptek Las Vegasban, amely magában foglalja a fények városának legjobbjait – beleértve a híres Stripet is. A Las Vegas szívében található új, 6,2 km-es, 17 kanyaros utcai kör olyan ikonikus helyszínek mellett kanyarog, mint a Caesars Palace, a Bellagio és a Venetian. A Monzához, más néven Forma-1 „Sebesség templomához” hasonló átlagsebességgel a rajongók számára garantált a rengeteg akció és előzés.	las-vegas-strip-circuit
3	2024-01-15 17:57:39.936	2024-01-15 17:57:42.684	Melbourne Grand Prix Circuit	Ausztrália	Melbourne	5278	14	1996	80.235	Sergio Perez	f	1993-ban született meg a döntés a Forma-1 rendezéséről Melbourne-ben, és úgy döntöttek, hogy a város Albert Park-i utak keverékéből majd egy pályát hoznak létre. Ideiglenes létesítményként az Albert Park meglehetősen göröngyös lehet, míg a hétvége elején a pálya gyakran csúszós, és fokozaton gumizódik fel az etapok elteltével. Ez egy olyan pálya is, amelyhez egy jól átgondolt karosszéria szükséges, több hely is van a pályán, ahol a pilótáknak egy mozgékony autó kell, amit bátran be tudnak dobni a kanyarba– a fő gyors rész a 11-12 kanyarban lévő sikán.	melbourne-grand-prix-circuit
4	2024-01-15 17:59:47.936	2024-01-15 17:59:50.847	Suzuka International Racing Course	Japán	Suzuka	5807	18	1987	90.983	Lewis Hamilton	f	Mikor épült a pálya? 1962-ben. Soichiro Honda, akinek autógyártó cégéről talán hallottál, nagy ambíciókkal rendelkező ember volt. Annak érdekében, hogy a Hondát autóipari óriássá tegye, úgy döntött, hogy cégének saját tesztpályával kell rendelkeznie. A holland John Hugenholtz kapta a feladatot, és elkészítette a mára ikonikussá vált „crossover” suzukai pályát. „Mutass nekünk egy versenyzőt, aki nem szereti Suzukát, mi pedig megmutatjuk, hogy hazudik.” A nagy sebességű pálya továbbra is az egyik legnagyobb kihívás marad, a kígyózó „S” kanyarokkal.	suzuka-international-racing-course
5	2024-01-15 18:02:45.711	2024-01-15 18:02:48.221	Shanghai International Circuit	Kína	Shanghai	5451	16	2004	92.238	Michael Schumacher	f	2003 áprilisában Sanghaj Jiading kerületében egy mocsaras területet jelöltek ki a Forma-1 verseny tartására. Tizennyolc hónappal és körülbelül 450 millió dollárral később elkészült a legmodernebb sanghaji nemzetközi versenypálya. Az pálya tetszetős formája az égből nézve – úgy tervezték, hogy úgy nézzen ki, mint a „shang” kínai szimbóluma, aminek a jelentése „felfelé”. Egyedülálló a kör rajtja, ahogy a pilóták berepülnek az egyre szűkebb 1-es és 2-es kanyarba, mielőtt balra fordulnak a 3-as és 4-es kanyarban. A extrém magas G-erőt a 7-es és 8-as kanyarokban tapasztalják a pilóták. Ezen a pályán van ugyanakkor a naptár egyik leghosszabb egyenese, egy 1,2 km-es szakasz, amely a 13-14 kanyarokat választja el egymástól, itt nyilván DRS zóna is helyett kapott.	shanghai-international-circuit
9	2024-01-15 18:16:22.328	2024-01-15 18:16:25.561	Circuit Gilles-Villeneuve	Kanada	Montréal	4361	14	1978	63.078	Valtteri Bottas	f	Mivel a Kanadai Nagydíj évek óta állandó otthont keresett az 1960-as és 1970-es években, a Circuit Ile Notre-Dame először 1978-ban adott otthont a futamnak. Gilles Villeneuve értelemszerűen megszerezte első győzelmét a pályán, ami mostanra már az ő nevét viseli. A gyors, alacsony leszorítóerős pálya a versenyzők egyik kedvence. A pálya eléggé stop-start érzése, sok nagy féktávú sikánnal és a híres hajtűvel. A kanyarok szempontjából azonban a pálya gyors és gördülékeny, míg a legikonikusabb szakasza  közvetlenül a kör végén érkezik: a Bajnokok fala.	circuit-gilles-villeneuve
15	2024-01-15 18:45:07.58	2024-01-15 18:45:10.344	Circuit Zandvoort	Hollandia	Zandvoort	4259	14	1952	71.097	Lewis Hamilton	f	Silverstone-hoz hasonlóan, Zandvoort is először 1948-ban nyitotta meg kapuit, a háború utáni motorsport lelkesedés részeként, amely végigsöpört Európán. Eredetileg állandó pályák és közutak keverékéből állt, amelyek a Zandvoort üdülőváros homokdűnéin kígyóztak. „Igazán gyors”, „nagyon őrült”, „őrült” és „old-school” – ezeket a szavakat használta a jelenlegi F1-es pilóták, amikor arra kérték, írják le a zandvoorti pályát, amellyel sokan megküzdöttek a junior kategória napjaiban. A „hullámzó” kifejezést is hozzáadnánk ehhez a listához. A zandvoorti pálya a homokdűnéken halad keresztül, és hullámvasút-szerű érzést kelt az emberben. És bár a pályát időben korszerűsítették az F1 legutóbbi visszatéréséhez – beleértve a híres Tarzan kanyar dőlésszögének növelését 18 fokos szögre.	circuit-zandvoort
1	2024-01-15 17:32:17.129	2024-01-15 17:32:19.735	Bahrain International Circuit	Bahrein	Sakhir	5412	15	2004	91.447	Pedro de la Rosa	f	2004-ben a pilóták először sorakoztak fel a szokatlanul felhős égbolt alatt az első Bahreini Nagydíjra. Általában nagyszerű versenyzésre és megfelelő mennyiségű előzésre lehet számítani Bahreinben, miközben a pilótáknak meg kell küzdeniük a széllel, a reflektorok alatti versenyzéssel és a megfelelő beállítás megtalálásának nehézségével az edzések közötti nagy hőmérséklet-ingadozások miatt. A pálya legnagyobb kihívást jelentő pontja a szűk, lejtős, 10-es kanyar, míg a sprint a 12-es kanyarban egy másik csúcspont, amely lehetővé teszi a versenyzők számára, hogy igazán érezzék ahogy az autók életre kelnek alattuk.	bahrain-international-circuit
6	2024-01-15 18:04:25.85	2024-01-15 18:04:28.546	Miami International Autodrome	USA	Miami	5412	19	2022	89.708	Max Verstappen	f	2022 májusában debütált az F1-ben, a Miami International Autodrome egy ideiglenes pálya, de úgy lett tervezve, hogy sokáig megállja a helyét. Látványos utcai pálya. A Hard Rock Stadion központjában az 5,41 km-es hosszával 19 kanyart tartalmaz, a végsebességek pedig meghaladják a 340 km/h-t. Vannak magaslati eltérések is, a legnagyobb ilyen változás a 13-as és 16-os kanyar között található, ahol a pálya egy kijárati rámpa felett halad, és különböző felüljárók alatt, egyenetlen talajon.	miami-international-autodrome
7	2024-01-15 18:12:08.096	2024-01-15 18:12:11.219	Autodromo Enzo e Dino Ferrari	Olaszország	Imola	4909	19	1980	75.484	Lewis Hamilton	f	Imola – vagy 1988 óta ismert Autodromo Internazionale Enzo e Dino Ferrari – 1950 márciusában tették le az alapköveket. 1952 októberére készen állt a tesztelésre, míg a versenyzés 1953-ban kezdődött a pályán. Danyiil Kvyat megjegyezte, hogy „egy F1-es autó olyan kanyarokban, mint az Acque Minerali – a bejárat olyan gyors, annyira menő. Ez tényleg egy hatalmas adrenalin löket.” Az óramutató járásával ellentétes kör minden bizonnyal gyors, régimódi hangulatú, ahogy a pilóták olyan ikonikus kanyarokban versenyeznek a pályán mint a fent említett Acque Minerali és Piratella.	autodromo-enzo-e-dino-ferrari
8	2024-01-15 18:14:07.887	2024-01-15 18:14:10.317	Circuit de Monaco	Monaco	Monaco	3337	19	1950	62.909	Lewis Hamilton	t	1929-ben történt, amikor a versenyautók hangja először visszhangoztak a Hercegség utcáin, miután Antony Noghes cigarettagyártó úgy döntött, hogy versenyt szervez a Monacói Automobilklubból származó haverjaival. Hihetetlenül keskeny és szinte a legikonikusabb. Nelson Piquet emlékezetesen úgy jellemezte a Monacóban való versenyzést, mint „mintha biciklivel a nappaliban”… ami teljes mértékben leírja a pálya milyenségét. Ennek ellenére ez egy olyan kihívás, amelyet szinte minden pilóta imád, és arra kényszeríti őket, hogy próbára tegye tudásukat, és szinte kötelező nekik minden kanyart kicentizni.	circuit-de-monaco
10	2024-01-15 18:20:02.932	2024-01-15 18:20:05.751	Circuit de Barcelona-Catalunya	Spanyolország	Katalónia	4657	14	1991	76.33	Max Verstappen	f	A Circuit de Barcelona-Catalunya az 1992-es barcelonai olimpia fejlesztési programjának részeként épült. Az alapkövét 1989-ben fektették le, míg az első autóverseny az 1991-es spanyol túraautó-bajnokság egy fordulója volt. A pilóták szeretik a Circuit de Barcelona-Catalunya-t, amiatt is, hiszen rengeteg időt töltöttek rajta a téli teszteken. A pálya mixeli a magas és alacsony sebességű kanyarokat, a kihívást jelentő 3-as jobbos kanyar remek lehetőséget kínál arra, hogy a versenyzők mérlegeljék a tervezők által a szezonban épitett autó egyensúlyát.	circuit-de-barcelona-catalunya
11	2024-01-15 18:32:24.306	2024-01-15 18:32:26.756	Red Bull Ring	Ausztria	Spielberg	4318	10	1970	65.619	Carlos Sainz	f	A félelmetes, eredeti Osterreichring 1969-ben jött létre a zeltwegi repülőtéri körút helyettesítésére. A ma Red Bull Ring néven ismert pálya többé-kevésbé 1995–1996 telén jött létre, amikor Hermann Tilke elvállalta, hogy az Osterreichringet rövidebb, modernebb versenypályává alakítsa. Habár a pálya maga elég rövid, de a Red Bull Ring sok mindent belepakol egy körbe. Az első része megas végsebességet igényel, mivel az autók három egyenesen mennek át, amelyeket egy pár jobbos kanyar választ el egymástól.	red-bull-ring
12	2024-01-15 18:38:54.363	2024-01-15 18:38:56.842	Silverstone Circuit	Nagy Britannia	Silverstone	5891	18	1950	87.097	Max Verstappen	f	Silverstone volt az első Grand Prix, amely 1950. május 13-án adott otthont a Forma-1 világbajnokság első fordulójának. A régi méltán híres, Giuseppe Farina, aki abban az évben megszerezte a címet, megnyerte a versenyt Alfa Romeo 158-asával. Az évek során számos elrendezési változás ellenére, Silverstone mindig is megőrizte alapvető karakterét, mint az egyik leggyorsabb pálya az F1-es naptárban, miközben a történelmi kanyarok, mint a Maggotts, Becketts és Abbey jelentik a legnagyobb kihívásokat a versenyzők számára.	silverstone-circuit
13	2024-01-15 18:40:24.68	2024-01-15 18:40:26.799	Hungaroring	Magyarország	Mogyoród	4381	14	1986	76.627	Lewis Hamilton	f	A Hungaroringen 1985-ben kezdődtek a munkálatok, a pálya pedig alig kilenc hónappal később volt versenykész. A magyar kormány eredetileg a régi budapesti Népligeti parki pálya újjáélesztését fontolgatta annak érdekében, hogy a Forma-1-et itthon rendezzék meg. A Hungaroringen az egyenesek hiánya miatt, gyakran egy gokartpályához hasonlítják – és igaz, a hasonlóság elképesztő. A több kanyarkombinációnak köszönhetően a csapatok a monacói szintű leszorítóerőt választják, és több hangsúlyt fektetnek az autó karosszéria beállítására, hogy maximalizálják a leszorítóerőt, a lőerő pedig jóval kevesebb szerepet kap.	hungaroring
14	2024-01-15 18:41:52.737	2024-01-15 18:41:55.317	Circuit de Spa-Francorchamps	Belgium	Spa-Franchochamps	7004	19	1950	106.286	Valtteri Bottas	f	Miután 1924-ben nemcsak egy bajnoki nagydíjnak adott otthont, Belgium ikonikus pályája egyike volt annak a hétnek, amelyek 1950-ben részesei voltak a Forma-1 első bajnokságának. Ezt a futamot a legendás Juan Manuel Fangio nyerte, aki egy Alfa Romeót vezetett abban a szezonban, ezt a versenyt pedig egy első és második helyezettel zárták csapattársával, Nino Farinával. Spa a Forma-1-es pilóták egyik legkedveltebb pályája, ahol a hosszú egyenesek és a kihívást jelentő gyors kanyarok keveréke lehetővé teszi számukra, hogy a képességeik szerint, határokig feszegessék az autóikat. A pálya mérete és a belga időjárás jellege miatt előfordul, hogy a pálya egyik részén már esik az eső, a másikon pedig száraz, ami azt jelenti, hogy a tapadás egyik kanyarról a másikra jelentősen megváltozhat.	circuit-de-spa-francorchamps
16	2024-01-15 18:46:45.197	2024-01-15 18:46:47.988	Autodromo Nazionale Monza	Olaszország	Monza	5793	11	1950	81.046	Rubens Barrichello	f	Az 1922-ben mindössze 110 nap alatt felépült Autodromo Nazionale Monza volt a világ harmadik, kifejezetten erre a célra épített versenypályája, az Egyesült Királyságban található Brooklands és az amerikai Indianapolis után. A két pályához hasonlóan az eredeti pálya döbbenetes kanyarokat tartalmazott, valamint a ma is használatos „outfield” szakasz nagy részét. a helyiek „La Pista Magica”-nak hívják. Az autók a kör 80%-ában padlógázzal mennek, és a pálya 1,1 km-es rajt/cél egyenesében elérik a maximumot. Innen zúgnak be a történelmi parkrészbe, ahol a nagy féktávú szűk sikánok jó hőmérsékletet adnak a fékeknek.	autodromo-nazionale-monza
19	2024-01-15 18:59:02.738	2024-04-09 13:22:16.597789	Circuit of The Americas	USA	Ausztin	5513	20	2012	96.169	Charles Leclerc	f	A Hermann Tilke által a HKS amerikai építészeti céggel együttműködésben tervezett Circuit of The Americas némileg nehézkes kezdetet élt át, az építkezés több kudarcot is szenvedett. Érdemes volt azonban várni, amikor 2012. október 21-én az 1978-as F1-es bajnok, Mario Andretti megnyitotta a pályát. A 3-as kanyartól a 6-ig nem sokban tér el a Silverstone-i nagy sebességű Maggotts/Becketts vagy a suzukai S-kanyaroktól, míg a 12-15. kanyar Hockenheim stadionrészét utánozza. Eközben az emelkedő egy széles, beláthatatlan 1-es kanyarba torkollik.	circuit-of-the-americas
17	2024-01-15 18:54:54.354	2024-01-15 18:54:57.34	Baku City Circuit	Azerbajdzsán	Baku	6003	20	2016	103.009	Charles Leclerc	t	Az első bakui Grand Prix-t 2016-ban rendezték meg, Európa Nagydíjként. Ezt követte 2017-ben az első Azerbajdzsáni Nagydíj, amely a szezon egyik legnagyobb felfordulásának volt tanúja, Daniel Ricciardo győzelmével. Széles és nyitott a pálya. A Baku partvonala mentén húzódó hosszú egyenes sok lehetőséget ad az előzésre, és mivel 3 autó egymás mellett haladva tud bemenni az 1-es kanyarba, az események gyakran inkább IndyCarnak tűnnek, mint F1-nek. Innen azonban a pálya a város keskeny, kanyargós Icheri Sheher óvárosába kanyarog, drámai módon elhaladva Baku középkori városfalai mellett. Monacóhoz hasonlóan a legkisebb hibákat is gyorsan és szigorúan megbüntetik, míg az összeállítás alapján a csapatok kénytelenek választani a kanyaros részek leszorítóereje és az egyenesben a kisebb ellenállás között.	baku-city-circuit
18	2024-01-15 18:56:12.105	2024-01-15 18:56:14.195	Marina Bay Street Circuit	Szingapúr	Szingapúr	4940	19	2008	95.867	Lewis Hamilton	t	2008-ban Szingapúr abban a megtiszteltetésben részesült, hogy a Forma-1 történetének első éjszakai futamának adhatott otthont. A Nagydíj – a szezon 15. fordulója – óriási sikert aratott a csapatok és a versenyzők körében, míg a Renault-nál versenyző Fernando Alonso győzelmet aratott abban az évben. A Marina Bay Circuit az egyik legmegterhelőbb a versenynaptárban, hepehupás utcafelülete párás körülményekkel párosulva igazán meg tudja nehezíteni mind a versenyzők, mind a csapatok dolgát. Még egy 2023-as elrendezési változtatás után is, amely 23-ról 19-re csökkentette a kanyarok számát, a gyorskörökön is sokat dolgoznak a kormányon – a fizikai megterhelés miatt akár 3 kg-ot is elveszítenek testsúlyukból a versenyzők a versenytáv során.	marina-bay-street-circuit
20	2024-01-15 19:02:25.795	2024-01-15 19:02:27.859	Autódromo Hermanos Rodríguez	Mexikó	Mexikó város	4304	17	1963	77.774	Valtteri Bottas	t	A Forma-1-es autók 1962-ben érkeztek egy nem bajnoki versenyre, majd a következő évben visszatértek egy megfelelő, jóhiszemű Nagydíjra. Az 1963-as futamot Jim Clark nyerte, míg a következő néhány évben a mexikói fiesta hangulat azt jelentette, hogy a Forma-1 hagyományos szezonzárójává vált. Mexikót 2015-ben üdvözölték az F1-es naptárban. Az Autodromo Hermanos Rodriguez több mint 2 km-es tengerszint feletti magasságban található, így a 4,3 km-es kör lélegzetelállító élmény. A pálya továbbra is nagyrészt az eredeti, 1959-es pálya körvonalait követi, a fő különbség az, hogy a látványos – és látványosan ijesztő – Peralta-sarkot most kettéválasztották, a pálya ehelyett a régi Foro Sol baseballstadionon kanyarodik át.	autodromo-hermanos-rodriguez
21	2024-01-15 19:03:52.563	2024-01-15 19:03:55.88	Autódromo José Carlos Pace	Brazília	São Paulo	4309	15	1973	70.54	Valtteri Bottas	f	Az Autodromo Jose Carlos Pace – de inkább Interlagos néven emlegetett – építési munkálatai egészen 1938-ban kezdődtek. A pályatervezők három másik pályáról merítettek ihletet: Brooklands (Egyesült Királyság), Roosevelt Raceway az USA-ban és Montlhery-ben Franciaországban. Mint sok második világháború előtti pálya, Interlagos is dőlt kanyarokkal rendelkezik, ahol a pilóták egyfajta fél oválison kezdik a kört – valójában 1957 és a pálya 1990-es Forma-1-es naptárba való visszatérése között Interlagost óriás ovális pályaként lehetett körbe autózni. A Senna S-en való átkelés után a 4-es kanyarig a pilóták egy kígyózó mezőn belüli szakaszon mennek keresztül, néhány kihívást jelentő dőlésszög-módosítással, majd visszakanyarodnak a dombra, és áthaladnak a szintén dőlt utolsó kanyaron.	autodromo-jose-carlos-pace
23	2024-01-15 19:07:23.838	2024-01-15 19:07:26.056	Lusail International Circuit	Katar	Lusail	5419	16	2021	84.319	Max Verstappen	f	2021 volt az első alkalom, hogy Katar adott otthont az FIA Forma-1-es világbajnokságának – az ország további 10 éves szerződést írt alá a sportág 2023-tól való megrendezésére. Az elsősorban a motorversenyzést szem előtt tartva tervezett 5,4 kilométeres Lusail International Circuit egy gyors és gördülékeny pálya, ahol a közepes és nagy sebességű kanyarok dominálnak. A pálya teljes hosszának több mint egy kilométerét a fő egyenes teszi ki, amely rengeteg előzési lehetőséget biztosít az 1-es kanyarban.	lusail-international-circuit
24	2024-01-15 19:09:01.298	2024-01-15 19:09:03.367	Yas Marina Circuit	Abu-Dzabi	Yas sziget	5281	16	2009	86.103	Max Verstappen	f	2006-ban bejelentették, hogy az Abu-Dzabitól keletre található Yas-szigetet új turisztikai célponttá fejlesztik, és a tervek nagy része egy 5,5 km-es versenypálya köré összpontosultak. Az munkagépek 2007 májusában gurultak be a Yas Marina Circuit pályára, a projekt 2009 októberére fejeződött be. A Hermann Tilke által tervezett pályát az 5-ös és 6-os kanyar közötti 1,2 km-es egyenes uralja – amelyet lassú kanyarokkal kereteznek, kiváló lehetőséget adva ezzel az előzéshez. További érdekességek közé tartozik a trükkös menet a 10-es és a 11-es kanyarból a 12-esbe, ami arra kényszeríti a vezetőket, hogy teljes erővel fékezzenek, miközben még oldalsó terhelés is bőven van az autón.	yas-marina-circuit
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, jti, admin, username, keresztnev, vezeteknev, fav_team, fav_driver, banned) FROM stdin;
7	bazsyhun@gmail.com	$2a$12$ACut3fv1jtlbqT7gjjlix.Yk56DGT9JCSekO6ceGvejwNrtDg5M4G	\N	\N	\N	bbcd1cba-bf1d-436d-b704-b53342522b07	f	\N	Pop	Simon	van-amersfoort-racing-f3	\N	f
2	admin@admin.com	$2a$12$jzl4Ozr9sbSpes8DAxgA/eBmjsNbqF1F3xSK.ADCOKu75af5IfJjC	\N	\N	\N	8d88e4e0-8ff7-4c0e-a5bf-1daa9cff8e17	t	bogressuti4	Balázs	Kis	Oracle Red Bull Racing	max-verstappen	f
3	bazsyhun1@gmail.com	$2a$12$n2vhik9cm5k7SaROcM1h2.0L7/tfvI2JH5k7jTrjwOze/Bb11I/Ry	\N	\N	\N	07dba453-2d4f-40d8-87a9-b2e8e0909851	f	bogressuti1	Péter	Bodnár	Oracle Red Bull Racing	Carlos Sainz Jr.	t
6	helloszia@gmail.com	$2a$12$qv7f.1Cw/sYA7VdvEBkhb.wMRcj2FHkdbMlwn8.o7xiTfjSaLLPya	\N	\N	\N	319045aa-ccdb-430b-92ad-c883edd64652	t	helloszia	Kis	Balázs	Oracle Red Bull Racing	Carlos Sainz Jr.	t
5	kugi@kugi.kugi	$2a$12$a2MKCicoZHLMkfwDmfw84.Mee3kaykOvmiso9KFlQCXAEdFTiqjRC	\N	\N	\N	0aadc05c-2a62-41c6-8763-d8f2eb391403	f	bogressuti2	Pop	Simon	Oracle Red Bull Racing	Carlos Sainz Jr.	t
8	max@verstappen.com	$2a$12$lN/q2mrUO3tifHisXkRBZONwpom1n/a3paFyF1Y8iGH0S7aV8TmT2	\N	\N	\N	9d7aa907-3ada-4259-b5f1-da67abe29b41	f	maxxxv	Maxxxxx	Verstappen	mp-motorsport-f3	kush-maini	f
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 384, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 384, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: calendar_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calendar_events_id_seq', 2, true);


--
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_id_seq', 3, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 15, true);


--
-- Name: devise_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devise_api_tokens_id_seq', 25, true);


--
-- Name: drivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drivers_id_seq', 295, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 550, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_id_seq', 34, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, true);


--
-- Name: series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.series_id_seq', 12, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 66, true);


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracks_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: calendar_events calendar_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events
    ADD CONSTRAINT calendar_events_pkey PRIMARY KEY (id);


--
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: devise_api_tokens devise_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devise_api_tokens
    ADD CONSTRAINT devise_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_devise_api_tokens_on_access_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_devise_api_tokens_on_access_token ON public.devise_api_tokens USING btree (access_token);


--
-- Name: index_devise_api_tokens_on_previous_refresh_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_devise_api_tokens_on_previous_refresh_token ON public.devise_api_tokens USING btree (previous_refresh_token);


--
-- Name: index_devise_api_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_devise_api_tokens_on_refresh_token ON public.devise_api_tokens USING btree (refresh_token);


--
-- Name: index_devise_api_tokens_on_resource_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_devise_api_tokens_on_resource_owner ON public.devise_api_tokens USING btree (resource_owner_type, resource_owner_id);


--
-- Name: index_likes_on_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_likes_on_post_id ON public.likes USING btree (post_id);


--
-- Name: index_likes_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_likes_on_user_id ON public.likes USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_jti; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_jti ON public.users USING btree (jti);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: likes fk_rails_a04bfa7e81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_rails_a04bfa7e81 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: likes fk_rails_d07653f350; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_rails_d07653f350 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

