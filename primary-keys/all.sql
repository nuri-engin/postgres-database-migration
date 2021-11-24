
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