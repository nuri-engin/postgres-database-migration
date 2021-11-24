
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
