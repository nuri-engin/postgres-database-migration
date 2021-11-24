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


-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);

-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);

-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);

-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);

-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);

-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);

-- Name: film_actor film_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id, film_id);

-- Name: film_category film_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_pkey PRIMARY KEY (film_id, category_id);

-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);

-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);

-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);

-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);

-- Name: rental rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (rental_id);

-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);

-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);

-- Name: film_fulltext_idx; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX film_fulltext_idx ON public.film USING gist (fulltext);

-- Name: idx_actor_last_name; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_actor_last_name ON public.actor USING btree (last_name);

-- Name: idx_fk_address_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_address_id ON public.customer USING btree (address_id);

-- Name: idx_fk_city_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_city_id ON public.address USING btree (city_id);

-- Name: idx_fk_country_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_country_id ON public.city USING btree (country_id);

-- Name: idx_fk_customer_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_customer_id ON public.payment USING btree (customer_id);

-- Name: idx_fk_film_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_film_id ON public.film_actor USING btree (film_id);

-- Name: idx_fk_inventory_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_inventory_id ON public.rental USING btree (inventory_id);

-- Name: idx_fk_language_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_language_id ON public.film USING btree (language_id);

-- Name: idx_fk_rental_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_rental_id ON public.payment USING btree (rental_id);

-- Name: idx_fk_staff_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_staff_id ON public.payment USING btree (staff_id);

-- Name: idx_fk_store_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_fk_store_id ON public.customer USING btree (store_id);

-- Name: idx_last_name; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_last_name ON public.customer USING btree (last_name);

-- Name: idx_store_id_film_id; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_store_id_film_id ON public.inventory USING btree (store_id, film_id);

-- Name: idx_title; Type: INDEX; Schema: public; Owner: postgres
CREATE INDEX idx_title ON public.film USING btree (title);

-- Name: idx_unq_manager_staff_id; Type: INDEX; Schema: public; Owner: postgres
CREATE UNIQUE INDEX idx_unq_manager_staff_id ON public.store USING btree (manager_staff_id);

-- Name: idx_unq_rental_rental_date_inventory_id_customer_id; Type: INDEX; Schema: public; Owner: postgres
CREATE UNIQUE INDEX idx_unq_rental_rental_date_inventory_id_customer_id ON public.rental USING btree (rental_date, inventory_id, customer_id);


-- Name: film film_fulltext_trigger; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER film_fulltext_trigger BEFORE INSERT OR UPDATE ON public.film FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('fulltext', 'pg_catalog.english', 'title', 'description');

-- Name: actor last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.actor FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: address last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.address FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: category last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.category FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: city last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.city FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: country last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.country FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: customer last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.customer FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: film last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.film FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: film_actor last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.film_actor FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: film_category last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.film_category FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: inventory last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.inventory FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: language last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.language FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: rental last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.rental FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: staff last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.staff FOR EACH ROW EXECUTE PROCEDURE public.last_updated();

-- Name: store last_updated; Type: TRIGGER; Schema: public; Owner: postgres
CREATE TRIGGER last_updated BEFORE UPDATE ON public.store FOR EACH ROW EXECUTE PROCEDURE public.last_updated();
