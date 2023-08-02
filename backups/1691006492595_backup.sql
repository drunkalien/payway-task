--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: Chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Chat" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL,
    "socketId" text NOT NULL
);


ALTER TABLE public."Chat" OWNER TO postgres;

--
-- Name: Message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Message" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    content text NOT NULL,
    "chatId" text NOT NULL,
    "userName" text NOT NULL
);


ALTER TABLE public."Message" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Data for Name: Chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Chat" (id, "createdAt", "updatedAt", name, "socketId") FROM stdin;
a3c19af8-d44e-4f52-b185-cc6cc25fefd6	2023-08-02 09:30:48.688	2023-08-02 09:30:48.688	john	PgXNmRyhpczMVl8zAAAB
\.


--
-- Data for Name: Message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Message" (id, "createdAt", "updatedAt", content, "chatId", "userName") FROM stdin;
acea4e5f-93f8-4860-a6d9-4d41dc2c5d07	2023-08-02 09:30:48.706	2023-08-02 09:30:48.706	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
aebb5491-3bf3-495a-a325-68632a631144	2023-08-02 09:31:53.332	2023-08-02 09:31:53.332	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
6cb80a17-59e1-449a-b7ef-518f0340289a	2023-08-02 09:34:26.132	2023-08-02 09:34:26.132	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
1d45855f-c6d9-47f6-a3fa-c18ea0a9de55	2023-08-02 09:39:11.567	2023-08-02 09:39:11.567	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
a755cfb4-a501-4044-84cc-b69b42d9b826	2023-08-02 09:39:14.307	2023-08-02 09:39:14.307	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
0db76e42-5a92-492e-ad39-e5f382b1c8c5	2023-08-02 09:41:25.598	2023-08-02 09:41:25.598	Hello from operaor	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	operator
cd42760c-3554-434a-b976-54b49ed596ae	2023-08-02 09:42:43.32	2023-08-02 09:42:43.32	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
c84bc76d-6dc6-4580-94af-139173f2ec92	2023-08-02 09:42:50.934	2023-08-02 09:42:50.934	Hello from operaor	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	operator
2735f15d-1312-4793-affe-517169ef2fd8	2023-08-02 17:30:56.795	2023-08-02 17:30:56.795	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
49c4763d-0ec8-4380-9d79-4d9ce87a005b	2023-08-02 17:34:16.029	2023-08-02 17:34:16.029	Hello from operaor	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	operator
5ddeb8e8-573d-4bcc-a152-8b75b0d1c7ea	2023-08-02 17:34:28.568	2023-08-02 17:34:28.568	Hello from operaor	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	operator
3b132f14-c22f-4141-b28e-57df47266bd8	2023-08-02 17:34:45.515	2023-08-02 17:34:45.515	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
00ccdca6-a866-485d-970a-de3ab1b71d53	2023-08-02 17:34:55.251	2023-08-02 17:34:55.251	Hello from operaor	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	operator
ed13fc36-e935-481c-9135-5b619d44bc2e	2023-08-02 17:36:26.281	2023-08-02 17:36:26.281	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
164b234d-1f77-4ee3-8b5f-a69d3acd47cb	2023-08-02 17:36:59.664	2023-08-02 17:36:59.664	Hello from operaor	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	operator
1a0c3bf1-2781-414a-a63b-a4ee1feb235f	2023-08-02 17:38:20.356	2023-08-02 17:38:20.356	Hello from operaor	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	operator
0091fa34-55c1-4564-b47a-d2744ba8e916	2023-08-02 17:38:28.601	2023-08-02 17:38:28.601	Hello	a3c19af8-d44e-4f52-b185-cc6cc25fefd6	john
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
bcb1727a-d4fd-4731-a99f-8e781654bb61	17b1a90c779a4ab4c9f1dd5ac4e9dcee7d266abf85a521826a10de7db579c899	2023-07-30 02:44:42.682687+05	20230729214442_init	\N	\N	2023-07-30 02:44:42.641648+05	1
f6597198-f9fd-489d-9d34-fc34dfdfedf3	a4035cd71aa0669f2e2e45b29cfde3e1f5fdc67b9d3400b68e97b0a7961bc51b	2023-07-30 03:23:07.732414+05	20230729222307_added_user_name	\N	\N	2023-07-30 03:23:07.718595+05	1
688d2d58-8057-4d6b-ab17-0d05aa4d4285	d615b19a39b9b0ffc5d8bcaea22f659852c472d57f0a05f2baa3f050f0ed0384	2023-07-30 03:46:32.091756+05	20230729224632_added_socket_id	\N	\N	2023-07-30 03:46:32.084785+05	1
\.


--
-- Name: Chat Chat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chat"
    ADD CONSTRAINT "Chat_pkey" PRIMARY KEY (id);


--
-- Name: Message Message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT "Message_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Message Message_chatId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT "Message_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES public."Chat"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

