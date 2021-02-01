--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

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
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO vorob;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO vorob;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO vorob;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO vorob;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO vorob;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO vorob;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    city character varying,
    street character varying,
    "houseNumber" integer,
    addressable_type character varying,
    addressable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO vorob;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO vorob;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vorob;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    name character varying,
    comment character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    commentable_type character varying,
    commentable_id integer,
    user_id integer
);


ALTER TABLE public.comments OWNER TO vorob;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO vorob;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    avatar character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint,
    address_id bigint
);


ALTER TABLE public.companies OWNER TO vorob;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO vorob;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    name character varying,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    user_id bigint NOT NULL,
    service_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO vorob;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO vorob;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    resource_type character varying,
    resource_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO vorob;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO vorob;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vorob;

--
-- Name: services; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    avatar character varying,
    company_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    time_limit_id bigint,
    user_id bigint
);


ALTER TABLE public.services OWNER TO vorob;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO vorob;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: time_limits; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.time_limits (
    id bigint NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    user_id bigint NOT NULL,
    length integer,
    service_id integer
);


ALTER TABLE public.time_limits OWNER TO vorob;

--
-- Name: time_limits_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.time_limits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_limits_id_seq OWNER TO vorob;

--
-- Name: time_limits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.time_limits_id_seq OWNED BY public.time_limits.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    provider character varying,
    surname character varying,
    name character varying,
    uid character varying,
    avatar character varying,
    language character varying,
    reminder_time integer,
    "interval" character varying
);


ALTER TABLE public.users OWNER TO vorob;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vorob
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vorob;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vorob
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: vorob
--

CREATE TABLE public.users_roles (
    user_id bigint,
    role_id bigint
);


ALTER TABLE public.users_roles OWNER TO vorob;

--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: time_limits id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.time_limits ALTER COLUMN id SET DEFAULT nextval('public.time_limits_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
2	avatar	User	3	2	2021-01-22 14:42:19.559255
3	avatar	User	2	3	2021-01-22 15:00:43.679147
4	avatar	User	1	4	2021-01-22 15:15:33.561537
7	avatar	Service	1	7	2021-01-22 17:11:01.435702
8	avatar	Service	6	8	2021-01-25 08:44:39.674224
9	avatar	Service	3	9	2021-01-25 09:14:50.442713
10	avatar	Service	11	10	2021-01-25 16:10:08.618392
12	avatar	Service	4	12	2021-01-27 09:49:12.009324
13	avatar	User	36	13	2021-01-30 21:42:29.734794
14	avatar	Company	53	14	2021-01-30 22:03:34.320568
15	avatar	Company	60	15	2021-01-31 13:08:09.315294
16	avatar	Company	61	16	2021-01-31 13:34:50.563379
17	avatar	User	37	17	2021-01-31 15:02:05.731155
18	avatar	Company	62	18	2021-01-31 16:24:11.731053
19	avatar	Service	31	19	2021-01-31 16:24:29.378113
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
2	cgmkdbah1dxjhg2n8x2ogwdul6ub	B8P7cKavYvs.jpg	image/jpeg	{"identified":true,"width":2048,"height":1365,"analyzed":true}	350205	mje3r0nsyue1Z9FY/Dc+kQ==	2021-01-22 14:42:19.556922
3	5vqp9bb6fa0ux9dag9aia42tir7x	B8P7cKavYvs.jpg	image/jpeg	{"identified":true,"width":2048,"height":1365,"analyzed":true}	350205	mje3r0nsyue1Z9FY/Dc+kQ==	2021-01-22 15:00:43.674984
4	iuwsgsrhbhhfwveu3ya32qa0ufjt	1516429936_1.jpg	image/jpeg	{"identified":true,"width":512,"height":512,"analyzed":true}	18657	o23CHKpHrKSPlb0m2QBcvQ==	2021-01-22 15:15:33.556667
6	1ox305ebs6zs6rohhzx9c0v8v0uj	1516429936_1.jpg	image/jpeg	{"identified":true,"width":512,"height":512,"analyzed":true}	18657	o23CHKpHrKSPlb0m2QBcvQ==	2021-01-22 17:08:55.287614
7	svfwfb67l34jl8pjykz7jy2mdmen	download.jpeg	image/jpeg	{"identified":true,"width":275,"height":183,"analyzed":true}	8890	aFKkpPJg6r7tvH5i2xuuiw==	2021-01-22 17:11:01.433489
8	tyany87itcdc6ixxj9mntpyrkrph	Screenshot from 2020-09-07 23-18-12.png	image/png	{"identified":true,"width":1920,"height":1080,"analyzed":true}	364070	jBA/00VMM6KiExmBJjL4yA==	2021-01-25 08:44:39.659855
9	es3gi9hf9hfkhk74eaw1l27o7rz0	Screenshot from 2020-09-07 23-18-07.png	image/png	{"identified":true,"width":1920,"height":1080,"analyzed":true}	365395	v1qOg+zIoMYvd7Khb7CCkw==	2021-01-25 09:14:50.440477
10	smwogyb6vrirb250js3rkbqxyiuv	Screenshot from 2020-09-08 21-36-17.png	image/png	{"identified":true}	227470	FRZaKmm2mMj1FXusfb0bVw==	2021-01-25 16:10:08.604081
11	p38kah6wolv4o8v6qfaujs5qzykq	Screenshot from 2020-09-07 23-17-53.png	image/png	{"identified":true}	510656	F6ggF0cq54+LQqACw6zP9g==	2021-01-27 09:49:06.919073
12	z295fwo0mr6d4hl9e3fsbwd3b6vk	Screenshot from 2020-09-07 23-17-53.png	image/png	{"identified":true}	510656	F6ggF0cq54+LQqACw6zP9g==	2021-01-27 09:49:12.007503
13	vwaw63mj328dvz1vpz0amfw2uw4v	B8P7cKavYvs.jpg	image/jpeg	{"identified":true}	350205	mje3r0nsyue1Z9FY/Dc+kQ==	2021-01-30 21:42:29.720112
14	jhxc9s50b1bmpjsz4gqh03yihbdq	Screenshot from 2020-09-07 23-17-53.png	image/png	{"identified":true}	510656	F6ggF0cq54+LQqACw6zP9g==	2021-01-30 22:03:34.317214
15	e2nz4g17om1br8pewdbzjoz61yi2	download.jpeg	image/jpeg	{"identified":true}	8890	aFKkpPJg6r7tvH5i2xuuiw==	2021-01-31 13:08:09.304344
16	khya8b2qksq4jkitv0c710p2xu2q	B8P7cKavYvs.jpg	image/jpeg	{"identified":true}	350205	mje3r0nsyue1Z9FY/Dc+kQ==	2021-01-31 13:34:50.561463
17	f8otq0oygx5mx285j95nrc9vtr90	B8P7cKavYvs.jpg	image/jpeg	{"identified":true}	350205	mje3r0nsyue1Z9FY/Dc+kQ==	2021-01-31 15:02:05.728624
18	ugmobxr9m1n6739dnwp3xw94i2xe	download.jpeg	image/jpeg	{"identified":true}	8890	aFKkpPJg6r7tvH5i2xuuiw==	2021-01-31 16:24:11.728429
19	2bjsf383bm22emwywn40z23sjhd6	download.jpeg	image/jpeg	{"identified":true}	8890	aFKkpPJg6r7tvH5i2xuuiw==	2021-01-31 16:24:29.375206
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.addresses (id, city, street, "houseNumber", addressable_type, addressable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-01-22 14:32:06.235098	2021-01-22 14:32:06.235098
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.comments (id, name, comment, created_at, updated_at, commentable_type, commentable_id, user_id) FROM stdin;
35	\N	ddd	2021-01-27 09:46:16.524134	2021-01-27 09:46:16.524134	Service	4	1
36	\N	d	2021-01-27 09:46:50.900559	2021-01-27 09:46:50.900559	Service	4	1
37	\N	d	2021-01-27 09:47:18.927826	2021-01-27 09:47:18.927826	Service	4	1
38	\N	s	2021-01-27 09:47:22.784404	2021-01-27 09:47:22.784404	Service	4	1
39	\N	ddd	2021-01-27 09:48:59.4151	2021-01-27 09:48:59.4151	Service	4	1
40	\N	ws	2021-01-30 20:37:24.630193	2021-01-30 20:37:24.630193	Service	1	2
41	\N	ws	2021-01-30 20:37:33.98146	2021-01-30 20:37:33.98146	Service	1	2
42	\N	ws	2021-01-30 20:37:38.687662	2021-01-30 20:37:38.687662	Service	1	2
43	\N	we	2021-01-30 20:46:50.602529	2021-01-30 20:46:50.602529	Company	3	2
44	\N	ws	2021-01-30 21:39:12.055894	2021-01-30 21:39:12.055894	Company	3	1
45	\N	qweasd	2021-01-30 22:03:39.357452	2021-01-30 22:03:39.357452	Company	53	36
46	\N	ddd	2021-01-31 13:34:53.468638	2021-01-31 13:34:53.468638	Company	61	1
47	\N	qwe	2021-01-31 15:10:42.687594	2021-01-31 15:10:42.687594	Company	9	37
48	\N	s	2021-01-31 16:20:49.764369	2021-01-31 16:20:49.764369	Company	4	39
49	\N	wewe	2021-01-31 17:02:40.274354	2021-01-31 17:02:40.274354	Company	63	1
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.companies (id, name, description, avatar, created_at, updated_at, user_id, address_id) FROM stdin;
1	2English	Creamy mascarpone cheese and custard layered between espresso and rum soaked house-made ladyfingers, topped with Valrhona cocoa powder.	\N	2021-01-22 14:32:22.9877	2021-01-22 14:32:22.9877	\N	\N
2	ItechArt	28-day aged 300g USDA Certified Prime Ribeye, rosemary-thyme garlic butter, with choice of two sides.	\N	2021-01-22 14:32:22.997522	2021-01-22 14:32:22.997522	\N	\N
3	Diploms	We offer you course works and diploms on good price and the best quantity	\N	2021-01-22 14:32:23.00615	2021-01-22 14:32:23.00615	\N	\N
5	Itransition	qweasd	\N	2021-01-22 17:14:03.873187	2021-01-22 17:14:03.873187	\N	\N
6	Company	We make soft	\N	2021-01-25 07:41:34.197669	2021-01-25 07:41:34.197669	\N	\N
7	My Company	bla bla bla 	\N	2021-01-25 07:43:14.918706	2021-01-25 07:43:14.918706	2	\N
4	School	frefewfiwenfwe	\N	2021-01-22 15:20:46.610172	2021-01-25 07:51:27.827228	2	\N
8	Itransition	we sell soft	\N	2021-01-25 07:53:09.645585	2021-01-25 07:53:09.645585	2	\N
9	dedede	qweasd	\N	2021-01-25 16:09:26.746974	2021-01-25 16:09:26.746974	1	\N
10	Company	bla bla bla 	\N	2021-01-25 16:09:56.460084	2021-01-25 16:09:56.460084	1	\N
11	My Company	We make soft	\N	2021-01-26 10:55:17.06931	2021-01-26 10:55:17.06931	1	\N
12	Compannnny	asdnke	\N	2021-01-26 11:17:54.399245	2021-01-26 11:17:54.399245	2	\N
13	Itechart	qweasd	\N	2021-01-26 14:06:15.241336	2021-01-26 14:06:15.241336	2	\N
14	Itransition	We make soft	\N	2021-01-26 15:34:16.160985	2021-01-26 15:34:16.160985	22	\N
15	Itechart	qweasd	\N	2021-01-26 16:13:30.953075	2021-01-26 16:13:30.953075	1	\N
16	Companyq222	w2	\N	2021-01-27 09:06:22.923295	2021-01-27 09:06:22.923295	\N	\N
17	Itechart	bla bla bla 	\N	2021-01-27 09:46:09.643857	2021-01-27 09:46:09.643857	\N	\N
18	My Company	bla bla bla 	\N	2021-01-27 13:50:32.314978	2021-01-27 13:50:32.314978	\N	\N
19	Itechart	We make soft	\N	2021-01-27 15:06:41.745214	2021-01-27 15:06:41.745214	\N	\N
20	Company	We make soft	\N	2021-01-27 16:59:56.746152	2021-01-27 16:59:56.746152	\N	\N
21	Itechart	bla bla bla 	\N	2021-01-27 17:00:16.010264	2021-01-27 17:00:16.010264	\N	\N
22	Itechart	bla bla bla 	\N	2021-01-27 17:00:47.607197	2021-01-27 17:00:47.607197	\N	\N
23	Itechart	bla bla bla 	\N	2021-01-27 17:00:50.562428	2021-01-27 17:00:50.562428	\N	\N
24	Itechart	bla bla bla 	\N	2021-01-27 17:00:53.917414	2021-01-27 17:00:53.917414	\N	\N
25	Itechart	bla bla bla 	\N	2021-01-27 17:01:01.399002	2021-01-27 17:01:01.399002	\N	\N
26	Itechart	bla bla bla 	\N	2021-01-27 17:01:21.032229	2021-01-27 17:01:21.032229	\N	\N
27	Itechart	bla bla bla 	\N	2021-01-27 17:01:36.097499	2021-01-27 17:01:36.097499	\N	\N
28	Itechart	bla bla bla 	\N	2021-01-27 17:01:44.361962	2021-01-27 17:01:44.361962	\N	\N
29	Itechart	bla bla bla 	\N	2021-01-27 17:02:12.025505	2021-01-27 17:02:12.025505	\N	\N
30	Itechart	bla bla bla 	\N	2021-01-27 17:02:20.239631	2021-01-27 17:02:20.239631	\N	\N
31	Company		\N	2021-01-27 17:02:24.790776	2021-01-27 17:02:24.790776	\N	\N
32	Company	bla bla bla 	\N	2021-01-27 17:02:27.376674	2021-01-27 17:02:27.376674	\N	\N
33	My Company	We make soft	\N	2021-01-27 17:02:46.750023	2021-01-27 17:02:46.750023	\N	\N
34	Itechart	We make soft	\N	2021-01-27 17:02:59.682226	2021-01-27 17:02:59.682226	\N	\N
35	Company	bla bla bla 	\N	2021-01-27 17:05:34.586941	2021-01-27 17:05:34.586941	\N	\N
36	Itechart	bla bla bla 	\N	2021-01-27 17:06:30.696429	2021-01-27 17:06:30.696429	\N	\N
37	My Company	bla bla bla 	\N	2021-01-27 17:06:45.561386	2021-01-27 17:06:45.561386	\N	\N
38	Company	la la la	\N	2021-01-27 17:06:57.099521	2021-01-27 17:06:57.099521	\N	\N
39	Company	qweasd	\N	2021-01-27 17:07:09.24237	2021-01-27 17:07:09.24237	\N	\N
40	My Company	We make soft	\N	2021-01-27 19:50:53.79799	2021-01-27 19:50:53.79799	\N	\N
41	Itransition	We make soft	\N	2021-01-27 19:51:28.816269	2021-01-27 19:51:28.816269	1	\N
42	Itransition	We make soft	\N	2021-01-27 19:51:57.74623	2021-01-27 19:51:57.74623	\N	\N
43	Itransition	We make soft	\N	2021-01-27 19:52:05.708792	2021-01-27 19:52:05.708792	\N	\N
44	Itransition	We make soft	\N	2021-01-27 19:52:16.958167	2021-01-27 19:52:16.958167	\N	\N
45	Itransition	We make soft	\N	2021-01-30 21:12:10.56802	2021-01-30 21:12:10.56802	\N	\N
46	My Company	bla bla bla 	\N	2021-01-30 21:27:47.145922	2021-01-30 21:27:47.145922	1	\N
47	Itechart	bla bla bla 	\N	2021-01-30 21:27:58.712746	2021-01-30 21:27:58.712746	1	\N
48	My Company	bla bla bla 	\N	2021-01-30 21:28:19.413726	2021-01-30 21:28:19.413726	1	\N
49	dedede	bla bla bla 	\N	2021-01-30 21:28:30.952162	2021-01-30 21:28:30.952162	1	\N
50	My Company	bla bla bla 	\N	2021-01-30 21:31:41.261849	2021-01-30 21:31:41.261849	1	\N
51	My Company	bla bla bla 	\N	2021-01-30 21:33:09.763589	2021-01-30 21:33:09.763589	1	\N
52	Itechart	We make soft	\N	2021-01-30 22:02:09.315509	2021-01-30 22:02:09.315509	36	\N
53	Company	We make soft	\N	2021-01-30 22:03:34.279601	2021-01-30 22:03:34.323627	36	\N
55	Itechart	We make soft	\N	2021-01-30 22:12:01.659046	2021-01-30 22:12:01.659046	1	\N
58	Itechart	we sell soft	\N	2021-01-30 22:13:14.622985	2021-01-30 22:13:14.622985	1	\N
60	Company	We make soft	\N	2021-01-31 13:08:09.168646	2021-01-31 13:08:09.326433	1	\N
61	Itechart	qweasd	\N	2021-01-31 13:34:50.548013	2021-01-31 13:34:50.56511	1	\N
62	Diploms	bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla 	\N	2021-01-31 16:24:11.711196	2021-01-31 16:24:11.733612	1	\N
63	Company	bla bla bla 	\N	2021-01-31 17:01:30.879711	2021-01-31 17:01:30.879711	1	\N
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.orders (id, name, start_time, end_time, user_id, service_id, created_at, updated_at) FROM stdin;
3	qwdwe	2021-01-22 10:30:00	\N	2	1	2021-01-22 15:06:30.275376	2021-01-22 15:06:30.275376
5	qqqqqqqqq	2021-01-22 11:00:00	\N	2	3	2021-01-25 08:26:15.496594	2021-01-25 08:26:15.496594
9	123	2021-01-26 14:52:00	\N	2	4	2021-01-26 12:06:07.217128	2021-01-26 12:06:07.217128
10		\N	\N	2	4	2021-01-26 12:19:35.955707	2021-01-26 12:19:35.955707
15	qwe	2021-01-22 15:00:00	\N	2	1	2021-01-26 12:23:41.889791	2021-01-26 12:23:41.889791
16	qwe	2021-01-22 15:15:00	\N	2	1	2021-01-26 12:24:59.085288	2021-01-26 12:24:59.085288
18	\N	\N	\N	2	1	2021-01-26 12:39:10.995644	2021-01-26 12:39:10.995644
19	wsvvvvvvvvvv	2021-01-10 10:30:00	\N	2	4	2021-01-26 13:44:11.558089	2021-01-26 13:44:11.558089
20	wsvvvvvvvvvv	2021-01-22 19:15:00	\N	2	1	2021-01-26 13:44:26.027041	2021-01-26 13:44:26.027041
25	wsvvvvvvvvvv	2021-01-22 10:15:00	\N	1	1	2021-01-27 09:50:49.776986	2021-01-27 09:50:49.776986
28	qqqqqqqqq	2021-01-27 19:59:00	\N	1	1	2021-01-27 20:09:22.623333	2021-01-27 20:09:22.623333
29	dddddddd	2021-01-27 20:59:00	\N	1	1	2021-01-27 20:10:04.031822	2021-01-27 20:10:04.031822
30	qqqqqqqqq	2021-01-27 21:59:00	\N	1	1	2021-01-27 20:12:33.375698	2021-01-27 20:12:33.375698
31		2021-01-27 22:59:00	\N	1	1	2021-01-27 20:19:29.79987	2021-01-27 20:19:29.79987
32	123	\N	\N	1	1	2021-01-27 20:33:14.664864	2021-01-27 20:33:14.664864
33	qqqqqqqqq	2021-01-27 23:59:00	\N	1	1	2021-01-27 20:33:21.599273	2021-01-27 20:33:21.599273
34	qwe	2021-01-28 00:59:00	\N	1	1	2021-01-27 20:34:27.693033	2021-01-27 20:34:27.693033
35	wsvvvvvvvvvv	2021-01-28 18:59:00	\N	1	1	2021-01-27 20:35:34.68155	2021-01-27 20:35:34.68155
36	wsvvvvvvvvvv	\N	\N	1	1	2021-01-27 20:37:11.034265	2021-01-27 20:37:11.034265
37	123	2021-01-28 01:59:00	\N	1	1	2021-01-27 20:37:25.462423	2021-01-27 20:37:25.462423
38	123	2021-01-28 02:59:00	\N	1	1	2021-01-27 20:37:46.613335	2021-01-27 20:37:46.613335
39	wsvvvvvvvvvv	2021-01-28 03:59:00	\N	1	1	2021-01-27 20:38:04.117411	2021-01-27 20:38:04.117411
40	wsvvvvvvvvvv	2021-01-28 04:59:00	\N	1	1	2021-01-27 20:40:48.210229	2021-01-27 20:40:48.210229
41	123	2021-01-28 05:59:00	\N	1	1	2021-01-27 20:57:41.610182	2021-01-27 20:57:41.610182
42	wsvvvvvvvvvv	2021-01-28 06:59:00	\N	1	1	2021-01-27 21:07:56.57924	2021-01-27 21:07:56.57924
43	dddddddd	2021-01-28 07:59:00	\N	1	1	2021-01-28 10:54:11.048568	2021-01-28 10:54:11.048568
44	dddddddd	\N	\N	1	1	2021-01-28 10:54:15.876455	2021-01-28 10:54:15.876455
45	wsvvvvvvvvvv	2021-01-28 08:59:00	\N	1	1	2021-01-28 10:55:02.881496	2021-01-28 10:55:02.881496
46	wsvvvvvvvvvv	\N	\N	1	1	2021-01-28 10:55:30.365109	2021-01-28 10:55:30.365109
47	wsvvvvvvvvvv	\N	\N	1	1	2021-01-28 10:55:33.276166	2021-01-28 10:55:33.276166
48	wsvvvvvvvvvv	2021-01-28 09:59:00	\N	1	1	2021-01-28 10:55:36.455953	2021-01-28 10:55:36.455953
49	wsvvvvvvvvvv	\N	\N	1	1	2021-01-28 10:56:48.999469	2021-01-28 10:56:48.999469
50	qqqqqqqqq	2021-01-28 10:59:00	\N	1	1	2021-01-28 10:56:52.330872	2021-01-28 10:56:52.330872
51	qqqqqqqqq	2021-01-28 11:59:00	\N	1	1	2021-01-28 11:01:10.061315	2021-01-28 11:01:10.061315
52	qqqqqqqqq	\N	\N	1	1	2021-01-28 11:01:32.102118	2021-01-28 11:01:32.102118
53	qqqqqqqqq	2021-01-28 12:59:00	\N	1	1	2021-01-28 11:01:35.98486	2021-01-28 11:01:35.98486
54	dddddddd	2021-01-28 13:59:00	\N	1	1	2021-01-28 11:02:15.481584	2021-01-28 11:02:15.481584
55	dddddddd	\N	\N	1	1	2021-01-28 11:02:23.948078	2021-01-28 11:02:23.948078
56	dddddddd	2021-01-28 14:59:00	\N	1	1	2021-01-28 11:02:27.814128	2021-01-28 11:02:27.814128
57	dddddddd	\N	\N	1	1	2021-01-28 11:24:08.782506	2021-01-28 11:24:08.782506
58	qqqqqqqqq	2021-01-28 15:59:00	\N	1	1	2021-01-28 11:24:16.209462	2021-01-28 11:24:16.209462
60	wsvvvvvvvvvv	2021-01-28 16:59:00	\N	2	1	2021-01-28 14:12:14.633887	2021-01-28 14:12:14.633887
61	qqqqqqqqq	2021-01-29 13:59:00	\N	2	1	2021-01-28 14:31:51.549584	2021-01-28 14:31:51.549584
62	qqqqqqqqq	2021-01-28 17:59:00	\N	2	1	2021-01-28 14:35:23.007256	2021-01-28 14:35:23.007256
63	dddddddd	2021-01-28 19:59:00	\N	2	1	2021-01-28 14:35:43.281962	2021-01-28 14:35:43.281962
64	Order order	2021-01-28 14:39:00	\N	2	6	2021-01-28 14:39:23.247153	2021-01-28 14:39:23.247153
65	qweasdOrder order	\N	\N	2	6	2021-01-28 14:45:30.295287	2021-01-28 14:45:30.295287
66	qweweq	2021-01-28 15:09:00	\N	2	6	2021-01-28 14:45:34.612693	2021-01-28 14:45:34.612693
67	qqqqqqqqq	2021-01-28 15:39:00	\N	2	6	2021-01-28 14:49:21.838735	2021-01-28 14:49:21.838735
68	qqqqqqqqq	\N	\N	2	6	2021-01-28 14:50:31.360835	2021-01-28 14:50:31.360835
69	qqqqqqqqq	\N	\N	2	6	2021-01-28 14:50:36.143246	2021-01-28 14:50:36.143246
70	qqqqqqqqq	2021-01-28 16:09:00	\N	2	6	2021-01-28 14:50:39.217657	2021-01-28 14:50:39.217657
71	wsvvvvvvvvvv	2021-01-29 02:09:00	\N	2	6	2021-01-28 14:50:55.530934	2021-01-28 14:50:55.530934
72	wsvvvvvvvvvv	2021-01-28 16:39:00	\N	2	6	2021-01-28 14:51:11.359242	2021-01-28 14:51:11.359242
73	wsvvvvvvvvvv	2021-01-28 17:09:00	\N	2	6	2021-01-28 14:51:40.190158	2021-01-28 14:51:40.190158
74	wsvvvvvvvvvv	2021-01-28 17:39:00	\N	2	6	2021-01-28 14:53:44.41329	2021-01-28 14:53:44.41329
75	wsvvvvvvvvvv	2021-01-28 18:09:00	\N	2	6	2021-01-28 14:57:44.739993	2021-01-28 14:57:44.739993
76	wsvvvvvvvvvv	2021-01-28 18:39:00	\N	2	6	2021-01-28 14:58:13.276187	2021-01-28 14:58:13.276187
77	wsvvvvvvvvvv	2021-01-28 19:09:00	\N	2	6	2021-01-28 15:04:43.193077	2021-01-28 15:04:43.193077
78	qqqqqqqqq	2021-01-28 19:39:00	\N	2	6	2021-01-28 15:05:09.828602	2021-01-28 15:05:09.828602
79	qwe	2021-01-28 20:09:00	\N	2	6	2021-01-28 15:05:46.504621	2021-01-28 15:05:46.504621
80	123	2021-01-28 20:39:00	\N	2	6	2021-01-28 15:06:55.747958	2021-01-28 15:06:55.747958
81	qqqqqqqqq	2021-01-28 21:09:00	\N	2	6	2021-01-28 15:07:26.193109	2021-01-28 15:07:26.193109
82	qqqqqqqqq	2021-01-28 21:39:00	\N	2	6	2021-01-28 15:07:40.374595	2021-01-28 15:07:40.374595
83		2021-01-28 22:09:00	\N	2	6	2021-01-28 15:08:35.584513	2021-01-28 15:08:35.584513
84	qwe	2021-01-28 22:39:00	\N	2	6	2021-01-28 15:08:55.862499	2021-01-28 15:08:55.862499
85	qqqqqqqqq	2021-01-28 23:09:00	\N	2	6	2021-01-28 15:10:24.872511	2021-01-28 15:10:24.872511
86	123	2021-01-28 23:39:00	\N	2	6	2021-01-28 15:10:58.389454	2021-01-28 15:10:58.389454
87	qqqqqqqqq	2021-01-29 00:09:00	\N	2	6	2021-01-28 15:12:12.383446	2021-01-28 15:12:12.383446
88	qqqqqqqqq	2021-01-29 00:39:00	\N	2	6	2021-01-28 15:14:01.306657	2021-01-28 15:14:01.306657
89	qqqqqqqqq	2021-01-29 10:09:00	\N	2	6	2021-01-28 15:14:17.159187	2021-01-28 15:14:17.159187
90		2021-01-29 12:09:00	\N	2	6	2021-01-28 15:16:03.578166	2021-01-28 15:16:03.578166
91	123	2021-01-29 01:09:00	\N	2	6	2021-01-28 15:25:44.460768	2021-01-28 15:25:44.460768
92	dddddddd	2021-01-29 13:09:00	\N	2	6	2021-01-28 15:26:08.59602	2021-01-28 15:26:08.59602
93	wsvvvvvvvvvv	2021-01-29 13:39:00	\N	2	6	2021-01-28 15:26:37.996592	2021-01-28 15:26:37.996592
94	qqqqqqqqq	2021-01-29 01:39:00	\N	2	6	2021-01-28 15:27:38.861629	2021-01-28 15:27:38.861629
95	wsvvvvvvvvvv	2021-01-29 02:39:00	\N	2	6	2021-01-28 15:31:03.217348	2021-01-28 15:31:03.217348
96	123	2021-01-28 20:59:00	\N	1	1	2021-01-29 10:55:51.691722	2021-01-29 10:55:51.691722
97	qqqqqqqqq	2021-01-28 21:59:00	\N	1	1	2021-01-29 10:56:12.503289	2021-01-29 10:56:12.503289
98	wsvvvvvvvvvv	2021-01-28 22:59:00	\N	1	1	2021-01-29 10:56:53.900784	2021-01-29 10:56:53.900784
99	qqqqqqqqq	2021-01-28 23:59:00	\N	1	1	2021-01-29 10:57:11.08336	2021-01-29 10:57:11.08336
100	123	2021-01-29 00:59:00	\N	1	1	2021-01-29 10:59:21.55778	2021-01-29 10:59:21.55778
101	wsvvvvvvvvvv	2021-01-29 01:59:00	\N	1	1	2021-01-29 11:00:03.040978	2021-01-29 11:00:03.040978
102	qwe	2021-01-29 02:59:00	\N	1	1	2021-01-29 11:00:27.038362	2021-01-29 11:00:27.038362
103	qqqqqqqqq	2021-01-29 03:59:00	\N	1	1	2021-01-29 11:03:50.472917	2021-01-29 11:03:50.472917
104	123	2021-01-29 04:59:00	\N	1	1	2021-01-29 11:04:28.47132	2021-01-29 11:04:28.47132
105	123	2021-01-29 05:59:00	\N	1	1	2021-01-29 11:04:53.735878	2021-01-29 11:04:53.735878
106	123	2021-01-29 06:59:00	\N	1	1	2021-01-29 11:13:37.421353	2021-01-29 11:13:37.421353
107	123	2021-01-29 07:59:00	\N	1	1	2021-01-29 11:16:19.319905	2021-01-29 11:16:19.319905
108	wsvvvvvvvvvv	2021-01-29 08:59:00	\N	1	1	2021-01-29 11:16:58.195588	2021-01-29 11:16:58.195588
109	dddddddd	2021-01-29 09:59:00	\N	1	1	2021-01-29 11:17:13.158091	2021-01-29 11:17:13.158091
110	wsvvvvvvvvvv	2021-01-29 10:59:00	\N	1	1	2021-01-29 11:17:33.888098	2021-01-29 11:17:33.888098
111		2021-01-29 11:59:00	\N	1	1	2021-01-29 11:17:54.151903	2021-01-29 11:17:54.151903
112	123	2021-01-29 12:59:00	\N	1	1	2021-01-29 11:18:37.924253	2021-01-29 11:18:37.924253
113	dddddddd	2021-01-29 14:59:00	\N	1	1	2021-01-29 11:19:04.222317	2021-01-29 11:19:04.222317
115	wsvvvvvvvvvv	2021-01-29 11:00:00	\N	16	1	2021-01-29 11:26:30.087674	2021-01-29 11:26:30.087674
116	wsvvvvvvvvvv	2021-01-29 12:00:00	\N	16	1	2021-01-29 11:27:31.428615	2021-01-29 11:27:31.428615
117	qqqqqqqqq	2021-01-29 13:00:00	\N	16	1	2021-01-29 11:27:50.570058	2021-01-29 11:27:50.570058
118	123	2021-01-29 14:00:00	\N	16	1	2021-01-29 11:28:08.162536	2021-01-29 11:28:08.162536
119	wsvvvvvvvvvv	2021-01-29 15:00:00	\N	16	1	2021-01-29 11:28:17.766003	2021-01-29 11:28:17.766003
120	wsvvvvvvvvvv	2021-01-29 16:00:00	\N	28	1	2021-01-29 11:53:54.885552	2021-01-29 11:53:54.885552
121	qwe	2021-01-29 17:00:00	\N	28	1	2021-01-29 11:55:21.345513	2021-01-29 11:55:21.345513
122	dddddddd	2021-01-29 18:00:00	\N	28	1	2021-01-29 11:56:39.32021	2021-01-29 11:56:39.32021
123	qqqqqqqqq	2021-01-29 19:00:00	\N	28	1	2021-01-29 11:59:01.785446	2021-01-29 11:59:01.785446
124	123	2021-01-29 20:00:00	\N	29	1	2021-01-29 12:01:06.97402	2021-01-29 12:01:06.97402
125	123	2021-01-29 21:00:00	\N	29	1	2021-01-29 12:02:17.42923	2021-01-29 12:02:17.42923
126	wsvvvvvvvvvv	2021-01-29 22:00:00	\N	29	1	2021-01-29 12:54:16.129901	2021-01-29 12:54:16.129901
127	qqqqqqqqq	2021-01-29 23:00:00	\N	29	1	2021-01-29 12:54:54.258694	2021-01-29 12:54:54.258694
128	dddddddd	2021-01-30 00:00:00	\N	29	1	2021-01-29 12:55:00.08736	2021-01-29 12:55:00.08736
129	dddddddd	2021-01-30 01:00:00	\N	29	1	2021-01-29 12:55:18.486967	2021-01-29 12:55:18.486967
130	qwe	2021-01-30 02:00:00	\N	29	1	2021-01-29 12:55:37.819348	2021-01-29 12:55:37.819348
131	My order	2021-01-30 03:00:00	\N	29	1	2021-01-29 12:57:44.379907	2021-01-29 12:57:44.379907
132		2021-01-30 04:00:00	\N	29	1	2021-01-29 12:58:35.558532	2021-01-29 12:58:35.558532
133	qqqqqqqqq	2021-01-30 05:00:00	\N	30	1	2021-01-29 13:02:23.098478	2021-01-29 13:02:23.098478
134	wsvvvvvvvvvv	2021-01-30 06:00:00	\N	31	1	2021-01-29 13:14:22.466229	2021-01-29 13:14:22.466229
135	wsvvvvvvvvvv	2021-01-30 07:00:00	\N	31	1	2021-01-29 13:14:27.828595	2021-01-29 13:14:27.828595
136	qwe	2021-01-30 08:00:00	\N	31	1	2021-01-29 13:15:08.997086	2021-01-29 13:15:08.997086
137	123	2021-01-30 09:00:00	\N	31	1	2021-01-29 13:16:30.368551	2021-01-29 13:16:30.368551
138	123	2021-01-29 03:09:00	\N	32	6	2021-01-29 13:53:45.728502	2021-01-29 13:53:45.728502
139	qqqqqqqqq	2021-01-29 03:39:00	\N	32	6	2021-01-29 13:54:59.009812	2021-01-29 13:54:59.009812
140	dddddddd	2021-01-29 04:09:00	\N	32	6	2021-01-29 13:55:02.567577	2021-01-29 13:55:02.567577
141	qwe	2021-01-30 10:00:00	\N	32	1	2021-01-29 13:55:17.47569	2021-01-29 13:55:17.47569
142	123	2021-01-30 11:00:00	\N	32	1	2021-01-29 13:56:43.095787	2021-01-29 13:56:43.095787
143	dddddddd	2021-01-30 12:00:00	\N	32	1	2021-01-29 13:57:20.368515	2021-01-29 13:57:20.368515
144	wsvvvvvvvvvv	2021-01-30 13:00:00	\N	32	1	2021-01-29 14:01:55.408664	2021-01-29 14:01:55.408664
145		2021-01-30 14:00:00	\N	32	1	2021-01-29 14:02:18.152769	2021-01-29 14:02:18.152769
147	213	2021-01-29 04:39:00	\N	1	6	2021-01-31 16:27:24.648573	2021-01-31 16:27:24.648573
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.roles (id, name, resource_type, resource_id, created_at, updated_at) FROM stdin;
1	customer	\N	\N	2021-01-22 14:32:21.982817	2021-01-22 14:32:21.982817
2	admin	\N	\N	2021-01-22 14:32:22.241904	2021-01-22 14:32:22.241904
3	owner	\N	\N	2021-01-22 14:32:22.257911	2021-01-22 14:32:22.257911
4		\N	\N	2021-01-22 19:17:31.314405	2021-01-22 19:17:31.314405
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.schema_migrations (version) FROM stdin;
20201029101154
20201029101215
20201112170921
20201118133828
20201118211016
20201202094051
20201210141346
20201211102937
20201214162003
20201216103131
20201225213953
20210105123626
20210109123932
20210110130738
20210114070013
20210114082845
20210114083107
20210118211617
20210118211732
20210118212710
20210120204430
20210121185122
20210122142956
20210125112447
20210127091802
20210127091836
20210127092016
20210127092344
20210127152552
20210127152937
20210128125419
20210128142636
20210129103624
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.services (id, name, description, avatar, company_id, created_at, updated_at, time_limit_id, user_id) FROM stdin;
31	Driving School	bla bla bla 	\N	9	2021-01-31 16:24:29.366905	2021-01-31 16:24:29.380072	\N	1
32	Fast Food	some desc	\N	63	2021-01-31 17:02:00.310452	2021-01-31 17:02:00.310452	\N	1
6	Dima's Service	We can give you our products so fast that you will not notice how time has passed	\N	4	2021-01-25 08:44:39.428594	2021-01-25 08:44:39.685819	\N	2
7	It Soft	We teach people to driving on car. We can give you all categories.	\N	7	2021-01-25 08:49:50.508658	2021-01-25 08:49:50.508658	\N	2
8	Dima's Service	We can give you our products so fast that you will not notice how time has passed	\N	8	2021-01-25 09:07:45.952735	2021-01-25 09:07:45.952735	\N	2
9	Fast Food	We can give you our products so fast that you will not notice how time has passed	\N	4	2021-01-25 09:14:18.369104	2021-01-25 09:14:18.369104	\N	2
3	Test Service	Thick slices of French toast bread, brown sugar, half-and-half and vanilla, topped with powdered sugar. With two eggs served any style, and your choice of smoked bacon or smoked ham.	\N	8	2021-01-22 14:32:23.0416	2021-01-25 09:14:50.445131	\N	3
11	Driving School	We teach people to driving on car. We can give you all categories.	\N	10	2021-01-25 16:10:08.510943	2021-01-25 16:10:08.634103	\N	1
12	Dima's Service	We teach people to driving on car. We can give you all categories.	\N	9	2021-01-25 16:10:33.980246	2021-01-25 16:10:33.980246	\N	1
14	Second Service	We teach people to driving on car. We can give you all categories.	\N	9	2021-01-26 10:58:36.573437	2021-01-26 10:58:36.573437	\N	1
16	Third service	qweasdewd	\N	8	2021-01-26 14:06:29.845746	2021-01-26 14:06:29.845746	\N	2
17	Dima's Service	We teach people to driving on car. We can give you all categories.	\N	10	2021-01-26 14:42:28.826731	2021-01-26 14:42:28.826731	\N	1
19	Fast Food	We can give you our products so fast that you will not notice how time has passed	\N	14	2021-01-26 15:54:15.923023	2021-01-26 15:54:15.923023	\N	22
4	Driving School	We teach people to driving on car. We can give you all categories.	\N	10	2021-01-22 15:21:20.902227	2021-01-27 09:49:16.216771	\N	2
20	Hogwarts	wqedqwe	\N	9	2021-01-27 10:28:29.617801	2021-01-27 10:28:29.617801	\N	1
21	kfc	some desc	\N	9	2021-01-27 10:32:17.989605	2021-01-27 10:32:17.989605	\N	1
22	mcdonalds	We can give you our products so fast that you will not notice how time has passed	\N	7	2021-01-27 10:33:29.847268	2021-01-27 10:33:29.847268	\N	2
23	burgerking		\N	7	2021-01-27 10:35:31.085635	2021-01-27 10:35:31.085635	\N	2
24	Second Service	We can give you our products so fast that you will not notice how time has passed	\N	11	2021-01-27 13:50:45.841338	2021-01-27 13:50:45.841338	\N	1
25	Fast Food	some desc	\N	15	2021-01-27 13:51:14.111686	2021-01-27 13:51:14.111686	\N	1
26	Fast Food 5	some desc	\N	9	2021-01-27 15:35:42.282974	2021-01-27 15:35:42.282974	\N	1
28	Dima's Service	We teach people to driving on car. We can give you all categories.	\N	9	2021-01-30 22:13:18.733663	2021-01-30 22:13:18.733663	\N	1
1	Diploms	Fresh parsley, Italian sausage, shallots, garlic, sun-dried tomatoes and mozzarella cheese in an all-butter crust. With a side of mixed fruits.	\N	9	2021-01-22 14:32:23.026429	2021-01-31 10:14:58.53224	\N	3
30	Driving School	some desc	\N	9	2021-01-31 13:55:35.219405	2021-01-31 13:55:35.219405	\N	1
\.


--
-- Data for Name: time_limits; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.time_limits (id, start_time, end_time, user_id, length, service_id) FROM stdin;
3	2021-01-22 11:00:00	2021-02-25 20:00:00	3	45	\N
1	2021-01-22 10:15:00	2021-02-10 19:00:00	3	15	\N
4	2021-01-10 10:00:00	2021-01-10 12:00:00	2	30	\N
5	2021-01-25 02:44:00	2021-01-30 08:44:00	2	25	\N
6	2021-01-25 09:10:00	2021-01-27 19:10:00	2	123	\N
10	2021-01-26 15:18:00	2021-01-26 17:18:00	1	12	\N
11	2021-01-26 15:46:00	2021-01-26 15:46:00	22	32	\N
8	2021-01-26 11:16:00	2021-01-31 23:16:00	1	12	\N
14	2021-01-27 15:30:00	2021-01-27 23:30:00	1	30	25
15	2021-01-22 11:00:00	2021-02-25 20:00:00	1	15	26
16	2021-01-22 11:00:00	2021-02-25 20:00:00	1	15	26
17	2021-01-22 11:00:00	2021-02-25 20:00:00	1	15	26
18	2021-01-22 11:00:00	2021-02-25 20:00:00	1	15	26
19	2021-01-22 11:00:00	2021-02-25 20:00:00	1	15	26
20	2021-01-22 11:00:00	2021-02-25 20:00:00	1	15	26
21	2021-01-22 11:00:00	2021-02-25 20:00:00	1	15	26
22	2021-01-22 11:00:00	2021-02-25 20:00:00	1	15	26
23	2021-01-22 11:00:00	2021-02-25 20:00:00	1	15	26
25	2021-01-27 19:48:00	2021-01-27 21:48:00	1	15	27
27	2021-01-28 14:39:00	2021-01-31 20:39:00	2	30	6
26	2021-01-27 19:59:00	2021-02-02 22:59:00	1	60	1
28	2021-01-20 11:00:00	2021-02-03 11:00:00	1	60	1
30	2021-01-31 08:55:00	2021-03-31 20:55:00	1	20	30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, provider, surname, name, uid, avatar, language, reminder_time, "interval") FROM stdin;
24	qweasd@mail.ru	$2a$12$F2J1MlUyLrT.ULR7dctpie2rY3VPygQYSB.dVi/PEAsuz5OLzQnQe	\N	\N	\N	2021-01-29 11:31:24.906496	2021-01-29 11:31:24.906496	\N	\N	\N	\N	\N	\N	\N	\N
25	qweasd11@mail.ru	$2a$12$otVh2d2GkkGGl1fczAqU4e9Le2V8OaEZLxRrOFFNcPxUwKrW7h3L6	\N	\N	\N	2021-01-29 11:31:57.048541	2021-01-29 11:31:57.048541	\N	\N	\N	\N	\N	\N	\N	\N
26	rrrrrr@mail.ru	$2a$12$Td3XjheI6SUeNeOUiimdvu2If9imAYbNlBKjRzka/Qp0CSUk9yeny	\N	\N	\N	2021-01-29 11:42:56.844338	2021-01-29 11:42:56.844338	\N	\N	\N	\N	\N	\N	\N	\N
27	qwdwed@mail.ru	$2a$12$zGcdu.4KwlI9yk9ci59etu42iPHF7BMzGPbC9kK4GbHsm.Fg.gKzy	\N	\N	\N	2021-01-29 11:45:20.331006	2021-01-29 11:45:20.331006	\N	\N	\N	\N	\N	\N	\N	\N
28	erfre@mail.ru	$2a$12$5hvJ8e6PfoWI0Y1q2IV4w.0qHRbZEO/Tx85wlFC1CTetjS0nmofdO	\N	\N	\N	2021-01-29 11:50:28.394927	2021-01-29 11:56:27.833725	\N			\N	\N	\N	5	hours
29	refcdr@mail.ru	$2a$12$7E8/fZXAjrdzMJj/IFR.rOyk6D3AWUzX877IxoUeK2aTCC7Yn5ERe	\N	\N	\N	2021-01-29 11:59:22.447105	2021-01-29 12:01:38.148576	\N			\N	\N	\N	\N	hours
5	secondowner@mail.ru	$2a$12$ODgbSY3elqG3svNghS14QOrX0HS6PBy.xwi12QcsALlfHLfPtF1xC	\N	\N	\N	2021-01-22 17:21:07.923008	2021-01-22 17:21:07.923008	\N	\N	\N	\N	\N	\N	\N	\N
15	vorobyov_egor@bk.ru	$2a$12$8Sy02kh/nm2Ht92EU1xS1.6H2Y3sFqjEokMo9tCR0ysfVajUExRvO	\N	\N	\N	2021-01-22 19:05:10.994374	2021-01-22 19:05:10.994374	\N	\N	\N	\N	\N	\N	\N	\N
17	customer111@mail.ru	$2a$12$/QvpwWOe01zXXbdHHo4nj.ghDVhTgUYnCtnHSjS.dl1c3gjrzkefa	\N	\N	\N	2021-01-22 19:18:48.429781	2021-01-22 19:18:48.429781	\N	\N	\N	\N	\N	\N	\N	\N
18	owner123@mail.ru	$2a$12$QPevWeCMsXNgnjthmeqQCO7fACbEzcEyVqFwauVxu/8aP7jdx36vq	\N	\N	\N	2021-01-25 07:35:58.071283	2021-01-25 07:35:58.071283	\N	\N	\N	\N	\N	\N	\N	\N
19	smoketest@cwtest.com	$2a$12$Umdd8ThR7ksWr3pSUnvV3u8nfFX8KOHq68gXi.HR4n6h487WcUbwC	\N	\N	\N	2021-01-25 09:59:40.07146	2021-01-25 09:59:40.07146	\N	\N	\N	\N	\N	\N	\N	\N
20	customer1234@mail.ru	$2a$12$bygdd65a29CX1eV0Bnd2cOMKJF1wvtj8.ciPxiIW.W93mUeZWYXqm	\N	\N	\N	2021-01-25 10:00:45.34248	2021-01-25 10:00:45.34248	\N	\N	\N	\N	\N	\N	\N	\N
3	user@mail.ru	$2a$12$ecIgxCTVO.3zniL7wTBLhuNIypBOvUYGva6djkS0bNp7GYt1F7CRW	\N	\N	\N	2021-01-22 14:32:22.9608	2021-01-26 10:21:53.399988	\N	Grom	Nikita	\N	\N	\N	\N	\N
21	lalalala@mail.ru	$2a$12$RHmCtIft2Kt/4f2YmNN3cO2pSluC7pDvH/P7fCWXOoKqJqAOqrZdq	\N	\N	\N	2021-01-26 14:02:48.248327	2021-01-26 14:02:48.248327	\N	\N	\N	\N	\N	\N	\N	\N
30	edwui@mail.ru	$2a$12$VueOizAn4W6P1CMr4UMiBe1P2EP6ai3kqKy9jWOPqnl/59hWeCU9a	\N	\N	\N	2021-01-29 12:59:16.436271	2021-01-29 13:03:04.540387	\N			\N	\N	\N	\N	days
22	dima_aleinik@mail.ru	$2a$12$O2DPLtaftnUJRhqVLvUnBu8VGF2gNKilbyJLt4HotzmXsi9nkfkA6	\N	\N	\N	2021-01-26 15:34:01.146807	2021-01-26 15:54:38.130206	\N	Aleinik	Nikita	\N	\N	\N	\N	\N
31	ddddd@mail.ru	$2a$12$e4bXLvfSub6pSzOZvzOEHOl08RjJ9VqJaiGw2qzM6vZhQ4P8vkdhy	\N	\N	\N	2021-01-29 13:03:51.828544	2021-01-29 13:16:25.826915	\N			\N	\N	\N	6	hours
2	owner@mail.ru	$2a$12$aXL.7wAqUdpViTpjPgCDZegvDV5gpnEmOQrzo6VMhmkYAkqzrCryK	\N	\N	\N	2021-01-22 14:32:22.742372	2021-01-28 14:38:59.556126	\N	Vorobyov	Egor	\N	\N	\N	3	\N
32	asdzxc@mail.ru	$2a$12$k9kMLp7I0dfuyzvmPygkNOTIPAnzsVnx.Bmv3YldAWsqCQk6elvh2	\N	\N	\N	2021-01-29 13:26:19.932635	2021-01-29 14:02:14.347841	\N			\N	\N	\N	6	hours
34	hallo@mail.ru	$2a$12$tub.UUvE4GI8SDSYvfgTz.KhaTSwolKaQRZ0FadGGCF5im3fhyrXG	\N	\N	\N	2021-01-29 18:21:22.584615	2021-01-29 18:21:22.584615	\N	\N	\N	\N	\N	\N	\N	\N
16	customer@mail.ru	$2a$12$zgYxi4X7q9eDi6rjSw/Mq./NRMe9BPKcjtYht3V/aQ7004xtd.2MG	\N	\N	\N	2021-01-22 19:17:31.260374	2021-01-29 11:27:15.336289	\N			\N	\N	\N	5	hours
4	timofey.zarenok@gmail.com	$2a$12$Sh86FmSrgh1dPia3Sxhta.YqD8XKka4efnn72NM5d2DsVGRzyADke	\N	\N	\N	2021-01-22 15:28:34.073469	2021-01-30 20:27:09.412077	facebook	Aleinik	Nikita	2475312516107422	\N	\N	\N	days
35	someuser@mail.ru	$2a$12$uosn/Go.b02kMUpGX/onX.JoFLr1zze4HSlZp4qJo3xg030JGUQwO	\N	\N	\N	2021-01-30 21:41:58.862742	2021-01-30 21:41:58.862742	\N	\N	\N	\N	\N	\N	\N	\N
36	someuser1@mail.ru	$2a$12$bF7/jACSOLGT.jwZzdWMpuhfAVl2GYmmKRd3dEuggl0WzZ2BgXXb.	\N	\N	\N	2021-01-30 21:42:19.885828	2021-01-30 21:42:37.831372	\N	Aleinik	Nikita	\N	\N	\N	4	hours
37	frheiufjwe@mail.ru	$2a$12$qlDSKCilQ2Db312gcEfbWenM0ieD6M.Mh.3.J64LQLoXMVgWK.SfG	\N	\N	\N	2021-01-31 14:58:45.532777	2021-01-31 15:02:05.733424	\N	Vorobyov	Egor	\N	\N	\N	5	hours
38	rehfdsk@mail.ru	$2a$12$gHg5BojdSfDY7gete1HTiuRsieERrfk84qkeWcOLwhqIVEbdJoTZ2	\N	\N	\N	2021-01-31 16:18:46.710248	2021-01-31 16:18:46.710248	\N	\N	\N	\N	\N	\N	\N	\N
39	rehfdsdk@mail.ru	$2a$12$2jmJQa2lr3E3yMwWmhvvuuSdMMUba3PgvXeB2ZkTt21EmGy3Q42em	\N	\N	\N	2021-01-31 16:19:24.658946	2021-01-31 16:19:24.658946	\N	\N	\N	\N	\N	\N	\N	\N
1	admin@mail.ru	$2a$12$7QxlKncMmRD6k/QWnLSR/OL0yOoyGC.w858lG3Ax2c3A9Nx0De8k2	\N	\N	\N	2021-01-22 14:32:22.5132	2021-01-31 16:23:55.564869	\N	Grom	Dima	\N	\N	\N	3	hours
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: vorob
--

COPY public.users_roles (user_id, role_id) FROM stdin;
1	2
2	3
3	1
5	3
15	3
16	4
17	4
18	4
19	4
20	4
21	3
22	3
25	3
26	4
27	4
28	4
29	4
30	4
31	4
32	4
34	3
34	3
36	3
37	3
39	3
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 19, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 19, true);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.addresses_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.comments_id_seq', 49, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.companies_id_seq', 63, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.orders_id_seq', 147, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.services_id_seq', 32, true);


--
-- Name: time_limits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.time_limits_id_seq', 30, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vorob
--

SELECT pg_catalog.setval('public.users_id_seq', 39, true);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: time_limits time_limits_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.time_limits
    ADD CONSTRAINT time_limits_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: vorob
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: vorob
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_addresses_on_addressable_type_and_addressable_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_addresses_on_addressable_type_and_addressable_id ON public.addresses USING btree (addressable_type, addressable_id);


--
-- Name: index_companies_on_address_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_companies_on_address_id ON public.companies USING btree (address_id);


--
-- Name: index_companies_on_user_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_companies_on_user_id ON public.companies USING btree (user_id);


--
-- Name: index_orders_on_service_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_orders_on_service_id ON public.orders USING btree (service_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON public.roles USING btree (name, resource_type, resource_id);


--
-- Name: index_roles_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_roles_on_resource_type_and_resource_id ON public.roles USING btree (resource_type, resource_id);


--
-- Name: index_services_on_company_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_services_on_company_id ON public.services USING btree (company_id);


--
-- Name: index_services_on_time_limit_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_services_on_time_limit_id ON public.services USING btree (time_limit_id);


--
-- Name: index_services_on_user_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_services_on_user_id ON public.services USING btree (user_id);


--
-- Name: index_time_limits_on_user_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_time_limits_on_user_id ON public.time_limits USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: vorob
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: vorob
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_roles_on_role_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_users_roles_on_role_id ON public.users_roles USING btree (role_id);


--
-- Name: index_users_roles_on_user_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_users_roles_on_user_id ON public.users_roles USING btree (user_id);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: vorob
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON public.users_roles USING btree (user_id, role_id);


--
-- Name: companies fk_rails_244dfae511; Type: FK CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_244dfae511 FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: orders fk_rails_4d159e34c4; Type: FK CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_4d159e34c4 FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- Name: services fk_rails_51a813203f; Type: FK CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT fk_rails_51a813203f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: services fk_rails_6c869ccd3c; Type: FK CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT fk_rails_6c869ccd3c FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: companies fk_rails_e57cb42012; Type: FK CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_e57cb42012 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: time_limits fk_rails_fabdb255f4; Type: FK CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.time_limits
    ADD CONSTRAINT fk_rails_fabdb255f4 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: services fk_rails_fccdb99914; Type: FK CONSTRAINT; Schema: public; Owner: vorob
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT fk_rails_fccdb99914 FOREIGN KEY (time_limit_id) REFERENCES public.time_limits(id);


--
-- PostgreSQL database dump complete
--

