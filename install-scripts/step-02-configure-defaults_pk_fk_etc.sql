/**
    Target Server: PostgreSQL
    Server Version: 10

    Step 002: Configure the tables; PK, FK, Sequences, Nextvals.
*/

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

-- Name: mpaa_rating; Type: TYPE; Schema: public; Owner: postgres
CREATE TYPE public.mpaa_rating AS ENUM (
    'G',
    'PG',
    'PG-13',
    'R',
    'NC-17'
);

ALTER TYPE public.mpaa_rating OWNER TO postgres;

-- Name: year; Type: DOMAIN; Schema: public; Owner: postgres
CREATE DOMAIN public.year AS integer
	CONSTRAINT year_check CHECK (((VALUE >= 1901) AND (VALUE <= 2155)));

ALTER DOMAIN public.year OWNER TO postgres;

SET default_tablespace = '';
SET default_with_oids = false;

-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

-- Name: group_concat(text); Type: AGGREGATE; Schema: public; Owner: postgres
CREATE AGGREGATE public.group_concat(text) (
    SFUNC = public._group_concat,
    STYPE = text
);

ALTER AGGREGATE public.group_concat(text) OWNER TO postgres;

-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.actor_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.actor_actor_id_seq OWNER TO postgres;

-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.category_category_id_seq OWNER TO postgres;

-- Name: film_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.film_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.film_film_id_seq OWNER TO postgres;

-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.address_address_id_seq OWNER TO postgres;

-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.city_city_id_seq OWNER TO postgres;

-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.country_country_id_seq OWNER TO postgres;

-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.inventory_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.inventory_inventory_id_seq OWNER TO postgres;

-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.language_language_id_seq OWNER TO postgres;

-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.rental_rental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.rental_rental_id_seq OWNER TO postgres;

-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
CREATE SEQUENCE public.staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.staff_staff_id_seq OWNER TO postgres;


-- Name: actor_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.actor_actor_id_seq', 200, true);

-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.address_address_id_seq', 605, true);

-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.category_category_id_seq', 16, true);

-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.city_city_id_seq', 600, true);

-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.country_country_id_seq', 109, true);

-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.customer_customer_id_seq', 599, true);

-- Name: film_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.film_film_id_seq', 1000, true);

-- Name: inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 4581, true);

-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.language_language_id_seq', 6, true);

-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.payment_payment_id_seq', 32098, true);

-- Name: rental_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.rental_rental_id_seq', 16049, true);

-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.staff_staff_id_seq', 2, true);

-- Name: store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
SELECT pg_catalog.setval('public.store_store_id_seq', 2, true);
