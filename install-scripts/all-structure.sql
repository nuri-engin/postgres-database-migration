/**
    Target Server: PostgreSQL
    Server Version: 10

    PostgreSQL database dump
    Dumped from database version 10
    Dumped by pg_dump version 10
*/

DROP DATABASE postgres_sample;

-- Name: postgres_sample; Type: DATABASE; Schema: -; Owner: postgres
CREATE DATABASE postgres_sample WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';

ALTER DATABASE postgres_sample OWNER TO postgres;

\connect postgres_sample

-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.actor (actor_id, first_name, last_name, last_update) FROM stdin;
\.
COPY public.actor (actor_id, first_name, last_name, last_update) FROM '$$PATH$$/3057.dat';

-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.address (address_id, address, address2, district, city_id, postal_code, phone, last_update) FROM stdin;
\.
COPY public.address (address_id, address, address2, district, city_id, postal_code, phone, last_update) FROM '$$PATH$$/3065.dat';

-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.category (category_id, name, last_update) FROM stdin;
\.
COPY public.category (category_id, name, last_update) FROM '$$PATH$$/3059.dat';

-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.city (city_id, city, country_id, last_update) FROM stdin;
\.
COPY public.city (city_id, city, country_id, last_update) FROM '$$PATH$$/3067.dat';

-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.country (country_id, country, last_update) FROM stdin;
\.
COPY public.country (country_id, country, last_update) FROM '$$PATH$$/3069.dat';

-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active) FROM stdin;
\.
COPY public.customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active) FROM '$$PATH$$/3055.dat';

-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext) FROM stdin;
\.
COPY public.film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext) FROM '$$PATH$$/3061.dat';

-- Data for Name: film_actor; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.film_actor (actor_id, film_id, last_update) FROM stdin;
\.
COPY public.film_actor (actor_id, film_id, last_update) FROM '$$PATH$$/3062.dat';

-- Data for Name: film_category; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.film_category (film_id, category_id, last_update) FROM stdin;
\.
COPY public.film_category (film_id, category_id, last_update) FROM '$$PATH$$/3063.dat';

-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.inventory (inventory_id, film_id, store_id, last_update) FROM stdin;
\.
COPY public.inventory (inventory_id, film_id, store_id, last_update) FROM '$$PATH$$/3071.dat';

-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.language (language_id, name, last_update) FROM stdin;
\.
COPY public.language (language_id, name, last_update) FROM '$$PATH$$/3073.dat';

-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date) FROM stdin;
\.
COPY public.payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date) FROM '$$PATH$$/3075.dat';

-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) FROM stdin;
\.
COPY public.rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) FROM '$$PATH$$/3077.dat';

-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture) FROM stdin;
\.
COPY public.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture) FROM '$$PATH$$/3079.dat';

-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
COPY public.store (store_id, manager_staff_id, address_id, last_update) FROM stdin;
\.
COPY public.store (store_id, manager_staff_id, address_id, last_update) FROM '$$PATH$$/3081.dat';

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

-- Name: customer customer_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- Name: film_actor film_actor_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actor(actor_id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- Name: film_actor film_actor_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- Name: film_category film_category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- Name: film_category film_category_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- Name: film film_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(language_id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- Name: address fk_address_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.address
    ADD CONSTRAINT fk_address_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);

-- Name: city fk_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk_city FOREIGN KEY (country_id) REFERENCES public.country(country_id);

-- Name: inventory inventory_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- Name: payment payment_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;

-- Name: payment payment_rental_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_rental_id_fkey FOREIGN KEY (rental_id) REFERENCES public.rental(rental_id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Name: payment payment_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Name: rental rental_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Name: rental rental_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.inventory(inventory_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Name: rental rental_staff_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_staff_id_key FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);


-- Name: staff staff_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Name: store store_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Name: store store_manager_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_manager_staff_id_fkey FOREIGN KEY (manager_staff_id) REFERENCES public.staff(staff_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- PostgreSQL database dump complete
