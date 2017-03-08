--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- Name: address_standardizer_data_us; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;


--
-- Name: EXTENSION address_standardizer_data_us; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE points (
    id integer NOT NULL,
    stop_group_id integer,
    name text
);


ALTER TABLE points OWNER TO postgres;

--
-- Name: stop_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE stop_groups (
    id integer NOT NULL,
    name text
);


ALTER TABLE stop_groups OWNER TO postgres;

--
-- Name: stop_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stop_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stop_groups_id_seq OWNER TO postgres;

--
-- Name: stop_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stop_groups_id_seq OWNED BY stop_groups.id;


--
-- Name: stop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stop_id_seq OWNER TO postgres;

--
-- Name: stops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE stops (
    id integer DEFAULT nextval('stop_id_seq'::regclass) NOT NULL,
    location point,
    stop_group_id integer
);


ALTER TABLE stops OWNER TO postgres;

--
-- Name: stop_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stop_groups ALTER COLUMN id SET DEFAULT nextval('stop_groups_id_seq'::regclass);


--
-- Data for Name: points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY points (id, stop_group_id, name) FROM stdin;
840	\N	Sulechów
4128	\N	Rakowicka
4752	\N	PH
5246	\N	PB
8111	\N	PT
8931	\N	Marszowiec
9246	708	Jubilat
9578	144	Lipska
10729	104	Libertów Dolny
1	160	Mlynka Petla
2	\N	Zelków
3	\N	Balicka
4	81	UR Balicka
5	562	Mydlniki PKP
6	\N	Zakliki
7	658	Mydlniki
8	\N	Mydlniki Stawy
9	\N	Mydlniki I
10	\N	Podkamycze
11	\N	Podkamycze
12	\N	Mydlniki I
13	\N	Mydlniki Stawy
14	658	Mydlniki
15	658	Mydlniki
16	562	Mydlniki PKP
17	350	Rondo Ofiar Katynia
18	324	Katowicka
19	\N	Pasternik Cmentarz
20	103	Pasternik
21	\N	Ojcowska
22	\N	Bronowice Wielkie
23	350	Rondo Ofiar Katynia
24	350	Rondo Ofiar Katynia
25	324	Katowicka
26	\N	Pasternik Cmentarz
27	103	Pasternik
28	\N	Ojcowska
29	\N	Bronowice Wielkie
30	\N	Gaik I
31	\N	Gaik I
32	9	Tonie Skrzyzowanie
33	90	Pekowice
34	9	Tonie Skrzyzowanie
35	\N	Marszowiec
36	\N	Witkowice
37	\N	Witkowice Nowe
38	\N	Dozynkowa
39	71	Siewna Wiadukt
40	\N	Bociana
41	475	Górka Narodowa
42	536	Clepardia
43	656	Mackiewicza
44	428	Imbramowska
45	428	Imbramowska
46	656	Mackiewicza
47	656	Mackiewicza
48	536	Clepardia
49	71	Siewna Wiadukt
50	71	Siewna Wiadukt
51	\N	Bociana
52	\N	Dozynkowa
53	\N	Witkowice Nowe
54	\N	Kaczorówka
55	779	Wyki
56	632	Pachonskiego
57	\N	Pachonskiego I
58	\N	Pradnik  Bialy
59	766	Pleszowska
60	62	Opolska Kladka
61	\N	Krowodrza II
62	336	Pradnik Bialy
63	157	Opolska
64	157	Opolska
65	\N	Kaczorówka
66	779	Wyki
67	632	Pachonskiego
68	62	Opolska Kladka
69	\N	Pachonskiego I
70	336	Pradnik Bialy
71	766	Pleszowska
72	766	Pleszowska
73	595	Azory
74	376	Rózyckiego
75	\N	Stachiewicza
76	317	Lobzów PKP
77	\N	Lokietka
78	302	Wybickiego
79	726	Bratyslawska
80	692	Lekarska
81	229	Szpital Narutowicza
82	291	Urzad Marszalkowski
83	647	Wroclawska
84	376	Rózyckiego
85	\N	Lokietka
86	302	Wybickiego
87	291	Urzad Marszalkowski
88	647	Wroclawska
89	726	Bratyslawska
90	726	Bratyslawska
91	726	Bratyslawska
92	692	Lekarska
93	788	Zdrowa
94	461	Krowodrza Górka
95	519	Nowy Kleparz
96	\N	Plac Matejki
97	\N	Basztowa LOT
98	201	Grottgera
99	610	Teatr Bagatela
100	234	Plac Inwalidów
101	380	AGH
102	297	Czarnowiejska
103	604	Kawiory
104	430	Biprostal
105	525	Miasteczko Studenckie AGH
106	\N	Armii Krajowej 
107	94	Uniwersytet Pedagogiczny
108	7	Bronowice
109	606	Mazowiecka
110	606	Mazowiecka
111	430	Biprostal
112	430	Biprostal
113	430	Biprostal
114	430	Biprostal
115	7	Bronowice
116	7	Bronowice
117	\N	Armii Krajowej 
118	525	Miasteczko Studenckie AGH
119	525	Miasteczko Studenckie AGH
120	525	Miasteczko Studenckie AGH
121	604	Kawiory
122	297	Czarnowiejska
123	380	AGH
124	234	Plac Inwalidów
125	234	Plac Inwalidów
126	610	Teatr Bagatela
127	\N	Basztowa LOT
128	201	Grottgera
129	519	Nowy Kleparz
130	519	Nowy Kleparz
131	519	Nowy Kleparz
132	519	Nowy Kleparz
133	519	Nowy Kleparz
134	519	Nowy Kleparz
135	458	Dworzec Towarowy
136	\N	Cmentarz
137	234	Plac Inwalidów
138	77	Cichy Kacik
139	77	Cichy Kacik
140	257	Opolska Estakada
141	811	Uniwersytet Rolniczy
142	585	Lublanska
143	\N	Al.29 Listopada
144	507	Powstanców
145	611	Kuznicy Kollatajowskiej
146	\N	Stara Cegielnia
147	729	Pradnik Czerwony
148	786	Strzelców
149	388	Olszecka
150	470	Rondo Barei
151	470	Rondo Barei
152	251	Olsza II
153	622	Miechowity
154	\N	Brogi I
155	440	Batowice
156	197	Batowice PKP
157	466	Park Wodny
158	\N	Os.Oswiecenia
159	492	Okulickiego
160	334	Wislicka
161	\N	Os.Dywizjonu 303
162	131	Stella-Sawickiego
163	526	AWF
164	\N	Wieczysta
165	\N	Ugorek
166	337	Akacjowa
167	78	Rondo Mlynskie
168	320	Pilotów
169	125	Lukasiewicza
170	429	Narzymskiego
171	\N	Brogi
172	181	Uniwersytet Ekonomiczny
173	\N	Rakowicka
174	158	Bialucha
175	573	Dworzec Glówny
176	573	Dworzec Glówny
177	494	Lubicz
178	181	Uniwersytet Ekonomiczny
179	\N	Rakowicka
180	220	Rondo Mogilskie
181	429	Narzymskiego
182	636	Cmentarz Rakowicki
183	636	Cmentarz Rakowicki
184	636	Cmentarz Rakowicki
185	453	Biskupa Prandoty
186	\N	Brogi
187	\N	Brogi I
188	811	Uniwersytet Rolniczy
189	811	Uniwersytet Rolniczy
190	257	Opolska Estakada
191	257	Opolska Estakada
192	257	Opolska Estakada
193	585	Lublanska
194	\N	Al.29 Listopada
195	\N	Al.29 Listopada
196	\N	Al.29 Listopada
197	507	Powstanców
198	611	Kuznicy Kollatajowskiej
199	\N	Stara Cegielnia
200	729	Pradnik Czerwony
201	786	Strzelców
202	251	Olsza II
203	251	Olsza II
204	251	Olsza II
205	388	Olszecka
206	470	Rondo Barei
207	470	Rondo Barei
208	470	Rondo Barei
209	197	Batowice PKP
210	440	Batowice
211	466	Park Wodny
212	\N	Os.Oswiecenia
213	492	Okulickiego
214	334	Wislicka
215	334	Wislicka
216	334	Wislicka
217	\N	Os.Dywizjonu 303
218	\N	Ugorek
219	337	Akacjowa
220	320	Pilotów
221	78	Rondo Mlynskie
222	158	Bialucha
223	\N	Wieczysta
224	\N	Wieczysta
225	526	AWF
226	182	Radzikowskiego
227	519	Nowy Kleparz
228	\N	Basztowa LOT
229	494	Lubicz
230	494	Lubicz
231	610	Teatr Bagatela
232	64	Batorego
233	64	Batorego
234	141	Urzednicza
235	141	Urzednicza
236	\N	Balicka Wiadukt
237	\N	Balicka Wiadukt
238	591	Bronowice Male
239	194	Zarzecze
240	\N	Armii Krajowej I
241	194	Zarzecze
242	\N	Armii Krajowej I
243	\N	Tondosa
244	\N	Lajkonika
245	646	Strzelnica
246	72	Sielanka
247	73	Park Decjusza
248	358	Baba Jaga
249	524	ZOO
250	358	Baba Jaga
251	\N	Tondosa
252	646	Strzelnica
253	72	Sielanka
254	72	Sielanka
255	454	Kasztanowa
256	\N	Kopalina
257	5	Królowej Jadwigi
258	377	Chelm
259	654	Raczkiewicza
260	73	Park Decjusza
261	454	Kasztanowa
262	\N	Kopalina
263	377	Chelm
264	654	Raczkiewicza
265	5	Królowej Jadwigi
266	513	Zakamycze
267	584	Kosmowskiej
268	584	Kosmowskiej
269	448	Olszanica Kapliczka
270	\N	Port Lotniczy (Airport)
271	448	Olszanica Kapliczka
272	\N	Trzecia Góra
273	\N	Trzecia Góra
274	\N	Wegrzce Centrum
275	\N	Bibice Petla
276	\N	Narama
277	\N	Pielgrzymowice
278	\N	Górna Wies
279	\N	Zakonce
280	\N	Wola Zachariaszowska
281	\N	Droga do Garliczki
282	\N	Garlica Duchowna
283	\N	Garlica Murowana
284	\N	Podskale
285	136	Zielonki Rozjazd
286	136	Zielonki Rozjazd
287	136	Zielonki Rozjazd
288	136	Zielonki Rozjazd
289	\N	Podskale
290	\N	Garlica Murowana
291	\N	Garlica Duchowna
292	\N	Droga do Garliczki
293	\N	Wola Zachariaszowska
294	\N	Wola Zachariaszowska
295	\N	Zakonce
296	\N	Trojanowice Petla
297	\N	Trojanowice I
298	\N	Trojanowice I
299	520	Zielonki Transformator
300	634	Zielonki UG
301	\N	Zielonki Skrzyzowanie
302	520	Zielonki Transformator
303	634	Zielonki UG
304	\N	Zielonki Skrzyzowanie
305	592	Trojanowice Strugi
306	446	Trojanowice
307	23	Januszowice
308	23	Januszowice
309	446	Trojanowice
310	592	Trojanowice Strugi
311	\N	Owczary
312	\N	Owczary I
313	224	Brzozówka
314	\N	Brzozówka Sklep
315	\N	Przybyslawice I
316	\N	Przybyslawice II
317	\N	Owczary I
318	224	Brzozówka
319	\N	Brzozówka Sklep
320	\N	Przybyslawice I
321	\N	Przybyslawice II
322	439	Droga do Rzaski
323	772	Rzaska Jednostka Wojskowa
324	281	Rzaska UR
325	414	Rzaska
326	360	Rzaska Autostrada
327	439	Droga do Rzaski
328	439	Droga do Rzaski
329	772	Rzaska Jednostka Wojskowa
330	281	Rzaska UR
331	414	Rzaska
332	264	Modlniczka Mala
333	542	Zabierzów Dzialki
334	311	Zabierzów
335	809	Zabierzów Sklep
336	714	Zabierzów Piekarnia
337	\N	Zabierzów I
338	\N	Zabierzów Piaski
339	\N	Zabierzów PKP
340	\N	Zielona
341	\N	Zielona
342	\N	Zabierzów PKP
343	\N	Zabierzów Piaski
344	\N	Zabierzów I
345	714	Zabierzów Piekarnia
346	809	Zabierzów Sklep
347	311	Zabierzów
348	542	Zabierzów Dzialki
349	264	Modlniczka Mala
350	264	Modlniczka Mala
351	\N	Bolechowice I
352	\N	Bolechowice II
353	531	Bolechowice
354	531	Bolechowice
355	\N	Bolechowice II
356	\N	Bolechowice I
357	\N	Zelków Wola
358	\N	Zelków Staw
359	\N	Zelków II
360	\N	Zelków I
361	\N	Zelków I
362	\N	Zelków II
363	\N	Zelków Staw
364	\N	Zelków Wola
365	\N	Zabierzów Osrodek Zdrowia
366	\N	Kochanów I
367	\N	Kochanów
368	\N	Droga do Niegoszowic
369	\N	Zabierzów Osrodek Zdrowia
370	\N	Kochanów I
371	\N	Kochanów
372	\N	Droga do Niegoszowic
373	\N	Rudawa
374	\N	Mlynka I
375	\N	Rudawa
376	\N	Mlynka I
377	260	Szczyglice
378	\N	Balice Autostrada
379	\N	Balice Szkola
380	\N	Balice Instytut
381	\N	Szczyglice Most
382	\N	Szczyglice Autostrada 
383	\N	Balice Szkola
384	\N	Balice Autostrada
385	\N	Balice Autostrada
386	\N	Balice Autostrada
387	\N	Balice Autostrada
388	\N	Skala Kmity
389	260	Szczyglice
390	260	Szczyglice
391	\N	Szczyglice Autostrada 
392	\N	Szczyglice Most
393	\N	Balice I
394	\N	Balice I
395	\N	Balice II
396	\N	Balice II
397	395	Olszanica Bory
398	395	Olszanica Bory
399	\N	Chrosna
400	\N	Chrosna Studnia
401	\N	Chrosna Sklep
402	\N	Chrosna Kapliczka
403	\N	Morawica Mostek
404	\N	Morawica Krzyzówka
405	\N	Morawica
406	\N	Morawica Cmentarz
407	\N	Morawica Krzyzówka
408	\N	Morawica Cmentarz
409	\N	Morawica Mostek
410	\N	Chrosna Kapliczka
411	\N	Chrosna Sklep
412	\N	Chrosna Studnia
413	\N	Aleksandrowice
414	\N	Aleksandrowice Osiedle
415	\N	Winna Góra
416	\N	Aleksandrowice
417	\N	Aleksandrowice Osiedle
418	\N	Winna Góra
419	\N	Brzoskwinia Koziary
420	\N	Brzoskwinia Sklep
421	\N	Brzoskwinia Kamyk
422	\N	Brzoskwinia
423	\N	Brzoskwinia Kamyk
424	\N	Brzoskwinia Sklep
425	555	Kopiec Kosciuszki
426	\N	Kryspinów Zalew
427	\N	Kryspinów Zalew
428	\N	Czulów
429	\N	Czulów II
430	\N	Czulów I
431	32	Mników Sklep
432	648	Droga do Kaszowa
433	688	Dziady
434	\N	Czulów II
435	\N	Czulów I
436	32	Mników Sklep
437	648	Droga do Kaszowa
438	688	Dziady
439	200	Cholerzyn Granica
440	593	Cholerzyn Skrzyzowanie
441	277	Cholerzyn Sklep
442	695	Cholerzyn
443	200	Cholerzyn Granica
444	593	Cholerzyn Skrzyzowanie
445	277	Cholerzyn Sklep
446	695	Cholerzyn
447	\N	Budzyn
448	\N	Budzyn I
449	\N	Budzyn I
450	\N	Budzyn
451	493	Kryspinów Sanka
452	515	Kryspinów
453	472	Granica Miasta
454	375	Bielany
455	48	Bielany Szkola
456	556	Bielany Klasztor
457	84	Wodociagi
458	\N	Skalna
459	\N	Skalna
460	556	Bielany Klasztor
461	48	Bielany Szkola
462	472	Granica Miasta
463	515	Kryspinów
464	515	Kryspinów
465	493	Kryspinów Sanka
466	84	Wodociagi
467	84	Wodociagi
468	\N	Bielanska
469	\N	Stopien Wodny
470	\N	Piekary I
471	\N	Piekary II
472	192	Piekary Sklep
473	34	Piekary
474	\N	Borki
475	\N	Bielanska
476	\N	Stopien Wodny
477	\N	Piekary I
478	\N	Piekary II
479	192	Piekary Sklep
480	34	Piekary
481	\N	Borki
482	132	Bielanskie Skaly
483	630	Na Krepaku
484	\N	Zaskale
485	710	Przegorzaly
486	\N	Glinnik
487	\N	S.I.Robotnik
488	132	Bielanskie Skaly
489	630	Na Krepaku
490	710	Przegorzaly
491	\N	Glinnik
492	\N	S.I.Robotnik
493	241	Nowa Wies Szlachecka
494	14	Nowa Wies Kosciól
495	296	Nowa Wies
496	460	Nowa Wies Kapliczka
497	473	Kaszów II
498	538	Kaszów Tyralówka
499	671	Kaszów Lysa Góra
500	758	Liszki Krzyzówka
501	321	Liszki UG
502	\N	Liszki II
503	438	Liszki I
504	\N	Borki I
505	14	Nowa Wies Kosciól
506	296	Nowa Wies
507	460	Nowa Wies Kapliczka
508	473	Kaszów II
509	538	Kaszów Tyralówka
510	671	Kaszów Lysa Góra
511	758	Liszki Krzyzówka
512	321	Liszki UG
513	321	Liszki UG
514	438	Liszki I
515	\N	Liszki II
516	\N	Borki I
517	174	Wyzral
518	787	Wyzral Szkola
519	529	Wyzral Wielka Droga
520	575	Wyzral I
521	174	Wyzral
522	787	Wyzral Szkola
523	529	Wyzral Wielka Droga
524	575	Wyzral I
525	206	Raczna Kapliczka
526	206	Raczna Kapliczka
527	397	Czernichów
528	\N	Czernichów Studzienki
529	255	Zagacie II
530	516	Zagacie I
531	\N	Czernichów Studzienki
532	255	Zagacie II
533	516	Zagacie I
534	\N	Sciejowice Granica
535	\N	Raczna I
536	\N	Sciejowice
537	\N	Droga do Jeziorzan
538	\N	Jeziorzany I
539	\N	Jeziorzany
540	\N	Jeziorzany I
541	\N	Droga do Jeziorzan
542	\N	Raczna II
543	\N	Raczna I
544	\N	Sciejowice
545	\N	Sciejowice Granica
546	\N	Ksiecia Józefa
547	\N	Ksiecia Józefa
548	279	Malczewskiego
549	279	Malczewskiego
550	63	Salwator
551	63	Salwator
552	63	Salwator
553	215	Slonecznikowa
554	185	Hofmana
555	625	Przegon
556	364	Instytut Reumatologii
557	505	Cracovia
558	708	Jubilat
559	\N	Reymana
560	436	Filharmonia
561	\N	Pl.Wszystkich Swietych
562	394	Wawel
563	215	Slonecznikowa
564	625	Przegon
565	364	Instytut Reumatologii
566	505	Cracovia
567	505	Cracovia
568	505	Cracovia
569	505	Cracovia
570	708	Jubilat
571	\N	Reymana
572	74	Uniwersytet Jagiellonski
573	\N	Wegrzce Starostwo Powiatowe
574	396	Wegrzce
575	\N	Bibice I
576	\N	Wegrzce Starostwo Powiatowe
577	396	Wegrzce
578	396	Wegrzce
579	\N	Bibice I
580	807	Bibice
581	790	Michalowice
582	790	Michalowice
583	807	Bibice
584	\N	Michalowice Komora
585	\N	Michalowice Komora
586	\N	Michalowice I
587	391	Maslomiaca
588	\N	Michalowice Lecznica
589	\N	Michalowice II
590	\N	Laskowiec
591	\N	Warszówka
592	\N	Michalowice III
593	\N	Michalówka
594	\N	Gosciniec
595	\N	Michalowice I
596	391	Maslomiaca
597	\N	Michalowice Lecznica
598	\N	Michalowice II
599	\N	Warszówka
600	\N	Laskowiec
601	\N	Michalowice III
602	\N	Michalówka
603	\N	Gosciniec
604	\N	Kozierów Skrzyzowanie
605	\N	Zerkowice Kolonia
606	\N	Zerkowice Skrzyzowanie
607	\N	Krasieniec Stary
608	\N	Krasieniec Remiza
609	\N	Kozierów Skrzyzowanie
610	\N	Zerkowice Kolonia
611	\N	Zerkowice Skrzyzowanie
612	\N	Krasieniec Stary
613	\N	Krasieniec Remiza
614	\N	Maslomiaca I
615	222	Wieclawice Stare
616	\N	Pielgrzymowice II
617	\N	Pielgrzymowice I
618	\N	Maslomiaca I
619	222	Wieclawice Stare
620	\N	Pielgrzymowice II
621	\N	Pielgrzymowice I
622	\N	Batowice I
623	\N	Batowice Kapliczka
624	\N	Dlubnia
625	\N	Raciborowice
626	\N	Raciborowice I
627	\N	Zastów
628	\N	Batowice I
629	\N	Batowice Kapliczka
630	\N	Dlubnia
631	\N	Raciborowice
632	\N	Raciborowice I
633	591	Bronowice Male
634	\N	Pl.Wszystkich Swietych
635	436	Filharmonia
636	436	Filharmonia
637	436	Filharmonia
638	394	Wawel
639	743	Sw. Gertrudy
640	743	Sw. Gertrudy
641	310	Poczta Glówna
642	359	Starowislna
643	307	Stradom
644	83	Plac Wolnica
645	704	Hala Targowa
646	307	Stradom
647	307	Stradom
648	83	Plac Wolnica
649	554	Sw. Wawrzynca
650	359	Starowislna
651	359	Starowislna
652	310	Poczta Glówna
653	310	Poczta Glówna
654	704	Hala Targowa
655	554	Sw. Wawrzynca
656	444	Rondo Grzegórzeckie
657	503	Francesco Nullo
658	444	Rondo Grzegórzeckie
659	444	Rondo Grzegórzeckie
660	503	Francesco Nullo
661	169	Ofiar Dabia
662	613	Dabie
663	\N	Nowohucka
664	\N	M1  Nowohucka
665	169	Ofiar Dabia
666	169	Ofiar Dabia
667	613	Dabie
668	\N	M1  Nowohucka
669	\N	Nowohucka
670	530	Elektrocieplownia Kraków
671	633	Mistrzejowice
672	\N	Mistrzejowice I
673	633	Mistrzejowice
674	\N	Mistrzejowice I
675	\N	Os.Piastów
676	56	Piasta Kolodzieja
677	568	Popielidów
678	286	Kruszwicka
679	728	Kleeberga
680	650	Rondo Piastowskie
681	564	Kupaly
682	46	Dunikowskiego
683	\N	Os.Strusia
684	\N	Os.Na Lotnisku
685	67	DH Wanda
686	\N	Szpital Rydygiera I
687	50	Lowinskiego
688	408	Nowolipki
689	60	Makuszynskiego
690	\N	Pralnia
691	\N	Bienczyce Mleczarnia
692	\N	Kocmyrzowska
693	509	Os.Kosciuszkowskie
694	609	Marii Dabrowskiej
695	163	Medweckiego
696	621	Czyzyny
697	449	Rondo Czyzynskie
698	624	Centralna
699	551	Soltysowska
700	\N	Os.Kolorowe
701	\N	Plac Centralny
702	226	Aleja Przyjazni
703	478	Aleja Róz
704	801	Zeromskiego
705	\N	Os.Zgody
706	599	Rondo Kocmyrzowskie
707	793	Teatr Ludowy
708	\N	Os.Górali
709	\N	Os.Zielone
710	433	Struga
711	\N	Os.Na Skarpie
712	37	Klasztor Cystersów
713	\N	Os.Wandy
714	164	Klasztorna
715	\N	Os.Willowe
716	\N	Orkana
717	\N	Bulwarowa
718	187	Wiadukty
719	167	Darwina
720	\N	Os.Na Stoku Szkola
721	800	Architektów
722	166	Piekarnia
723	\N	Jagielly
724	565	Wzgórza Krzeslawickie
725	304	Grebalów
726	19	Zeslawice
727	304	Grebalów
728	565	Wzgórza Krzeslawickie
729	565	Wzgórza Krzeslawickie
730	565	Wzgórza Krzeslawickie
731	565	Wzgórza Krzeslawickie
732	800	Architektów
733	166	Piekarnia
734	\N	Os.Na Stoku Szkola
735	167	Darwina
736	167	Darwina
737	167	Darwina
738	187	Wiadukty
739	187	Wiadukty
740	\N	Bienczyce Mleczarnia
741	\N	Pralnia
742	60	Makuszynskiego
743	\N	Kocmyrzowska
744	\N	Jagielly
745	408	Nowolipki
746	50	Lowinskiego
747	\N	Szpital Rydygiera I
748	564	Kupaly
749	\N	Bienczyce Mleczarnia
750	\N	Cedynska
751	650	Rondo Piastowskie
752	728	Kleeberga
753	286	Kruszwicka
754	568	Popielidów
755	56	Piasta Kolodzieja
756	\N	Os.Piastów
757	\N	Os.Piastów
758	46	Dunikowskiego
759	46	Dunikowskiego
760	46	Dunikowskiego
761	\N	Bienczyce
762	\N	Bienczyce
763	\N	Os.Strusia
764	\N	Os.Na Lotnisku
765	\N	Os.Na Lotnisku
766	67	DH Wanda
767	67	DH Wanda
768	67	DH Wanda
769	509	Os.Kosciuszkowskie
770	609	Marii Dabrowskiej
771	163	Medweckiego
772	621	Czyzyny
773	449	Rondo Czyzynskie
774	449	Rondo Czyzynskie
775	449	Rondo Czyzynskie
776	449	Rondo Czyzynskie
777	\N	Os.Kolorowe
778	599	Rondo Kocmyrzowskie
779	\N	Os.Zgody
780	793	Teatr Ludowy
781	793	Teatr Ludowy
782	\N	Os.Górali
783	801	Zeromskiego
784	801	Zeromskiego
785	478	Aleja Róz
786	478	Aleja Róz
787	478	Aleja Róz
788	\N	Os.Zielone
789	624	Centralna
790	624	Centralna
791	551	Soltysowska
792	\N	Plac Centralny
793	\N	Plac Centralny
794	\N	Plac Centralny
795	\N	Plac Centralny
796	433	Struga
797	433	Struga
798	\N	Os.Na Skarpie
799	\N	Os.Na Skarpie
800	164	Klasztorna
801	164	Klasztorna
802	37	Klasztor Cystersów
803	\N	Os.Willowe
804	\N	Bulwarowa
805	\N	Brama nr 4
806	\N	Brama nr 5
807	\N	Koksochemia
808	292	Pleszów
809	\N	Mrozowa
810	776	Blokowa
811	\N	Agencja Kraków Wschód
812	58	Walcownia
813	431	Elektromontaz
814	227	Zajezdnia Nowa Huta
815	\N	PH
816	642	Lubocza PKP
817	409	Lubocza Bugaj
818	724	Lubocza Przychodnia
819	292	Pleszów
820	292	Pleszów
821	\N	Koksochemia
822	\N	Brama nr 5
823	\N	Brama nr 4
824	812	Kombinat
825	\N	Mrozowa
826	776	Blokowa
827	227	Zajezdnia Nowa Huta
828	431	Elektromontaz
829	431	Elektromontaz
830	431	Elektromontaz
831	642	Lubocza PKP
832	\N	Agencja Kraków Wschód
833	409	Lubocza Bugaj
834	724	Lubocza Przychodnia
835	626	Luborzyca
836	495	Luborzyca I
837	499	Kocmyrzów
838	\N	Dojazdów Dzialki
839	\N	Dojazdów PKS
841	\N	Prusy WSR
842	\N	Prusy Szkola
843	\N	Prusy
844	\N	Prusy
845	\N	Prusy Szkola
846	\N	Prusy WSR
847	\N	Sulechów
848	\N	Dojazdów PKS
849	499	Kocmyrzów
850	495	Luborzyca I
851	\N	Luczanowice
852	\N	Wadów Osiedle
853	\N	Wadów
854	\N	Wadów
855	\N	Wadów Osiedle
856	\N	Wegrzynowice
857	\N	Wegrzynowice Centrum
858	\N	Wegrzynowice Centrum
859	\N	Wegrzynowice I
860	\N	Wadów Dzialki
861	\N	Wadów Tunel
862	\N	Wadów Dzialki
863	\N	Wegrzynowice I
864	\N	Czulice I
865	\N	Droga do Czulic
866	\N	Os.Nowe
867	\N	Wrózenice
868	\N	Rozjazd
869	\N	Koscielniki
870	\N	Resztówka
871	\N	Zablocie Koscielnickie
872	\N	Krzyzówka
873	\N	Blonia Koscielnickie
874	\N	Janówka
875	\N	Wyciaze I
876	\N	Droga do Branic
877	\N	Zaklad Przeróbki
878	\N	Branice Pagórek
879	\N	Wyciaze Sklep
880	\N	Wyciaze II
881	\N	Podstawie
882	\N	Drozyska
883	\N	Zaklad Przeróbki
884	\N	Droga do Branic
885	\N	Droga do Branic
886	\N	Droga do Branic
887	\N	Branice Pagórek
888	\N	Wyciaze
889	\N	Wyciaze Sklep
890	\N	Wyciaze II
891	\N	Podstawie
892	\N	Drozyska
893	\N	Wyciaze I
894	\N	Ruszcza Cmentarz
895	\N	Ruszcza
896	\N	Ruszcza Cmentarz
897	\N	Wyciaze Wiadukt
898	\N	Janówka
899	\N	Blonia Koscielnickie
900	\N	Krzyzówka
901	\N	Zablocie Koscielnickie
902	\N	Resztówka
903	\N	Koscielniki
904	\N	Rozjazd
905	\N	Droga do Czulic
906	\N	Os.Nowe
907	\N	Czulice I
908	235	Clo
909	\N	Wolica II
910	\N	Wolica I
911	\N	Wolica I
912	\N	Wolica II
913	235	Clo
914	\N	Wyciaze Wiadukt
915	\N	Chalupki
916	\N	Droga do Pleszowa
917	\N	Droga do Pleszowa
918	\N	Przylasek Rusiecki
919	\N	Wolica Most
920	\N	Wolica Las
921	\N	Wolica Kosciól
922	\N	Wolica
923	\N	Wolica Sklep
924	\N	Bartnicza
925	\N	Siejówka
926	\N	Przylasek Wyciaski
927	\N	Przylasek Wyciaski
928	\N	Siejówka
929	\N	Bartnicza
930	\N	Wolica Sklep
931	\N	Wolica Kosciól
932	\N	Wolica Las
933	\N	Wolica
934	\N	Wolica Most
935	\N	Kujawy
936	\N	Dymarek
937	\N	Dymarek
938	\N	Leg
939	\N	Na Zaleczu I
940	617	Na Zaleczu
941	\N	Lesisko
942	\N	Na Zaleczu I
943	\N	Zakole Wisly
944	170	Stoczniowców
945	437	Saska
946	309	Szczecinska
947	765	Lanowa
948	434	Plaszów Szkola
949	563	Motyla
950	\N	Zalew Bagry
951	498	Kuklinskiego
952	763	Limanowskiego
953	736	Korona
954	\N	Os.Podwawelskie
955	598	Kapelanka
956	147	Slomiana
957	\N	Baluckiego
958	672	Rynek Debnicki
959	686	Zielinskiego
960	\N	Os.Robotnicze
961	24	Kobierzynska
962	139	Grota Roweckiego
963	615	Rostworowskiego
964	\N	Bulgarska
965	637	Tyniec Kamieniolom
966	\N	Katy
967	\N	Waly Wislane II
968	\N	Kostrze Kapliczka
969	\N	Dabrowa
970	117	Kostrze
971	\N	Podgórki Tynieckie I
972	544	Podgórki Tynieckie
973	\N	Podgórki Tynieckie I
974	173	Skotniki Szkola
975	117	Kostrze
976	\N	Dabrowa
977	\N	Kostrze Kapliczka
978	\N	Waly Wislane II
979	\N	Os.Robotnicze
980	686	Zielinskiego
981	\N	Most Grunwaldzki
982	\N	Most Grunwaldzki
983	\N	Most Grunwaldzki
984	\N	Most Grunwaldzki
985	754	Szwedzka
986	754	Szwedzka
987	147	Slomiana
988	139	Grota Roweckiego
989	\N	Ruczaj I
990	615	Rostworowskiego
991	355	Ruczaj
992	\N	Bulgarska
993	\N	Os.Podwawelskie
994	697	Rzemieslnicza
995	266	Borsucza
996	\N	PT
997	\N	Kamienskiego Wiadukt
998	306	Kamienskiego
999	\N	Kamienskiego Wiadukt
1000	697	Rzemieslnicza
1001	386	Rondo Matecznego
1002	386	Rondo Matecznego
1003	386	Rondo Matecznego
1004	736	Korona
1005	266	Borsucza
1006	763	Limanowskiego
1007	86	Powstanców Wielkopolskich
1008	86	Powstanców Wielkopolskich
1009	86	Powstanców Wielkopolskich
1010	498	Kuklinskiego
1011	498	Kuklinskiego
1012	\N	Zakole Wisly
1013	170	Stoczniowców
1014	170	Stoczniowców
1015	170	Stoczniowców
1016	437	Saska
1017	144	Lipska
1018	309	Szczecinska
1019	31	Rzebika
1020	765	Lanowa
1021	427	Maly Plaszów
1022	209	Farmina
1023	427	Maly Plaszów
1024	209	Farmina
1025	316	Dworcowa
1026	406	Malborska
1027	561	Makowa
1028	\N	Malborska I
1029	579	Wola Duchacka
1030	258	Biezanowska
1031	\N	Os.Na Kozlówce
1032	87	Dauna
1033	713	Prosta
1034	145	Wlotowa
1035	\N	Prokocim  Rynek
1036	\N	Mlodziezy
1037	\N	Mlodziezy
1038	\N	Prokocim  Rynek
1039	713	Prosta
1040	258	Biezanowska
1041	258	Biezanowska
1042	258	Biezanowska
1043	87	Dauna
1044	145	Wlotowa
1045	316	Dworcowa
1046	306	Kamienskiego
1047	561	Makowa
1048	406	Malborska
1049	579	Wola Duchacka
1050	579	Wola Duchacka
1051	\N	Malborska I
1052	\N	Brzegi
1053	411	Brzegi I
1054	411	Brzegi I
1055	\N	Przewóz I
1056	\N	Wrobela
1057	410	Podwierzbie
1058	\N	Wrobela
1059	\N	Przewóz I
1060	\N	Nad Drwina
1061	372	Póllanki
1062	\N	Szparagowa
1063	\N	Plk. Dabka
1064	\N	Plk. Dabka
1065	\N	Biskupinska
1066	485	Instal
1067	\N	Szparagowa
1068	\N	Szparagowa
1069	\N	Biezanów Szkola
1070	\N	Sucharskiego
1071	\N	Biezanów Szkola
1072	\N	Sucharskiego
1073	415	Jasienskiego
1074	\N	Sucharskiego I
1075	\N	Biezanów Potrzask
1076	\N	Pruszynskiego
1077	\N	Biezanów Kaim
1078	\N	Fabryka Drozdzy
1079	\N	Ks.Laczka
1080	\N	Biezanów Nowy
1081	\N	Biezanów  Nowy
1082	753	Cwiklinskiej
1083	711	Teligi
1084	12	Prokocim Szpital
1085	\N	Wydzial Farmaceutyczny UJ
1086	742	Dom Spokojnej Starosci
1087	20	Piaski Wielkie
1088	\N	Kosocicka II
1089	53	Wielicka
1090	\N	Prokocim CPN
1091	\N	Ks.Laczka
1092	\N	Biezanów Cmentarz
1093	\N	Biezanów Nowy
1094	\N	Biezanów Nowy
1095	753	Cwiklinskiej
1096	711	Teligi
1097	12	Prokocim Szpital
1098	12	Prokocim Szpital
1099	742	Dom Spokojnej Starosci
1100	679	Prokocim UJ
1101	679	Prokocim UJ
1102	679	Prokocim UJ
1103	\N	Prokocim CPN
1104	53	Wielicka
1105	\N	Kosocicka II
1106	\N	Sucharskiego I
1107	415	Jasienskiego
1108	365	Biezanów
1109	\N	Forty
1110	\N	Rajsko Sklep
1111	3	Soboniowice
1112	\N	Soboniowice II
1113	96	Grabówki
1114	\N	Krzemieniecka
1115	\N	Barycz
1116	\N	Barycz I
1117	318	Kosocice
1118	\N	Luzycka
1119	663	Kurdwanów Szkola
1120	\N	Os.Kurdwanów
1121	701	Stojalowskiego
1122	\N	Cechowa
1123	\N	Studnia Miejska
1124	313	Tuchowska
1125	543	Nowosadecka
1126	99	Witosa
1127	99	Witosa
1128	456	Karpinskiego
1129	543	Nowosadecka
1130	543	Nowosadecka
1131	442	Piaski Nowe
1132	442	Piaski Nowe
1133	\N	Studnia Miejska
1134	\N	Cechowa
1135	\N	Luzycka
1136	663	Kurdwanów Szkola
1137	\N	Os.Kurdwanów
1138	701	Stojalowskiego
1139	20	Piaski Wielkie
1140	20	Piaski Wielkie
1141	318	Kosocice
1142	\N	Kosocice II
1143	\N	Barycz I
1144	\N	Barycz
1145	\N	Krzemieniecka
1146	\N	Rajsko Sklep
1147	3	Soboniowice
1148	\N	Soboniowice II
1149	\N	Forty
1150	15	Golkowice
1151	41	Zbydniowice Szkola
1152	\N	Lusina Dolna
1153	339	Ukraina
1154	\N	Krakówka
1155	\N	Lusina I
1156	785	Wróblowice Rozwidlenie
1157	\N	Chalubinskiego
1158	\N	Wróblowice Szkola
1159	\N	Pytlasinskiego
1160	673	Swoszowice
1161	361	Swoszowice Poczta
1162	98	Swoszowice Pawilon
1163	577	Swoszowice Sklep
1164	482	Zdrojowa
1165	\N	Swoszowice Uzdrowisko
1166	202	Wilga
1167	\N	Swoszowice Osiedle
1168	441	Swoszowice Autostrada
1169	558	Myslenicka
1170	352	Halszki
1171	210	Bujaka
1172	299	Kurdwanów
1173	\N	Zywiecka
1174	756	Góra Borkowska
1175	243	Las Borkowski
1176	287	Zawila
1177	803	Skosna
1178	792	Borkowska
1179	469	Forteczna
1180	\N	Zawiszy
1181	\N	Os.Kliny
1182	\N	Narwik
1183	151	Judyma
1184	178	Opatkowice Wiadukt
1185	755	Opatkowice
1186	755	Opatkowice
1187	178	Opatkowice Wiadukt
1188	247	Kapielowa
1189	247	Kapielowa
1190	469	Forteczna
1191	792	Borkowska
1192	151	Judyma
1193	287	Zawila
1194	243	Las Borkowski
1195	756	Góra Borkowska
1196	803	Skosna
1197	171	Borek Falecki
1198	547	Solvay
1199	299	Kurdwanów
1200	299	Kurdwanów
1201	210	Bujaka
1202	352	Halszki
1203	352	Halszki
1204	558	Myslenicka
1205	558	Myslenicka
1206	441	Swoszowice Autostrada
1207	\N	Swoszowice Osiedle
1208	202	Wilga
1209	482	Zdrojowa
1210	577	Swoszowice Sklep
1211	361	Swoszowice Poczta
1212	98	Swoszowice Pawilon
1213	673	Swoszowice
1214	673	Swoszowice
1215	\N	Pytlasinskiego
1216	\N	Wróblowice Szkola
1217	\N	Chalubinskiego
1218	785	Wróblowice Rozwidlenie
1219	\N	Krakówka
1220	339	Ukraina
1221	\N	Lusina Dolna
1222	41	Zbydniowice Szkola
1223	778	Brücknera
1224	4	Skotniki
1225	514	Babinskiego
1226	385	Kobierzyn
1227	\N	Sidzina Skrzyzowanie
1228	\N	Sidzina Skrzyzowanie
1229	778	Brücknera
1230	4	Skotniki
1231	4	Skotniki
1232	514	Babinskiego
1233	385	Kobierzyn
1234	\N	Podlipki
1235	384	Sidzina
1236	\N	Podlipki
1237	\N	Os.Radziszowskie
1238	\N	Radziszowska
1239	100	Skawina
1240	425	Skawina Rynek
1241	703	Skawina Cmentarz
1242	\N	Skawina Pawilon
1243	699	Skawina Podlipki
1244	175	Skawina Rzepnik
1245	\N	Radziszowska
1246	703	Skawina Cmentarz
1247	175	Skawina Rzepnik
1248	699	Skawina Podlipki
1249	\N	Os.Radziszowskie
1250	\N	Radziszów Wlosanka
1251	\N	Radziszów Zadworze
1252	152	Radziszów Centrum
1253	239	Radziszów Kamionna
1254	239	Radziszów Kamionna
1255	152	Radziszów Centrum
1256	\N	Radziszów Zadworze
1257	\N	Radziszów Wlosanka
1258	\N	Gaj Szkola
1259	\N	Gaj Zadziele
1260	\N	Mogilany Osrodek Zdrowia
1261	\N	Gaj Zadziele
1262	\N	Gaj Szkola
1263	\N	Radziszów
1264	\N	Stare Sanatorium
1265	\N	Radziszów Lesniczówka
1266	\N	Radziszów Podlesie
1267	\N	Radziszów Podlesie
1268	\N	Stare Sanatorium
1269	\N	Konary
1270	\N	Konary I
1271	\N	Lusina Górka
1272	\N	Dobrzyczany
1273	\N	Krasnik
1274	\N	Zagrody
1275	\N	Zagrody
1276	\N	Krasnik
1277	\N	Dobrzyczany
1278	\N	Lusina Górka
1279	\N	Konary I
1280	\N	Konary Wlosan
1281	\N	Mogilany Wlosan
1282	\N	Mogilany Wlosan
1283	\N	Konary Wlosan
1284	\N	Wlosan
1285	\N	Wlosan Krzyzówka
1286	\N	Wlosan Kopan
1287	\N	Wlosan Kopan
1288	\N	Wlosan Krzyzówka
1289	\N	Spadochroniarzy
1290	\N	Spadochroniarzy
1291	\N	Bienczyce
1292	\N	Bienczyce
1293	\N	Ajka
1294	\N	Ajka
1295	\N	Glogera I
1296	\N	Glogera I
1297	\N	Glogera
1298	\N	Glogera
1299	107	Bora-Komorowskiego
1300	107	Bora-Komorowskiego
1301	\N	Ogródki Dzialkowe
1302	\N	Ogródki Dzialkowe
1303	731	Zlocien
1304	755	Opatkowice
1305	216	Podgaje
1306	216	Podgaje
1307	399	Taklinskiego
1308	399	Taklinskiego
1309	329	Sidzina Olszyny
1310	329	Sidzina Olszyny
1311	\N	Opatkowice CPN
1312	\N	Opatkowice CPN
1313	\N	Podstawki
1314	\N	Podstawki
1315	278	Smolenskiego
1316	278	Smolenskiego
1317	\N	PB
1318	\N	PW
1319	\N	PP
1320	548	Dworzec Plaszów
1321	\N	Gaik
1322	\N	Gaik
1323	198	Tonie Katy
1324	198	Tonie Katy
1325	54	Siewna
1326	54	Siewna
1327	591	Bronowice Male
1328	591	Bronowice Male
1329	\N	Ruczaj I
1330	\N	Ruczaj I
1331	236	Conrada
1332	236	Conrada
1333	740	Oleandry
1334	740	Oleandry
1335	196	Zachodnia
1336	196	Zachodnia
1337	63	Salwator
1338	284	Lutnia
1339	171	Borek Falecki
1340	316	Dworcowa
1341	74	Uniwersytet Jagiellonski
1342	\N	Wybickiego I
1343	\N	Wybickiego I
1344	331	Krowoderskich Zuchów
1345	331	Krowoderskich Zuchów
1346	751	Kabel
1347	751	Kabel
1348	406	Malborska
1349	\N	Soboniowice I
1350	\N	Soboniowice I
1351	\N	Kosocice I
1352	\N	Kosocice I
1353	\N	Majora I
1354	728	Kleeberga
1355	30	Szpital Rydygiera
1356	\N	Os.Jagiellonskie
1357	\N	Os.Jagiellonskie
1358	651	Arka
1359	651	Arka
1360	\N	Bulwarowa I
1361	\N	Szpital Zeromskiego
1362	\N	Szpital Zeromskiego
1363	\N	Klasztorna I
1364	\N	Klasztorna I
1365	\N	Stawy
1366	\N	Stawy
1367	\N	Las Mogilski
1368	\N	Las Mogilski
1369	649	Jugowicka
1370	649	Jugowicka
1371	\N	Plac Centralny
1372	\N	Plac Centralny
1373	161	Torfowa
1374	712	Biezanów Bazy
1375	712	Biezanów Bazy
1376	150	Bacutil
1377	150	Bacutil
1378	\N	Rybitwy Rozjazd
1379	\N	Rybitwy Rozjazd
1380	\N	Rybitwy Dom Kultury
1381	\N	Rybitwy Dom Kultury
1382	\N	Rybitwy Sklep
1383	\N	Rybitwy Sklep
1384	567	Jezowa
1385	\N	Fabryka Mebli
1386	\N	Fabryka Mebli
1387	423	Hejnal
1388	423	Hejnal
1389	49	Plac Bohaterów Getta
1390	49	Plac Bohaterów Getta
1391	86	Powstanców Wielkopolskich
1392	86	Powstanców Wielkopolskich
1393	375	Bielany
1394	375	Bielany
1395	63	Salwator
1396	\N	Wegrzynowice II
1397	\N	Wegrzynowice II
1398	\N	Parowozownia
1399	\N	Parowozownia
1400	\N	Wadów Osr.Pracy
1401	\N	Wadów Osr.Pracy
1402	\N	Wadów os.Kolejowe
1403	\N	Wadów os.Kolejowe
1404	\N	Wadów Szkola
1405	\N	Wadów Szkola
1406	\N	Luczanowice Skrzyzowanie
1407	\N	Luczanowice Skrzyzowanie
1408	\N	Luczanowice I
1409	\N	Luczanowice I
1410	\N	Wadowska
1411	\N	Wadowska
1412	\N	Lubocza Trafo
1413	\N	Lubocza Trafo
1414	745	Lubocza Szkola
1415	745	Lubocza Szkola
1416	739	Cmentarz Grebalów
1417	739	Cmentarz Grebalów
1418	672	Rynek Debnicki
1419	\N	Praska
1420	\N	Praska
1421	522	Pychowice
1422	522	Pychowice
1423	\N	Pychowice I
1424	\N	Pychowice I
1425	\N	Pychowice II
1426	\N	Pychowice II
1427	\N	Kostrze II
1428	\N	Kostrze II
1429	\N	Kostrze I
1430	\N	Kostrze I
1431	113	Kostrze Szkola
1432	113	Kostrze Szkola
1433	814	Kostrze OSP
1434	814	Kostrze OSP
1435	\N	Waly Wislane I
1436	\N	Waly Wislane I
1437	\N	Podgórki
1438	\N	Podgórki
1439	678	Tyniec
1440	678	Tyniec
1441	481	Bogucianka
1442	481	Bogucianka
1443	\N	Zywiecka I
1444	791	Komuny Paryskiej
1445	791	Komuny Paryskiej
1446	71	Siewna Wiadukt
1447	\N	Os.Marszowiec
1448	\N	Os.Marszowiec
1449	788	Zdrowa
1450	\N	Kosocicka I
1451	\N	Kosocicka I
1452	\N	Kosocicka
1453	\N	Kosocicka
1454	604	Kawiory
1455	604	Kawiory
1456	322	Makowskiego
1457	322	Makowskiego
1458	322	Makowskiego
1459	322	Makowskiego
1460	\N	Prokocim Nowy
1461	\N	Prokocim Nowy
1462	\N	Górnickiego
1463	\N	Górnickiego
1464	\N	Jasnogórska
1465	\N	Lusina Dwór
1466	\N	Lusina I
1467	638	Poroninska
1468	755	Opatkowice
1469	\N	Opatkowice Krzyzówka
1470	\N	Opatkowice Krzyzówka
1471	755	Opatkowice
1472	764	Zyzna
1473	764	Zyzna
1474	228	Petrazyckiego
1475	228	Petrazyckiego
1476	\N	Wyciaze
1477	\N	Wyciaze
1478	603	Kaszów
1479	603	Kaszów
1480	\N	Dwór Czeczów
1481	\N	Lipowskiego
1482	\N	Fabryka Drozdzy
1483	\N	Wyciaze
1484	\N	Brzoskwinia Koziary
1485	771	Cystersów
1486	771	Cystersów
1487	433	Struga
1488	433	Struga
1489	519	Nowy Kleparz
1490	\N	Katy
1491	284	Lutnia
1492	284	Lutnia
1493	33	Przewóz
1494	33	Przewóz
1495	\N	N.M.P.
1496	\N	N.M.P.
1497	795	Na Zaleczu Szkola
1498	795	Na Zaleczu Szkola
1499	\N	Montin
1500	\N	Montin
1501	\N	Centralna I
1502	\N	Centralna I
1503	\N	Ojcowska Wagroda
1504	\N	Ojcowska Wagroda
1505	\N	Ojcowska Dworek
1506	\N	Ojcowska Dworek
1507	450	Gospodarska
1508	450	Gospodarska
1509	42	Chabrowa
1510	42	Chabrowa
1511	\N	Za Przejazdem
1512	\N	Za Przejazdem
1513	\N	Skrajna
1514	\N	Skrajna
1515	641	Zeslawice I
1516	641	Zeslawice I
1517	261	Kantorowice
1518	261	Kantorowice
1519	\N	Grebalów Skrzyzowanie
1520	\N	Grebalów Skrzyzowanie
1521	\N	Porazinskiej
1522	\N	Porazinskiej
1523	\N	Petöfiego
1524	\N	Petöfiego
1525	265	Zajezdnia Bienczyce
1526	265	Zajezdnia Bienczyce
1527	\N	Os.Kalinowe
1528	\N	Os.Kalinowe
1529	301	Os.Zlotego Wieku
1530	301	Os.Zlotego Wieku
1531	231	Leczycka
1532	231	Leczycka
1533	\N	Slawka
1534	\N	Slawka
1535	305	Zajezdnia Wola Duchacka
1536	305	Zajezdnia Wola Duchacka
1537	\N	Branice Na Dole
1538	\N	Branice Na Dole
1539	723	Branice Szkola
1540	723	Branice Szkola
1541	\N	Branice
1542	\N	Branice
1543	\N	Branice I
1544	\N	Branice I
1545	\N	Kakolowa
1546	\N	Kakolowa
1547	\N	Chalupki I
1548	\N	Chalupki I
1549	\N	Biezanów Pomnik
1550	\N	Biezanów Pomnik
1551	762	Barbary
1552	762	Barbary
1553	\N	Biezanów Trafo
1554	\N	Biezanów Trafo
1555	148	Prokocim Cmentarz
1556	148	Prokocim Cmentarz
1557	\N	Karowa
1558	\N	Karowa
1559	\N	Gwarecka
1560	\N	Gwarecka
1561	\N	Suchy Jar
1562	\N	Suchy Jar
1563	\N	Igolomska
1564	\N	Igolomska
1565	\N	Rzepakowa
1566	\N	Rzepakowa
1567	\N	Swietlica
1568	\N	Swietlica
1569	\N	Zwirownia
1570	\N	Zwirownia
1571	\N	Za Torami
1572	\N	Za Torami
1573	\N	Fredry
1574	\N	Fredry
1575	412	EC Leg
1576	383	Isep
1577	383	Isep
1578	\N	Zatyka
1579	\N	Zatyka
1580	617	Na Zaleczu
1581	295	Bronowice Wiadukt
1582	295	Bronowice Wiadukt
1583	273	Majora
1584	346	Zbydniowice
1585	346	Zbydniowice
1586	\N	Rzeszotary Panciawa
1587	\N	Droga do Janowic
1588	\N	Ochojno Remiza
1589	\N	Wrzasowice
1590	\N	Wrzasowice
1591	\N	Dabrówki I
1592	\N	Dabrówki I
1593	\N	Dabrówki
1594	\N	Dabrówki
1595	\N	Ochojno Kamieniec
1596	\N	Ochojno Kamieniec
1597	\N	Ochojno Skrzyzowanie
1598	\N	Ochojno Skrzyzowanie
1599	\N	Rzeszotary Górne
1600	\N	Rzeszotary Górne
1601	\N	Rzeszotary Polanki
1602	\N	Rzeszotary Polanki
1603	\N	Rzeszotary
1604	\N	Rzeszotary
1605	\N	Rzeszotary Trafo
1606	\N	Rzeszotary Trafo
1607	\N	Rzeszotary Szkola
1608	\N	Rzeszotary Szkola
1609	\N	Swiatniki Skrzyzowanie
1610	\N	Swiatniki Skrzyzowanie
1611	\N	Piasna Górka 
1612	\N	Piasna Górka 
1613	\N	Rzeszotary Zalesie
1614	\N	Rzeszotary Zalesie
1615	\N	Droga do Janowic
1616	\N	Swiatniki Górne
1617	\N	Swiatniki Górne
1618	\N	Swiatniki Centrum
1619	\N	Swiatniki Centrum
1620	\N	Swiatniki Cmentarz
1621	\N	Swiatniki Cmentarz
1622	\N	Swiatniki I
1623	\N	Swiatniki I
1624	\N	Konary Buk
1625	\N	Konary Buk
1626	\N	Wrzasowice III
1627	\N	Wrzasowice III
1628	\N	Wrzasowice Górka
1629	\N	Wrzasowice II
1630	\N	Wrzasowice II
1631	\N	Wrzasowice I
1632	\N	Wrzasowice I
1633	\N	Swiatniki Górne
1634	346	Zbydniowice
1635	\N	Mogilany Osrodek Zdrowia
1636	\N	Mogilany Wiadukt
1637	\N	Mogilany Wiadukt
1638	\N	Mogilany Wiadukt
1639	\N	Os.Kolejowe
1640	\N	Os.Kolejowe
1641	437	Saska
1642	\N	Rajsko Krzyzówka
1643	\N	Rajsko Krzyzówka
1644	\N	Rajsko
1645	\N	Rajsko
1646	768	Landaua
1647	768	Landaua
1648	327	Wiklinowa
1649	327	Wiklinowa
1650	34	Piekary
1651	70	Piekary Górne
1652	70	Piekary Górne
1653	784	Piekary III
1654	784	Piekary III
1655	\N	Szafranska
1656	\N	Szafranska
1657	524	ZOO
1658	39	Stara Wola
1659	39	Stara Wola
1660	597	Pradnik Bialy Zachód
1661	366	Szczyglice Dom Kultury
1662	164	Klasztorna
1663	6	Tonie
1664	6	Tonie
1665	499	Kocmyrzów
1666	499	Kocmyrzów
1667	\N	Kocmyrzów I
1668	\N	Kocmyrzów I
1669	\N	Sodfiny
1670	\N	Sodfiny
1671	\N	Sodfiny Kolonia
1672	\N	Sodfiny Kolonia
1673	\N	Gleboka
1674	\N	Gleboka
1675	\N	Karniów
1676	129	Kopiec Wandy
1677	\N	Smolenskiego I
1678	\N	Smolenskiego I
1679	20	Piaski Wielkie
1680	20	Piaski Wielkie
1681	\N	Malborska Szkola
1682	\N	Buków
1683	\N	Buków Klin
1684	\N	Buków Klin
1685	\N	Buków Szkola
1686	\N	Buków Szkola
1687	\N	Kulerzów
1688	\N	Kulerzów
1689	\N	Kulerzów Wawóz
1690	\N	Kulerzów Wawóz
1691	\N	Chorowice
1692	\N	Chorowice
1693	\N	Kopce
1694	\N	Kopce
1695	\N	Mogilany Cmentarz
1696	\N	Mogilany Cmentarz
1697	\N	Burów
1698	\N	Burów I
1699	\N	Grzybów
1700	\N	Balice OSP
1701	\N	Balice OSP
1702	\N	Burów I
1703	\N	Wolowice Szkola
1704	\N	Wolowice
1705	\N	Grotowa
1706	\N	Górskie Domy
1707	\N	Czulice
1708	\N	Górskie Domy
1709	\N	Grotowa
1710	\N	Wolowice
1711	\N	Wolowice Szkola
1712	\N	Podkamycze
1713	756	Góra Borkowska
1714	756	Góra Borkowska
1715	684	Cmentarz Batowice
1716	684	Cmentarz Batowice
1717	\N	Biezanów Cmentarz
1718	332	Wieliczka Cmentarz
1719	176	Wieliczka
1720	332	Wieliczka Cmentarz
1721	357	Wieliczka CPN
1722	357	Wieliczka CPN
1723	\N	Rondo Polsad
1724	\N	Narwik
1725	247	Kapielowa
1726	247	Kapielowa
1727	370	Libertów
1728	370	Libertów
1729	\N	Mogilany Rynek
1730	\N	Mogilany Rynek
1731	578	Zawila Cmentarz
1732	578	Zawila Cmentarz
1733	\N	Slósarczyka
1734	56	Piasta Kolodzieja
1735	\N	Przy Kuzni
1736	\N	Przy Kuzni
1737	97	Michalowice Kozlica
1738	97	Michalowice Kozlica
1739	\N	Wysylek
1740	\N	Wysylek
1741	699	Skawina Podlipki
1742	\N	Prusy
1743	\N	Glogera
1744	\N	Balice III
1745	\N	Balice I
1746	472	Granica Miasta
1747	395	Olszanica Bory
1748	\N	Balice III
1749	346	Zbydniowice
1750	\N	Trzecia Góra
1751	\N	Soboniowice II
1752	90	Pekowice
1753	\N	Podstawki
1754	\N	Opatkowice Krzyzówka
1755	103	Pasternik
1756	197	Batowice PKP
1757	\N	Raciborowice
1758	\N	Zastów
1759	\N	Czulice I
1760	\N	Konary Buk
1761	174	Wyzral
1762	\N	Dabrowa Szlachecka Figurka
1763	\N	Grotowa
1764	\N	Michalowice Komora
1765	\N	Aleksandrowice
1766	\N	Brzoskwinia Koziary
1767	\N	Wolica Most
1768	\N	Konopnickiej
1769	\N	Konopnickiej
1770	283	Zielony Dól
1771	283	Zielony Dól
1772	\N	Rzepichy
1773	\N	Rzepichy
1774	\N	Chelmska
1775	\N	Chelmska
1776	767	Lesmiana
1777	767	Lesmiana
1778	\N	Olszanica
1779	\N	Olszanica
1780	\N	Olszanica Dzialki
1781	\N	Olszanica Dzialki
1782	395	Olszanica Bory
1783	395	Olszanica Bory
1784	\N	Balice III
1785	\N	Balice III
1786	290	Instytut Pediatrii
1787	290	Instytut Pediatrii
1788	\N	Zawierzbie
1789	\N	Zawierzbie
1790	\N	Wolowice Kapliczka
1791	\N	Wolowice Kapliczka
1792	\N	Dabrowa Szlachecka Figurka
1793	\N	Dabrowa Szlachecka Figurka
1794	\N	Dabrowa Szlachecka Krzyz
1795	\N	Dabrowa Szlachecka Krzyz
1796	\N	Raczna Osiedle
1797	\N	Raczna Osiedle
1798	209	Farmina
1799	\N	Karniów
1800	799	Wieliczka Kosciól
1801	\N	Droga do Baryczy
1802	799	Wieliczka Kosciól
1803	\N	Droga do Baryczy
1804	591	Bronowice Male
1805	\N	Bronowice Mleczarnia
1806	81	UR Balicka
1807	\N	Most Grunwaldzki
1808	\N	Dzialki
1809	\N	Dzialki
1810	77	Cichy Kacik
1811	77	Cichy Kacik
1812	\N	Droga do Kujaw
1813	\N	Droga do Kujaw
1814	684	Cmentarz Batowice
1815	\N	Drozdzownia PKP
1816	\N	Drozdzownia PKP
1817	\N	Drozdzownia PKP I
1818	579	Wola Duchacka
1819	299	Kurdwanów
1820	\N	Rzeszotary Górne
1821	386	Rondo Matecznego
1822	381	Dajwór
1823	258	Biezanowska
1824	258	Biezanowska
1825	299	Kurdwanów
1826	\N	Os.Kurdwanów
1827	\N	Zagórzyce Dworskie
1828	\N	Zagórzyce Stare
1829	444	Rondo Grzegórzeckie
1830	\N	Cmentarz Rzaska
1831	732	Tischnera
1832	480	Czerwiakowskiego
1833	\N	Rzaka 
1834	12	Prokocim Szpital
1835	271	Lagiewniki
1836	271	Lagiewniki
1837	271	Lagiewniki
1838	271	Lagiewniki
1839	271	Lagiewniki
1840	\N	Domagaly
1841	\N	Domagaly
1842	\N	Biskupinska
1843	\N	Beskidzka
1844	\N	Beskidzka
1845	\N	Kuznicy Kollatajowskiej II
1846	\N	Kuznicy Kollatajowskiej II
1847	\N	Kuznicy Kollatajowskiej I
1848	\N	Kuznicy Kollatajowskiej I
1849	729	Pradnik Czerwony
1850	\N	Zajezdnia Podgórze
1851	355	Ruczaj
1852	\N	Wydz. Biologii UJ
1853	\N	Wydz. Biologii UJ
1854	\N	Bobrzynskiego
1855	\N	Bobrzynskiego
1856	347	Kampus UJ
1857	355	Ruczaj
1858	489	Rynek Falecki
1859	\N	Sucha
1860	\N	Sucha
1861	598	Kapelanka
1862	279	Malczewskiego
1863	598	Kapelanka
1864	686	Zielinskiego
1865	686	Zielinskiego
1866	479	Przykopy
1867	479	Przykopy
1868	279	Malczewskiego
1869	479	Przykopy
1870	558	Myslenicka
1871	149	Herberta
1872	149	Herberta
1873	53	Wielicka
1874	768	Landaua
1875	768	Landaua
1876	\N	Balicka Wiadukt
1877	\N	Lesna
1878	\N	Lesna
1879	131	Stella-Sawickiego
1880	131	Stella-Sawickiego
1881	\N	Iwanowice
1882	\N	Krasieniec Zakupny
1883	\N	Krasieniec Zakupny
1884	\N	Krasieniec
1885	\N	Krasieniec
1886	161	Torfowa
1887	\N	Lubostron
1888	\N	Lubostron
1889	636	Cmentarz Rakowicki
1890	505	Cracovia
1891	740	Oleandry
1892	\N	Reymana
1893	707	Wróblowice Cmentarz
1894	707	Wróblowice Cmentarz
1895	\N	Os.Na Stoku
1896	800	Architektów
1897	746	Libertów Szkola
1898	746	Libertów Szkola
1899	168	Libertów Dzialy
1900	168	Libertów Dzialy
1901	342	Libertów Krzyzówka
1902	342	Libertów Krzyzówka
1903	\N	Droga do Sidziny
1904	\N	Droga do Sidziny
1905	\N	Wróblowice Dom Kultury
1906	\N	Wróblowice Dom Kultury
1907	514	Babinskiego
1908	347	Kampus UJ
1909	\N	Mala Góra
1910	\N	Nowohucka
1911	\N	Nowohucka
1912	131	Stella-Sawickiego
1913	350	Rondo Ofiar Katynia
1914	\N	Jasnogórska
1915	\N	Ojcowska
1916	\N	Ojcowska
1917	369	Zabierzów Gimnazjum
1918	369	Zabierzów Gimnazjum
1919	567	Jezowa
1920	567	Jezowa
1921	\N	Lipowskiego
1922	\N	Dwór Czeczów
1923	167	Darwina
1924	\N	Sieborowice
1925	\N	Sieborowice
1926	\N	Szparagowa
1927	596	Kliny Zacisze
1928	596	Kliny Zacisze
1929	\N	Kenara
1930	\N	Kenara
1931	\N	Lesisko
1932	498	Kuklinskiego
1933	594	Klimeckiego
1934	594	Klimeckiego
1935	\N	Zelków
1936	\N	Soboniowice I
1937	\N	Soboniowice I
1938	\N	Golkowice Kosciól
1939	\N	Golkowice Kosciól
1940	\N	Bociana
1941	167	Darwina
1942	\N	Wyciaze
1943	\N	Wyciaze
1944	\N	Ruszcza Cmentarz
1945	\N	Ruszcza Cmentarz
1946	\N	Ruszcza
1947	\N	Karowa
1948	\N	Karowa
1949	626	Luborzyca
1950	\N	Wola Luborzycka
1951	\N	Wola Luborzycka
1952	\N	Wola Luborzycka Las
1953	\N	Wola Luborzycka Las
1954	\N	Lososkowice
1955	\N	Lososkowice Szkola
1956	\N	Lososkowice Szkola
1957	\N	Skrzeszowice
1958	\N	Skrzeszowice
1959	\N	Goszyce Remiza
1960	\N	Goszyce Remiza
1961	\N	Goszyce
1962	\N	Goszyce
1963	\N	Os.Nowe
1964	\N	Os.Nowe
1965	\N	Wrózenice
1966	659	Polana Zywiecka
1967	\N	Trojanowice I
1968	\N	Trojanowice I
1969	\N	Trojanowice Petla
1970	136	Zielonki Rozjazd
1971	191	Urzad Skarbowy Nowa Huta
1972	191	Urzad Skarbowy Nowa Huta
1973	\N	Wzg. Krzeslawickie I
1974	33	Przewóz
1975	\N	Wrobela I
1976	\N	Wrobela I
1977	\N	Biezanów Cmentarz
1978	53	Wielicka
1979	53	Wielicka
1980	167	Darwina
1981	\N	Park Jordana
1982	\N	Park Jordana
1983	\N	Zabierzów Mlyn
1984	710	Przegorzaly
1985	\N	Przegorzaly UJ
1986	\N	Panienskich Skal
1987	\N	Panienskich Skal
1988	591	Bronowice Male
1989	\N	Czyzyny Dworzec
1990	693	Tor Kajakowy
1991	693	Tor Kajakowy
1992	\N	Waly Wislane II
1993	\N	Waly Wislane II
1994	\N	Skrzyzowanie do Podchruscia
1995	\N	Skrzyzowanie do Podchruscia
1996	\N	Skrzyzowanie do Podchruscia
1997	\N	Skrzyzowanie do Podchruscia
1998	\N	Modlnica I Kolonia
1999	\N	Modlnica I Kolonia
2000	\N	Modlnica II
2001	\N	Modlnica II
2002	\N	Szyce II
2003	\N	Szyce II
2004	770	Szyce I
2005	770	Szyce I
2006	\N	Wielka Wies
2007	\N	Wielka Wies
2008	\N	Bialy Kosciól
2009	\N	Bialy Kosciól
2010	\N	Murownia
2011	\N	Murownia
2012	\N	Czajowice
2013	\N	Czajowice
2014	\N	Beblo Stara Wies
2015	\N	Beblo Stara Wies
2016	\N	Beblo Labajowa
2017	\N	Beblo Labajowa
2018	\N	Beblo Lasek
2019	\N	Beblo Lasek
2020	\N	Bedkowice Mosurowa
2021	\N	Bedkowice Mosurowa
2022	\N	Bedkowice Kawiory
2023	\N	Bedkowice Kawiory
2024	\N	Bedkowice Borynia
2025	\N	Bedkowice Borynia
2026	\N	Modlniczka I
2027	\N	Modlniczka I
2028	782	Modlniczka
2029	782	Modlniczka
2030	\N	Modlnica Skrzyzowanie
2031	\N	Modlnica Skrzyzowanie
2032	\N	Modlnica
2033	\N	Modlnica
2034	\N	Tomaszowice Wedonka
2035	\N	Tomaszowice Wedonka
2036	\N	Tomaszowice I
2037	\N	Tomaszowice I
2038	557	Tomaszowice
2039	774	Tonie Gliniki
2040	774	Tonie Gliniki
2041	\N	Trojadyn Szydlo
2042	\N	Trojadyn Szydlo
2043	\N	Trojadyn Szydlo
2044	\N	Trojadyn Trafo
2045	\N	Trojadyn Trafo
2046	\N	Trojadyn
2047	\N	Trojadyn
2048	\N	Trojadyn Skrzyzowanie
2049	\N	Trojadyn Skrzyzowanie
2050	90	Pekowice
2051	\N	Jasnogórska
2052	\N	Jasnogórska
2053	587	Prokocim
2054	\N	Bienczyce
2055	\N	Mlyn
2056	\N	Mlyn
2057	\N	Krzeslawice
2058	\N	Krzeslawice
2059	\N	Krasnowolskiego
2060	\N	Krasnowolskiego
2061	\N	Bienczyce Mleczarnia
2062	479	Przykopy
2063	184	Turowicza
2064	184	Turowicza
2065	591	Bronowice Male
2066	184	Turowicza
2067	\N	Lusina Petla
2068	\N	Lusina Szkola
2069	\N	Lusina Szkola
2070	\N	Lusina Spacerowa
2071	\N	Lusina Spacerowa
2072	\N	Lusina Dwór
2073	\N	Lusina Dwór
2074	466	Park Wodny
2075	\N	Sciejowice
2076	\N	Stopien Wodny
2077	\N	Cmentarz Grebalów I
2078	\N	Cmentarz Grebalów I
2079	\N	Lowinskiego Parking
2080	\N	Lowinskiego Parking
2081	720	Skawina Szkola
2082	36	Skawina Sad
2083	36	Skawina Sad
2084	\N	Tyniecka Osiedle
2085	\N	Tyniecka Osiedle
2086	\N	Skawinska
2087	794	Skawina Wojska Polskiego
2088	794	Skawina Wojska Polskiego
2089	\N	Samborek Most
2090	\N	Samborek Most
2091	\N	Podgórki Skawinskie
2092	\N	Podgórki Skawinskie
2093	\N	Olszanica
2094	341	Meissnera
2095	341	Meissnera
2096	\N	Pod Lipa
2097	\N	Pod Lipa
2098	181	Uniwersytet Ekonomiczny
2099	\N	Muzeum Armii Krajowej
2100	\N	Podgórki Skawinskie
2101	\N	Brzezie Dzialki
2102	\N	Brzezie Dzialki
2103	\N	Krzeszowice
2104	531	Bolechowice
2105	531	Bolechowice
2106	\N	Karniowice
2107	\N	Brzezie Narodowe
2108	\N	Karniowice I
2109	\N	Karniowice I
2110	\N	Zielona Mala
2111	\N	Zielona Mala
2112	\N	Lipka
2113	\N	Lipka
2114	\N	Wieckowice
2115	\N	Wieckowice
2116	422	Kobylany
2117	422	Kobylany
2118	\N	Kobylany I
2119	\N	Kobylany I
2120	\N	Brzezinka Zarzecze
2121	\N	Brzezinka Zarzecze
2122	1	Brzezinka
2123	1	Brzezinka
2124	390	Brzezinka Skrzyzowanie
2125	390	Brzezinka Skrzyzowanie
2126	769	Rudawa Bloki
2127	769	Rudawa Bloki
2128	88	Rudawa Kosciól
2129	\N	Radwanowice Petla
2130	\N	Radwanowice I
2131	\N	Radwanowice I
2132	\N	Radwanowice II
2133	\N	Radwanowice II
2134	312	Dubie
2135	312	Dubie
2136	\N	Pisary
2137	\N	Pisary
2138	\N	Pisary Kiosk
2139	\N	Pisary Kiosk
2140	685	Pisary Mleczarnia
2141	685	Pisary Mleczarnia
2142	635	Rudawa Szkola
2143	635	Rudawa Szkola
2144	\N	Mlynka
2145	\N	Krzeszowice Szkola
2146	\N	Krzeszowice Witaminka
2147	\N	Krzeszowice Witaminka
2148	\N	Nawojowa Góra II
2149	\N	Nawojowa Góra II
2150	\N	Nawojowa Góra I
2151	\N	Nawojowa Góra I
2152	\N	Pisary Skrzyzowanie
2153	\N	Pisary Skrzyzowanie
2154	61	Modlniczka Trzcie
2155	61	Modlniczka Trzcie
2156	\N	Brzezie Narodowe
2157	\N	Brzezie Narodowe
2158	\N	Brzezie
2159	\N	Brzezie
2160	\N	Brzezie Kulka
2161	\N	Brzezie Kulka
2162	586	Glowackiego
2163	586	Glowackiego
2164	\N	Karniowice
2165	94	Uniwersytet Pedagogiczny
2166	\N	Witkowice
2167	\N	Witkowice
2168	319	Leroy Merlin
2169	319	Leroy Merlin
2170	88	Rudawa Kosciól
2171	\N	Ujazd Petla
2172	\N	Ujazd Petla
2173	\N	Brzezie
2174	\N	Brzezie
2175	\N	Zabierzów Mlyn
2176	\N	Zielona
2177	\N	Zielona
2178	\N	Radwanowice Petla
2179	\N	Rudawa
2180	\N	Rudawa
2181	359	Starowislna
2182	599	Rondo Kocmyrzowskie
2183	\N	Korabniki
2184	\N	Sidzina Las
2185	\N	Sidzina Las
2186	115	Kleszczów
2187	\N	Burów
2188	587	Prokocim
2189	\N	Michalowice Ujecie Wody
2190	\N	Michalowice Ujecie Wody
2191	\N	Las Michalowski
2192	\N	Las Michalowski
2193	\N	Michalki
2194	\N	Michalki
2195	\N	Michalowice Banasiówka
2196	\N	Michalowice Banasiówka
2197	\N	Michalowice Komora
2198	\N	Michalowice I
2199	\N	Michalowice I
2200	129	Kopiec Wandy
2201	129	Kopiec Wandy
2202	\N	Plac Matejki
2203	181	Uniwersytet Ekonomiczny
2204	\N	Muzeum Armii Krajowej
2205	\N	Cmentarz
2206	\N	Cmentarz
2207	\N	Wegrzce Starostwo Powiatowe
2208	112	Rudawa PKP
2209	112	Rudawa PKP
2210	573	Dworzec Glówny
2211	\N	Krakowska Akademia
2212	777	Miodowa
2213	250	Dworzec Glówny Wschód
2214	\N	Piekielko
2215	\N	Piekielko
2216	49	Plac Bohaterów Getta
2217	425	Skawina Rynek
2218	720	Skawina Szkola
2219	256	Janasówka
2220	256	Janasówka
2221	\N	Zagórzyce Stare
2222	\N	Rudawa Mlyn
2223	\N	Rudawa Mlyn
2224	\N	Kobylany Remiza
2225	\N	Mlynka
2226	\N	Park Jordana
2227	\N	Bosutów
2228	\N	Bosutów Polindus
2229	\N	Bosutów Polindus
2230	\N	Bosutów Straz
2231	\N	Bosutów Straz
2232	\N	Bosutów Krzyz
2233	\N	Bosutów Krzyz
2234	\N	Bosutów Dziekanowice
2235	\N	Bosutów Dziekanowice
2236	\N	Wegrzce Sudól
2237	\N	Wegrzce Sudól
2238	\N	Wegrzce Magiczne Wzgórze
2239	\N	Wegrzce Magiczne Wzgórze
2240	\N	Wegrzce Centrum Medyczne
2241	\N	Wegrzce Centrum Medyczne
2242	\N	Bibice Petla
2243	\N	Bibice Cmentarz
2244	\N	Bibice Cmentarz
2245	\N	Zielonki Cegielnia
2246	\N	Zielonki Cegielnia
2247	\N	Marszowiec
2248	\N	Balice III
2249	\N	Wegrzce Centrum
2250	\N	Wegrzce Blonie
2251	\N	Wegrzce Blonie
2252	\N	Wegrzce Petla
2253	\N	Most Kotlarski
2254	\N	Dworzec Glówny Zachód (Galeria)
2255	\N	Bronowice Mleczarnia
2256	573	Dworzec Glówny
2257	\N	Dworzec Glówny Zachód (Galeria)
2258	\N	TR
2259	246	Baczynskiego
2260	246	Baczynskiego
2261	713	Prosta
2262	\N	Przybyslawice III
2263	\N	Przybyslawice III
2264	461	Krowodrza Górka
2265	\N	Stacja tankowania gazu
2266	\N	Dworzec Glówny Zachód (Galeria)
2267	553	Politechnika
2268	634	Zielonki UG
2269	634	Zielonki UG
2270	402	Skawina Koncentraty
2271	402	Skawina Koncentraty
2272	402	Skawina Koncentraty
2273	402	Skawina Koncentraty
2274	240	Rzozów Baseny
2275	240	Rzozów Baseny
2276	189	Rzozów I
2277	189	Rzozów I
2278	581	Rzozów Szkola
2279	581	Rzozów Szkola
2280	382	Goluchowice
2281	382	Goluchowice
2282	467	Goluchowice Jurczyce
2283	467	Goluchowice Jurczyce
2284	527	Goluchowice Sklep
2285	527	Goluchowice Sklep
2286	413	Polanka Hallera Dwór
2287	413	Polanka Hallera Dwór
2288	468	Grabie Polanka
2289	468	Grabie Polanka
2290	\N	Krzecin Sklep
2291	\N	Krzecin Sklep
2292	484	Skawina Wyspianskiego
2293	484	Skawina Wyspianskiego
2294	\N	Skawina Korabnicka
2295	\N	Skawina Korabnicka
2296	560	Skawina Korabnicka Szkola
2297	703	Skawina Cmentarz
2298	233	Skawina Elektrownia
2299	233	Skawina Elektrownia
2300	623	Skawina Zachodnia
2301	623	Skawina Zachodnia
2302	703	Skawina Cmentarz
2303	\N	Ajka
2304	\N	Ajka
2305	100	Skawina
2306	534	Brzeznica
2307	120	Skawina Pilsudskiego
2308	120	Skawina Pilsudskiego
2309	40	Skawina Podbory
2310	40	Skawina Podbory
2311	165	Brzeznica Pasieka
2312	616	Brzeznica Kuznia
2313	108	Jaskowice
2314	85	Jaskowice PKP
2315	363	Wielkie Drogi Trzebol
2316	725	Wielkie Drogi PKP
2317	\N	Wielkie  Drogi
2318	783	Zelczyna Sklep
2319	727	Zelczyna I
2320	18	Borek Szlachecki II
2321	213	Borek Szlachecki I
2322	165	Brzeznica Pasieka
2323	616	Brzeznica Kuznia
2324	108	Jaskowice
2325	85	Jaskowice PKP
2326	363	Wielkie Drogi Trzebol
2327	725	Wielkie Drogi PKP
2328	\N	Wielkie  Drogi
2329	783	Zelczyna Sklep
2330	727	Zelczyna I
2331	18	Borek Szlachecki II
2332	213	Borek Szlachecki I
2333	\N	Luczyce
2334	\N	Luczyce PKP
2335	\N	Wysiolek Luborzycki
2336	\N	Kapkazy
2337	\N	Kapkazy
2338	\N	Luczyce Las
2339	\N	Luczyce Las
2340	\N	Luczyce
2341	\N	Aleksandry
2342	\N	Aleksandry
2343	\N	Mala Góra
2344	180	Wola Radziszowska
2345	752	Wola Radziszowska Centrum
2346	752	Wola Radziszowska Centrum
2347	118	Wola Radziszowska Lipki
2348	118	Wola Radziszowska Lipki
2349	666	Wola Radziszowska Most
2350	666	Wola Radziszowska Most
2351	27	Wola Radziszowska Mala Ostra Góra
2352	27	Wola Radziszowska Mala Ostra Góra
2353	\N	Wola Radziszowska Kapelanka
2354	\N	Wola Radziszowska Kapelanka
2355	\N	Radziszów
2356	273	Majora
2357	\N	Wegrzce Centrum
2358	89	Wola Radziszowska Chorzyny
2359	89	Wola Radziszowska Chorzyny
2360	\N	Marcholta
2361	\N	Bohomolca
2362	\N	Marcholta
2363	\N	Bohomolca
2364	633	Mistrzejowice
2365	633	Mistrzejowice
2366	\N	Os.Oswiecenia
2367	\N	Radziszów Lesniczówka
2368	780	Skawina 29 Listopada
2369	\N	Skawina Centrum Wodne
2370	\N	Skawina Centrum Wodne
2371	353	Skawina Starostwo Powiatowe
2372	690	Skawina Kopernika
2373	\N	Skawina Kopernika I
2374	452	Skawina Cmentarz Komunalny
2375	780	Skawina 29 Listopada
2376	353	Skawina Starostwo Powiatowe
2377	690	Skawina Kopernika
2378	\N	Skawina Kopernika I
2379	220	Rondo Mogilskie
2380	220	Rondo Mogilskie
2381	220	Rondo Mogilskie
2382	220	Rondo Mogilskie
2383	220	Rondo Mogilskie
2384	220	Rondo Mogilskie
2385	220	Rondo Mogilskie
2386	220	Rondo Mogilskie
2387	458	Dworzec Towarowy
2388	458	Dworzec Towarowy
2389	553	Politechnika
2390	\N	Raciborowice Centrum
2391	\N	Raciborowice Centrum
2392	\N	Konczyce
2393	\N	Konczyce
2394	\N	Ksiazniczki Boisko
2395	\N	Ksiazniczki Boisko
2396	453	Biskupa Prandoty
2397	\N	Ksiazniczki Centrum
2398	\N	Ksiazniczki Centrum
2399	\N	Ksiazniczki Las
2400	\N	Ksiazniczki Las
2401	\N	Mlodziejowice Park
2402	\N	Mlodziejowice Park
2403	\N	Mlodziejowice Mlyn
2404	\N	Mlodziejowice Mlyn
2405	\N	Michalowice Ogrodowa
2406	\N	Michalowice Ogrodowa
2407	\N	Korzkiew I
2408	\N	Korzkiew I
2409	\N	Korzkiew II
2410	\N	Korzkiew II
2411	\N	Grebynice I
2412	\N	Grebynice I
2413	\N	Grebynice II
2414	\N	Grebynice II
2415	419	Grebynice Mogielki
2416	419	Grebynice Mogielki
2417	\N	Maszyce II
2418	\N	Maszyce II
2419	135	Maszyce Skrzyzowanie
2420	135	Maszyce Skrzyzowanie
2421	\N	Smardzowice
2422	788	Zdrowa
2423	\N	Galeria Kazimierz
2424	412	EC Leg
2425	412	EC Leg
2426	530	Elektrocieplownia Kraków
2427	242	M1 Al. Pokoju
2428	\N	Ogródki Dzialkowe
2429	\N	Ogródki Dzialkowe
2430	\N	Kraków Plaza
2431	242	M1 Al. Pokoju
2432	\N	Kraków Plaza
2433	449	Rondo Czyzynskie
2434	\N	Nowohucka
2435	\N	Nowohucka
2436	624	Centralna
2437	624	Centralna
2438	771	Cystersów
2439	771	Cystersów
2440	158	Bialucha
2441	158	Bialucha
2442	\N	Wieczysta
2443	\N	Wieczysta
2444	526	AWF
2445	526	AWF
2446	131	Stella-Sawickiego
2447	131	Stella-Sawickiego
2448	621	Czyzyny
2449	621	Czyzyny
2450	449	Rondo Czyzynskie
2451	131	Stella-Sawickiego
2452	418	Komorowskiego
2453	418	Komorowskiego
2454	74	Uniwersytet Jagiellonski
2455	505	Cracovia
2456	86	Powstanców Wielkopolskich
2457	619	Cmentarz Podgórski
2458	619	Cmentarz Podgórski
2459	316	Dworcowa
2460	751	Kabel
2461	316	Dworcowa
2462	\N	Meksyk
2463	\N	Meksyk
2464	\N	Koksochemia
2465	\N	Koksochemia
2466	\N	Jezynowa
2467	\N	Jezynowa
2468	\N	Pradnicka
2469	\N	Pradnicka
2470	726	Bratyslawska
2471	\N	Powstanców Garaze
2472	\N	Powstanców Garaze
2473	372	Póllanki
2474	\N	Dojazdów Dzialki
2475	442	Piaski Nowe
2476	511	Kraków Business Park
2477	511	Kraków Business Park
2478	573	Dworzec Glówny
2479	226	Aleja Przyjazni
2480	226	Aleja Przyjazni
2481	619	Cmentarz Podgórski
2482	619	Cmentarz Podgórski
2483	\N	Dworzec Glówny Zachód (Galeria)
2484	553	Politechnika
2485	553	Politechnika
2486	273	Majora
2487	\N	Wegrzce Wielkie
2488	811	Uniwersytet Rolniczy
2489	\N	Mydlniki I
2490	774	Tonie Gliniki
2491	\N	Krakówka
2492	\N	Os.Marszowiec
2493	395	Olszanica Bory
2494	461	Krowodrza Górka
2495	\N	Marszowiec
2496	\N	Kokotów I
2497	\N	Czarnochowice I
2498	\N	Czarnochowice I
2499	\N	Kokotów I
2500	\N	Wegrzce Wielkie III
2501	\N	Kokotów II
2502	\N	Wegrzce Wielkie II
2503	\N	Wegrzce Wielkie II
2504	612	Pszona
2505	612	Pszona
2506	\N	Czarnochowice VI
2507	274	Brodowicza
2508	289	Sikorki
2509	289	Sikorki
2510	639	Wieliczka Kopalnia Soli
2511	639	Wieliczka Kopalnia Soli
2512	21	Wieliczka Rynek
2513	21	Wieliczka Rynek
2514	613	Dabie
2515	613	Dabie
2516	169	Ofiar Dabia
2517	169	Ofiar Dabia
2518	545	Fabryczna
2519	545	Fabryczna
2520	503	Francesco Nullo
2521	503	Francesco Nullo
2522	\N	Aleja Pokoju
2523	\N	Aleja Pokoju
2524	444	Rondo Grzegórzeckie
2525	444	Rondo Grzegórzeckie
2526	444	Rondo Grzegórzeckie
2527	444	Rondo Grzegórzeckie
2528	\N	Wzg. Krzeslawickie I
2529	\N	Wzg. Krzeslawickie I
2530	\N	Pod Fortem
2531	252	Fort Mogila
2532	252	Fort Mogila
2533	56	Piasta Kolodzieja
2534	56	Piasta Kolodzieja
2535	728	Kleeberga
2536	728	Kleeberga
2537	505	Cracovia
2538	\N	Os.Kolorowe
2539	\N	Os.Kolorowe
2540	\N	Bardosa
2541	\N	Bardosa
2542	\N	KS Hutnik
2543	\N	KS Hutnik
2544	164	Klasztorna
2545	164	Klasztorna
2546	\N	Os.Na Skarpie
2547	\N	Os.Na Skarpie
2548	\N	Plac Centralny
2549	\N	Plac Centralny
2550	96	Grabówki
2551	\N	Podkamycze
2552	7	Bronowice
2553	7	Bronowice
2554	664	Wesele
2555	664	Wesele
2556	\N	Balicka Wiadukt
2557	\N	Balicka Wiadukt
2558	316	Dworcowa
2559	587	Prokocim
2560	587	Prokocim
2561	12	Prokocim Szpital
2562	12	Prokocim Szpital
2563	711	Teligi
2564	711	Teligi
2565	\N	Prokocim Nowy
2566	\N	Prokocim Nowy
2567	753	Cwiklinskiej
2568	753	Cwiklinskiej
2569	433	Struga
2570	433	Struga
2571	\N	Plac Centralny
2572	812	Kombinat
2573	812	Kombinat
2574	812	Kombinat
2575	650	Rondo Piastowskie
2576	650	Rondo Piastowskie
2577	301	Os.Zlotego Wieku
2578	301	Os.Zlotego Wieku
2579	\N	Mistrzejowice I
2580	\N	Mistrzejowice I
2581	704	Hala Targowa
2582	704	Hala Targowa
2583	63	Salwator
2584	\N	Flisacka
2585	418	Komorowskiego
2586	418	Komorowskiego
2587	708	Jubilat
2588	708	Jubilat
2589	759	Bienczycka
2590	759	Bienczycka
2591	431	Elektromontaz
2592	431	Elektromontaz
2593	187	Wiadukty
2594	187	Wiadukty
2595	227	Zajezdnia Nowa Huta
2596	227	Zajezdnia Nowa Huta
2597	\N	Krzecin Cmentarz
2598	\N	Krzecin Cmentarz
2599	\N	Krzecin Szkola
2600	\N	Krzecin Szkola
2601	\N	Krzecin Kapliczka
2602	\N	Krzecin
2603	\N	Krzecin Kapliczka
2604	\N	Krzecin Kosciól
2605	599	Rondo Kocmyrzowskie
2606	599	Rondo Kocmyrzowskie
2607	\N	Os.Zgody
2608	\N	Os.Zgody
2609	\N	Plac Centralny
2610	\N	Plac Centralny
2611	\N	Plac Centralny
2612	24	Kobierzynska
2613	24	Kobierzynska
2614	147	Slomiana
2615	147	Slomiana
2616	598	Kapelanka
2617	598	Kapelanka
2618	754	Szwedzka
2619	754	Szwedzka
2620	\N	Most Grunwaldzki
2621	\N	Most Grunwaldzki
2622	601	Orzeszkowej
2623	601	Orzeszkowej
2624	307	Stradom
2625	359	Starowislna
2626	359	Starowislna
2627	307	Stradom
2628	359	Starowislna
2629	359	Starowislna
2630	519	Nowy Kleparz
2631	519	Nowy Kleparz
2632	45	Pedzichów
2633	45	Pedzichów
2634	\N	Basztowa LOT
2635	205	Zelczyna Szkola
2636	205	Zelczyna Szkola
2637	276	Ochodza
2638	736	Korona
2639	83	Plac Wolnica
2640	83	Plac Wolnica
2641	307	Stradom
2642	763	Limanowskiego
2643	763	Limanowskiego
2644	736	Korona
2645	86	Powstanców Wielkopolskich
2646	49	Plac Bohaterów Getta
2647	49	Plac Bohaterów Getta
2648	554	Sw. Wawrzynca
2649	554	Sw. Wawrzynca
2650	777	Miodowa
2651	777	Miodowa
2652	\N	Bienczyce Mleczarnia
2653	\N	Bienczyce Mleczarnia
2654	\N	Kocmyrzowska
2655	\N	Kocmyrzowska
2656	793	Teatr Ludowy
2657	299	Kurdwanów
2658	99	Witosa
2659	99	Witosa
2660	543	Nowosadecka
2661	543	Nowosadecka
2662	442	Piaski Nowe
2663	442	Piaski Nowe
2664	87	Dauna
2665	87	Dauna
2666	258	Biezanowska
2667	258	Biezanowska
2668	751	Kabel
2669	258	Biezanowska
2670	258	Biezanowska
2671	145	Wlotowa
2672	145	Wlotowa
2673	547	Solvay
2674	547	Solvay
2675	781	Borek Falecki I
2676	781	Borek Falecki I
2677	16	Sanktuarium Bozego Milosierdzia
2678	16	Sanktuarium Bozego Milosierdzia
2679	736	Korona
2680	262	Smolki
2681	262	Smolki
2682	386	Rondo Matecznego
2683	386	Rondo Matecznego
2684	697	Rzemieslnicza
2685	599	Rondo Kocmyrzowskie
2686	67	DH Wanda
2687	67	DH Wanda
2688	\N	Bienczyce
2689	\N	Bienczyce
2690	46	Dunikowskiego
2691	46	Dunikowskiego
2692	220	Rondo Mogilskie
2693	293	Giebultów
2694	293	Giebultów
2695	553	Politechnika
2696	553	Politechnika
2697	403	Dworzec Glówny Tunel
2698	403	Dworzec Glówny Tunel
2699	629	Maszyce Remiza
2700	629	Maszyce Remiza
2701	\N	Smardzowice IV
2702	\N	Smardzowice IV
2703	\N	Giebultów Plac Zabaw
2704	\N	Giebultów Plac Zabaw
2705	549	Giebultów Morgi
2706	47	Bedkowice
2707	47	Bedkowice
2708	\N	Bedkowice Petla
2709	8	Rzozów Skotnica
2710	8	Rzozów Skotnica
2711	533	Rzozów Zagonnie
2712	628	Rzozów PKP
2713	675	Radziszów Kladka
2714	675	Radziszów Kladka
2715	\N	Radziszów Zacisze
2716	\N	Radziszów Zacisze
2717	349	Radziszów PKP
2718	\N	Radziszów Podwale
2719	\N	Radziszów Podwale
2720	\N	Radziszów Zawodzie
2721	\N	Radziszów Zawodzie
2722	470	Rondo Barei
2723	\N	Nielepice
2724	\N	Brzoskwinia
2725	\N	Brzezie Narodowe
2726	\N	Krzysztoforzyce
2727	343	Piekary Palac
2728	343	Piekary Palac
2729	356	Krzyszkowice Os. Szymanowskiego
2730	356	Krzyszkowice Os. Szymanowskiego
2731	\N	Droga do Baryczy
2732	\N	Droga do Baryczy
2733	\N	Droga do Baryczy
2734	\N	Krzyszkowice Kosciól
2735	\N	Krzyszkowice Kosciól
2736	\N	Krzyszkowice Kasztanowa I
2737	\N	Krzyszkowice Kasztanowa I
2738	\N	Krzyszkowice Kasztanowa II
2739	\N	Krzyszkowice Kasztanowa II
2740	\N	Krzyszkowice Modrzewiowa
2741	\N	Krzyszkowice Modrzewiowa
2742	\N	Krzyszkowice Rózana
2743	\N	Biezanów Cmentarz
2744	\N	Lusina Lany
2745	\N	Meksyk
2746	\N	Meksyk
2747	\N	Brama nr 5
2748	\N	Brama nr 5
2749	252	Fort Mogila
2750	252	Fort Mogila
2751	816	Przeginia Duchowna Szkola
2752	816	Przeginia Duchowna Szkola
2753	285	Przeginia Duchowna Centrum
2754	285	Przeginia Duchowna Centrum
2755	272	Przeginia Narodowa II
2756	272	Przeginia Narodowa II
2757	122	Czernichów II
2758	122	Czernichów II
2759	488	Nowa Wies Jesionka
2760	488	Nowa Wies Jesionka
2761	206	Raczna Kapliczka
2762	206	Raczna Kapliczka
2763	\N	Dabrowa Szlachecka
2764	\N	Dabrowa Szlachecka
2765	\N	Czernichów Stacja Paliw
2766	\N	Czernichów Stacja Paliw
2767	26	Czernichów GS
2768	26	Czernichów GS
2769	\N	Wolowice Sklep
2770	\N	Wolowice Sklep
2771	\N	Wolowice III
2772	\N	Wolowice III
2773	\N	Wolowice Niwa
2774	\N	Wolowice Niwa
2775	\N	Rybna Nowy Swiat
2776	\N	Rybna
2777	\N	Rybna
2778	\N	Rybna II
2779	\N	Rybna II
2780	\N	Rybna I
2781	\N	Rybna I
2782	\N	Rybna Dól
2783	\N	Rybna Dól
2784	\N	Przeginia Duchowna
2785	\N	Czulówek
2786	\N	Czulówek
2787	63	Salwator
2788	\N	Raczna Podlas
2789	\N	Raczna Podlas
2790	\N	Raczna Dzikowiec
2791	\N	Raczna Dzikowiec
2792	397	Czernichów
2793	733	Ratanice
2794	733	Ratanice
2795	127	Ratanice I
2796	127	Ratanice I
2797	263	Klokoczyn
2798	263	Klokoczyn
2799	\N	Kamien
2800	\N	Kamien Dól
2801	\N	Kamien Dól
2802	\N	Rusocice II
2803	\N	Rusocice II
2804	\N	Rusocice I
2805	\N	Rusocice I
2806	\N	Rusocice Leg
2807	\N	Rusocice Leg
2808	517	Czernichów Bór
2809	517	Czernichów Bór
2810	217	Przeginia Narodowa
2811	217	Przeginia Narodowa
2812	69	Przeginia Duchowna Bar
2813	69	Przeginia Duchowna Bar
2814	241	Nowa Wies Szlachecka
2815	\N	Rusocice Sklad
2816	\N	Rusocice Sklad
2817	\N	Grotowa
2818	\N	Jeziorzany
2819	397	Czernichów
2820	22	Rusocice Wies
2821	22	Rusocice Wies
2822	\N	Luczyce Zjawienie
2823	458	Dworzec Towarowy
2824	\N	Lusina Lany
2825	\N	Kosocice II
2826	\N	Skawinska
2827	533	Rzozów Zagonnie
2828	628	Rzozów PKP
2829	\N	Kokotów II
2830	\N	Czarnochowice VI
2831	\N	Czarnochowice VI
2832	\N	Wegrzce Wielkie III
2833	473	Kaszów II
2834	\N	Raczna Podlas
2835	\N	Raczna Osiedle
2836	\N	Mlynka
2837	293	Giebultów
2838	\N	Rybna Osrodek Zdrowia
2839	\N	Rybna Osrodek Zdrowia
2840	\N	Przeginia Duchowna
2841	205	Zelczyna Szkola
2842	459	Wielkie Drogi Osrodek Zdrowia
2843	459	Wielkie Drogi Osrodek Zdrowia
2844	572	Wielkie Drogi Szkola
2845	572	Wielkie Drogi Szkola
2846	205	Zelczyna Szkola
2847	317	Lobzów PKP
2848	\N	Wrzasowice Kowaleca
2849	\N	Biezanów  Nowy
2850	\N	Wrzasowice Górka
2851	\N	Wrzasowice Kowaleca
2852	710	Przegorzaly
2853	710	Przegorzaly
2854	710	Przegorzaly
2855	630	Na Krepaku
2856	\N	Zaskale
2857	474	Siwka
2858	\N	Nielepice Stadnina
2859	\N	Nielepice Stadnina
2860	\N	Pisary Dwór
2861	\N	Pisary Dwór
2862	477	Muzeum Inzynierii Miejskiej
2863	469	Forteczna
2864	\N	Zawiszy
2865	173	Skotniki Szkola
2866	778	Brücknera
2867	778	Brücknera
2868	4	Skotniki
2869	\N	Most Kotlarski
2870	\N	Wydzial Zarzadzania UJ
2871	\N	Wydzial Zarzadzania UJ
2872	\N	Prokocim  Rynek
2873	\N	Prokocim  Rynek
2874	\N	Dabrowa I
2875	\N	Dabrowa I
2876	75	Os.Lokietka
2877	75	Os.Lokietka
2878	377	Chelm
2879	767	Lesmiana
2880	\N	Rzepichy
2881	\N	Rzepichy
2882	767	Lesmiana
2883	\N	Odmetowa
2884	\N	Odmetowa
2885	\N	Habina
2886	\N	Habina
2887	\N	Lesisko
2888	\N	Lesisko
2889	359	Starowislna
2890	24	Kobierzynska
2891	266	Borsucza
2892	266	Borsucza
2893	\N	Brozka
2894	\N	Brozka
2895	610	Teatr Bagatela
2896	64	Batorego
2897	64	Batorego
2898	234	Plac Inwalidów
2899	234	Plac Inwalidów
2900	141	Urzednicza
2901	141	Urzednicza
2902	430	Biprostal
2903	430	Biprostal
2904	94	Uniwersytet Pedagogiczny
2905	94	Uniwersytet Pedagogiczny
2906	586	Glowackiego
2907	586	Glowackiego
2908	129	Kopiec Wandy
2909	677	Skawina PKP
2910	\N	Brama nr 4
2911	\N	Brama nr 4
2912	\N	Brama nr 5
2913	\N	Jezynowa
2914	\N	Jezynowa
2915	129	Kopiec Wandy
2916	129	Kopiec Wandy
2917	\N	Sciejowice Na Bagnach
2918	\N	Sciejowice Na Bagnach
2919	474	Siwka
2920	\N	Grotowa I
2921	\N	Grotowa I
2922	\N	Krzysztoforzyce Góra
2923	\N	Krzysztoforzyce Góra
2924	\N	Krzysztoforzyce Sklep 
2925	\N	Krzysztoforzyce Sklep 
2926	\N	Krzysztoforzyce Góra
2927	\N	Luczanowice
2928	\N	Balice PKP
2929	\N	Terminal Miedzynarodowy
2930	\N	Terminal Krajowy
2931	74	Uniwersytet Jagiellonski
2932	722	Puszkarska
2933	722	Puszkarska
2934	305	Zajezdnia Wola Duchacka
2935	305	Zajezdnia Wola Duchacka
2936	644	Bonarka
2937	\N	Krzysztoforzyce przy Dworze
2938	\N	Krzysztoforzyce przy Dworze
2939	644	Bonarka
2940	\N	Kocmyrzów Krzyzówka
2941	\N	Kocmyrzów Krzyzówka
2942	736	Korona
2943	386	Rondo Matecznego
2944	\N	Wyslouchów
2945	\N	Wyslouchów
2946	\N	Bojki
2947	\N	Bojki
2948	\N	Rusocice Jalowce
2949	\N	Rusocice Jalowce
2950	694	Rusocice Zaleg
2951	694	Rusocice Zaleg
2952	\N	Grebalów Skrzyzowanie
2953	\N	Grebalów Skrzyzowanie
2954	812	Kombinat
2955	227	Zajezdnia Nowa Huta
2956	812	Kombinat
2957	436	Filharmonia
2958	610	Teatr Bagatela
2959	610	Teatr Bagatela
2960	\N	Basztowa LOT
2961	\N	Basztowa LOT
2962	573	Dworzec Glówny
2963	573	Dworzec Glówny
2964	310	Poczta Glówna
2965	310	Poczta Glówna
2966	494	Lubicz
2967	494	Lubicz
2968	573	Dworzec Glówny
2969	307	Stradom
2970	427	Maly Plaszów
2971	427	Maly Plaszów
2972	586	Glowackiego
2973	586	Glowackiego
2974	485	Instal
2975	485	Instal
2976	324	Katowicka
2977	594	Klimeckiego
2978	594	Klimeckiego
2979	179	Zablocie
2980	179	Zablocie
2981	498	Kuklinskiego
2982	498	Kuklinskiego
2983	214	Gromadzka
2984	214	Gromadzka
2985	144	Lipska
2986	144	Lipska
2987	31	Rzebika
2988	31	Rzebika
2989	708	Jubilat
2990	599	Rondo Kocmyrzowskie
2991	\N	Wiktorowice Granica
2992	\N	Wiktorowice Granica
2993	\N	Zastów Dzialki
2994	\N	Zastów Dzialki
2995	\N	Wiktorowice Skrzyzowanie
2996	\N	Wiktorowice Skrzyzowanie
2997	\N	Wiktorowice Centrum
2998	\N	Wiktorowice Centrum
2999	\N	Zastów
3000	\N	Maciejowice
3001	\N	Wiktorowice Rozdzielnia Wód
3002	\N	Wiktorowice Rozdzielnia Wód
3003	\N	Maciejowice Góra
3004	\N	Maciejowice Góra
3005	349	Radziszów PKP
3006	58	Walcownia
3007	\N	Mrozowa
3008	\N	Mrozowa
3009	776	Blokowa
3010	776	Blokowa
3011	\N	Agencja Kraków Wschód
3012	\N	Agencja Kraków Wschód
3013	\N	Owczary
3014	\N	Owczary
3015	23	Januszowice
3016	23	Januszowice
3017	82	Bialopradnicka
3018	82	Bialopradnicka
3019	\N	Ruszcza Cmentarz
3020	\N	Ruszcza
3021	595	Azory
3022	706	Czerwienskiego
3023	212	Fiszera
3024	582	Radzikowskiego Osiedle
3025	\N	Krowodrza II
3026	\N	Niepolomice Moczydlo
3027	\N	Niepolomice Moczydlo
3028	\N	Niepolomice Kolejowa
3029	\N	Niepolomice Kolejowa
3030	\N	Niepolomice Dworzec
3031	\N	Niepolomice Dworzec
3032	660	Niepolomice Rynek
3033	660	Niepolomice Rynek
3034	\N	Niepolomice Batorego
3035	\N	Niepolomice Batorego
3036	\N	Niepolomice Batorego II
3037	\N	Niepolomice Batorego II
3038	\N	Wola Batorska Ruskie
3039	\N	Wola Batorska Ruskie
3040	\N	Chobot Lesniczówka
3041	\N	Niepolomice Jazy
3042	\N	Niepolomice Jazy
3043	\N	Niepolomice Jazy II
3044	\N	Niepolomice Jazy II
3045	\N	Wola Batorska Zwirownia
3046	\N	Wola Batorska Zwirownia
3047	\N	Wola Batorska Kosciól
3048	\N	Wola Batorska Kosciól
3049	\N	Wola Batorska Cmentarz
3050	\N	Wola Batorska Cmentarz
3051	\N	Wola Batorska Borek
3052	\N	Wola Batorska Borek
3053	\N	Wola Batorska Mikoniowiec
3054	\N	Wola Batorska Mikoniowiec
3055	\N	Wola Batorska Zamoglice
3056	\N	Wola Batorska Zamoglice
3057	\N	Zabierzów Bochenski Centrum
3058	\N	Zabierzów Bochenski Centrum
3059	\N	Chobot
3060	\N	Chobot
3061	\N	Wolica Most
3062	389	Grabie Szczurów
3063	715	Grabie Dom Kultury
3064	539	Brzegi III
3065	137	Grabie Kosciól
3066	\N	Staniatki Wiadukt
3067	539	Brzegi III
3068	389	Grabie Szczurów
3069	715	Grabie Dom Kultury
3070	137	Grabie Kosciól
3071	137	Grabie Kosciól
3072	393	Niepolomice Podgrabie
3073	393	Niepolomice Podgrabie
3074	\N	Niepolomice Pasternik
3075	\N	Niepolomice Pasternik
3076	\N	Niepolomice Katek
3077	\N	Niepolomice Katek
3078	\N	Niepolomice Poreby
3079	\N	Niepolomice Poreby
3080	\N	Niepolomice Diesla
3081	\N	Niepolomice Diesla
3082	\N	Niepolomice Wodna
3083	\N	Niepolomice Wodna
3084	\N	Niepolomice Plaszowska I
3085	\N	Niepolomice Plaszowska I
3086	\N	Niepolomice Kosciuszki
3087	\N	Niepolomice Kosciuszki
3088	\N	Ochmanów Otaczarnia
3089	\N	Ochmanów Oknoplast
3090	\N	Zakrzów
3091	\N	Zakrzów
3092	\N	Podleze Balachówka
3093	\N	Podleze Balachówka
3094	\N	Podleze Przedszkole
3095	\N	Podleze Straz
3096	\N	Podleze Centrum
3097	\N	Podleze Centrum
3098	\N	Staniatki Wiadukt
3099	\N	Niepolomice Wielicka
3100	\N	Niepolomice Wielicka
3101	\N	Niepolomice Boryczów
3102	\N	Niepolomice Boryczów
3103	144	Lipska
3104	214	Gromadzka
3105	214	Gromadzka
3106	\N	Rondo Grunwaldzkie
3107	\N	Wegrzce Sudól I
3108	\N	Wegrzce Sudól I
3109	\N	Skala Kmity
3110	31	Rzebika
3111	144	Lipska
3112	52	Garbarnia
3113	52	Garbarnia
3114	52	Garbarnia
3115	\N	Slomniki Osiedle
3116	\N	Slomniki Rynek
3117	\N	Slomniki Rynek
3118	\N	Slomniki Zagloby
3119	\N	Slomniki Zagloby
3120	\N	Polanowice
3121	\N	Polanowice
3122	\N	Marszowice Góry
3123	\N	Marszowice Góry
3124	\N	Wysiolek Luborzycki Radwany
3125	\N	Wysiolek Luborzycki Radwany
3126	\N	Wysiolek Luborzycki I
3127	\N	Wysiolek Luborzycki I
3128	\N	Marszowice
3129	\N	Marszowice
3130	\N	Polanowice Kolonia
3131	\N	Polanowice Kolonia
3132	\N	Marszowice I
3133	\N	Marszowice I
3134	\N	Ratajów Skrzyzowanie
3135	\N	Ratajów Skrzyzowanie
3136	\N	Niedzwiedz PKP
3137	\N	Niedzwiedz PKP
3138	\N	Niedzwiedz Felix
3139	\N	Niedzwiedz Felix
3140	\N	Wysiolek Luborzycki
3141	\N	Wysiolek Luborzycki
3142	449	Rondo Czyzynskie
3143	599	Rondo Kocmyrzowskie
3144	405	Agatowa
3145	405	Agatowa
3146	\N	Ochodza Dom Ludowy
3147	\N	Ochodza Dom Ludowy
3148	\N	Ochodza Odwisle
3149	\N	Ochodza Staw
3150	\N	Ochodza Staw
3151	276	Ochodza
3152	615	Rostworowskiego
3153	\N	Ruczaj I
3154	\N	Ruczaj I
3155	171	Borek Falecki
3156	171	Borek Falecki
3157	24	Kobierzynska
3158	24	Kobierzynska
3159	756	Góra Borkowska
3160	\N	Ruczaj I
3161	793	Teatr Ludowy
3162	793	Teatr Ludowy
3163	24	Kobierzynska
3164	\N	Armii Krajowej 
3165	\N	Wola Luborzycka Dzialki
3166	\N	Wola Luborzycka Dzialki
3167	\N	Mników Panska Góra
3168	\N	Mników Panska Góra
3169	\N	Mników Skaly
3170	\N	Mników Skaly
3171	\N	Czulów Skaly
3172	\N	Czulów Skaly
3173	436	Filharmonia
3174	505	Cracovia
3175	435	Wola Radziszowska Podgazle
3176	435	Wola Radziszowska Podgazle
3177	541	Wola Radziszowska Leg
3178	541	Wola Radziszowska Leg
3179	15	Golkowice
3180	\N	Czulówek Kapliczka
3181	\N	Czulówek
3182	\N	Sanka Skrzyzowanie
3183	\N	Sanka Skrzyzowanie
3184	\N	Rybna Nowy Swiat
3185	\N	Rybna Nowy Swiat
3186	\N	Czulów
3187	\N	Rybna Zagórze
3188	\N	Rybna Dolna
3189	86	Powstanców Wielkopolskich
3190	\N	Rybna Granica
3191	\N	Rybna Granica
3192	\N	Jeziorzany Kosciól
3193	\N	Jeziorzany Kosciól
3194	\N	Raczna II
3195	\N	Raczna II
3196	\N	Czulów Kapliczka
3197	\N	Czulów Kapliczka
3198	\N	Raczna Kosciól
3199	\N	Raczna Kosciól
3200	528	Bunscha
3201	528	Bunscha
3202	\N	Konary Sek
3203	\N	Konary Sek
3204	117	Kostrze
3205	117	Kostrze
3206	\N	Biskupinska
3207	601	Orzeszkowej
3208	601	Orzeszkowej
3209	\N	Podgrabie Most
3210	137	Grabie Kosciól
3211	\N	Bienczyce
3212	86	Powstanców Wielkopolskich
3213	86	Powstanców Wielkopolskich
3214	732	Tischnera
3215	\N	Niepolomice Fabryczna
3216	\N	Niepolomice Fabryczna
3217	\N	Niepolomice Wodna
3218	\N	Niepolomice Wodna
3219	271	Lagiewniki
3220	271	Lagiewniki
3221	697	Rzemieslnicza
3222	271	Lagiewniki
3223	271	Lagiewniki
3224	271	Lagiewniki
3225	461	Krowodrza Górka
3226	\N	Dabrowa Szlachecka Krzemiennik
3227	\N	Dabrowa Szlachecka Krzemiennik
3228	\N	Sidzina Skrzyzowanie
3229	93	Fort Winnica
3230	93	Fort Winnica
3231	199	Winnicka
3232	199	Winnicka
3233	\N	Terminal Krajowy
3234	814	Kostrze OSP
3235	484	Skawina Wyspianskiego
3236	777	Miodowa
3237	359	Starowislna
3238	370	Libertów
3239	370	Libertów
3240	\N	Morawica
3241	\N	Morawica Krzyzówka
3242	\N	Morawica Krzyzówka
3243	\N	Giebultów Zbiornik
3244	\N	Giebultów Zbiornik
3245	\N	Modlniczka Poligon
3246	\N	Modlniczka Poligon
3247	\N	Skrzyzowanie do Podchruscia
3248	\N	Czulówek Kapliczka
3249	\N	Czulówek Kapliczka
3250	\N	Krzecin Czesna
3251	\N	Krzecin Czesna
3252	\N	Wola Zabierzowska
3253	\N	Wola Zabierzowska
3254	250	Dworzec Glówny Wschód
3255	\N	Bedkowice Petla
3256	\N	Niepolomice Fabryczna
3257	\N	Niepolomice Fabryczna
3258	\N	Krzecin Czesna
3259	\N	Krzecin Czesna
3260	139	Grota Roweckiego
3261	139	Grota Roweckiego
3262	\N	Ruczaj I
3263	\N	Ruczaj I
3264	615	Rostworowskiego
3265	615	Rostworowskiego
3266	355	Ruczaj
3267	355	Ruczaj
3268	\N	Wydz. Biologii UJ
3269	\N	Wydz. Biologii UJ
3270	\N	Bobrzynskiego
3271	\N	Bobrzynskiego
3272	347	Kampus UJ
3273	278	Smolenskiego
3274	84	Wodociagi
3275	84	Wodociagi
3276	709	Plac Wszystkich Swietych
3277	709	Plac Wszystkich Swietych
3278	\N	Wadów Osrodek Pracy
3279	\N	Wadów Osrodek Pracy
3280	\N	Wydzial Biologii UJ
3281	\N	Wydzial Biologii UJ
3282	\N	Wzgórza Krzeslawickie I
3283	670	Wielkie Drogi
3284	670	Wielkie Drogi
3285	\N	Wzgórza Krzeslawickie I
3286	\N	Wzgórza Krzeslawickie I
3287	\N	Czulówek Kapliczka
3288	\N	Sanka Skrzyzowanie
3289	\N	Sanka Skrzyzowanie
3290	\N	Rybna Dolna
3291	\N	Rybna Granica
3292	\N	Rybna Granica
3293	\N	Jeziorzany Kosciól
3294	\N	Jeziorzany Kosciól
3295	\N	Raczna Kosciól
3296	\N	Raczna Kosciól
3297	93	Fort Winnica
3298	93	Fort Winnica
3299	199	Winnicka
3300	199	Winnicka
3301	\N	Czulówek Kapliczka
3302	\N	Czulówek Kapliczka
3303	\N	Wydzial Biologii UJ
3304	\N	Wydzial Biologii UJ
3305	547	Solvay
3306	\N	Cmentarz Batowice Wschód
3307	\N	Cmentarz Batowice Wschód
3308	167	Darwina
3309	\N	Cmentarz Grebalów I
3310	739	Cmentarz Grebalów
3311	273	Majora
3312	\N	Sliwiaka
3313	\N	Sliwiaka
3314	638	Poroninska
3315	638	Poroninska
3316	212	Fiszera
3317	582	Radzikowskiego Osiedle
3318	\N	Karowa I
3319	\N	Karowa I
3320	540	Centrum JP II
3321	540	Centrum JP II
3324	\N	Bronowice Male 
3325	\N	Korabniki
3326	\N	Skawina Pawilon
3327	452	Skawina Cmentarz Komunalny
3328	452	Skawina Cmentarz Komunalny
3329	447	Aleja 29 Listopada
3330	447	Aleja 29 Listopada
3331	447	Aleja 29 Listopada
3332	447	Aleja 29 Listopada
3333	276	Ochodza
3334	540	Centrum JP II
3335	540	Centrum JP II
3336	\N	Kopanka Przeryte Petla
3337	\N	Kopanka II
3338	\N	Kopanka II
3339	760	Kopanka Kapliczka
3340	760	Kopanka Kapliczka
3341	211	Kopanka Szkola
3342	211	Kopanka Szkola
3343	\N	Robotnicza
3344	\N	Robotnicza
3345	40	Skawina Podbory
3346	218	Jurczyce Dom Ludowy
3347	218	Jurczyce Dom Ludowy
3348	\N	Jurczyce Szkola
3349	\N	Jurczyce Szkola
3350	\N	Jurczyce Podole
3351	\N	Jurczyce Podole
3352	\N	Radziszów Za Mogilka
3353	\N	Radziszów Za Mogilka
3354	468	Grabie Polanka
3355	315	Grabie Kuznia
3356	315	Grabie Kuznia
3357	193	Grabie
3358	276	Ochodza
3359	\N	Sidzina Las
3360	479	Przykopy
3361	749	Skawina Energetyków
3362	749	Skawina Energetyków
3363	\N	Krzecin Szkola
3364	66	Skawina Nad Potokiem
3365	66	Skawina Nad Potokiem
3366	\N	Radziszów Za Mogilka
3367	\N	Radziszów Za Mogilka
3368	675	Radziszów Kladka
3369	467	Goluchowice Jurczyce
3370	\N	Zabawa
3371	\N	Zabawa
3372	\N	Mala Wies
3373	\N	Mala Wies
3374	\N	Sulków
3375	\N	Sulków
3376	\N	Skawina Os.Radziszowskie
3377	665	Skawina Radziszowska
3378	703	Skawina Cmentarz
3379	699	Skawina Podlipki
3380	665	Skawina Radziszowska
3381	490	Skawina Popieluszki
3382	699	Skawina Podlipki
3383	\N	Skawina Os.Radziszowskie
3384	\N	Radziszów Stare Sanatorium
3385	\N	Radziszów Stare Sanatorium
3386	68	Skawina Ajka
3387	68	Skawina Ajka
3388	699	Skawina Podlipki
3389	259	Skawina Tyniecka Osiedle
3390	259	Skawina Tyniecka Osiedle
3391	\N	Skawina Tyniecka
3392	245	Skawina Samborek Most
3393	245	Skawina Samborek Most
3394	445	Skawina Korabniki
3395	512	Brzyczyna
3396	512	Brzyczyna
3397	703	Skawina Cmentarz
3398	490	Skawina Popieluszki
3399	68	Skawina Ajka
3400	68	Skawina Ajka
3401	\N	Krzecin Kosciól
3402	\N	Skawina Tyniecka
3403	445	Skawina Korabniki
3404	703	Skawina Cmentarz
3405	\N	Kopanka
3406	\N	Kopanka II
3407	\N	Kopanka II
3408	760	Kopanka Kapliczka
3409	760	Kopanka Kapliczka
3410	211	Kopanka Szkola
3411	211	Kopanka Szkola
3412	735	Skawina Robotnicza
3413	735	Skawina Robotnicza
3414	\N	Jurczyce Szkola
3415	\N	Jurczyce Podole
3416	315	Grabie Kuznia
3417	315	Grabie Kuznia
3418	193	Grabie
3419	512	Brzyczyna
3420	749	Skawina Energetyków
3421	749	Skawina Energetyków
3422	66	Skawina Nad Potokiem
3423	66	Skawina Nad Potokiem
3424	\N	Radziszów Za Mogilka
3425	218	Jurczyce Dom Ludowy
3426	218	Jurczyce Dom Ludowy
3427	\N	Jurczyce Podole
3428	\N	Jurczyce Szkola
3429	\N	Radziszów Za Mogilka
3430	\N	Zabawa
3431	\N	Zabawa
3432	\N	Mala Wies
3433	\N	Mala Wies
3434	\N	Mogilany Rynek
3435	\N	Mogilany Rynek
3436	\N	Sulków
3437	\N	Sulków
3438	\N	Mogilany Cicha
3439	\N	Mogilany Wiadukt
3440	\N	Mogilany Wiadukt
3441	703	Skawina Cmentarz
3442	100	Skawina
3443	\N	Mogilany Cicha
3444	490	Skawina Popieluszki
3445	\N	Mogilany Cicha
3446	\N	Mogilany Cicha
3447	347	Kampus UJ
3448	424	Cracovia Blonia
3449	424	Cracovia Blonia
3450	55	Cracovia Stadion
3451	347	Kampus UJ
3452	347	Kampus UJ
3453	642	Lubocza PKP
3454	\N	Biezanów Pomnik
3455	\N	Biezanów Pomnik
3456	610	Teatr Bagatela
3457	570	Wieliczka Park
3458	570	Wieliczka Park
3459	570	Wieliczka Park
3460	570	Wieliczka Park
3461	\N	Wzgórza Krzeslaw I
3462	\N	Wzgórza Krzeslaw I
3463	\N	Wzgórza Krzeslaw I
3464	\N	Bedkowice Petla
3465	359	Starowislna
3466	\N	Balicka Wiadukt
3467	\N	Balicka Wiadukt
3468	\N	Murownia
3469	610	Teatr Bagatela
3470	\N	Michalowice Osrodek Zdrowia
3471	\N	Michalowice Osrodek Zdrowia
3472	\N	Michalowice II
3473	\N	Michalowice Kwiaty Polne
3474	\N	Michalowice Kwiaty Polne
3475	\N	Michalowice Las Michalowski
3476	\N	Michalowice Las Michalowski
3477	\N	Zabawa I
3478	\N	Wieliczka Niepolomska
3479	\N	Batowice Stacja PKP
3480	\N	Batowice Stacja PKP
3481	\N	Wola Zachariaszowska Kresy
3482	\N	Wola Zachariaszowska Kresy
3483	\N	Jeziorzany I
3484	\N	Jeziorzany I
3485	784	Piekary III
3486	784	Piekary III
3487	355	Ruczaj
3488	355	Ruczaj
3489	\N	Michalowice Las Michalowski
3490	\N	Wola Zachariaszowska Kresy
3491	\N	Zakonce
3492	\N	Jasnogórska
3493	\N	Wilenska
3494	\N	Wilenska
3495	\N	Wilenska
3496	\N	Mobilis
3497	\N	Sliwiaka Zaklady
3498	\N	Sliwiaka Zaklady
3499	\N	Lusina Dolna
3500	\N	Lusina Dolna
3501	\N	Budzyn
3502	805	Benedyktowicza
3503	805	Benedyktowicza
3504	811	Uniwersytet Rolniczy
3505	\N	Garlica Duchowna Rozjazd
3506	\N	Garlica Duchowna Rozjazd
3507	\N	Garliczka Chochól
3508	\N	Garliczka Chochól
3509	\N	Owczary Górna
3510	\N	Owczary Górna
3511	\N	Owczary Dluga
3512	\N	Owczary Dluga
3513	\N	Owczary Gajowa
3514	\N	Owczary Gajowa
3515	310	Poczta Glówna
3516	394	Wawel
3517	394	Wawel
3518	228	Petrazyckiego
3519	557	Tomaszowice
3520	557	Tomaszowice
3521	708	Jubilat
3522	597	Pradnik Bialy Zachód
3523	622	Miechowity
3524	622	Miechowity
3525	\N	Port Lotniczy (Airport)
3526	63	Salwator
3527	\N	Plac Centralny
3528	\N	Fabryka Drozdzy
3529	\N	Biezanów  Nowy
3530	\N	Plac Centralny
3531	\N	Weigla
3532	617	Na Zaleczu
3533	617	Na Zaleczu
3534	597	Pradnik Bialy Zachód
3535	63	Salwator
3536	\N	Biezanów  Nowy
3537	\N	Balice PKP
3538	\N	Port Lotniczy (Airport)
3539	\N	Kraków Airport T2
3540	\N	Kraków Airport T2
3541	\N	Biezanów Nowy
3542	\N	Mydlniki Granica Miasta
3543	\N	Mydlniki Granica Miasta
3544	632	Pachonskiego
3545	336	Pradnik Bialy
3546	\N	Batalionu "Skala" AK
3547	\N	Piaszczysta
3548	632	Pachonskiego
3549	\N	Piaszczysta
3550	535	Przybyszewskiego
3551	535	Przybyszewskiego
3552	\N	Cmentarz Rakowicki Zachód
3553	303	Bosaków
3554	303	Bosaków
3555	219	Armii Krajowej
3556	219	Armii Krajowej
3557	\N	Kraków Airport T1
3558	362	Misnienska
3559	362	Misnienska
3560	\N	Os. Mistrzejowice Nowe
3561	\N	Nad Dlubnia
3562	60	Makuszynskiego
3563	620	Wankowicza
3564	308	Soltysowska Osiedle
3565	620	Wankowicza
3566	60	Makuszynskiego
3567	\N	Nad Dlubnia
3568	\N	Os. Mistrzejowice Nowe
3569	620	Wankowicza
3570	270	Rondo Hipokratesa
3571	270	Rondo Hipokratesa
3572	308	Soltysowska Osiedle
3573	\N	Wegrzynowice Dól
3574	\N	Wegrzynowice Dól
3575	474	Siwka
3576	474	Siwka
3577	607	Koszykarska
3578	426	Tyniecka Autostrada
3579	109	Kolna
3580	747	Bagienna
3581	747	Bagienna
3582	109	Kolna
3583	607	Koszykarska
3584	\N	Surzyckiego
3585	\N	Surzyckiego
3586	398	Sulkowskiego
3587	398	Sulkowskiego
3588	156	Ks. Targosza
3589	156	Ks. Targosza
3590	17	Zajezdnia Plaszów
3591	552	Albatrosów
3592	\N	Zlocieniowa
3593	\N	Drozdzowa
3594	110	Nowy Biezanów
3595	\N	Nowy Biezanów Poludnie
3596	\N	Kosocicka
3597	810	Jerzmanowskiego
3598	110	Nowy Biezanów
3599	110	Nowy Biezanów
3600	810	Jerzmanowskiego
3601	\N	Kosocicka
3602	\N	Zlocieniowa
3603	\N	Fort Swoszowice
3604	\N	Malinowskiego
3605	\N	Soboniowice Granica Miasta
3606	\N	Zelazowskiego
3607	\N	Cechowa
3608	\N	Luzycka
3609	\N	Bochenka
3610	\N	Bochenka
3611	\N	Luzycka
3612	\N	Cechowa
3613	\N	Szczegów
3614	\N	Zelazowskiego
3615	\N	Malinowskiego
3616	\N	Soboniowice Granica Miasta
3617	\N	Fort Swoszowice
3618	325	Wrony
3619	325	Wrony
3620	738	Warchalowskiego
3621	738	Warchalowskiego
3622	270	Rondo Hipokratesa
3623	270	Rondo Hipokratesa
3624	\N	Lema
3625	\N	Lema
3626	154	Krowodrza Urzedy Skarbowe
3627	154	Krowodrza Urzedy Skarbowe
3628	\N	Druzbackiej
3629	\N	Druzbackiej
3630	\N	Niebieska Autostrada
3631	\N	Niebieska Autostrada
3632	\N	Sudolska
3633	\N	Bulwarowa Ogródki Dzialkowe
3634	\N	Sieroszewskiego
3635	\N	Sieroszewskiego
3636	\N	Stare Wislisko
3637	\N	Stare Wislisko
3638	\N	Lasek Mogilski
3639	\N	Lasek Mogilski
3640	\N	Biskupinska
3641	\N	Biskupinska
3642	\N	Obronców Modlina
3643	\N	Obronców Modlina
3644	\N	Barwna
3645	\N	Barwna
3646	\N	Wegrzynowicka
3647	\N	Wegrzynowicka
3648	\N	Wadów Glinik
3649	\N	Wadów Glinik
3650	\N	Wadów Os. Kolejowe
3651	\N	Wadów Os. Kolejowe
3652	\N	Park "Skaly Twardowskiego"
3653	\N	Park "Skaly Twardowskiego"
3654	522	Pychowice
3655	522	Pychowice
3656	254	Rodzinna
3657	254	Rodzinna
3658	\N	Górka Pychowicka
3659	\N	Górka Pychowicka
3660	244	Fort Bodzów
3661	244	Fort Bodzów
3662	\N	Waly Wislane
3663	\N	Waly Wislane
3664	773	Boleslawa Smialego
3665	773	Boleslawa Smialego
3666	\N	Luczynskiego
3667	\N	Slona Woda
3668	\N	Slona Woda
3669	\N	Hallera
3670	\N	Hallera
3671	374	Nowy Prokocim
3672	374	Nowy Prokocim
3673	426	Tyniecka Autostrada
3674	102	Soltysowska Zaklady
3675	102	Soltysowska Zaklady
3676	551	Soltysowska
3677	551	Soltysowska
3678	618	Gustawa Morcinka
3679	618	Gustawa Morcinka
3680	501	Tretówka
3681	501	Tretówka
3682	\N	Geologów
3683	\N	Geologów
3684	\N	Soboniowice Granica Miasta
3685	518	Olszanica Ogródki Dzialkowe
3686	518	Olszanica Ogródki Dzialkowe
3687	\N	Surzyckiego
3688	\N	Lindego
3689	\N	Biezanów Drozdzownia PKP
3690	\N	Biezanów Drozdzownia PKP
3691	\N	Swidzinskiego
3692	17	Zajezdnia Plaszów
3693	583	Natansona
3694	583	Natansona
3695	796	Slomczynskiego
3696	796	Slomczynskiego
3697	\N	Druzbackiej
3698	\N	Druzbackiej
3699	\N	Cmentarz Grebalów Zachód
3700	109	Kolna
3701	109	Kolna
3702	270	Rondo Hipokratesa
3703	620	Wankowicza
3704	\N	Cmentarz Rakowicki Zachód
3705	\N	Cmentarz Rakowicki Zachód
3706	576	Dworzec Glówny Zachód
3707	\N	Lindego
3708	576	Dworzec Glówny Zachód
3709	576	Dworzec Glówny Zachód
3710	\N	Lema
3711	\N	Lema
3712	576	Dworzec Glówny Zachód
3713	\N	Mydlniki Granica Miasta
3714	\N	Biezanów Granica Miasta
3715	\N	Kordylewskiego
3716	\N	Kordylewskiego
3717	\N	Cmentarz Grebalów Zachód
3718	\N	Cmentarz Grebalów Zachód
3719	588	Suche Stawy
3720	588	Suche Stawy
3721	374	Nowy Prokocim
3722	374	Nowy Prokocim
3723	362	Misnienska
3724	362	Misnienska
3725	620	Wankowicza
3726	620	Wankowicza
3727	270	Rondo Hipokratesa
3728	270	Rondo Hipokratesa
3729	\N	Szczegów
3730	\N	Biezanów Granica Miasta
3731	\N	Biezanów Granica Miasta
3732	\N	Nowy Biezanów Poludnie
3733	\N	Slaskiego
3734	\N	Slaskiego
3735	\N	Kraków Airport T1
3736	618	Gustawa Morcinka
3737	618	Gustawa Morcinka
3738	552	Albatrosów
3739	552	Albatrosów
3740	\N	Batalionu "Skala" AK
3741	535	Przybyszewskiego
3742	17	Zajezdnia Plaszów
3743	270	Rondo Hipokratesa
3744	325	Wrony
3745	\N	Dziekanowice Stacja Batowice
3746	\N	Dziekanowice Stacja Batowice
3747	110	Nowy Biezanów
3748	445	Skawina Korabniki
3749	\N	Górna Wies
3750	\N	Górna Wies
3751	\N	Gaik
3752	\N	Gaik
3753	\N	Leszka Bialego
3754	\N	Leszka Bialego
3755	387	Skawina Os. Radziszowskie
3756	387	Skawina Os. Radziszowskie
3757	\N	Glogera Granica Miasta
3758	\N	Glogera Granica Miasta
3759	\N	Na Budzyniu
3760	\N	Na Budzyniu
3761	\N	Jordanowska
3762	\N	Jordanowska
3763	\N	Zeslawice Ogródki Dzialkowe
3764	\N	Zeslawice Ogródki Dzialkowe
3765	\N	Jana Kaziemierza
3766	\N	Jana Kaziemierza
3767	223	Wielicka Granica Miasta
3768	223	Wielicka Granica Miasta
3769	223	Wielicka Granica Miasta
3770	223	Wielicka Granica Miasta
3771	223	Wielicka Granica Miasta
3772	\N	MOBILIS
3773	77	Cichy Kacik
3774	\N	Biezanów Cmentarz
3775	77	Cichy Kacik
3776	762	Barbary
3777	\N	Bystronia
3778	\N	Bystronia
3779	\N	Jana Kazimierza
3780	\N	Jana Kazimierza
3781	\N	Aleja Waszyngtona
3782	\N	Aleja Waszyngtona
3783	\N	Os.Piastów
3784	708	Jubilat
3785	436	Filharmonia
3786	505	Cracovia
3787	270	Rondo Hipokratesa
3788	\N	Garlica Duchowna Rozjazd
3789	\N	Garlica Duchowna Rozjazd
3790	\N	Garliczka Chochól
3791	\N	Garliczka Chochól
3792	\N	Owczary Górna
3793	\N	Owczary Górna
3794	\N	Owczary Dluga
3795	\N	Owczary Dluga
3796	\N	Owczary Gajowa
3797	\N	Owczary Gajowa
3798	\N	Drozdzowa
3799	\N	Dwór Czeczów
3800	\N	Lipowskiego
3801	\N	Weigla
3802	\N	Biezanów Drozdzownia PKP
3803	\N	Biezanów Drozdzownia PKP
3804	\N	Biezanów Pomnik
3805	\N	Biezanów Pomnik
3806	\N	Grzybów
3807	\N	Kobylany Remiza
3808	\N	Belwederczyków
3809	\N	Belwederczyków
3810	\N	Opatkowice Zadworze
3811	\N	Opatkowice Zadworze
3812	\N	Balice Grzybów
3813	\N	Balice Lesna
3814	\N	Balice Lesna
3815	\N	Balice Grzybów
3816	\N	Biezanów Potrzask
3817	\N	Pruszynskiego
3818	731	Zlocien
3819	\N	PB
3820	\N	PW
3821	\N	PP
3822	712	Biezanów Bazy
3823	712	Biezanów Bazy
3824	\N	Czyzyny Dworzec
3825	336	Pradnik Bialy
3826	595	Azory
3827	\N	Stachiewicza
3828	229	Szpital Narutowicza
3829	492	Okulickiego
3830	125	Lukasiewicza
3831	182	Radzikowskiego
3832	\N	Basztowa LOT
3833	64	Batorego
3834	64	Batorego
3835	633	Mistrzejowice
3836	\N	Orkana
3837	434	Plaszów Szkola
3838	563	Motyla
3839	\N	Zalew Bagry
3840	\N	Baluckiego
3841	24	Kobierzynska
3842	754	Szwedzka
3843	266	Borsucza
3844	266	Borsucza
3845	410	Podwierzbie
3846	\N	Nad Drwina
3847	20	Piaski Wielkie
3848	104	Libertów Dolny
3849	104	Libertów Dolny
3850	548	Dworzec Plaszów
3851	\N	Sudolska
3852	728	Kleeberga
3853	30	Szpital Rydygiera
3854	49	Plac Bohaterów Getta
3855	49	Plac Bohaterów Getta
3856	322	Makowskiego
3857	322	Makowskiego
3858	322	Makowskiego
3859	322	Makowskiego
3860	330	Lusina Granica
3861	330	Lusina Granica
3862	56	Piasta Kolodzieja
3863	104	Libertów Dolny
3864	330	Lusina Granica
3865	\N	Sucha
3866	\N	Sucha
3867	\N	Os.Na Stoku
3868	620	Wankowicza
3869	\N	Cmentarz Rakowicki Zachód
3870	\N	Krakowska Akademia
3871	\N	Bohomolca
3872	633	Mistrzejowice
3873	220	Rondo Mogilskie
3874	453	Biskupa Prandoty
3875	273	Majora
3876	274	Brodowicza
3877	24	Kobierzynska
3878	595	Azory
3879	706	Czerwienskiego
3880	212	Fiszera
3881	582	Radzikowskiego Osiedle
3882	86	Powstanców Wielkopolskich
3883	461	Krowodrza Górka
3884	273	Majora
3885	\N	Mala Góra
3886	\N	Mala Góra
3887	\N	Biezanów Cmentarz
3888	674	Wazewskiego
3889	674	Wazewskiego
3890	\N	Wrózenicka
3891	\N	Wrózenice Górka
3892	\N	Hektary
3893	\N	Ostafina
3894	\N	Koscielniki
3895	\N	Wyciaze Zachód
3896	\N	Szymanskiego
3897	\N	Wyciaska
3898	\N	Szymanskiego
3899	\N	Szymanskiego
3900	\N	Szymanskiego
3901	\N	Wyciaska
3902	\N	Wyciaze Zachód
3903	\N	Koscielniki
3904	\N	Ostafina
3905	\N	Hektary
3906	\N	Wrózenicka
3907	\N	Wrózenice Górka
3908	\N	Brzeska
3909	\N	Zakepie
3910	\N	Zakepie
3911	\N	Brzeska
3912	\N	Chalupki Górne
3913	\N	Chalupki Górne
3914	\N	Oczyszczalnia Scieków "Kujawy"
3915	\N	Oczyszczalnia Scieków "Kujawy"
3916	\N	Branice Osrodek Zdrowia
3917	\N	Branice Osrodek Zdrowia
3918	\N	Truskawkowa
3919	\N	Truskawkowa
3920	\N	Rzepakowa Swietlica
3921	\N	Rzepakowa Swietlica
3922	\N	Ciekowiec
3923	\N	Ciekowiec
3924	\N	Nadbrzezie
3925	\N	Nadbrzezie
3926	\N	Wrózenice Górka
3927	\N	Wrózenice Górka
3928	\N	Dymarek
3929	\N	Dymarek
3930	347	Kampus UJ
3931	347	Kampus UJ
3932	262	Smolki
3933	262	Smolki
3934	\N	Skawina  Elektrownia
3935	\N	Skawina  Elektrownia
3936	\N	Skawina  Pilsudskiego
3937	\N	Skawina  Pilsudskiego
3938	\N	Wola Bat. Ruskie
3939	\N	Wola Bat. Ruskie
3940	\N	Wola Batorska  Zwirownia
3941	\N	Wola Batorska  Zwirownia
3942	\N	Wola Batorska  Kosciól
3943	\N	Wola Batorska  Kosciól
3944	\N	Wola Batorska  Cmentarz
3945	\N	Wola Batorska  Cmentarz
3946	\N	Wola Batorska  Borek
3947	\N	Wola Batorska  Borek
3948	265	Zajezdnia Bienczyce
3949	\N	PH
3950	\N	PT
3951	\N	Os.Dywizjonu 303
3952	110	Nowy Biezanów
3953	110	Nowy Biezanów
3954	160	Mlynka Petla
3955	\N	Zelków
3956	\N	Balicka
3957	81	UR Balicka
3958	562	Mydlniki PKP
3959	\N	Zakliki
3960	658	Mydlniki
3961	\N	Mydlniki Stawy
3962	\N	Mydlniki Granica Miasta
3963	\N	Podkamycze
3964	\N	Podkamycze
3965	\N	Mydlniki Granica Miasta
3966	\N	Mydlniki Stawy
3967	658	Mydlniki
3968	658	Mydlniki
3969	562	Mydlniki PKP
3970	350	Rondo Ofiar Katynia
3971	324	Katowicka
3972	\N	Pasternik Cmentarz
3973	103	Pasternik
3974	\N	Ojcowska
3975	\N	Bronowice Wielkie
3976	350	Rondo Ofiar Katynia
3977	350	Rondo Ofiar Katynia
3978	324	Katowicka
3979	\N	Pasternik Cmentarz
3980	103	Pasternik
3981	\N	Ojcowska
3982	\N	Bronowice Wielkie
3983	\N	Gaik
3984	\N	Gaik
3985	9	Tonie Skrzyzowanie
3986	90	Pekowice
3987	9	Tonie Skrzyzowanie
3988	\N	Marszowiec
3989	\N	Witkowice
3990	\N	Witkowice Nowe
3991	\N	Dozynkowa
3992	71	Siewna Wiadukt
3993	\N	Bociana
3994	475	Górka Narodowa
3995	536	Clepardia
3996	656	Mackiewicza
3997	428	Imbramowska
3998	428	Imbramowska
3999	656	Mackiewicza
4000	656	Mackiewicza
4001	536	Clepardia
4002	71	Siewna Wiadukt
4003	71	Siewna Wiadukt
4004	\N	Bociana
4005	\N	Dozynkowa
4006	\N	Witkowice Nowe
4007	\N	Kaczorówka
4008	779	Wyki
4009	632	Pachonskiego
4010	336	Pradnik Bialy
4011	766	Pleszowska
4012	62	Opolska Kladka
4013	\N	Batalionu "Skala" AK
4014	\N	Piaszczysta
4015	157	Opolska
4016	157	Opolska
4017	\N	Kaczorówka
4018	779	Wyki
4019	597	Pradnik Bialy Zachód
4020	62	Opolska Kladka
4021	632	Pachonskiego
4022	\N	Piaszczysta
4023	766	Pleszowska
4024	766	Pleszowska
4025	595	Azory
4026	376	Rózyckiego
4027	\N	Stachiewicza
4028	317	Lobzów PKP
4029	\N	Lokietka
4030	302	Wybickiego
4031	726	Bratyslawska
4032	692	Lekarska
4033	229	Szpital Narutowicza
4034	291	Urzad Marszalkowski
4035	647	Wroclawska
4036	376	Rózyckiego
4037	\N	Lokietka
4038	302	Wybickiego
4039	291	Urzad Marszalkowski
4040	647	Wroclawska
4041	726	Bratyslawska
4042	726	Bratyslawska
4043	726	Bratyslawska
4044	692	Lekarska
4045	788	Zdrowa
4046	461	Krowodrza Górka
4047	519	Nowy Kleparz
4048	\N	Basztowa LOT
4049	201	Grottgera
4050	610	Teatr Bagatela
4051	234	Plac Inwalidów
4052	380	AGH
4053	297	Czarnowiejska
4054	604	Kawiory
4055	430	Biprostal
4056	525	Miasteczko Studenckie AGH
4057	535	Przybyszewskiego
4058	94	Uniwersytet Pedagogiczny
4059	7	Bronowice
4060	606	Mazowiecka
4061	606	Mazowiecka
4062	430	Biprostal
4063	430	Biprostal
4064	430	Biprostal
4065	430	Biprostal
4066	7	Bronowice
4067	7	Bronowice
4068	535	Przybyszewskiego
4069	525	Miasteczko Studenckie AGH
4070	525	Miasteczko Studenckie AGH
4071	525	Miasteczko Studenckie AGH
4072	604	Kawiory
4073	297	Czarnowiejska
4074	380	AGH
4075	234	Plac Inwalidów
4076	234	Plac Inwalidów
4077	610	Teatr Bagatela
4078	\N	Basztowa LOT
4079	201	Grottgera
4080	519	Nowy Kleparz
4081	519	Nowy Kleparz
4082	519	Nowy Kleparz
4083	519	Nowy Kleparz
4084	458	Dworzec Towarowy
4085	\N	Cmentarz Rakowicki Zachód
4086	234	Plac Inwalidów
4087	77	Cichy Kacik
4088	77	Cichy Kacik
4089	257	Opolska Estakada
4090	811	Uniwersytet Rolniczy
4091	585	Lublanska
4092	447	Aleja 29 Listopada
4093	507	Powstanców
4094	611	Kuznicy Kollatajowskiej
4095	\N	Belwederczyków
4096	729	Pradnik Czerwony
4097	786	Strzelców
4098	388	Olszecka
4099	470	Rondo Barei
4100	470	Rondo Barei
4101	251	Olsza II
4102	622	Miechowity
4103	303	Bosaków
4104	440	Batowice
4105	197	Batowice PKP
4106	466	Park Wodny
4107	\N	Os.Oswiecenia
4108	492	Okulickiego
4109	334	Wislicka
4110	\N	Os.Dywizjonu 303
4111	131	Stella-Sawickiego
4112	526	AWF
4113	\N	Wieczysta
4114	\N	Ugorek
4115	337	Akacjowa
4116	78	Rondo Mlynskie
4117	320	Pilotów
4118	125	Lukasiewicza
4119	429	Narzymskiego
4120	\N	Brogi
4121	181	Uniwersytet Ekonomiczny
4122	\N	Rakowicka
4123	158	Bialucha
4124	573	Dworzec Glówny
4125	573	Dworzec Glówny
4126	494	Lubicz
4127	181	Uniwersytet Ekonomiczny
4129	220	Rondo Mogilskie
4130	429	Narzymskiego
4131	636	Cmentarz Rakowicki
4132	636	Cmentarz Rakowicki
4133	636	Cmentarz Rakowicki
4134	453	Biskupa Prandoty
4135	\N	Brogi
4136	303	Bosaków
4137	\N	Wilenska
4138	257	Opolska Estakada
4139	257	Opolska Estakada
4140	257	Opolska Estakada
4141	585	Lublanska
4142	447	Aleja 29 Listopada
4143	447	Aleja 29 Listopada
4144	447	Aleja 29 Listopada
4145	507	Powstanców
4146	611	Kuznicy Kollatajowskiej
4147	\N	Belwederczyków
4148	729	Pradnik Czerwony
4149	786	Strzelców
4150	251	Olsza II
4151	622	Miechowity
4152	622	Miechowity
4153	388	Olszecka
4154	470	Rondo Barei
4155	470	Rondo Barei
4156	470	Rondo Barei
4157	197	Batowice PKP
4158	440	Batowice
4159	466	Park Wodny
4160	\N	Os.Oswiecenia
4161	492	Okulickiego
4162	334	Wislicka
4163	334	Wislicka
4164	334	Wislicka
4165	\N	Os.Dywizjonu 303
4166	\N	Ugorek
4167	337	Akacjowa
4168	320	Pilotów
4169	78	Rondo Mlynskie
4170	158	Bialucha
4171	\N	Wieczysta
4172	\N	Wieczysta
4173	526	AWF
4174	182	Radzikowskiego
4175	\N	Basztowa LOT
4176	494	Lubicz
4177	494	Lubicz
4178	610	Teatr Bagatela
4179	64	Batorego
4180	64	Batorego
4181	141	Urzednicza
4182	141	Urzednicza
4183	\N	Balicka Wiadukt
4184	\N	Balicka Wiadukt
4185	591	Bronowice Male
4186	194	Zarzecze
4187	219	Armii Krajowej
4188	194	Zarzecze
4189	219	Armii Krajowej
4190	\N	Tondosa
4191	\N	Lajkonika
4192	646	Strzelnica
4193	72	Sielanka
4194	73	Park Decjusza
4195	358	Baba Jaga
4196	524	ZOO
4197	358	Baba Jaga
4198	\N	Tondosa
4199	646	Strzelnica
4200	72	Sielanka
4201	72	Sielanka
4202	454	Kasztanowa
4203	\N	Kopalina
4204	5	Królowej Jadwigi
4205	377	Chelm
4206	654	Raczkiewicza
4207	73	Park Decjusza
4208	454	Kasztanowa
4209	\N	Kopalina
4210	377	Chelm
4211	654	Raczkiewicza
4212	5	Królowej Jadwigi
4213	513	Zakamycze
4214	584	Kosmowskiej
4215	584	Kosmowskiej
4216	448	Olszanica Kapliczka
4217	\N	Kraków Airport T1
4218	448	Olszanica Kapliczka
4219	\N	Trzecia Góra
4220	\N	Trzecia Góra
4221	\N	Wegrzce Centrum
4222	\N	Bibice Petla
4223	\N	Narama
4224	\N	Pielgrzymowice
4225	\N	Górna Wies
4226	\N	Zakonce
4227	\N	Droga do Garliczki
4228	\N	Garlica Duchowna
4229	\N	Garlica Murowana
4230	\N	Podskale
4231	136	Zielonki Rozjazd
4232	136	Zielonki Rozjazd
4233	136	Zielonki Rozjazd
4234	136	Zielonki Rozjazd
4235	\N	Podskale
4236	\N	Garlica Murowana
4237	\N	Garlica Duchowna
4238	\N	Droga do Garliczki
4239	\N	Wola Zachariaszowska
4240	\N	Wola Zachariaszowska
4241	\N	Zakonce
4242	\N	Trojanowice Petla
4243	\N	Trojanowice I
4244	\N	Trojanowice I
4245	520	Zielonki Transformator
4246	634	Zielonki UG
4247	\N	Zielonki Skrzyzowanie
4248	520	Zielonki Transformator
4249	634	Zielonki UG
4250	\N	Zielonki Skrzyzowanie
4251	592	Trojanowice Strugi
4252	446	Trojanowice
4253	23	Januszowice
4254	23	Januszowice
4255	446	Trojanowice
4256	592	Trojanowice Strugi
4257	\N	Owczary
4258	\N	Owczary I
4259	224	Brzozówka
4260	\N	Brzozówka Sklep
4261	\N	Przybyslawice I
4262	\N	Przybyslawice II
4263	\N	Owczary I
4264	224	Brzozówka
4265	\N	Brzozówka Sklep
4266	\N	Przybyslawice I
4267	\N	Przybyslawice II
4268	439	Droga do Rzaski
4269	772	Rzaska Jednostka Wojskowa
4270	281	Rzaska UR
4271	414	Rzaska
4272	360	Rzaska Autostrada
4273	439	Droga do Rzaski
4274	439	Droga do Rzaski
4275	772	Rzaska Jednostka Wojskowa
4276	281	Rzaska UR
4277	414	Rzaska
4278	264	Modlniczka Mala
4279	542	Zabierzów Dzialki
4280	311	Zabierzów
4281	809	Zabierzów Sklep
4282	714	Zabierzów Piekarnia
4283	\N	Zabierzów I
4284	\N	Zabierzów Piaski
4285	\N	Zabierzów PKP
4286	\N	Zielona
4287	\N	Zielona
4288	\N	Zabierzów PKP
4289	\N	Zabierzów Piaski
4290	\N	Zabierzów I
4291	714	Zabierzów Piekarnia
4292	809	Zabierzów Sklep
4293	311	Zabierzów
4294	542	Zabierzów Dzialki
4295	264	Modlniczka Mala
4296	264	Modlniczka Mala
4297	\N	Bolechowice I
4298	\N	Bolechowice II
4299	531	Bolechowice
4300	531	Bolechowice
4301	\N	Bolechowice II
4302	\N	Bolechowice I
4303	\N	Zelków Wola
4304	\N	Zelków Staw
4305	\N	Zelków II
4306	\N	Zelków I
4307	\N	Zelków I
4308	\N	Zelków II
4309	\N	Zelków Staw
4310	\N	Zelków Wola
4311	\N	Zabierzów Osrodek Zdrowia
4312	\N	Kochanów I
4313	\N	Kochanów
4314	\N	Droga do Niegoszowic
4315	\N	Zabierzów Osrodek Zdrowia
4316	\N	Kochanów I
4317	\N	Kochanów
4318	\N	Droga do Niegoszowic
4319	\N	Rudawa
4320	\N	Mlynka I
4321	\N	Rudawa
4322	\N	Mlynka I
4323	260	Szczyglice
4324	\N	Balice Autostrada
4325	\N	Balice Szkola
4326	\N	Balice Instytut
4327	\N	Szczyglice Most
4328	\N	Szczyglice Autostrada 
4329	\N	Balice Szkola
4330	\N	Balice Autostrada
4331	\N	Balice Autostrada
4332	\N	Balice Autostrada
4333	\N	Skala Kmity
4334	260	Szczyglice
4335	260	Szczyglice
4336	\N	Szczyglice Autostrada 
4337	\N	Szczyglice Most
4338	\N	Balice I
4339	\N	Balice I
4340	\N	Balice II
4341	\N	Balice II
4342	395	Olszanica Bory
4343	395	Olszanica Bory
4344	\N	Chrosna
4345	\N	Chrosna Studnia
4346	\N	Chrosna Sklep
4347	\N	Chrosna Kapliczka
4348	\N	Morawica Mostek
4349	\N	Morawica Krzyzówka
4350	\N	Morawica
4351	\N	Morawica Cmentarz
4352	\N	Morawica Krzyzówka
4353	\N	Morawica Cmentarz
4354	\N	Morawica Mostek
4355	\N	Chrosna Kapliczka
4356	\N	Chrosna Sklep
4357	\N	Chrosna Studnia
4358	\N	Aleksandrowice
4359	\N	Aleksandrowice Osiedle
4360	\N	Winna Góra
4361	\N	Aleksandrowice
4362	\N	Aleksandrowice Osiedle
4363	\N	Winna Góra
4364	\N	Brzoskwinia Koziary
4365	\N	Brzoskwinia Sklep
4366	\N	Brzoskwinia Kamyk
4367	\N	Brzoskwinia
4368	\N	Brzoskwinia Kamyk
4369	\N	Brzoskwinia Sklep
4370	555	Kopiec Kosciuszki
4371	\N	Kryspinów Zalew
4372	\N	Kryspinów Zalew
4373	\N	Czulów
4374	\N	Czulów II
4375	\N	Czulów I
4376	32	Mników Sklep
4377	648	Droga do Kaszowa
4378	688	Dziady
4379	\N	Czulów II
4380	\N	Czulów I
4381	32	Mników Sklep
4382	648	Droga do Kaszowa
4383	688	Dziady
4384	200	Cholerzyn Granica
4385	593	Cholerzyn Skrzyzowanie
4386	277	Cholerzyn Sklep
4387	695	Cholerzyn
4388	200	Cholerzyn Granica
4389	593	Cholerzyn Skrzyzowanie
4390	277	Cholerzyn Sklep
4391	695	Cholerzyn
4392	\N	Budzyn
4393	\N	Budzyn I
4394	\N	Budzyn I
4395	\N	Budzyn
4396	493	Kryspinów Sanka
4397	515	Kryspinów
4398	472	Granica Miasta
4399	375	Bielany
4400	48	Bielany Szkola
4401	556	Bielany Klasztor
4402	84	Wodociagi
4403	\N	Skalna
4404	\N	Skalna
4405	556	Bielany Klasztor
4406	48	Bielany Szkola
4407	472	Granica Miasta
4408	515	Kryspinów
4409	515	Kryspinów
4410	493	Kryspinów Sanka
4411	\N	Bielanska
4412	\N	Stopien Wodny
4413	\N	Piekary I
4414	\N	Piekary II
4415	192	Piekary Sklep
4416	34	Piekary
4417	\N	Borki
4418	\N	Bielanska
4419	\N	Stopien Wodny
4420	\N	Piekary I
4421	\N	Piekary II
4422	192	Piekary Sklep
4423	34	Piekary
4424	\N	Borki
4425	132	Bielanskie Skaly
4426	630	Na Krepaku
4427	\N	Zaskale
4428	710	Przegorzaly
4429	\N	Glinnik
4430	805	Benedyktowicza
4431	132	Bielanskie Skaly
4432	630	Na Krepaku
4433	710	Przegorzaly
4434	\N	Glinnik
4435	805	Benedyktowicza
4436	241	Nowa Wies Szlachecka
4437	14	Nowa Wies Kosciól
4438	296	Nowa Wies
4439	460	Nowa Wies Kapliczka
4440	473	Kaszów II
4441	538	Kaszów Tyralówka
4442	671	Kaszów Lysa Góra
4443	758	Liszki Krzyzówka
4444	321	Liszki UG
4445	\N	Liszki II
4446	438	Liszki I
4447	\N	Borki I
4448	14	Nowa Wies Kosciól
4449	296	Nowa Wies
4450	460	Nowa Wies Kapliczka
4451	473	Kaszów II
4452	538	Kaszów Tyralówka
4453	671	Kaszów Lysa Góra
4454	758	Liszki Krzyzówka
4455	321	Liszki UG
4456	321	Liszki UG
4457	438	Liszki I
4458	\N	Liszki II
4459	\N	Borki I
4460	174	Wyzral
4461	787	Wyzral Szkola
4462	529	Wyzral Wielka Droga
4463	575	Wyzral I
4464	174	Wyzral
4465	787	Wyzral Szkola
4466	529	Wyzral Wielka Droga
4467	575	Wyzral I
4468	206	Raczna Kapliczka
4469	206	Raczna Kapliczka
4470	397	Czernichów
4471	\N	Czernichów Studzienki
4472	255	Zagacie II
4473	516	Zagacie I
4474	\N	Czernichów Studzienki
4475	255	Zagacie II
4476	516	Zagacie I
4477	\N	Sciejowice Granica
4478	\N	Raczna I
4479	\N	Sciejowice
4480	\N	Droga do Jeziorzan
4481	\N	Jeziorzany
4482	\N	Jeziorzany I
4483	\N	Droga do Jeziorzan
4484	\N	Raczna II
4485	\N	Raczna I
4486	\N	Sciejowice
4487	\N	Sciejowice Granica
4488	\N	Ksiecia Józefa
4489	\N	Ksiecia Józefa
4490	279	Malczewskiego
4491	279	Malczewskiego
4492	63	Salwator
4493	63	Salwator
4494	63	Salwator
4495	215	Slonecznikowa
4496	185	Hofmana
4497	625	Przegon
4498	364	Instytut Reumatologii
4499	505	Cracovia
4500	708	Jubilat
4501	\N	Reymana
4502	436	Filharmonia
4503	709	Plac Wszystkich Swietych
4504	394	Wawel
4505	215	Slonecznikowa
4506	625	Przegon
4507	364	Instytut Reumatologii
4508	505	Cracovia
4509	424	Cracovia Blonia
4510	424	Cracovia Blonia
4511	55	Cracovia Stadion
4512	708	Jubilat
4513	\N	Reymana
4514	74	Uniwersytet Jagiellonski
4515	\N	Wegrzce Starostwo Powiatowe
4516	396	Wegrzce
4517	\N	Bibice I
4518	\N	Wegrzce Starostwo Powiatowe
4519	396	Wegrzce
4520	396	Wegrzce
4521	\N	Bibice I
4522	807	Bibice
4523	790	Michalowice
4524	790	Michalowice
4525	807	Bibice
4526	\N	Michalowice Komora
4527	\N	Michalowice Komora
4528	\N	Michalowice I
4529	391	Maslomiaca
4530	\N	Michalowice Lecznica
4531	\N	Michalowice II
4532	\N	Laskowiec
4533	\N	Warszówka
4534	\N	Michalowice III
4535	\N	Michalówka
4536	\N	Gosciniec
4537	\N	Michalowice I
4538	391	Maslomiaca
4539	\N	Michalowice Lecznica
4540	\N	Warszówka
4541	\N	Laskowiec
4542	\N	Michalowice III
4543	\N	Michalówka
4544	\N	Gosciniec
4545	\N	Kozierów Skrzyzowanie
4546	\N	Zerkowice Kolonia
4547	\N	Zerkowice Skrzyzowanie
4548	\N	Krasieniec Stary
4549	\N	Krasieniec Remiza
4550	\N	Kozierów Skrzyzowanie
4551	\N	Zerkowice Kolonia
4552	\N	Zerkowice Skrzyzowanie
4553	\N	Krasieniec Stary
4554	\N	Krasieniec Remiza
4555	\N	Maslomiaca I
4556	222	Wieclawice Stare
4557	\N	Pielgrzymowice II
4558	\N	Pielgrzymowice I
4559	\N	Maslomiaca I
4560	222	Wieclawice Stare
4561	\N	Pielgrzymowice II
4562	\N	Pielgrzymowice I
4563	\N	Batowice I
4564	\N	Batowice Kapliczka
4565	\N	Dlubnia
4566	\N	Raciborowice
4567	\N	Raciborowice I
4568	\N	Zastów
4569	\N	Batowice I
4570	\N	Batowice Kapliczka
4571	\N	Dlubnia
4572	\N	Raciborowice
4573	\N	Raciborowice I
4574	709	Plac Wszystkich Swietych
4575	436	Filharmonia
4576	436	Filharmonia
4577	436	Filharmonia
4578	394	Wawel
4579	743	Sw. Gertrudy
4580	743	Sw. Gertrudy
4581	310	Poczta Glówna
4582	359	Starowislna
4583	307	Stradom
4584	83	Plac Wolnica
4585	704	Hala Targowa
4586	307	Stradom
4587	307	Stradom
4588	83	Plac Wolnica
4589	554	Sw. Wawrzynca
4590	359	Starowislna
4591	359	Starowislna
4592	310	Poczta Glówna
4593	310	Poczta Glówna
4594	704	Hala Targowa
4595	554	Sw. Wawrzynca
4596	444	Rondo Grzegórzeckie
4597	503	Francesco Nullo
4598	444	Rondo Grzegórzeckie
4599	444	Rondo Grzegórzeckie
4600	503	Francesco Nullo
4601	169	Ofiar Dabia
4602	613	Dabie
4603	\N	Nowohucka
4604	\N	M1  Nowohucka
4605	169	Ofiar Dabia
4606	169	Ofiar Dabia
4607	613	Dabie
4608	\N	M1  Nowohucka
4609	\N	Nowohucka
4610	530	Elektrocieplownia Kraków
4611	633	Mistrzejowice
4612	362	Misnienska
4613	633	Mistrzejowice
4614	362	Misnienska
4615	\N	Os.Piastów
4616	56	Piasta Kolodzieja
4617	568	Popielidów
4618	286	Kruszwicka
4619	728	Kleeberga
4620	650	Rondo Piastowskie
4621	564	Kupaly
4622	46	Dunikowskiego
4623	\N	Os.Strusia
4624	\N	Os.Na Lotnisku
4625	67	DH Wanda
4626	\N	Os. Mistrzejowice Nowe
4627	50	Lowinskiego
4628	408	Nowolipki
4629	\N	Nad Dlubnia
4630	60	Makuszynskiego
4631	620	Wankowicza
4632	\N	Kocmyrzowska
4633	509	Os.Kosciuszkowskie
4634	609	Marii Dabrowskiej
4635	163	Medweckiego
4636	621	Czyzyny
4637	449	Rondo Czyzynskie
4638	624	Centralna
4639	308	Soltysowska Osiedle
4640	\N	Os.Kolorowe
4641	\N	Plac Centralny
4642	226	Aleja Przyjazni
4643	478	Aleja Róz
4644	801	Zeromskiego
4645	\N	Os.Zgody
4646	599	Rondo Kocmyrzowskie
4647	793	Teatr Ludowy
4648	\N	Os.Górali
4649	\N	Os.Zielone
4650	433	Struga
4651	\N	Os.Na Skarpie
4652	37	Klasztor Cystersów
4653	\N	Os.Wandy
4654	164	Klasztorna
4655	\N	Os.Willowe
4656	\N	Orkana
4657	\N	Bulwarowa
4658	187	Wiadukty
4659	167	Darwina
4660	\N	Os.Na Stoku Szkola
4661	800	Architektów
4662	\N	Leszka Bialego
4663	\N	Jagielly
4664	565	Wzgórza Krzeslawickie
4665	304	Grebalów
4666	19	Zeslawice
4667	304	Grebalów
4668	565	Wzgórza Krzeslawickie
4669	565	Wzgórza Krzeslawickie
4670	565	Wzgórza Krzeslawickie
4671	800	Architektów
4672	\N	Leszka Bialego
4673	\N	Os.Na Stoku Szkola
4674	167	Darwina
4675	167	Darwina
4676	167	Darwina
4677	187	Wiadukty
4678	187	Wiadukty
4679	620	Wankowicza
4680	60	Makuszynskiego
4681	\N	Nad Dlubnia
4682	\N	Kocmyrzowska
4683	\N	Jagielly
4684	408	Nowolipki
4685	50	Lowinskiego
4686	\N	Os. Mistrzejowice Nowe
4687	564	Kupaly
4688	620	Wankowicza
4689	\N	Cedynska
4690	650	Rondo Piastowskie
4691	728	Kleeberga
4692	286	Kruszwicka
4693	568	Popielidów
4694	56	Piasta Kolodzieja
4695	\N	Os.Piastów
4696	\N	Os.Piastów
4697	46	Dunikowskiego
4698	46	Dunikowskiego
4699	46	Dunikowskiego
4700	270	Rondo Hipokratesa
4701	270	Rondo Hipokratesa
4702	\N	Os.Strusia
4703	\N	Os.Na Lotnisku
4704	\N	Os.Na Lotnisku
4705	67	DH Wanda
4706	67	DH Wanda
4707	67	DH Wanda
4708	509	Os.Kosciuszkowskie
4709	609	Marii Dabrowskiej
4710	163	Medweckiego
4711	621	Czyzyny
4712	449	Rondo Czyzynskie
4713	449	Rondo Czyzynskie
4714	449	Rondo Czyzynskie
4715	449	Rondo Czyzynskie
4716	\N	Os.Kolorowe
4717	599	Rondo Kocmyrzowskie
4718	\N	Os.Zgody
4719	793	Teatr Ludowy
4720	793	Teatr Ludowy
4721	\N	Os.Górali
4722	801	Zeromskiego
4723	801	Zeromskiego
4724	478	Aleja Róz
4725	478	Aleja Róz
4726	478	Aleja Róz
4727	\N	Os.Zielone
4728	624	Centralna
4729	624	Centralna
4730	308	Soltysowska Osiedle
4731	\N	Plac Centralny
4732	\N	Plac Centralny
4733	\N	Plac Centralny
4734	433	Struga
4735	433	Struga
4736	\N	Os.Na Skarpie
4737	\N	Os.Na Skarpie
4738	164	Klasztorna
4739	37	Klasztor Cystersów
4740	\N	Os.Willowe
4741	\N	Bulwarowa
4742	\N	Brama nr 4
4743	\N	Brama nr 5
4744	\N	Koksochemia
4745	292	Pleszów
4746	\N	Mrozowa
4747	776	Blokowa
4748	\N	Agencja Kraków Wschód
4749	58	Walcownia
4750	431	Elektromontaz
4751	227	Zajezdnia Nowa Huta
4753	642	Lubocza PKP
4754	409	Lubocza Bugaj
4755	724	Lubocza Przychodnia
4756	292	Pleszów
4757	292	Pleszów
4758	\N	Koksochemia
4759	\N	Brama nr 5
4760	\N	Brama nr 4
4761	812	Kombinat
4762	\N	Mrozowa
4763	776	Blokowa
4764	227	Zajezdnia Nowa Huta
4765	431	Elektromontaz
4766	431	Elektromontaz
4767	431	Elektromontaz
4768	642	Lubocza PKP
4769	\N	Agencja Kraków Wschód
4770	409	Lubocza Bugaj
4771	724	Lubocza Przychodnia
4772	626	Luborzyca
4773	495	Luborzyca I
4774	499	Kocmyrzów
4775	\N	Dojazdów Dzialki
4776	\N	Dojazdów PKS
4777	\N	Sulechów
4778	\N	Prusy WSR
4779	\N	Prusy Szkola
4780	\N	Prusy
4781	\N	Prusy
4782	\N	Prusy Szkola
4783	\N	Prusy WSR
4784	\N	Sulechów
4785	\N	Dojazdów PKS
4786	499	Kocmyrzów
4787	495	Luborzyca I
4788	\N	Luczanowice
4789	\N	Wadów Osiedle
4790	\N	Wadów
4791	\N	Wadów
4792	\N	Wadów Osiedle
4793	\N	Wegrzynowice
4794	\N	Wegrzynowice Centrum
4795	\N	Wegrzynowice Centrum
4796	\N	Wegrzynowice Dól
4797	\N	Wadów Dzialki
4798	\N	Wadów Tunel
4799	\N	Wadów Dzialki
4800	\N	Wegrzynowice Dól
4801	\N	Czulice I
4802	\N	Wrózenicka
4803	\N	Wrózenice Górka
4804	\N	Wrózenice
4805	\N	Hektary
4806	\N	Ostafina
4807	\N	Resztówka
4808	\N	Zablocie Koscielnickie
4809	\N	Koscielniki
4810	\N	Blonia Koscielnickie
4811	\N	Janówka
4812	\N	Wyciaze Zachód
4813	\N	Szymanskiego
4814	\N	Zaklad Przeróbki
4815	\N	Branice Pagórek
4816	\N	Wyciaze Sklep
4817	\N	Wyciaska
4818	\N	Podstawie
4819	\N	Drozyska
4820	\N	Zaklad Przeróbki
4821	\N	Szymanskiego
4822	\N	Szymanskiego
4823	\N	Szymanskiego
4824	\N	Branice Pagórek
4825	\N	Wyciaze
4826	\N	Wyciaze Sklep
4827	\N	Wyciaska
4828	\N	Podstawie
4829	\N	Drozyska
4830	\N	Wyciaze Zachód
4831	\N	Ruszcza Cmentarz
4832	\N	Ruszcza
4833	\N	Ruszcza Cmentarz
4834	\N	Wyciaze Wiadukt
4835	\N	Janówka
4836	\N	Blonia Koscielnickie
4837	\N	Koscielniki
4838	\N	Zablocie Koscielnickie
4839	\N	Resztówka
4840	\N	Ostafina
4841	\N	Hektary
4842	\N	Wrózenicka
4843	\N	Wrózenice Górka
4844	\N	Czulice I
4845	235	Clo
4846	\N	Brzeska
4847	\N	Zakepie
4848	\N	Zakepie
4849	\N	Brzeska
4850	235	Clo
4851	\N	Wyciaze Wiadukt
4852	\N	Chalupki
4853	\N	Chalupki Górne
4854	\N	Chalupki Górne
4855	\N	Przylasek Rusiecki
4856	\N	Wolica Most
4857	\N	Wolica Las
4858	\N	Wolica Kosciól
4859	\N	Wolica
4860	\N	Wolica Sklep
4861	\N	Bartnicza
4862	\N	Siejówka
4863	\N	Przylasek Wyciaski
4864	\N	Przylasek Wyciaski
4865	\N	Siejówka
4866	\N	Bartnicza
4867	\N	Wolica Sklep
4868	\N	Wolica Kosciól
4869	\N	Wolica Las
4870	\N	Wolica
4871	\N	Wolica Most
4872	\N	Kujawy
4873	\N	Oczyszczalnia Scieków "Kujawy"
4874	\N	Oczyszczalnia Scieków "Kujawy"
4875	\N	Leg
4876	474	Siwka
4877	617	Na Zaleczu
4878	\N	Lesisko
4879	474	Siwka
4880	607	Koszykarska
4881	170	Stoczniowców
4882	437	Saska
4883	309	Szczecinska
4884	765	Lanowa
4885	434	Plaszów Szkola
4886	563	Motyla
4887	\N	Zalew Bagry
4888	498	Kuklinskiego
4889	763	Limanowskiego
4890	736	Korona
4891	\N	Os.Podwawelskie
4892	598	Kapelanka
4893	147	Slomiana
4894	\N	Baluckiego
4895	672	Rynek Debnicki
4896	686	Zielinskiego
4897	\N	Os.Robotnicze
4898	24	Kobierzynska
4899	139	Grota Roweckiego
4900	615	Rostworowskiego
4901	\N	Bulgarska
4902	637	Tyniec Kamieniolom
4903	426	Tyniecka Autostrada
4904	109	Kolna
4905	\N	Kostrze Kapliczka
4906	\N	Dabrowa
4907	117	Kostrze
4908	747	Bagienna
4909	544	Podgórki Tynieckie
4910	747	Bagienna
4911	173	Skotniki Szkola
4912	\N	Dabrowa
4913	\N	Kostrze Kapliczka
4914	109	Kolna
4915	\N	Os.Robotnicze
4916	686	Zielinskiego
4917	\N	Most Grunwaldzki
4918	\N	Most Grunwaldzki
4919	\N	Most Grunwaldzki
4920	\N	Most Grunwaldzki
4921	754	Szwedzka
4922	754	Szwedzka
4923	147	Slomiana
4924	139	Grota Roweckiego
4925	615	Rostworowskiego
4926	\N	Bulgarska
4927	\N	Os.Podwawelskie
4928	697	Rzemieslnicza
4929	266	Borsucza
4930	\N	PT
4931	\N	Kamienskiego Wiadukt
4932	306	Kamienskiego
4933	\N	Kamienskiego Wiadukt
4934	697	Rzemieslnicza
4935	386	Rondo Matecznego
4936	386	Rondo Matecznego
4937	386	Rondo Matecznego
4938	736	Korona
4939	266	Borsucza
4940	763	Limanowskiego
4941	86	Powstanców Wielkopolskich
4942	86	Powstanców Wielkopolskich
4943	86	Powstanców Wielkopolskich
4944	498	Kuklinskiego
4945	498	Kuklinskiego
4946	607	Koszykarska
4947	170	Stoczniowców
4948	170	Stoczniowców
4949	170	Stoczniowców
4950	437	Saska
4951	144	Lipska
4952	309	Szczecinska
4953	31	Rzebika
4954	765	Lanowa
4955	427	Maly Plaszów
4956	\N	Surzyckiego
4957	427	Maly Plaszów
4958	\N	Surzyckiego
4959	316	Dworcowa
4960	406	Malborska
4961	561	Makowa
4962	398	Sulkowskiego
4963	579	Wola Duchacka
4964	258	Biezanowska
4965	\N	Os.Na Kozlówce
4966	87	Dauna
4967	713	Prosta
4968	145	Wlotowa
4969	\N	Prokocim  Rynek
4970	\N	Mlodziezy
4971	\N	Mlodziezy
4972	\N	Prokocim  Rynek
4973	713	Prosta
4974	258	Biezanowska
4975	258	Biezanowska
4976	258	Biezanowska
4977	87	Dauna
4978	145	Wlotowa
4979	316	Dworcowa
4980	306	Kamienskiego
4981	561	Makowa
4982	406	Malborska
4983	579	Wola Duchacka
4984	579	Wola Duchacka
4985	398	Sulkowskiego
4986	\N	Brzegi
4987	411	Brzegi I
4988	411	Brzegi I
4989	156	Ks. Targosza
4990	\N	Wrobela
4991	410	Podwierzbie
4992	\N	Wrobela
4993	156	Ks. Targosza
4994	\N	Nad Drwina
4995	372	Póllanki
4996	\N	Szparagowa
4997	\N	Plk. Dabka
4998	\N	Plk. Dabka
4999	17	Zajezdnia Plaszów
5000	552	Albatrosów
5001	\N	Szparagowa
5002	\N	Szparagowa
5003	\N	Biezanów Szkola
5004	\N	Sucharskiego
5005	\N	Biezanów Szkola
5006	\N	Sucharskiego
5007	415	Jasienskiego
5008	\N	Zlocieniowa
5009	\N	Biezanów Potrzask
5010	\N	Pruszynskiego
5011	\N	Biezanów Kaim
5012	\N	Drozdzowa
5013	\N	Ks.Laczka
5014	110	Nowy Biezanów
5015	\N	Nowy Biezanów Poludnie
5016	753	Cwiklinskiej
5017	711	Teligi
5018	12	Prokocim Szpital
5019	\N	Wydzial Farmaceutyczny UJ
5020	742	Dom Spokojnej Starosci
5021	20	Piaski Wielkie
5022	\N	Kosocicka
5023	810	Jerzmanowskiego
5024	\N	Ks.Laczka
5025	\N	Biezanów Cmentarz
5026	110	Nowy Biezanów
5027	110	Nowy Biezanów
5028	753	Cwiklinskiej
5029	711	Teligi
5030	12	Prokocim Szpital
5031	12	Prokocim Szpital
5032	742	Dom Spokojnej Starosci
5033	679	Prokocim UJ
5034	679	Prokocim UJ
5035	679	Prokocim UJ
5036	810	Jerzmanowskiego
5037	53	Wielicka
5038	\N	Kosocicka
5039	\N	Zlocieniowa
5040	415	Jasienskiego
5041	365	Biezanów
5042	\N	Fort Swoszowice
5043	\N	Malinowskiego
5044	3	Soboniowice
5045	\N	Soboniowice Granica Miasta
5046	96	Grabówki
5047	\N	Krzemieniecka
5048	\N	Barycz
5049	\N	Zelazowskiego
5050	318	Kosocice
5051	\N	Cechowa
5052	663	Kurdwanów Szkola
5053	\N	Os.Kurdwanów
5054	701	Stojalowskiego
5055	\N	Luzycka
5056	\N	Bochenka
5057	313	Tuchowska
5058	543	Nowosadecka
5059	99	Witosa
5060	99	Witosa
5061	456	Karpinskiego
5062	543	Nowosadecka
5063	543	Nowosadecka
5064	442	Piaski Nowe
5065	442	Piaski Nowe
5066	\N	Bochenka
5067	\N	Luzycka
5068	\N	Cechowa
5069	663	Kurdwanów Szkola
5070	\N	Os.Kurdwanów
5071	701	Stojalowskiego
5072	20	Piaski Wielkie
5073	20	Piaski Wielkie
5074	318	Kosocice
5075	\N	Szczegów
5076	\N	Zelazowskiego
5077	\N	Barycz
5078	\N	Krzemieniecka
5079	\N	Malinowskiego
5080	3	Soboniowice
5081	\N	Soboniowice Granica Miasta
5082	\N	Fort Swoszowice
5083	15	Golkowice
5084	41	Zbydniowice Szkola
5085	\N	Lusina Dolna
5086	339	Ukraina
5087	\N	Krakówka
5088	\N	Lusina I
5089	785	Wróblowice Rozwidlenie
5090	\N	Chalubinskiego
5091	\N	Wróblowice Szkola
5092	\N	Pytlasinskiego
5093	673	Swoszowice
5094	361	Swoszowice Poczta
5095	98	Swoszowice Pawilon
5096	577	Swoszowice Sklep
5097	482	Zdrojowa
5098	\N	Swoszowice Uzdrowisko
5099	202	Wilga
5100	\N	Swoszowice Osiedle
5101	441	Swoszowice Autostrada
5102	558	Myslenicka
5103	352	Halszki
5104	210	Bujaka
5105	299	Kurdwanów
5106	\N	Zywiecka
5107	756	Góra Borkowska
5108	243	Las Borkowski
5109	287	Zawila
5110	803	Skosna
5111	792	Borkowska
5112	469	Forteczna
5113	\N	Zawiszy
5114	\N	Os.Kliny
5115	\N	Narwik
5116	151	Judyma
5117	178	Opatkowice Wiadukt
5118	755	Opatkowice
5119	178	Opatkowice Wiadukt
5120	247	Kapielowa
5121	247	Kapielowa
5122	469	Forteczna
5123	792	Borkowska
5124	151	Judyma
5125	287	Zawila
5126	243	Las Borkowski
5127	756	Góra Borkowska
5128	803	Skosna
5129	171	Borek Falecki
5130	299	Kurdwanów
5131	299	Kurdwanów
5132	210	Bujaka
5133	352	Halszki
5134	352	Halszki
5135	558	Myslenicka
5136	558	Myslenicka
5137	441	Swoszowice Autostrada
5138	\N	Swoszowice Osiedle
5139	202	Wilga
5140	482	Zdrojowa
5141	577	Swoszowice Sklep
5142	361	Swoszowice Poczta
5143	98	Swoszowice Pawilon
5144	673	Swoszowice
5145	673	Swoszowice
5146	\N	Pytlasinskiego
5147	\N	Wróblowice Szkola
5148	\N	Chalubinskiego
5149	785	Wróblowice Rozwidlenie
5150	\N	Krakówka
5151	339	Ukraina
5152	\N	Lusina Dolna
5153	41	Zbydniowice Szkola
5154	778	Brücknera
5155	4	Skotniki
5156	514	Babinskiego
5157	385	Kobierzyn
5158	325	Wrony
5159	325	Wrony
5160	778	Brücknera
5161	4	Skotniki
5162	4	Skotniki
5163	514	Babinskiego
5164	385	Kobierzyn
5165	738	Warchalowskiego
5166	384	Sidzina
5167	738	Warchalowskiego
5168	387	Skawina Os. Radziszowskie
5169	665	Skawina Radziszowska
5170	425	Skawina Rynek
5171	703	Skawina Cmentarz
5172	699	Skawina Podlipki
5173	175	Skawina Rzepnik
5174	665	Skawina Radziszowska
5175	490	Skawina Popieluszki
5176	175	Skawina Rzepnik
5177	699	Skawina Podlipki
5178	387	Skawina Os. Radziszowskie
5179	\N	Radziszów Wlosanka
5180	\N	Radziszów Zadworze
5181	152	Radziszów Centrum
5182	239	Radziszów Kamionna
5183	239	Radziszów Kamionna
5184	152	Radziszów Centrum
5185	\N	Radziszów Zadworze
5186	\N	Radziszów Wlosanka
5187	\N	Gaj Szkola
5188	\N	Gaj Zadziele
5189	\N	Mogilany Osrodek Zdrowia
5190	\N	Gaj Zadziele
5191	\N	Gaj Szkola
5192	\N	Radziszów
5193	\N	Radziszów Stare Sanatorium
5194	\N	Radziszów Lesniczówka
5195	\N	Radziszów Podlesie
5196	\N	Radziszów Podlesie
5197	\N	Radziszów Stare Sanatorium
5198	\N	Konary
5199	\N	Konary I
5200	\N	Lusina Górka
5201	\N	Dobrzyczany
5202	\N	Krasnik
5203	\N	Zagrody
5204	\N	Zagrody
5205	\N	Krasnik
5206	\N	Dobrzyczany
5207	\N	Lusina Górka
5208	\N	Konary I
5209	\N	Konary Wlosan
5210	\N	Mogilany Wlosan
5211	\N	Mogilany Wlosan
5212	\N	Konary Wlosan
5213	\N	Wlosan
5214	\N	Wlosan Krzyzówka
5215	\N	Wlosan Kopan
5216	\N	Wlosan Kopan
5217	\N	Wlosan Krzyzówka
5218	\N	Spadochroniarzy
5219	\N	Spadochroniarzy
5220	270	Rondo Hipokratesa
5221	270	Rondo Hipokratesa
5222	68	Skawina Ajka
5223	68	Skawina Ajka
5224	\N	Glogera Granica Miasta
5225	\N	Glogera Granica Miasta
5226	\N	Glogera
5227	\N	Glogera
5228	107	Bora-Komorowskiego
5229	107	Bora-Komorowskiego
5230	\N	Lema
5231	\N	Lema
5232	731	Zlocien
5233	755	Opatkowice
5234	216	Podgaje
5235	216	Podgaje
5236	399	Taklinskiego
5237	399	Taklinskiego
5238	329	Sidzina Olszyny
5239	329	Sidzina Olszyny
5240	674	Wazewskiego
5241	674	Wazewskiego
5242	104	Libertów Dolny
5243	104	Libertów Dolny
5244	278	Smolenskiego
5245	278	Smolenskiego
5247	\N	PW
5248	\N	PP
5249	548	Dworzec Plaszów
5250	\N	Na Budzyniu
5251	\N	Na Budzyniu
5252	198	Tonie Katy
5253	198	Tonie Katy
5254	54	Siewna
5255	54	Siewna
5256	591	Bronowice Male
5257	\N	Ruczaj I
5258	\N	Ruczaj I
5259	236	Conrada
5260	236	Conrada
5261	740	Oleandry
5262	740	Oleandry
5263	196	Zachodnia
5264	196	Zachodnia
5265	63	Salwator
5266	284	Lutnia
5267	171	Borek Falecki
5268	316	Dworcowa
5269	74	Uniwersytet Jagiellonski
5270	154	Krowodrza Urzedy Skarbowe
5271	154	Krowodrza Urzedy Skarbowe
5272	331	Krowoderskich Zuchów
5273	331	Krowoderskich Zuchów
5274	751	Kabel
5275	751	Kabel
5276	406	Malborska
5277	\N	Druzbackiej
5278	\N	Druzbackiej
5279	\N	Niebieska Autostrada
5280	\N	Niebieska Autostrada
5281	\N	Sudolska
5282	728	Kleeberga
5283	30	Szpital Rydygiera
5284	\N	Os.Jagiellonskie
5285	\N	Os.Jagiellonskie
5286	651	Arka
5287	651	Arka
5288	\N	Bulwarowa Ogródki Dzialkowe
5289	\N	Szpital Zeromskiego
5290	\N	Szpital Zeromskiego
5291	\N	Sieroszewskiego
5292	\N	Sieroszewskiego
5293	\N	Stare Wislisko
5294	\N	Stare Wislisko
5295	\N	Lasek Mogilski
5296	\N	Lasek Mogilski
5297	649	Jugowicka
5298	649	Jugowicka
5299	\N	Plac Centralny
5300	\N	Plac Centralny
5301	161	Torfowa
5302	712	Biezanów Bazy
5303	712	Biezanów Bazy
5304	150	Bacutil
5305	150	Bacutil
5306	\N	Rybitwy Rozjazd
5307	\N	Rybitwy Rozjazd
5308	\N	Rybitwy Dom Kultury
5309	\N	Rybitwy Dom Kultury
5310	\N	Rybitwy Sklep
5311	\N	Rybitwy Sklep
5312	567	Jezowa
5313	\N	Biskupinska
5314	\N	Biskupinska
5315	\N	Obronców Modlina
5316	\N	Obronców Modlina
5317	49	Plac Bohaterów Getta
5318	49	Plac Bohaterów Getta
5319	86	Powstanców Wielkopolskich
5320	375	Bielany
5321	375	Bielany
5322	\N	Barwna
5323	\N	Barwna
5324	\N	Wegrzynowicka
5325	\N	Wegrzynowicka
5326	\N	Wadów Glinik
5327	\N	Wadów Glinik
5328	\N	Wadów Os. Kolejowe
5329	\N	Wadów Os. Kolejowe
5330	\N	Wadów Szkola
5331	\N	Wadów Szkola
5332	\N	Luczanowice Skrzyzowanie
5333	\N	Luczanowice Skrzyzowanie
5334	\N	Bystronia
5335	\N	Bystronia
5336	\N	Wadowska
5337	\N	Wadowska
5338	\N	Lubocza Trafo
5339	\N	Lubocza Trafo
5340	745	Lubocza Szkola
5341	745	Lubocza Szkola
5342	739	Cmentarz Grebalów
5343	739	Cmentarz Grebalów
5344	672	Rynek Debnicki
5345	\N	Praska
5346	\N	Praska
5347	\N	Park "Skaly Twardowskiego"
5348	\N	Park "Skaly Twardowskiego"
5349	522	Pychowice
5350	522	Pychowice
5351	254	Rodzinna
5352	254	Rodzinna
5353	\N	Górka Pychowicka
5354	\N	Górka Pychowicka
5355	244	Fort Bodzów
5356	244	Fort Bodzów
5357	113	Kostrze Szkola
5358	113	Kostrze Szkola
5359	814	Kostrze OSP
5360	814	Kostrze OSP
5361	\N	Waly Wislane
5362	\N	Waly Wislane
5363	773	Boleslawa Smialego
5364	773	Boleslawa Smialego
5365	678	Tyniec
5366	678	Tyniec
5367	481	Bogucianka
5368	481	Bogucianka
5369	\N	Luczynskiego
5370	791	Komuny Paryskiej
5371	791	Komuny Paryskiej
5372	71	Siewna Wiadukt
5373	\N	Os.Marszowiec
5374	\N	Os.Marszowiec
5375	788	Zdrowa
5376	\N	Slona Woda
5377	\N	Slona Woda
5378	\N	Hallera
5379	\N	Hallera
5380	604	Kawiory
5381	604	Kawiory
5382	322	Makowskiego
5383	322	Makowskiego
5384	322	Makowskiego
5385	322	Makowskiego
5386	374	Nowy Prokocim
5387	374	Nowy Prokocim
5388	\N	Górnickiego
5389	\N	Górnickiego
5390	\N	Jasnogórska
5391	\N	Lusina Dwór
5392	\N	Lusina I
5393	638	Poroninska
5394	638	Poroninska
5395	330	Lusina Granica
5396	330	Lusina Granica
5397	755	Opatkowice
5398	764	Zyzna
5399	764	Zyzna
5400	228	Petrazyckiego
5401	228	Petrazyckiego
5402	\N	Wyciaze
5403	603	Kaszów
5404	603	Kaszów
5405	\N	Dwór Czeczów
5406	\N	Lipowskiego
5407	\N	Weigla
5408	\N	Wyciaze
5409	\N	Brzoskwinia Koziary
5410	771	Cystersów
5411	771	Cystersów
5412	433	Struga
5413	519	Nowy Kleparz
5414	426	Tyniecka Autostrada
5415	284	Lutnia
5416	284	Lutnia
5417	33	Przewóz
5418	33	Przewóz
5419	617	Na Zaleczu
5420	617	Na Zaleczu
5421	795	Na Zaleczu Szkola
5422	795	Na Zaleczu Szkola
5423	102	Soltysowska Zaklady
5424	102	Soltysowska Zaklady
5425	551	Soltysowska
5426	551	Soltysowska
5427	\N	Ojcowska Wagroda
5428	\N	Ojcowska Wagroda
5429	\N	Ojcowska Dworek
5430	\N	Ojcowska Dworek
5431	450	Gospodarska
5432	450	Gospodarska
5433	42	Chabrowa
5434	42	Chabrowa
5435	\N	Jordanowska
5436	\N	Jordanowska
5437	\N	Skrajna
5438	\N	Skrajna
5439	\N	Zeslawice Ogródki Dzialkowe
5440	\N	Zeslawice Ogródki Dzialkowe
5441	261	Kantorowice
5442	261	Kantorowice
5443	618	Gustawa Morcinka
5444	618	Gustawa Morcinka
5445	\N	Jana Kazimierza
5446	\N	Jana Kazimierza
5447	\N	Petöfiego
5448	\N	Petöfiego
5449	265	Zajezdnia Bienczyce
5450	265	Zajezdnia Bienczyce
5451	\N	Os.Kalinowe
5452	\N	Os.Kalinowe
5453	301	Os.Zlotego Wieku
5454	301	Os.Zlotego Wieku
5455	231	Leczycka
5456	231	Leczycka
5457	\N	Slawka
5458	\N	Slawka
5459	305	Zajezdnia Wola Duchacka
5460	305	Zajezdnia Wola Duchacka
5461	\N	Branice Na Dole
5462	\N	Branice Na Dole
5463	723	Branice Szkola
5464	723	Branice Szkola
5465	\N	Branice
5466	\N	Branice
5467	\N	Branice Osrodek Zdrowia
5468	\N	Branice Osrodek Zdrowia
5469	\N	Kakolowa
5470	\N	Kakolowa
5471	\N	Truskawkowa
5472	\N	Truskawkowa
5473	\N	Biezanów Pomnik
5474	\N	Biezanów Pomnik
5475	762	Barbary
5476	\N	Biezanów Trafo
5477	\N	Biezanów Trafo
5478	148	Prokocim Cmentarz
5479	148	Prokocim Cmentarz
5480	\N	Karowa
5481	\N	Karowa
5482	\N	Gwarecka
5483	\N	Gwarecka
5484	\N	Suchy Jar
5485	\N	Suchy Jar
5486	\N	Igolomska
5487	\N	Igolomska
5488	\N	Rzepakowa
5489	\N	Rzepakowa
5490	\N	Rzepakowa Swietlica
5491	\N	Rzepakowa Swietlica
5492	\N	Zwirownia
5493	\N	Zwirownia
5494	\N	Ciekowiec
5495	\N	Ciekowiec
5496	\N	Fredry
5497	\N	Fredry
5498	412	EC Leg
5499	383	Isep
5500	383	Isep
5501	\N	Zatyka
5502	\N	Zatyka
5503	617	Na Zaleczu
5504	295	Bronowice Wiadukt
5505	295	Bronowice Wiadukt
5506	273	Majora
5507	346	Zbydniowice
5508	346	Zbydniowice
5509	\N	Rzeszotary Panciawa
5510	\N	Droga do Janowic
5511	\N	Ochojno Remiza
5512	\N	Wrzasowice
5513	\N	Wrzasowice
5514	\N	Dabrówki I
5515	\N	Dabrówki I
5516	\N	Dabrówki
5517	\N	Dabrówki
5518	\N	Ochojno Kamieniec
5519	\N	Ochojno Kamieniec
5520	\N	Ochojno Skrzyzowanie
5521	\N	Ochojno Skrzyzowanie
5522	\N	Rzeszotary Górne
5523	\N	Rzeszotary Górne
5524	\N	Rzeszotary Polanki
5525	\N	Rzeszotary Polanki
5526	\N	Rzeszotary
5527	\N	Rzeszotary
5528	\N	Rzeszotary Trafo
5529	\N	Rzeszotary Trafo
5530	\N	Rzeszotary Szkola
5531	\N	Rzeszotary Szkola
5532	\N	Swiatniki Skrzyzowanie
5533	\N	Swiatniki Skrzyzowanie
5534	\N	Piasna Górka 
5535	\N	Piasna Górka 
5536	\N	Rzeszotary Zalesie
5537	\N	Rzeszotary Zalesie
5538	\N	Droga do Janowic
5539	\N	Swiatniki Górne
5540	\N	Swiatniki Górne
5541	\N	Swiatniki Centrum
5542	\N	Swiatniki Centrum
5543	\N	Swiatniki Cmentarz
5544	\N	Swiatniki Cmentarz
5545	\N	Swiatniki I
5546	\N	Swiatniki I
5547	\N	Konary Buk
5548	\N	Konary Buk
5549	\N	Wrzasowice III
5550	\N	Wrzasowice III
5551	\N	Wrzasowice Górka
5552	\N	Wrzasowice II
5553	\N	Wrzasowice II
5554	\N	Wrzasowice I
5555	\N	Wrzasowice I
5556	\N	Swiatniki Górne
5557	346	Zbydniowice
5558	\N	Mogilany Osrodek Zdrowia
5559	501	Tretówka
5560	501	Tretówka
5561	437	Saska
5562	\N	Geologów
5563	\N	Geologów
5564	\N	Rajsko
5565	\N	Rajsko
5566	768	Landaua
5567	768	Landaua
5568	327	Wiklinowa
5569	327	Wiklinowa
5570	34	Piekary
5571	70	Piekary Górne
5572	70	Piekary Górne
5573	784	Piekary III
5574	\N	Szafranska
5575	\N	Szafranska
5576	39	Stara Wola
5577	39	Stara Wola
5578	597	Pradnik Bialy Zachód
5579	366	Szczyglice Dom Kultury
5580	164	Klasztorna
5581	6	Tonie
5582	6	Tonie
5583	499	Kocmyrzów
5584	499	Kocmyrzów
5585	\N	Kocmyrzów I
5586	\N	Kocmyrzów I
5587	\N	Sodfiny
5588	\N	Sodfiny
5589	\N	Sodfiny Kolonia
5590	\N	Sodfiny Kolonia
5591	\N	Gleboka
5592	\N	Gleboka
5593	\N	Karniów
5594	129	Kopiec Wandy
5595	\N	Opatkowice Zadworze
5596	\N	Opatkowice Zadworze
5597	\N	Malborska Szkola
5598	\N	Buków
5599	\N	Buków Klin
5600	\N	Buków Klin
5601	\N	Buków Szkola
5602	\N	Buków Szkola
5603	\N	Kulerzów
5604	\N	Kulerzów
5605	\N	Kulerzów Wawóz
5606	\N	Kulerzów Wawóz
5607	\N	Chorowice
5608	\N	Chorowice
5609	\N	Kopce
5610	\N	Kopce
5611	\N	Mogilany Cmentarz
5612	\N	Mogilany Cmentarz
5613	\N	Burów
5614	\N	Burów I
5615	\N	Balice Grzybów
5616	\N	Balice OSP
5617	\N	Balice OSP
5618	\N	Burów I
5619	\N	Wolowice Szkola
5620	\N	Wolowice
5621	\N	Grotowa
5622	\N	Górskie Domy
5623	\N	Czulice
5624	\N	Górskie Domy
5625	\N	Grotowa
5626	\N	Wolowice
5627	\N	Wolowice Szkola
5628	\N	Podkamycze
5629	756	Góra Borkowska
5630	756	Góra Borkowska
5631	684	Cmentarz Batowice
5632	684	Cmentarz Batowice
5633	332	Wieliczka Cmentarz
5634	176	Wieliczka
5635	332	Wieliczka Cmentarz
5636	357	Wieliczka CPN
5637	357	Wieliczka CPN
5638	\N	Narwik
5639	247	Kapielowa
5640	247	Kapielowa
5641	370	Libertów
5642	370	Libertów
5643	578	Zawila Cmentarz
5644	578	Zawila Cmentarz
5645	\N	Slósarczyka
5646	56	Piasta Kolodzieja
5647	\N	Przy Kuzni
5648	\N	Przy Kuzni
5649	97	Michalowice Kozlica
5650	97	Michalowice Kozlica
5651	\N	Wysylek
5652	\N	Wysylek
5653	699	Skawina Podlipki
5654	\N	Prusy
5655	\N	Glogera
5656	\N	Balice III
5657	\N	Balice I
5658	472	Granica Miasta
5659	395	Olszanica Bory
5660	\N	Balice III
5661	346	Zbydniowice
5662	\N	Trzecia Góra
5663	\N	Soboniowice Granica Miasta
5664	90	Pekowice
5665	104	Libertów Dolny
5666	330	Lusina Granica
5667	103	Pasternik
5668	197	Batowice PKP
5669	\N	Raciborowice
5670	\N	Zastów
5671	\N	Czulice I
5672	\N	Konary Buk
5673	174	Wyzral
5674	\N	Dabrowa Szlachecka Figurka
5675	\N	Grotowa
5676	\N	Michalowice Komora
5677	\N	Aleksandrowice
5678	\N	Brzoskwinia Koziary
5679	\N	Wolica Most
5680	\N	Konopnickiej
5681	\N	Konopnickiej
5682	283	Zielony Dól
5683	283	Zielony Dól
5684	\N	Rzepichy
5685	\N	Rzepichy
5686	\N	Chelmska
5687	\N	Chelmska
5688	767	Lesmiana
5689	767	Lesmiana
5690	\N	Olszanica
5691	\N	Olszanica
5692	518	Olszanica Ogródki Dzialkowe
5693	518	Olszanica Ogródki Dzialkowe
5694	395	Olszanica Bory
5695	395	Olszanica Bory
5696	\N	Balice III
5697	\N	Balice III
5698	290	Instytut Pediatrii
5699	290	Instytut Pediatrii
5700	\N	Zawierzbie
5701	\N	Zawierzbie
5702	\N	Wolowice Kapliczka
5703	\N	Wolowice Kapliczka
5704	\N	Dabrowa Szlachecka Figurka
5705	\N	Dabrowa Szlachecka Figurka
5706	\N	Dabrowa Szlachecka Krzyz
5707	\N	Dabrowa Szlachecka Krzyz
5708	\N	Raczna Osiedle
5709	\N	Raczna Osiedle
5710	\N	Surzyckiego
5711	\N	Karniów
5712	799	Wieliczka Kosciól
5713	223	Wielicka Granica Miasta
5714	799	Wieliczka Kosciól
5715	223	Wielicka Granica Miasta
5716	\N	Lindego
5717	81	UR Balicka
5718	\N	Most Grunwaldzki
5719	\N	Aleja Waszyngtona
5720	\N	Aleja Waszyngtona
5721	77	Cichy Kacik
5722	\N	Nadbrzezie
5723	\N	Nadbrzezie
5724	684	Cmentarz Batowice
5725	\N	Biezanów Drozdzownia PKP
5726	\N	Biezanów Drozdzownia PKP
5727	\N	Swidzinskiego
5728	579	Wola Duchacka
5729	299	Kurdwanów
5730	\N	Rzeszotary Górne
5731	386	Rondo Matecznego
5732	381	Dajwór
5733	258	Biezanowska
5734	258	Biezanowska
5735	\N	Os.Kurdwanów
5736	\N	Zagórzyce Dworskie
5737	\N	Zagórzyce Stare
5738	444	Rondo Grzegórzeckie
5739	\N	Cmentarz Rzaska
5740	732	Tischnera
5741	480	Czerwiakowskiego
5742	\N	Rzaka 
5743	12	Prokocim Szpital
5744	271	Lagiewniki
5745	271	Lagiewniki
5746	271	Lagiewniki
5747	271	Lagiewniki
5748	\N	Domagaly
5749	\N	Domagaly
5750	17	Zajezdnia Plaszów
5751	\N	Beskidzka
5752	\N	Beskidzka
5753	583	Natansona
5754	583	Natansona
5755	796	Slomczynskiego
5756	796	Slomczynskiego
5757	729	Pradnik Czerwony
5758	\N	Zajezdnia Podgórze
5759	\N	Wydzial Biologii UJ
5760	\N	Wydzial Biologii UJ
5761	\N	Bobrzynskiego
5762	\N	Bobrzynskiego
5763	489	Rynek Falecki
5764	\N	Sucha
5765	\N	Sucha
5766	598	Kapelanka
5767	279	Malczewskiego
5768	598	Kapelanka
5769	686	Zielinskiego
5770	686	Zielinskiego
5771	479	Przykopy
5772	479	Przykopy
5773	279	Malczewskiego
5774	479	Przykopy
5775	558	Myslenicka
5776	149	Herberta
5777	149	Herberta
5778	53	Wielicka
5779	768	Landaua
5780	768	Landaua
5781	\N	Balicka Wiadukt
5782	\N	Balice Lesna
5783	\N	Balice Lesna
5784	131	Stella-Sawickiego
5785	131	Stella-Sawickiego
5786	\N	Iwanowice
5787	\N	Krasieniec Zakupny
5788	\N	Krasieniec Zakupny
5789	\N	Krasieniec
5790	\N	Krasieniec
5791	161	Torfowa
5792	\N	Lubostron
5793	\N	Lubostron
5794	636	Cmentarz Rakowicki
5795	707	Wróblowice Cmentarz
5796	707	Wróblowice Cmentarz
5797	\N	Os.Na Stoku
5798	800	Architektów
5799	746	Libertów Szkola
5800	746	Libertów Szkola
5801	168	Libertów Dzialy
5802	168	Libertów Dzialy
5803	342	Libertów Krzyzówka
5804	342	Libertów Krzyzówka
5805	\N	Droga do Sidziny
5806	\N	Droga do Sidziny
5807	\N	Wróblowice Dom Kultury
5808	\N	Wróblowice Dom Kultury
5809	514	Babinskiego
5810	347	Kampus UJ
5811	\N	Mala Góra
5812	\N	Nowohucka
5813	\N	Nowohucka
5814	131	Stella-Sawickiego
5815	350	Rondo Ofiar Katynia
5816	\N	Jasnogórska
5817	\N	Ojcowska
5818	\N	Ojcowska
5819	369	Zabierzów Gimnazjum
5820	369	Zabierzów Gimnazjum
5821	567	Jezowa
5822	567	Jezowa
5823	167	Darwina
5824	\N	Sieborowice
5825	\N	Sieborowice
5826	\N	Szparagowa
5827	596	Kliny Zacisze
5828	596	Kliny Zacisze
5829	\N	Kenara
5830	\N	Kenara
5831	\N	Lesisko
5832	498	Kuklinskiego
5833	594	Klimeckiego
5834	594	Klimeckiego
5835	\N	Zelków
5836	\N	Druzbackiej
5837	\N	Druzbackiej
5838	\N	Golkowice Kosciól
5839	\N	Golkowice Kosciól
5840	\N	Bociana
5841	167	Darwina
5842	\N	Wyciaze
5843	\N	Wyciaze
5844	\N	Ruszcza Cmentarz
5845	\N	Ruszcza Cmentarz
5846	\N	Ruszcza
5847	\N	Karowa
5848	\N	Karowa
5849	626	Luborzyca
5850	\N	Wola Luborzycka
5851	\N	Wola Luborzycka
5852	\N	Wola Luborzycka Las
5853	\N	Wola Luborzycka Las
5854	\N	Lososkowice
5855	\N	Lososkowice Szkola
5856	\N	Lososkowice Szkola
5857	\N	Skrzeszowice
5858	\N	Skrzeszowice
5859	\N	Goszyce Remiza
5860	\N	Goszyce Remiza
5861	\N	Goszyce
5862	\N	Goszyce
5863	\N	Wrózenice Górka
5864	\N	Wrózenice Górka
5865	\N	Wrózenice
5866	659	Polana Zywiecka
5867	\N	Trojanowice I
5868	\N	Trojanowice I
5869	\N	Trojanowice Petla
5870	136	Zielonki Rozjazd
5871	191	Urzad Skarbowy Nowa Huta
5872	191	Urzad Skarbowy Nowa Huta
5873	33	Przewóz
5874	\N	Sliwiaka
5875	\N	Sliwiaka
5876	\N	Biezanów Cmentarz
5877	53	Wielicka
5878	167	Darwina
5879	\N	Park Jordana
5880	\N	Park Jordana
5881	\N	Zabierzów Mlyn
5882	710	Przegorzaly
5883	\N	Przegorzaly UJ
5884	\N	Panienskich Skal
5885	\N	Panienskich Skal
5886	591	Bronowice Male
5887	\N	Czyzyny Dworzec
5888	693	Tor Kajakowy
5889	693	Tor Kajakowy
5890	109	Kolna
5891	109	Kolna
5892	\N	Skrzyzowanie do Podchruscia
5893	\N	Skrzyzowanie do Podchruscia
5894	\N	Modlnica I Kolonia
5895	\N	Modlnica I Kolonia
5896	\N	Modlnica II
5897	\N	Modlnica II
5898	\N	Szyce II
5899	\N	Szyce II
5900	770	Szyce I
5901	770	Szyce I
5902	\N	Wielka Wies
5903	\N	Wielka Wies
5904	\N	Bialy Kosciól
5905	\N	Bialy Kosciól
5906	\N	Murownia
5907	\N	Murownia
5908	\N	Czajowice
5909	\N	Czajowice
5910	\N	Beblo Stara Wies
5911	\N	Beblo Stara Wies
5912	\N	Beblo Labajowa
5913	\N	Beblo Labajowa
5914	\N	Beblo Lasek
5915	\N	Beblo Lasek
5916	\N	Bedkowice Mosurowa
5917	\N	Bedkowice Mosurowa
5918	\N	Bedkowice Kawiory
5919	\N	Bedkowice Kawiory
5920	\N	Bedkowice Borynia
5921	\N	Bedkowice Borynia
5922	\N	Modlniczka I
5923	\N	Modlniczka I
5924	782	Modlniczka
5925	782	Modlniczka
5926	\N	Modlnica Skrzyzowanie
5927	\N	Modlnica Skrzyzowanie
5928	\N	Modlnica
5929	\N	Modlnica
5930	\N	Tomaszowice Wedonka
5931	\N	Tomaszowice Wedonka
5932	\N	Tomaszowice I
5933	\N	Tomaszowice I
5934	557	Tomaszowice
5935	774	Tonie Gliniki
5936	774	Tonie Gliniki
5937	\N	Trojadyn Szydlo
5938	\N	Trojadyn Szydlo
5939	\N	Trojadyn Szydlo
5940	\N	Trojadyn Trafo
5941	\N	Trojadyn Trafo
5942	\N	Trojadyn
5943	\N	Trojadyn
5944	\N	Trojadyn Skrzyzowanie
5945	90	Pekowice
5946	\N	Jasnogórska
5947	\N	Jasnogórska
5948	587	Prokocim
5949	270	Rondo Hipokratesa
5950	\N	Mlyn
5951	\N	Mlyn
5952	\N	Krzeslawice
5953	\N	Krzeslawice
5954	\N	Krasnowolskiego
5955	\N	Krasnowolskiego
5956	620	Wankowicza
5957	479	Przykopy
5958	184	Turowicza
5959	184	Turowicza
5960	184	Turowicza
5961	\N	Lusina Petla
5962	\N	Lusina Szkola
5963	\N	Lusina Szkola
5964	\N	Lusina Spacerowa
5965	\N	Lusina Spacerowa
5966	\N	Lusina Dwór
5967	\N	Lusina Dwór
5968	466	Park Wodny
5969	\N	Sciejowice
5970	\N	Stopien Wodny
5971	\N	Cmentarz Grebalów I
5972	\N	Cmentarz Grebalów I
5973	720	Skawina Szkola
5974	36	Skawina Sad
5975	36	Skawina Sad
5976	259	Skawina Tyniecka Osiedle
5977	259	Skawina Tyniecka Osiedle
5978	\N	Skawina Tyniecka
5979	794	Skawina Wojska Polskiego
5980	794	Skawina Wojska Polskiego
5981	245	Skawina Samborek Most
5982	245	Skawina Samborek Most
5983	\N	Podgórki Skawinskie
5984	\N	Podgórki Skawinskie
5985	\N	Olszanica
5986	341	Meissnera
5987	341	Meissnera
5988	\N	Pod Lipa
5989	\N	Pod Lipa
5990	181	Uniwersytet Ekonomiczny
5991	\N	Muzeum Armii Krajowej
5992	\N	Podgórki Skawinskie
5993	\N	Brzezie Dzialki
5994	\N	Brzezie Dzialki
5995	\N	Krzeszowice
5996	531	Bolechowice
5997	531	Bolechowice
5998	\N	Karniowice
5999	\N	Brzezie Narodowe
6000	\N	Karniowice I
6001	\N	Karniowice I
6002	\N	Zielona Mala
6003	\N	Zielona Mala
6004	\N	Lipka
6005	\N	Lipka
6006	\N	Wieckowice
6007	\N	Wieckowice
6008	422	Kobylany
6009	422	Kobylany
6010	\N	Kobylany I
6011	\N	Kobylany I
6012	\N	Brzezinka Zarzecze
6013	\N	Brzezinka Zarzecze
6014	1	Brzezinka
6015	1	Brzezinka
6016	390	Brzezinka Skrzyzowanie
6017	390	Brzezinka Skrzyzowanie
6018	769	Rudawa Bloki
6019	769	Rudawa Bloki
6020	88	Rudawa Kosciól
6021	\N	Radwanowice Petla
6022	\N	Radwanowice I
6023	\N	Radwanowice I
6024	\N	Radwanowice II
6025	\N	Radwanowice II
6026	312	Dubie
6027	312	Dubie
6028	\N	Pisary
6029	\N	Pisary
6030	\N	Pisary Kiosk
6031	\N	Pisary Kiosk
6032	685	Pisary Mleczarnia
6033	685	Pisary Mleczarnia
6034	635	Rudawa Szkola
6035	635	Rudawa Szkola
6036	\N	Mlynka
6037	\N	Krzeszowice Szkola
6038	\N	Krzeszowice Witaminka
6039	\N	Krzeszowice Witaminka
6040	\N	Nawojowa Góra II
6041	\N	Nawojowa Góra II
6042	\N	Nawojowa Góra I
6043	\N	Nawojowa Góra I
6044	\N	Pisary Skrzyzowanie
6045	\N	Pisary Skrzyzowanie
6046	61	Modlniczka Trzcie
6047	61	Modlniczka Trzcie
6048	\N	Brzezie Narodowe
6049	\N	Brzezie Narodowe
6050	\N	Brzezie
6051	\N	Brzezie
6052	\N	Brzezie Kulka
6053	\N	Brzezie Kulka
6054	586	Glowackiego
6055	586	Glowackiego
6056	\N	Karniowice
6057	94	Uniwersytet Pedagogiczny
6058	\N	Witkowice
6059	\N	Witkowice
6060	319	Leroy Merlin
6061	319	Leroy Merlin
6062	88	Rudawa Kosciól
6063	\N	Ujazd Petla
6064	\N	Ujazd Petla
6065	\N	Brzezie
6066	\N	Brzezie
6067	\N	Zabierzów Mlyn
6068	\N	Zielona
6069	\N	Zielona
6070	\N	Radwanowice Petla
6071	\N	Rudawa
6072	\N	Rudawa
6073	359	Starowislna
6074	599	Rondo Kocmyrzowskie
6075	445	Skawina Korabniki
6076	512	Brzyczyna
6077	512	Brzyczyna
6078	115	Kleszczów
6079	\N	Burów
6080	587	Prokocim
6081	\N	Michalowice Ujecie Wody
6082	\N	Michalowice Ujecie Wody
6083	\N	Michalowice Las Michalowski
6084	\N	Michalowice Las Michalowski
6085	\N	Michalki
6086	\N	Michalki
6087	\N	Michalowice Banasiówka
6088	\N	Michalowice Banasiówka
6089	\N	Michalowice Komora
6090	129	Kopiec Wandy
6091	129	Kopiec Wandy
6092	181	Uniwersytet Ekonomiczny
6093	\N	Muzeum Armii Krajowej
6094	\N	Cmentarz Rakowicki Zachód
6095	\N	Cmentarz Rakowicki Zachód
6096	\N	Wegrzce Starostwo Powiatowe
6097	112	Rudawa PKP
6098	112	Rudawa PKP
6099	573	Dworzec Glówny
6100	\N	Krakowska Akademia
6101	777	Miodowa
6102	250	Dworzec Glówny Wschód
6103	\N	Piekielko
6104	\N	Piekielko
6105	720	Skawina Szkola
6106	256	Janasówka
6107	256	Janasówka
6108	\N	Zagórzyce Stare
6109	\N	Rudawa Mlyn
6110	\N	Rudawa Mlyn
6111	\N	Kobylany Remiza
6112	\N	Mlynka
6113	\N	Bosutów
6114	\N	Bosutów Polindus
6115	\N	Bosutów Polindus
6116	\N	Bosutów Straz
6117	\N	Bosutów Straz
6118	\N	Bosutów Krzyz
6119	\N	Bosutów Krzyz
6120	\N	Wegrzce Sudól
6121	\N	Wegrzce Sudól
6122	\N	Wegrzce Magiczne Wzgórze
6123	\N	Wegrzce Magiczne Wzgórze
6124	\N	Wegrzce Centrum Medyczne
6125	\N	Wegrzce Centrum Medyczne
6126	\N	Bibice Petla
6127	\N	Bibice Cmentarz
6128	\N	Bibice Cmentarz
6129	\N	Zielonki Cegielnia
6130	\N	Zielonki Cegielnia
6131	\N	Marszowiec
6132	\N	Balice III
6133	\N	Wegrzce Centrum
6134	\N	Wegrzce Blonie
6135	\N	Wegrzce Blonie
6136	\N	Wegrzce Petla
6137	\N	Most Kotlarski
6138	576	Dworzec Glówny Zachód
6139	\N	Lindego
6140	573	Dworzec Glówny
6141	576	Dworzec Glówny Zachód
6142	\N	TR
6143	246	Baczynskiego
6144	246	Baczynskiego
6145	713	Prosta
6146	\N	Przybyslawice III
6147	\N	Przybyslawice III
6148	461	Krowodrza Górka
6149	\N	Stacja tankowania gazu
6150	576	Dworzec Glówny Zachód
6151	553	Politechnika
6152	634	Zielonki UG
6153	634	Zielonki UG
6154	402	Skawina Koncentraty
6155	402	Skawina Koncentraty
6156	402	Skawina Koncentraty
6157	402	Skawina Koncentraty
6158	240	Rzozów Baseny
6159	240	Rzozów Baseny
6160	189	Rzozów I
6161	189	Rzozów I
6162	581	Rzozów Szkola
6163	581	Rzozów Szkola
6164	382	Goluchowice
6165	382	Goluchowice
6166	467	Goluchowice Jurczyce
6167	467	Goluchowice Jurczyce
6168	527	Goluchowice Sklep
6169	527	Goluchowice Sklep
6170	413	Polanka Hallera Dwór
6171	413	Polanka Hallera Dwór
6172	468	Grabie Polanka
6173	468	Grabie Polanka
6174	\N	Krzecin Sklep
6175	\N	Krzecin Sklep
6176	484	Skawina Wyspianskiego
6177	484	Skawina Wyspianskiego
6178	\N	Skawina Korabnicka
6179	\N	Skawina Korabnicka
6180	560	Skawina Korabnicka Szkola
6181	490	Skawina Popieluszki
6182	\N	Skawina  Elektrownia
6183	\N	Skawina  Elektrownia
6184	623	Skawina Zachodnia
6185	623	Skawina Zachodnia
6186	100	Skawina
6187	534	Brzeznica
6188	\N	Skawina  Pilsudskiego
6189	\N	Skawina  Pilsudskiego
6190	40	Skawina Podbory
6191	40	Skawina Podbory
6192	165	Brzeznica Pasieka
6193	616	Brzeznica Kuznia
6194	108	Jaskowice
6195	85	Jaskowice PKP
6196	363	Wielkie Drogi Trzebol
6197	725	Wielkie Drogi PKP
6198	670	Wielkie Drogi
6199	783	Zelczyna Sklep
6200	727	Zelczyna I
6201	18	Borek Szlachecki II
6202	213	Borek Szlachecki I
6203	165	Brzeznica Pasieka
6204	616	Brzeznica Kuznia
6205	108	Jaskowice
6206	85	Jaskowice PKP
6207	363	Wielkie Drogi Trzebol
6208	725	Wielkie Drogi PKP
6209	670	Wielkie Drogi
6210	783	Zelczyna Sklep
6211	727	Zelczyna I
6212	18	Borek Szlachecki II
6213	213	Borek Szlachecki I
6214	\N	Luczyce
6215	\N	Luczyce PKP
6216	\N	Wysiolek Luborzycki
6217	\N	Kapkazy
6218	\N	Kapkazy
6219	\N	Luczyce Las
6220	\N	Luczyce Las
6221	\N	Luczyce
6222	\N	Aleksandry
6223	\N	Aleksandry
6224	\N	Mala Góra
6225	180	Wola Radziszowska
6226	752	Wola Radziszowska Centrum
6227	752	Wola Radziszowska Centrum
6228	118	Wola Radziszowska Lipki
6229	118	Wola Radziszowska Lipki
6230	666	Wola Radziszowska Most
6231	666	Wola Radziszowska Most
6232	27	Wola Radziszowska Mala Ostra Góra
6233	27	Wola Radziszowska Mala Ostra Góra
6234	\N	Wola Radziszowska Kapelanka
6235	\N	Wola Radziszowska Kapelanka
6236	\N	Radziszów
6237	273	Majora
6238	\N	Wegrzce Centrum
6239	89	Wola Radziszowska Chorzyny
6240	89	Wola Radziszowska Chorzyny
6241	\N	Marcholta
6242	\N	Bohomolca
6243	\N	Marcholta
6244	\N	Bohomolca
6245	633	Mistrzejowice
6246	633	Mistrzejowice
6247	\N	Os.Oswiecenia
6248	\N	Radziszów Lesniczówka
6249	780	Skawina 29 Listopada
6250	\N	Skawina Centrum Wodne
6251	\N	Skawina Centrum Wodne
6252	353	Skawina Starostwo Powiatowe
6253	690	Skawina Kopernika
6254	\N	Skawina Kopernika I
6255	452	Skawina Cmentarz Komunalny
6256	780	Skawina 29 Listopada
6257	353	Skawina Starostwo Powiatowe
6258	690	Skawina Kopernika
6259	\N	Skawina Kopernika I
6260	220	Rondo Mogilskie
6261	220	Rondo Mogilskie
6262	220	Rondo Mogilskie
6263	220	Rondo Mogilskie
6264	220	Rondo Mogilskie
6265	220	Rondo Mogilskie
6266	220	Rondo Mogilskie
6267	220	Rondo Mogilskie
6268	458	Dworzec Towarowy
6269	458	Dworzec Towarowy
6270	553	Politechnika
6271	\N	Raciborowice Centrum
6272	\N	Raciborowice Centrum
6273	\N	Konczyce
6274	\N	Konczyce
6275	\N	Ksiazniczki Boisko
6276	\N	Ksiazniczki Boisko
6277	453	Biskupa Prandoty
6278	\N	Ksiazniczki Centrum
6279	\N	Ksiazniczki Centrum
6280	\N	Ksiazniczki Las
6281	\N	Ksiazniczki Las
6282	\N	Mlodziejowice Park
6283	\N	Mlodziejowice Park
6284	\N	Mlodziejowice Mlyn
6285	\N	Mlodziejowice Mlyn
6286	\N	Michalowice Ogrodowa
6287	\N	Michalowice Ogrodowa
6288	\N	Korzkiew I
6289	\N	Korzkiew I
6290	\N	Korzkiew II
6291	\N	Korzkiew II
6292	\N	Grebynice I
6293	\N	Grebynice I
6294	\N	Grebynice II
6295	\N	Grebynice II
6296	419	Grebynice Mogielki
6297	419	Grebynice Mogielki
6298	\N	Maszyce II
6299	\N	Maszyce II
6300	135	Maszyce Skrzyzowanie
6301	135	Maszyce Skrzyzowanie
6302	\N	Smardzowice
6303	788	Zdrowa
6304	412	EC Leg
6305	412	EC Leg
6306	530	Elektrocieplownia Kraków
6307	242	M1 Al. Pokoju
6308	\N	Lema
6309	\N	Lema
6310	\N	Kraków Plaza
6311	242	M1 Al. Pokoju
6312	\N	Kraków Plaza
6313	449	Rondo Czyzynskie
6314	\N	Nowohucka
6315	\N	Nowohucka
6316	624	Centralna
6317	624	Centralna
6318	771	Cystersów
6319	771	Cystersów
6320	158	Bialucha
6321	158	Bialucha
6322	\N	Wieczysta
6323	\N	Wieczysta
6324	526	AWF
6325	526	AWF
6326	131	Stella-Sawickiego
6327	131	Stella-Sawickiego
6328	621	Czyzyny
6329	621	Czyzyny
6330	449	Rondo Czyzynskie
6331	131	Stella-Sawickiego
6332	418	Komorowskiego
6333	418	Komorowskiego
6334	74	Uniwersytet Jagiellonski
6335	505	Cracovia
6336	86	Powstanców Wielkopolskich
6337	619	Cmentarz Podgórski
6338	619	Cmentarz Podgórski
6339	316	Dworcowa
6340	751	Kabel
6341	316	Dworcowa
6342	\N	Meksyk
6343	\N	Meksyk
6344	\N	Koksochemia
6345	\N	Koksochemia
6346	\N	Jezynowa
6347	\N	Jezynowa
6348	\N	Pradnicka
6349	\N	Pradnicka
6350	726	Bratyslawska
6351	\N	Powstanców Garaze
6352	\N	Powstanców Garaze
6353	372	Póllanki
6354	\N	Dojazdów Dzialki
6355	442	Piaski Nowe
6356	511	Kraków Business Park
6357	511	Kraków Business Park
6358	573	Dworzec Glówny
6359	226	Aleja Przyjazni
6360	226	Aleja Przyjazni
6361	619	Cmentarz Podgórski
6362	619	Cmentarz Podgórski
6363	576	Dworzec Glówny Zachód
6364	553	Politechnika
6365	553	Politechnika
6366	273	Majora
6367	\N	Wegrzce Wielkie
6368	811	Uniwersytet Rolniczy
6369	\N	Mydlniki Granica Miasta
6370	774	Tonie Gliniki
6371	\N	Krakówka
6372	\N	Os.Marszowiec
6373	395	Olszanica Bory
6374	461	Krowodrza Górka
6375	\N	Marszowiec
6376	\N	Kokotów I
6377	\N	Czarnochowice I
6378	\N	Czarnochowice I
6379	\N	Kokotów I
6380	\N	Wegrzce Wielkie III
6381	\N	Kokotów II
6382	\N	Wegrzce Wielkie II
6383	\N	Wegrzce Wielkie II
6384	612	Pszona
6385	612	Pszona
6386	\N	Biezanów Granica Miasta
6387	274	Brodowicza
6388	289	Sikorki
6389	289	Sikorki
6390	639	Wieliczka Kopalnia Soli
6391	639	Wieliczka Kopalnia Soli
6392	21	Wieliczka Rynek
6393	21	Wieliczka Rynek
6394	613	Dabie
6395	613	Dabie
6396	169	Ofiar Dabia
6397	169	Ofiar Dabia
6398	545	Fabryczna
6399	545	Fabryczna
6400	503	Francesco Nullo
6401	503	Francesco Nullo
6402	\N	Kordylewskiego
6403	\N	Kordylewskiego
6404	444	Rondo Grzegórzeckie
6405	444	Rondo Grzegórzeckie
6406	444	Rondo Grzegórzeckie
6407	444	Rondo Grzegórzeckie
6408	\N	Cmentarz Grebalów Zachód
6409	\N	Cmentarz Grebalów Zachód
6410	\N	Pod Fortem
6411	252	Fort Mogila
6412	252	Fort Mogila
6413	56	Piasta Kolodzieja
6414	56	Piasta Kolodzieja
6415	728	Kleeberga
6416	728	Kleeberga
6417	505	Cracovia
6418	\N	Os.Kolorowe
6419	\N	Os.Kolorowe
6420	\N	Bardosa
6421	\N	Bardosa
6422	588	Suche Stawy
6423	588	Suche Stawy
6424	164	Klasztorna
6425	164	Klasztorna
6426	\N	Os.Na Skarpie
6427	\N	Os.Na Skarpie
6428	\N	Plac Centralny
6429	\N	Plac Centralny
6430	96	Grabówki
6431	\N	Podkamycze
6432	7	Bronowice
6433	7	Bronowice
6434	664	Wesele
6435	664	Wesele
6436	\N	Balicka Wiadukt
6437	\N	Balicka Wiadukt
6438	316	Dworcowa
6439	587	Prokocim
6440	587	Prokocim
6441	12	Prokocim Szpital
6442	12	Prokocim Szpital
6443	711	Teligi
6444	711	Teligi
6445	374	Nowy Prokocim
6446	374	Nowy Prokocim
6447	753	Cwiklinskiej
6448	753	Cwiklinskiej
6449	433	Struga
6450	433	Struga
6451	\N	Plac Centralny
6452	812	Kombinat
6453	812	Kombinat
6454	812	Kombinat
6455	650	Rondo Piastowskie
6456	650	Rondo Piastowskie
6457	301	Os.Zlotego Wieku
6458	301	Os.Zlotego Wieku
6459	362	Misnienska
6460	362	Misnienska
6461	704	Hala Targowa
6462	704	Hala Targowa
6463	63	Salwator
6464	63	Salwator
6465	418	Komorowskiego
6466	418	Komorowskiego
6467	708	Jubilat
6468	708	Jubilat
6469	759	Bienczycka
6470	759	Bienczycka
6471	431	Elektromontaz
6472	431	Elektromontaz
6473	187	Wiadukty
6474	187	Wiadukty
6475	227	Zajezdnia Nowa Huta
6476	227	Zajezdnia Nowa Huta
6477	\N	Krzecin Cmentarz
6478	\N	Krzecin Cmentarz
6479	\N	Krzecin Kosciól
6480	\N	Krzecin Kapliczka
6481	\N	Krzecin
6482	\N	Krzecin Kapliczka
6483	\N	Krzecin Kosciól
6484	599	Rondo Kocmyrzowskie
6485	599	Rondo Kocmyrzowskie
6486	\N	Os.Zgody
6487	\N	Os.Zgody
6488	\N	Plac Centralny
6489	\N	Plac Centralny
6490	\N	Plac Centralny
6491	24	Kobierzynska
6492	24	Kobierzynska
6493	147	Slomiana
6494	147	Slomiana
6495	598	Kapelanka
6496	598	Kapelanka
6497	754	Szwedzka
6498	754	Szwedzka
6499	\N	Most Grunwaldzki
6500	\N	Most Grunwaldzki
6501	601	Orzeszkowej
6502	601	Orzeszkowej
6503	307	Stradom
6504	359	Starowislna
6505	359	Starowislna
6506	307	Stradom
6507	359	Starowislna
6508	359	Starowislna
6509	519	Nowy Kleparz
6510	519	Nowy Kleparz
6511	45	Pedzichów
6512	45	Pedzichów
6513	\N	Basztowa LOT
6514	205	Zelczyna Szkola
6515	205	Zelczyna Szkola
6516	276	Ochodza
6517	736	Korona
6518	83	Plac Wolnica
6519	83	Plac Wolnica
6520	307	Stradom
6521	763	Limanowskiego
6522	763	Limanowskiego
6523	736	Korona
6524	86	Powstanców Wielkopolskich
6525	49	Plac Bohaterów Getta
6526	49	Plac Bohaterów Getta
6527	554	Sw. Wawrzynca
6528	554	Sw. Wawrzynca
6529	777	Miodowa
6530	777	Miodowa
6531	620	Wankowicza
6532	620	Wankowicza
6533	\N	Kocmyrzowska
6534	\N	Kocmyrzowska
6535	793	Teatr Ludowy
6536	299	Kurdwanów
6537	99	Witosa
6538	99	Witosa
6539	543	Nowosadecka
6540	543	Nowosadecka
6541	442	Piaski Nowe
6542	442	Piaski Nowe
6543	87	Dauna
6544	87	Dauna
6545	258	Biezanowska
6546	258	Biezanowska
6547	751	Kabel
6548	258	Biezanowska
6549	258	Biezanowska
6550	145	Wlotowa
6551	145	Wlotowa
6552	547	Solvay
6553	547	Solvay
6554	781	Borek Falecki I
6555	781	Borek Falecki I
6556	16	Sanktuarium Bozego Milosierdzia
6557	16	Sanktuarium Bozego Milosierdzia
6558	736	Korona
6559	262	Smolki
6560	262	Smolki
6561	386	Rondo Matecznego
6562	386	Rondo Matecznego
6563	697	Rzemieslnicza
6564	599	Rondo Kocmyrzowskie
6565	67	DH Wanda
6566	67	DH Wanda
6567	270	Rondo Hipokratesa
6568	270	Rondo Hipokratesa
6569	46	Dunikowskiego
6570	46	Dunikowskiego
6571	220	Rondo Mogilskie
6572	293	Giebultów
6573	293	Giebultów
6574	553	Politechnika
6575	553	Politechnika
6576	403	Dworzec Glówny Tunel
6577	403	Dworzec Glówny Tunel
6578	629	Maszyce Remiza
6579	629	Maszyce Remiza
6580	\N	Smardzowice IV
6581	\N	Smardzowice IV
6582	\N	Giebultów Plac Zabaw
6583	\N	Giebultów Plac Zabaw
6584	549	Giebultów Morgi
6585	47	Bedkowice
6586	47	Bedkowice
6587	\N	Bedkowice Petla
6588	8	Rzozów Skotnica
6589	8	Rzozów Skotnica
6590	533	Rzozów Zagonnie
6591	628	Rzozów PKP
6592	675	Radziszów Kladka
6593	\N	Radziszów Zacisze
6594	349	Radziszów PKP
6595	\N	Radziszów Podwale
6596	\N	Radziszów Podwale
6597	\N	Radziszów Zawodzie
6598	\N	Radziszów Zawodzie
6599	470	Rondo Barei
6600	\N	Nielepice
6601	\N	Brzoskwinia
6602	\N	Brzezie Narodowe
6603	\N	Krzysztoforzyce
6604	343	Piekary Palac
6605	343	Piekary Palac
6606	356	Krzyszkowice Os. Szymanowskiego
6607	356	Krzyszkowice Os. Szymanowskiego
6608	223	Wielicka Granica Miasta
6609	223	Wielicka Granica Miasta
6610	223	Wielicka Granica Miasta
6611	\N	Krzyszkowice Kosciól
6612	\N	Krzyszkowice Kosciól
6613	\N	Krzyszkowice Kasztanowa I
6614	\N	Krzyszkowice Kasztanowa I
6615	\N	Krzyszkowice Kasztanowa II
6616	\N	Krzyszkowice Kasztanowa II
6617	\N	Krzyszkowice Modrzewiowa
6618	\N	Krzyszkowice Modrzewiowa
6619	\N	Krzyszkowice Rózana
6620	\N	Lusina Lany
6621	\N	Brama nr 5
6622	252	Fort Mogila
6623	252	Fort Mogila
6624	816	Przeginia Duchowna Szkola
6625	816	Przeginia Duchowna Szkola
6626	285	Przeginia Duchowna Centrum
6627	285	Przeginia Duchowna Centrum
6628	272	Przeginia Narodowa II
6629	272	Przeginia Narodowa II
6630	122	Czernichów II
6631	122	Czernichów II
6632	488	Nowa Wies Jesionka
6633	488	Nowa Wies Jesionka
6634	206	Raczna Kapliczka
6635	206	Raczna Kapliczka
6636	\N	Dabrowa Szlachecka
6637	\N	Dabrowa Szlachecka
6638	\N	Czernichów Stacja Paliw
6639	\N	Czernichów Stacja Paliw
6640	26	Czernichów GS
6641	26	Czernichów GS
6642	\N	Wolowice Sklep
6643	\N	Wolowice Sklep
6644	\N	Wolowice III
6645	\N	Wolowice III
6646	\N	Wolowice Niwa
6647	\N	Wolowice Niwa
6648	\N	Rybna Nowy Swiat
6649	\N	Rybna
6650	\N	Rybna
6651	\N	Rybna II
6652	\N	Rybna II
6653	\N	Rybna I
6654	\N	Rybna I
6655	\N	Rybna Dól
6656	\N	Rybna Dól
6657	\N	Przeginia Duchowna
6658	\N	Czulówek
6659	\N	Czulówek
6660	\N	Raczna Podlas
6661	\N	Raczna Podlas
6662	\N	Raczna Dzikowiec
6663	\N	Raczna Dzikowiec
6664	397	Czernichów
6665	733	Ratanice
6666	733	Ratanice
6667	127	Ratanice I
6668	127	Ratanice I
6669	263	Klokoczyn
6670	263	Klokoczyn
6671	\N	Kamien
6672	\N	Kamien Dól
6673	\N	Kamien Dól
6674	\N	Rusocice II
6675	\N	Rusocice II
6676	\N	Rusocice I
6677	\N	Rusocice I
6678	\N	Rusocice Leg
6679	\N	Rusocice Leg
6680	517	Czernichów Bór
6681	517	Czernichów Bór
6682	217	Przeginia Narodowa
6683	217	Przeginia Narodowa
6684	69	Przeginia Duchowna Bar
6685	69	Przeginia Duchowna Bar
6686	241	Nowa Wies Szlachecka
6687	\N	Rusocice Sklad
6688	\N	Rusocice Sklad
6689	\N	Grotowa
6690	\N	Jeziorzany
6691	397	Czernichów
6692	22	Rusocice Wies
6693	22	Rusocice Wies
6694	\N	Luczyce Zjawienie
6695	458	Dworzec Towarowy
6696	\N	Lusina Lany
6697	\N	Szczegów
6698	\N	Skawina Tyniecka
6699	533	Rzozów Zagonnie
6700	628	Rzozów PKP
6701	\N	Kokotów II
6702	\N	Biezanów Granica Miasta
6703	\N	Biezanów Granica Miasta
6704	\N	Wegrzce Wielkie III
6705	473	Kaszów II
6706	\N	Raczna Podlas
6707	\N	Raczna Osiedle
6708	\N	Mlynka
6709	293	Giebultów
6710	\N	Rybna Osrodek Zdrowia
6711	\N	Rybna Osrodek Zdrowia
6712	\N	Przeginia Duchowna
6713	205	Zelczyna Szkola
6714	459	Wielkie Drogi Osrodek Zdrowia
6715	459	Wielkie Drogi Osrodek Zdrowia
6716	572	Wielkie Drogi Szkola
6717	572	Wielkie Drogi Szkola
6718	205	Zelczyna Szkola
6719	317	Lobzów PKP
6720	\N	Wrzasowice Kowaleca
6721	\N	Nowy Biezanów Poludnie
6722	\N	Wrzasowice Górka
6723	\N	Wrzasowice Kowaleca
6724	710	Przegorzaly
6725	710	Przegorzaly
6726	710	Przegorzaly
6727	630	Na Krepaku
6728	\N	Zaskale
6729	\N	Nielepice Stadnina
6730	\N	Nielepice Stadnina
6731	\N	Pisary Dwór
6732	\N	Pisary Dwór
6733	477	Muzeum Inzynierii Miejskiej
6734	469	Forteczna
6735	\N	Zawiszy
6736	173	Skotniki Szkola
6737	\N	Most Kotlarski
6738	\N	Wydzial Zarzadzania UJ
6739	\N	Wydzial Zarzadzania UJ
6740	\N	Prokocim  Rynek
6741	\N	Prokocim  Rynek
6742	\N	Slaskiego
6743	\N	Slaskiego
6744	75	Os.Lokietka
6745	75	Os.Lokietka
6746	377	Chelm
6747	767	Lesmiana
6748	\N	Rzepichy
6749	\N	Rzepichy
6750	767	Lesmiana
6751	\N	Odmetowa
6752	\N	Odmetowa
6753	\N	Habina
6754	\N	Habina
6755	\N	Lesisko
6756	\N	Lesisko
6757	24	Kobierzynska
6758	266	Borsucza
6759	266	Borsucza
6760	\N	Brozka
6761	\N	Brozka
6762	610	Teatr Bagatela
6763	64	Batorego
6764	64	Batorego
6765	234	Plac Inwalidów
6766	234	Plac Inwalidów
6767	141	Urzednicza
6768	141	Urzednicza
6769	430	Biprostal
6770	430	Biprostal
6771	94	Uniwersytet Pedagogiczny
6772	94	Uniwersytet Pedagogiczny
6773	586	Glowackiego
6774	586	Glowackiego
6775	129	Kopiec Wandy
6776	677	Skawina PKP
6777	\N	Brama nr 5
6778	\N	Sciejowice Na Bagnach
6779	\N	Sciejowice Na Bagnach
6780	\N	Grotowa I
6781	\N	Grotowa I
6782	\N	Krzysztoforzyce Góra
6783	\N	Krzysztoforzyce Góra
6784	\N	Krzysztoforzyce Sklep 
6785	\N	Krzysztoforzyce Sklep 
6786	\N	Krzysztoforzyce Góra
6787	\N	Luczanowice
6788	\N	Balice PKP
6789	\N	Kraków Airport T1
6790	\N	Kraków Airport T2
6791	74	Uniwersytet Jagiellonski
6792	722	Puszkarska
6793	722	Puszkarska
6794	305	Zajezdnia Wola Duchacka
6795	305	Zajezdnia Wola Duchacka
6796	644	Bonarka
6797	\N	Krzysztoforzyce przy Dworze
6798	\N	Krzysztoforzyce przy Dworze
6799	644	Bonarka
6800	\N	Kocmyrzów Krzyzówka
6801	\N	Kocmyrzów Krzyzówka
6802	736	Korona
6803	386	Rondo Matecznego
6804	\N	Wyslouchów
6805	\N	Wyslouchów
6806	\N	Bojki
6807	\N	Bojki
6808	\N	Rusocice Jalowce
6809	\N	Rusocice Jalowce
6810	694	Rusocice Zaleg
6811	694	Rusocice Zaleg
6812	618	Gustawa Morcinka
6813	618	Gustawa Morcinka
6814	812	Kombinat
6815	227	Zajezdnia Nowa Huta
6816	812	Kombinat
6817	436	Filharmonia
6818	610	Teatr Bagatela
6819	610	Teatr Bagatela
6820	\N	Basztowa LOT
6821	\N	Basztowa LOT
6822	573	Dworzec Glówny
6823	573	Dworzec Glówny
6824	310	Poczta Glówna
6825	310	Poczta Glówna
6826	494	Lubicz
6827	494	Lubicz
6828	573	Dworzec Glówny
6829	307	Stradom
6830	427	Maly Plaszów
6831	427	Maly Plaszów
6832	586	Glowackiego
6833	586	Glowackiego
6834	552	Albatrosów
6835	552	Albatrosów
6836	594	Klimeckiego
6837	594	Klimeckiego
6838	179	Zablocie
6839	179	Zablocie
6840	498	Kuklinskiego
6841	498	Kuklinskiego
6842	214	Gromadzka
6843	214	Gromadzka
6844	144	Lipska
6845	144	Lipska
6846	31	Rzebika
6847	31	Rzebika
6848	599	Rondo Kocmyrzowskie
6849	\N	Wiktorowice Granica
6850	\N	Wiktorowice Granica
6851	\N	Zastów Dzialki
6852	\N	Zastów Dzialki
6853	\N	Wiktorowice Skrzyzowanie
6854	\N	Wiktorowice Skrzyzowanie
6855	\N	Wiktorowice Centrum
6856	\N	Wiktorowice Centrum
6857	\N	Zastów
6858	\N	Maciejowice
6859	\N	Wiktorowice Rozdzielnia Wód
6860	\N	Wiktorowice Rozdzielnia Wód
6861	\N	Maciejowice Góra
6862	\N	Maciejowice Góra
6863	349	Radziszów PKP
6864	\N	Owczary
6865	\N	Owczary
6866	23	Januszowice
6867	23	Januszowice
6868	82	Bialopradnicka
6869	82	Bialopradnicka
6870	\N	Ruszcza
6871	595	Azory
6872	706	Czerwienskiego
6873	212	Fiszera
6874	582	Radzikowskiego Osiedle
6875	\N	Batalionu "Skala" AK
6876	\N	Niepolomice Moczydlo
6877	\N	Niepolomice Moczydlo
6878	\N	Niepolomice Kolejowa
6879	\N	Niepolomice Kolejowa
6880	\N	Niepolomice Dworzec
6881	\N	Niepolomice Dworzec
6882	660	Niepolomice Rynek
6883	660	Niepolomice Rynek
6884	\N	Niepolomice Batorego
6885	\N	Niepolomice Batorego
6886	\N	Niepolomice Batorego II
6887	\N	Niepolomice Batorego II
6888	\N	Wola Bat. Ruskie
6889	\N	Wola Bat. Ruskie
6890	\N	Chobot Lesniczówka
6891	\N	Niepolomice Jazy
6892	\N	Niepolomice Jazy
6893	\N	Niepolomice Jazy II
6894	\N	Niepolomice Jazy II
6895	\N	Wola Batorska  Zwirownia
6896	\N	Wola Batorska  Zwirownia
6897	\N	Wola Batorska  Kosciól
6898	\N	Wola Batorska  Kosciól
6899	\N	Wola Batorska  Cmentarz
6900	\N	Wola Batorska  Cmentarz
6901	\N	Wola Batorska  Borek
6902	\N	Wola Batorska  Borek
6903	\N	Wola Batorska Mikoniowiec
6904	\N	Wola Batorska Mikoniowiec
6905	\N	Wola Batorska Zamoglice
6906	\N	Wola Batorska Zamoglice
6907	\N	Zabierzów Bochenski Centrum
6908	\N	Zabierzów Bochenski Centrum
6909	\N	Chobot
6910	\N	Chobot
6911	\N	Wolica Most
6912	389	Grabie Szczurów
6913	715	Grabie Dom Kultury
6914	539	Brzegi III
6915	137	Grabie Kosciól
6916	\N	Staniatki Wiadukt
6917	539	Brzegi III
6918	389	Grabie Szczurów
6919	715	Grabie Dom Kultury
6920	137	Grabie Kosciól
6921	137	Grabie Kosciól
6922	393	Niepolomice Podgrabie
6923	393	Niepolomice Podgrabie
6924	\N	Niepolomice Pasternik
6925	\N	Niepolomice Pasternik
6926	\N	Niepolomice Katek
6927	\N	Niepolomice Katek
6928	\N	Niepolomice Poreby
6929	\N	Niepolomice Poreby
6930	\N	Niepolomice Diesla
6931	\N	Niepolomice Diesla
6932	\N	Niepolomice Wodna
6933	\N	Niepolomice Wodna
6934	\N	Niepolomice Plaszowska I
6935	\N	Niepolomice Plaszowska I
6936	\N	Niepolomice Kosciuszki
6937	\N	Niepolomice Kosciuszki
6938	\N	Ochmanów Otaczarnia
6939	\N	Ochmanów Oknoplast
6940	\N	Zakrzów
6941	\N	Zakrzów
6942	\N	Podleze Balachówka
6943	\N	Podleze Balachówka
6944	\N	Podleze Przedszkole
6945	\N	Podleze Straz
6946	\N	Podleze Centrum
6947	\N	Podleze Centrum
6948	\N	Staniatki Wiadukt
6949	\N	Niepolomice Wielicka
6950	\N	Niepolomice Wielicka
6951	\N	Niepolomice Boryczów
6952	\N	Niepolomice Boryczów
6953	144	Lipska
6954	214	Gromadzka
6955	214	Gromadzka
6956	\N	Rondo Grunwaldzkie
6957	\N	Wegrzce Sudól I
6958	\N	Wegrzce Sudól I
6959	\N	Skala Kmity
6960	31	Rzebika
6961	144	Lipska
6962	52	Garbarnia
6963	52	Garbarnia
6964	52	Garbarnia
6965	\N	Slomniki Osiedle
6966	\N	Slomniki Rynek
6967	\N	Slomniki Rynek
6968	\N	Slomniki Zagloby
6969	\N	Slomniki Zagloby
6970	\N	Polanowice
6971	\N	Polanowice
6972	\N	Marszowice Góry
6973	\N	Marszowice Góry
6974	\N	Wysiolek Luborzycki Radwany
6975	\N	Wysiolek Luborzycki Radwany
6976	\N	Wysiolek Luborzycki I
6977	\N	Wysiolek Luborzycki I
6978	\N	Marszowice
6979	\N	Marszowice
6980	\N	Polanowice Kolonia
6981	\N	Polanowice Kolonia
6982	\N	Marszowice I
6983	\N	Marszowice I
6984	\N	Ratajów Skrzyzowanie
6985	\N	Ratajów Skrzyzowanie
6986	\N	Niedzwiedz PKP
6987	\N	Niedzwiedz PKP
6988	\N	Niedzwiedz Felix
6989	\N	Niedzwiedz Felix
6990	\N	Wysiolek Luborzycki
6991	\N	Wysiolek Luborzycki
6992	449	Rondo Czyzynskie
6993	599	Rondo Kocmyrzowskie
6994	405	Agatowa
6995	405	Agatowa
6996	\N	Ochodza Dom Ludowy
6997	\N	Ochodza Dom Ludowy
6998	\N	Ochodza Odwisle
6999	\N	Ochodza Staw
7000	\N	Ochodza Staw
7001	276	Ochodza
7002	171	Borek Falecki
7003	171	Borek Falecki
7004	756	Góra Borkowska
7005	\N	Ruczaj I
7006	793	Teatr Ludowy
7007	793	Teatr Ludowy
7008	535	Przybyszewskiego
7009	\N	Wola Luborzycka Dzialki
7010	\N	Wola Luborzycka Dzialki
7011	\N	Mników Panska Góra
7012	\N	Mników Panska Góra
7013	\N	Mników Skaly
7014	\N	Mników Skaly
7015	\N	Czulów Skaly
7016	\N	Czulów Skaly
7017	436	Filharmonia
7018	435	Wola Radziszowska Podgazle
7019	435	Wola Radziszowska Podgazle
7020	541	Wola Radziszowska Leg
7021	541	Wola Radziszowska Leg
7022	15	Golkowice
7023	\N	Czulówek Kapliczka
7024	\N	Czulówek
7025	\N	Sanka Skrzyzowanie
7026	\N	Sanka Skrzyzowanie
7027	\N	Rybna Nowy Swiat
7028	\N	Rybna Nowy Swiat
7029	\N	Czulów
7030	\N	Rybna Zagórze
7031	\N	Rybna Dolna
7032	86	Powstanców Wielkopolskich
7033	\N	Rybna Granica
7034	\N	Rybna Granica
7035	\N	Raczna II
7036	\N	Raczna II
7037	\N	Czulów Kapliczka
7038	\N	Czulów Kapliczka
7039	\N	Raczna Kosciól
7040	\N	Raczna Kosciól
7041	528	Bunscha
7042	528	Bunscha
7043	\N	Konary Sek
7044	\N	Konary Sek
7045	117	Kostrze
7046	17	Zajezdnia Plaszów
7047	601	Orzeszkowej
7048	601	Orzeszkowej
7049	\N	Podgrabie Most
7050	137	Grabie Kosciól
7051	270	Rondo Hipokratesa
7052	86	Powstanców Wielkopolskich
7053	86	Powstanców Wielkopolskich
7054	732	Tischnera
7055	\N	Niepolomice Fabryczna
7056	\N	Niepolomice Fabryczna
7057	\N	Niepolomice Wodna
7058	\N	Niepolomice Wodna
7059	271	Lagiewniki
7060	271	Lagiewniki
7061	697	Rzemieslnicza
7062	271	Lagiewniki
7063	271	Lagiewniki
7064	271	Lagiewniki
7065	461	Krowodrza Górka
7066	\N	Dabrowa Szlachecka Krzemiennik
7067	\N	Dabrowa Szlachecka Krzemiennik
7068	325	Wrony
7069	93	Fort Winnica
7070	93	Fort Winnica
7071	199	Winnicka
7072	199	Winnicka
7073	814	Kostrze OSP
7074	445	Skawina Korabniki
7075	777	Miodowa
7076	359	Starowislna
7077	370	Libertów
7078	370	Libertów
7079	\N	Morawica
7080	\N	Morawica Krzyzówka
7081	\N	Morawica Krzyzówka
7082	\N	Giebultów Zbiornik
7083	\N	Giebultów Zbiornik
7084	\N	Modlniczka Poligon
7085	\N	Modlniczka Poligon
7086	\N	Skrzyzowanie do Podchruscia
7087	\N	Czulówek Kapliczka
7088	\N	Czulówek Kapliczka
7089	\N	Krzecin Czesna
7090	\N	Krzecin Czesna
7091	\N	Wola Zabierzowska
7092	\N	Wola Zabierzowska
7093	250	Dworzec Glówny Wschód
7094	139	Grota Roweckiego
7095	139	Grota Roweckiego
7096	\N	Ruczaj I
7097	\N	Ruczaj I
7098	615	Rostworowskiego
7099	615	Rostworowskiego
7100	355	Ruczaj
7101	355	Ruczaj
7102	\N	Wydzial Biologii UJ
7103	\N	Wydzial Biologii UJ
7104	\N	Bobrzynskiego
7105	\N	Bobrzynskiego
7106	347	Kampus UJ
7107	\N	Trojadyn Skrzyzowanie
7108	278	Smolenskiego
7109	84	Wodociagi
7110	547	Solvay
7111	547	Solvay
7112	\N	Cmentarz Batowice Wschód
7113	\N	Cmentarz Batowice Wschód
7114	273	Majora
7115	591	Bronowice Male
7116	591	Bronowice Male
7117	755	Opatkowice
7118	\N	Dymarek
7119	\N	Dymarek
7120	540	Centrum JP II
7121	540	Centrum JP II
7122	703	Skawina Cmentarz
7123	452	Skawina Cmentarz Komunalny
7124	\N	Kopanka
7125	\N	Kopanka II
7126	\N	Kopanka II
7127	760	Kopanka Kapliczka
7128	760	Kopanka Kapliczka
7129	211	Kopanka Szkola
7130	211	Kopanka Szkola
7131	735	Skawina Robotnicza
7132	735	Skawina Robotnicza
7133	40	Skawina Podbory
7134	\N	Jurczyce Szkola
7135	\N	Jurczyce Podole
7136	468	Grabie Polanka
7137	315	Grabie Kuznia
7138	315	Grabie Kuznia
7139	193	Grabie
7140	276	Ochodza
7141	512	Brzyczyna
7142	479	Przykopy
7143	749	Skawina Energetyków
7144	749	Skawina Energetyków
7145	\N	Krzecin Szkola
7146	66	Skawina Nad Potokiem
7147	66	Skawina Nad Potokiem
7148	\N	Radziszów Za Mogilka
7149	467	Goluchowice Jurczyce
7150	452	Skawina Cmentarz Komunalny
7151	675	Radziszów Kladka
7152	218	Jurczyce Dom Ludowy
7153	218	Jurczyce Dom Ludowy
7154	\N	Jurczyce Podole
7155	\N	Jurczyce Szkola
7156	\N	Radziszów Za Mogilka
7157	\N	Radziszów Zacisze
7158	\N	Zabawa
7159	\N	Zabawa
7160	\N	Mala Wies
7161	\N	Mala Wies
7162	\N	Mogilany Rynek
7163	\N	Mogilany Rynek
7164	\N	Sulków
7165	\N	Sulków
7166	\N	Mogilany Cicha
7167	\N	Mogilany Wiadukt
7168	\N	Mogilany Wiadukt
7169	703	Skawina Cmentarz
7170	\N	Mogilany Cicha
7171	347	Kampus UJ
7172	347	Kampus UJ
7173	425	Skawina Rynek
7174	\N	Biezanów Pomnik
7175	\N	Biezanów Pomnik
7176	570	Wieliczka Park
7177	570	Wieliczka Park
7178	359	Starowislna
7179	\N	Balicka Wiadukt
7180	\N	Balicka Wiadukt
7181	\N	Murownia
7182	\N	Michalowice Osrodek Zdrowia
7183	\N	Michalowice Osrodek Zdrowia
7184	\N	Michalowice II
7185	\N	Michalowice Kwiaty Polne
7186	\N	Michalowice Kwiaty Polne
7187	\N	Zabawa I
7188	\N	Wieliczka Niepolomska
7189	\N	Dziekanowice Stacja Batowice
7190	\N	Dziekanowice Stacja Batowice
7191	\N	Wola Zachariaszowska Kresy
7192	\N	Wola Zachariaszowska Kresy
7193	\N	Jeziorzany I
7194	\N	Jeziorzany I
7195	784	Piekary III
7196	784	Piekary III
7197	355	Ruczaj
7198	355	Ruczaj
7199	\N	Michalowice Las Michalowski
7200	\N	Wola Zachariaszowska Kresy
7201	\N	Zakonce
7202	\N	Mobilis
7203	\N	Sliwiaka Zaklady
7204	\N	Sliwiaka Zaklady
7205	\N	Lusina Dolna
7206	\N	Lusina Dolna
7207	\N	Budzyn
7208	811	Uniwersytet Rolniczy
7209	\N	Garlica Duchowna Rozjazd
7210	\N	Garlica Duchowna Rozjazd
7211	\N	Garliczka Chochól
7212	\N	Garliczka Chochól
7213	\N	Owczary Górna
7214	\N	Owczary Górna
7215	\N	Owczary Dluga
7216	\N	Owczary Dluga
7217	\N	Owczary Gajowa
7218	\N	Owczary Gajowa
7219	310	Poczta Glówna
7220	394	Wawel
7221	394	Wawel
7222	228	Petrazyckiego
7223	557	Tomaszowice
7224	\N	Kraków Airport T2
7225	762	Barbary
7226	110	Nowy Biezanów
7227	\N	Bosutów Dziekanowice
7228	\N	Bosutów Dziekanowice
7229	445	Skawina Korabniki
7230	\N	Górna Wies
7231	\N	Biezanów Cmentarz
7232	77	Cichy Kacik
7233	762	Barbary
7234	\N	Balice Grzybów
7235	\N	Kobylany Remiza
7236	53	Wielicka
7237	53	Wielicka
7238	\N	Mala Góra
7239	\N	Biezanów Cmentarz
7240	433	Struga
7241	\N	Mala Góra
7242	347	Kampus UJ
7243	347	Kampus UJ
7244	262	Smolki
7245	262	Smolki
7246	265	Zajezdnia Bienczyce
7247	\N	Os.Dywizjonu 303
7248	110	Nowy Biezanów
7249	110	Nowy Biezanów
7250	\N	Balicka Wiadukt
7251	\N	Balicka Wiadukt
7252	759	Bienczycka
7253	759	Bienczycka
7254	664	Wesele
7255	664	Wesele
7256	71	Siewna Wiadukt
7257	\N	Wydz. Biologii UJ
7258	\N	Wydz. Biologii UJ
7259	\N	Wzg. Krzeslawickie I
7260	\N	Wzg. Krzeslawickie I
7261	\N	Lesisko
7262	\N	Wydz. Biologii UJ
7263	\N	Wydz. Biologii UJ
7264	167	Darwina
7265	\N	Cmentarz Grebalów I
7266	739	Cmentarz Grebalów
7267	\N	Rybna Granica
7268	173	Skotniki Szkola
7269	615	Rostworowskiego
7270	\N	Bulgarska
7271	\N	Pod Fortem
7272	596	Kliny Zacisze
7273	596	Kliny Zacisze
7274	\N	Wieczysta
7275	699	Skawina Podlipki
7276	699	Skawina Podlipki
7277	591	Bronowice Male
7278	110	Nowy Biezanów
7279	461	Krowodrza Górka
7280	227	Zajezdnia Nowa Huta
7281	121	Lipinskiego
7282	491	Norymberska
7283	615	Rostworowskiego
7284	121	Lipinskiego
7285	491	Norymberska
7286	615	Rostworowskiego
7287	238	Grota-Roweckiego
7288	238	Grota-Roweckiego
7289	347	Kampus UJ
7290	347	Kampus UJ
7291	682	Chmieleniec
7292	682	Chmieleniec
7293	\N	Czerwone Maki
7294	566	Jarzebiny
7295	566	Jarzebiny
7296	238	Grota-Roweckiego
7297	121	Lipinskiego
7298	121	Lipinskiego
7299	238	Grota-Roweckiego
7300	238	Grota-Roweckiego
7301	491	Norymberska
7302	491	Norymberska
7303	347	Kampus UJ
7304	347	Kampus UJ
7305	682	Chmieleniec
7306	682	Chmieleniec
7307	\N	Czerwone Maki
7308	\N	Czerwone Maki
7309	\N	Czerwone Maki
7310	\N	Czerwone Maki
7311	\N	Czerwone Maki
7312	687	Skarzynskiego
7313	491	Norymberska
7314	615	Rostworowskiego
7315	\N	Mochnaniec
7316	\N	Mochnaniec
7317	\N	Brzoskwinia Góra
7318	\N	Brzoskwinia Góra
7319	\N	Balice Autostrada
7320	\N	PT
7321	\N	Bibice Petla
7322	\N	Bibice I
7323	\N	Narvik
7324	\N	Narvik
7325	\N	Balicka Wiadukt
7326	\N	Balice PKP
7327	731	Zlocien
7328	171	Borek Falecki
7329	\N	Os.Dywizjonu 303
7330	\N	PH
7331	110	Nowy Biezanów
7332	\N	PH
7333	\N	PH
7334	\N	PH
7335	173	Skotniki Szkola
7336	\N	Zawiszy
7337	\N	Os.Kliny
7338	751	Kabel
7339	751	Kabel
7340	\N	Luczynskiego
7341	\N	Zajezdnia Podgórze
7342	\N	Pod Fortem
7343	469	Forteczna
7344	452	Skawina Cmentarz Komunalny
7345	\N	Pod Fortem
7346	596	Kliny Zacisze
7347	596	Kliny Zacisze
7348	\N	Lesisko
7349	\N	Piaszczysta
7350	632	Pachonskiego
7351	\N	Piaszczysta
7352	\N	Tomaszowice Gliniki
7353	\N	Tomaszowice Gliniki
7354	160	Mlynka Petla
7355	\N	Zelków
7356	\N	Podkamycze
7357	\N	Podkamycze
7358	350	Rondo Ofiar Katynia
7359	350	Rondo Ofiar Katynia
7360	350	Rondo Ofiar Katynia
7361	90	Pekowice
7362	\N	Marszowiec
7363	\N	Bociana
7364	475	Górka Narodowa
7365	656	Mackiewicza
7366	428	Imbramowska
7367	428	Imbramowska
7368	656	Mackiewicza
7369	656	Mackiewicza
7370	\N	Bociana
7371	779	Wyki
7372	632	Pachonskiego
7373	336	Pradnik Bialy
7374	766	Pleszowska
7375	62	Opolska Kladka
7376	\N	Batalionu "Skala" AK
7377	157	Opolska
7378	157	Opolska
7379	779	Wyki
7380	597	Pradnik Bialy Zachód
7381	62	Opolska Kladka
7382	632	Pachonskiego
7383	766	Pleszowska
7384	766	Pleszowska
7385	595	Azory
7386	376	Rózyckiego
7387	\N	Stachiewicza
7388	317	Lobzów PKP
7389	\N	Lokietka
7390	302	Wybickiego
7391	726	Bratyslawska
7392	692	Lekarska
7393	229	Szpital Narutowicza
7394	291	Urzad Marszalkowski
7395	647	Wroclawska
7396	376	Rózyckiego
7397	\N	Lokietka
7398	302	Wybickiego
7399	291	Urzad Marszalkowski
7400	647	Wroclawska
7401	726	Bratyslawska
7402	726	Bratyslawska
7403	726	Bratyslawska
7404	692	Lekarska
7405	788	Zdrowa
7406	461	Krowodrza Górka
7407	519	Nowy Kleparz
7408	\N	Basztowa LOT
7409	201	Grottgera
7410	234	Plac Inwalidów
7411	297	Czarnowiejska
7412	604	Kawiory
7413	430	Biprostal
7414	535	Przybyszewskiego
7415	94	Uniwersytet Pedagogiczny
7416	606	Mazowiecka
7417	606	Mazowiecka
7418	430	Biprostal
7419	430	Biprostal
7420	430	Biprostal
7421	430	Biprostal
7422	7	Bronowice
7423	535	Przybyszewskiego
7424	297	Czarnowiejska
7425	234	Plac Inwalidów
7426	234	Plac Inwalidów
7427	\N	Basztowa LOT
7428	201	Grottgera
7429	519	Nowy Kleparz
7430	519	Nowy Kleparz
7431	519	Nowy Kleparz
7432	519	Nowy Kleparz
7433	458	Dworzec Towarowy
7434	\N	Cmentarz Rakowicki Zachód
7435	77	Cichy Kacik
7436	77	Cichy Kacik
7437	257	Opolska Estakada
7438	811	Uniwersytet Rolniczy
7439	585	Lublanska
7440	447	Aleja 29 Listopada
7441	507	Powstanców
7442	729	Pradnik Czerwony
7443	388	Olszecka
7444	470	Rondo Barei
7445	470	Rondo Barei
7446	251	Olsza II
7447	622	Miechowity
7448	303	Bosaków
7449	466	Park Wodny
7450	\N	Os.Oswiecenia
7451	492	Okulickiego
7452	334	Wislicka
7453	\N	Os.Dywizjonu 303
7454	131	Stella-Sawickiego
7455	526	AWF
7456	\N	Wieczysta
7457	\N	Ugorek
7458	337	Akacjowa
7459	78	Rondo Mlynskie
7460	320	Pilotów
7461	125	Lukasiewicza
7462	429	Narzymskiego
7463	\N	Brogi
7464	181	Uniwersytet Ekonomiczny
7465	\N	Rakowicka
7466	573	Dworzec Glówny
7467	573	Dworzec Glówny
7468	494	Lubicz
7469	181	Uniwersytet Ekonomiczny
7470	\N	Rakowicka
7471	220	Rondo Mogilskie
7472	429	Narzymskiego
7473	636	Cmentarz Rakowicki
7474	636	Cmentarz Rakowicki
7475	636	Cmentarz Rakowicki
7476	453	Biskupa Prandoty
7477	\N	Brogi
7478	303	Bosaków
7479	\N	Wilenska
7480	257	Opolska Estakada
7481	257	Opolska Estakada
7482	257	Opolska Estakada
7483	585	Lublanska
7484	447	Aleja 29 Listopada
7485	447	Aleja 29 Listopada
7486	447	Aleja 29 Listopada
7487	729	Pradnik Czerwony
7488	251	Olsza II
7489	622	Miechowity
7490	622	Miechowity
7491	388	Olszecka
7492	470	Rondo Barei
7493	470	Rondo Barei
7494	470	Rondo Barei
7495	466	Park Wodny
7496	\N	Os.Oswiecenia
7497	492	Okulickiego
7498	334	Wislicka
7499	334	Wislicka
7500	334	Wislicka
7501	\N	Os.Dywizjonu 303
7502	\N	Ugorek
7503	337	Akacjowa
7504	320	Pilotów
7505	78	Rondo Mlynskie
7506	\N	Wieczysta
7507	\N	Wieczysta
7508	526	AWF
7509	182	Radzikowskiego
7510	\N	Basztowa LOT
7511	494	Lubicz
7512	494	Lubicz
7513	64	Batorego
7514	64	Batorego
7515	141	Urzednicza
7516	141	Urzednicza
7517	591	Bronowice Male
7518	219	Armii Krajowej
7519	219	Armii Krajowej
7520	\N	Tondosa
7521	\N	Lajkonika
7522	646	Strzelnica
7523	72	Sielanka
7524	73	Park Decjusza
7525	358	Baba Jaga
7526	524	ZOO
7527	358	Baba Jaga
7528	\N	Tondosa
7529	646	Strzelnica
7530	72	Sielanka
7531	72	Sielanka
7532	454	Kasztanowa
7533	\N	Kopalina
7534	377	Chelm
7535	73	Park Decjusza
7536	454	Kasztanowa
7537	\N	Kopalina
7538	377	Chelm
7539	\N	Kraków Airport T1
7540	\N	Trzecia Góra
7541	\N	Trzecia Góra
7542	\N	Wegrzce Centrum
7543	\N	Bibice Petla
7544	\N	Narama
7545	\N	Pielgrzymowice
7546	\N	Górna Wies
7547	\N	Zakonce
7548	\N	Droga do Garliczki
7549	\N	Garlica Duchowna
7550	\N	Garlica Murowana
7551	\N	Podskale
7552	136	Zielonki Rozjazd
7553	136	Zielonki Rozjazd
7554	136	Zielonki Rozjazd
7555	136	Zielonki Rozjazd
7556	\N	Podskale
7557	\N	Garlica Murowana
7558	\N	Garlica Duchowna
7559	\N	Droga do Garliczki
7560	\N	Wola Zachariaszowska
7561	\N	Wola Zachariaszowska
7562	\N	Zakonce
7563	\N	Trojanowice Petla
7564	\N	Trojanowice I
7565	\N	Trojanowice I
7566	520	Zielonki Transformator
7567	634	Zielonki UG
7568	\N	Zielonki Skrzyzowanie
7569	520	Zielonki Transformator
7570	634	Zielonki UG
7571	\N	Zielonki Skrzyzowanie
7572	592	Trojanowice Strugi
7573	446	Trojanowice
7574	23	Januszowice
7575	23	Januszowice
7576	446	Trojanowice
7577	592	Trojanowice Strugi
7578	\N	Owczary
7579	\N	Owczary I
7580	224	Brzozówka
7581	\N	Brzozówka Sklep
7582	\N	Przybyslawice I
7583	\N	Przybyslawice II
7584	\N	Owczary I
7585	224	Brzozówka
7586	\N	Brzozówka Sklep
7587	\N	Przybyslawice I
7588	\N	Przybyslawice II
7589	439	Droga do Rzaski
7590	772	Rzaska Jednostka Wojskowa
7591	281	Rzaska UR
7592	414	Rzaska
7593	360	Rzaska Autostrada
7594	439	Droga do Rzaski
7595	439	Droga do Rzaski
7596	772	Rzaska Jednostka Wojskowa
7597	281	Rzaska UR
7598	414	Rzaska
7599	264	Modlniczka Mala
7600	542	Zabierzów Dzialki
7601	311	Zabierzów
7602	809	Zabierzów Sklep
7603	714	Zabierzów Piekarnia
7604	\N	Zabierzów I
7605	\N	Zabierzów Piaski
7606	\N	Zabierzów PKP
7607	\N	Zielona
7608	\N	Zielona
7609	\N	Zabierzów PKP
7610	\N	Zabierzów Piaski
7611	\N	Zabierzów I
7612	714	Zabierzów Piekarnia
7613	809	Zabierzów Sklep
7614	311	Zabierzów
7615	542	Zabierzów Dzialki
7616	264	Modlniczka Mala
7617	264	Modlniczka Mala
7618	\N	Bolechowice I
7619	\N	Bolechowice II
7620	531	Bolechowice
7621	531	Bolechowice
7622	\N	Bolechowice II
7623	\N	Bolechowice I
7624	\N	Zelków Wola
7625	\N	Zelków Staw
7626	\N	Zelków II
7627	\N	Zelków I
7628	\N	Zelków I
7629	\N	Zelków II
7630	\N	Zelków Staw
7631	\N	Zelków Wola
7632	\N	Zabierzów Osrodek Zdrowia
7633	\N	Kochanów I
7634	\N	Kochanów
7635	\N	Droga do Niegoszowic
7636	\N	Zabierzów Osrodek Zdrowia
7637	\N	Kochanów I
7638	\N	Kochanów
7639	\N	Droga do Niegoszowic
7640	\N	Rudawa
7641	\N	Mlynka I
7642	\N	Rudawa
7643	\N	Mlynka I
7644	260	Szczyglice
7645	\N	Balice Autostrada
7646	\N	Balice Szkola
7647	\N	Balice Instytut
7648	\N	Szczyglice Most
7649	\N	Szczyglice Autostrada 
7650	\N	Balice Szkola
7651	\N	Balice Autostrada
7652	\N	Balice Autostrada
7653	\N	Balice Autostrada
7654	\N	Skala Kmity
7655	260	Szczyglice
7656	260	Szczyglice
7657	\N	Szczyglice Autostrada 
7658	\N	Szczyglice Most
7659	\N	Balice I
7660	\N	Balice I
7661	\N	Balice II
7662	\N	Balice II
7663	395	Olszanica Bory
7664	395	Olszanica Bory
7665	\N	Chrosna
7666	\N	Chrosna Studnia
7667	\N	Chrosna Sklep
7668	\N	Chrosna Kapliczka
7669	\N	Morawica Mostek
7670	\N	Morawica Krzyzówka
7671	\N	Morawica
7672	\N	Morawica Cmentarz
7673	\N	Morawica Krzyzówka
7674	\N	Morawica Cmentarz
7675	\N	Morawica Mostek
7676	\N	Chrosna Kapliczka
7677	\N	Chrosna Sklep
7678	\N	Chrosna Studnia
7679	\N	Aleksandrowice
7680	\N	Aleksandrowice Osiedle
7681	\N	Winna Góra
7682	\N	Aleksandrowice
7683	\N	Aleksandrowice Osiedle
7684	\N	Winna Góra
7685	\N	Brzoskwinia Koziary
7686	\N	Brzoskwinia Sklep
7687	\N	Brzoskwinia Kamyk
7688	\N	Brzoskwinia
7689	\N	Brzoskwinia Kamyk
7690	\N	Brzoskwinia Sklep
7691	555	Kopiec Kosciuszki
7692	\N	Kryspinów Zalew
7693	\N	Kryspinów Zalew
7694	\N	Czulów
7695	\N	Czulów II
7696	\N	Czulów I
7697	32	Mników Sklep
7698	648	Droga do Kaszowa
7699	688	Dziady
7700	\N	Czulów II
7701	\N	Czulów I
7702	32	Mników Sklep
7703	648	Droga do Kaszowa
7704	688	Dziady
7705	200	Cholerzyn Granica
7706	593	Cholerzyn Skrzyzowanie
7707	277	Cholerzyn Sklep
7708	695	Cholerzyn
7709	200	Cholerzyn Granica
7710	593	Cholerzyn Skrzyzowanie
7711	277	Cholerzyn Sklep
7712	695	Cholerzyn
7713	\N	Budzyn
7714	\N	Budzyn I
7715	\N	Budzyn I
7716	\N	Budzyn
7717	493	Kryspinów Sanka
7718	515	Kryspinów
7719	472	Granica Miasta
7720	556	Bielany Klasztor
7721	84	Wodociagi
7722	556	Bielany Klasztor
7723	472	Granica Miasta
7724	515	Kryspinów
7725	515	Kryspinów
7726	493	Kryspinów Sanka
7727	\N	Piekary I
7728	\N	Piekary II
7729	192	Piekary Sklep
7730	34	Piekary
7731	\N	Borki
7732	\N	Piekary I
7733	\N	Piekary II
7734	192	Piekary Sklep
7735	34	Piekary
7736	\N	Borki
7737	132	Bielanskie Skaly
7738	630	Na Krepaku
7739	\N	Zaskale
7740	710	Przegorzaly
7741	\N	Glinnik
7742	805	Benedyktowicza
7743	132	Bielanskie Skaly
7744	630	Na Krepaku
7745	710	Przegorzaly
7746	\N	Glinnik
7747	805	Benedyktowicza
7748	241	Nowa Wies Szlachecka
7749	14	Nowa Wies Kosciól
7750	296	Nowa Wies
7751	460	Nowa Wies Kapliczka
7752	473	Kaszów II
7753	538	Kaszów Tyralówka
7754	671	Kaszów Lysa Góra
7755	758	Liszki Krzyzówka
7756	321	Liszki UG
7757	\N	Liszki II
7758	438	Liszki I
7759	\N	Borki I
7760	14	Nowa Wies Kosciól
7761	296	Nowa Wies
7762	460	Nowa Wies Kapliczka
7763	473	Kaszów II
7764	538	Kaszów Tyralówka
7765	671	Kaszów Lysa Góra
7766	758	Liszki Krzyzówka
7767	321	Liszki UG
7768	321	Liszki UG
7769	438	Liszki I
7770	\N	Liszki II
7771	\N	Borki I
7772	174	Wyzral
7773	787	Wyzral Szkola
7774	529	Wyzral Wielka Droga
7775	575	Wyzral I
7776	174	Wyzral
7777	787	Wyzral Szkola
7778	529	Wyzral Wielka Droga
7779	575	Wyzral I
7780	206	Raczna Kapliczka
7781	206	Raczna Kapliczka
7782	397	Czernichów
7783	\N	Czernichów Studzienki
7784	255	Zagacie II
7785	516	Zagacie I
7786	\N	Czernichów Studzienki
7787	255	Zagacie II
7788	516	Zagacie I
7789	\N	Sciejowice Granica
7790	\N	Raczna I
7791	\N	Sciejowice
7792	\N	Droga do Jeziorzan
7793	\N	Jeziorzany
7794	\N	Jeziorzany I
7795	\N	Droga do Jeziorzan
7796	\N	Raczna II
7797	\N	Raczna I
7798	\N	Sciejowice
7799	\N	Sciejowice Granica
7800	\N	Ksiecia Józefa
7801	\N	Ksiecia Józefa
7802	279	Malczewskiego
7803	279	Malczewskiego
7804	63	Salwator
7805	63	Salwator
7806	215	Slonecznikowa
7807	185	Hofmana
7808	625	Przegon
7809	364	Instytut Reumatologii
7810	505	Cracovia
7811	708	Jubilat
7812	\N	Reymana
7813	436	Filharmonia
7814	709	Plac Wszystkich Swietych
7815	394	Wawel
7816	215	Slonecznikowa
7817	625	Przegon
7818	364	Instytut Reumatologii
7819	505	Cracovia
7820	424	Cracovia Blonia
7821	55	Cracovia Stadion
7822	708	Jubilat
7823	\N	Reymana
7824	74	Uniwersytet Jagiellonski
7825	\N	Wegrzce Starostwo Powiatowe
7826	396	Wegrzce
7827	\N	Bibice I
7828	\N	Wegrzce Starostwo Powiatowe
7829	396	Wegrzce
7830	396	Wegrzce
7831	\N	Bibice I
7832	807	Bibice
7833	790	Michalowice
7834	790	Michalowice
7835	807	Bibice
7836	\N	Michalowice Komora
7837	\N	Michalowice Komora
7838	\N	Michalowice I
7839	391	Maslomiaca
7840	\N	Michalowice Lecznica
7841	\N	Michalowice II
7842	\N	Laskowiec
7843	\N	Warszówka
7844	\N	Michalowice III
7845	\N	Michalówka
7846	\N	Gosciniec
7847	\N	Michalowice I
7848	391	Maslomiaca
7849	\N	Michalowice Lecznica
7850	\N	Warszówka
7851	\N	Laskowiec
7852	\N	Michalowice III
7853	\N	Michalówka
7854	\N	Gosciniec
7855	\N	Kozierów Skrzyzowanie
7856	\N	Zerkowice Kolonia
7857	\N	Zerkowice Skrzyzowanie
7858	\N	Krasieniec Stary
7859	\N	Krasieniec Remiza
7860	\N	Kozierów Skrzyzowanie
7861	\N	Zerkowice Kolonia
7862	\N	Zerkowice Skrzyzowanie
7863	\N	Krasieniec Stary
7864	\N	Krasieniec Remiza
7865	\N	Maslomiaca I
7866	222	Wieclawice Stare
7867	\N	Pielgrzymowice II
7868	\N	Pielgrzymowice I
7869	\N	Maslomiaca I
7870	222	Wieclawice Stare
7871	\N	Pielgrzymowice II
7872	\N	Pielgrzymowice I
7873	\N	Batowice I
7874	\N	Batowice Kapliczka
7875	\N	Dlubnia
7876	\N	Raciborowice
7877	\N	Raciborowice I
7878	\N	Zastów
7879	\N	Batowice I
7880	\N	Batowice Kapliczka
7881	\N	Dlubnia
7882	\N	Raciborowice
7883	\N	Raciborowice I
7884	709	Plac Wszystkich Swietych
7885	436	Filharmonia
7886	436	Filharmonia
7887	436	Filharmonia
7888	394	Wawel
7889	743	Sw. Gertrudy
7890	743	Sw. Gertrudy
7891	310	Poczta Glówna
7892	359	Starowislna
7893	307	Stradom
7894	83	Plac Wolnica
7895	704	Hala Targowa
7896	307	Stradom
7897	83	Plac Wolnica
7898	554	Sw. Wawrzynca
7899	359	Starowislna
7900	359	Starowislna
7901	310	Poczta Glówna
7902	310	Poczta Glówna
7903	704	Hala Targowa
7904	554	Sw. Wawrzynca
7905	444	Rondo Grzegórzeckie
7906	503	Francesco Nullo
7907	444	Rondo Grzegórzeckie
7908	444	Rondo Grzegórzeckie
7909	503	Francesco Nullo
7910	169	Ofiar Dabia
7911	\N	Nowohucka
7912	\N	M1  Nowohucka
7913	169	Ofiar Dabia
7914	169	Ofiar Dabia
7915	613	Dabie
7916	\N	M1  Nowohucka
7917	\N	Nowohucka
7918	633	Mistrzejowice
7919	362	Misnienska
7920	633	Mistrzejowice
7921	362	Misnienska
7922	\N	Os.Piastów
7923	56	Piasta Kolodzieja
7924	568	Popielidów
7925	286	Kruszwicka
7926	728	Kleeberga
7927	650	Rondo Piastowskie
7928	564	Kupaly
7929	46	Dunikowskiego
7930	\N	Os.Strusia
7931	\N	Os.Na Lotnisku
7932	67	DH Wanda
7933	\N	Os. Mistrzejowice Nowe
7934	50	Lowinskiego
7935	408	Nowolipki
7936	\N	Nad Dlubnia
7937	620	Wankowicza
7938	\N	Kocmyrzowska
7939	509	Os.Kosciuszkowskie
7940	609	Marii Dabrowskiej
7941	163	Medweckiego
7942	621	Czyzyny
7943	449	Rondo Czyzynskie
7944	\N	Os.Kolorowe
7945	\N	Plac Centralny
7946	226	Aleja Przyjazni
7947	478	Aleja Róz
7948	801	Zeromskiego
7949	599	Rondo Kocmyrzowskie
7950	\N	Os.Górali
7951	433	Struga
7952	\N	Os.Na Skarpie
7953	37	Klasztor Cystersów
7954	\N	Os.Wandy
7955	164	Klasztorna
7956	\N	Os.Willowe
7957	\N	Orkana
7958	\N	Bulwarowa
7959	167	Darwina
7960	\N	Os.Na Stoku Szkola
7961	800	Architektów
7962	\N	Leszka Bialego
7963	\N	Jagielly
7964	565	Wzgórza Krzeslawickie
7965	565	Wzgórza Krzeslawickie
7966	565	Wzgórza Krzeslawickie
7967	565	Wzgórza Krzeslawickie
7968	800	Architektów
7969	\N	Leszka Bialego
7970	\N	Os.Na Stoku Szkola
7971	167	Darwina
7972	167	Darwina
7973	167	Darwina
7974	187	Wiadukty
7975	187	Wiadukty
7976	620	Wankowicza
7977	\N	Nad Dlubnia
7978	\N	Kocmyrzowska
7979	\N	Jagielly
7980	408	Nowolipki
7981	50	Lowinskiego
7982	\N	Os. Mistrzejowice Nowe
7983	564	Kupaly
7984	620	Wankowicza
7985	\N	Cedynska
7986	650	Rondo Piastowskie
7987	728	Kleeberga
7988	286	Kruszwicka
7989	568	Popielidów
7990	56	Piasta Kolodzieja
7991	\N	Os.Piastów
7992	\N	Os.Piastów
7993	46	Dunikowskiego
7994	46	Dunikowskiego
7995	46	Dunikowskiego
7996	270	Rondo Hipokratesa
7997	270	Rondo Hipokratesa
7998	\N	Os.Strusia
7999	\N	Os.Na Lotnisku
8000	\N	Os.Na Lotnisku
8001	67	DH Wanda
8002	67	DH Wanda
8003	67	DH Wanda
8004	509	Os.Kosciuszkowskie
8005	609	Marii Dabrowskiej
8006	163	Medweckiego
8007	621	Czyzyny
8008	449	Rondo Czyzynskie
8009	449	Rondo Czyzynskie
8010	449	Rondo Czyzynskie
8011	449	Rondo Czyzynskie
8012	\N	Os.Kolorowe
8013	599	Rondo Kocmyrzowskie
8014	793	Teatr Ludowy
8015	\N	Os.Górali
8016	801	Zeromskiego
8017	801	Zeromskiego
8018	478	Aleja Róz
8019	478	Aleja Róz
8020	478	Aleja Róz
8021	\N	Os.Zielone
8022	624	Centralna
8023	624	Centralna
8024	\N	Plac Centralny
8025	\N	Plac Centralny
8026	\N	Plac Centralny
8027	433	Struga
8028	433	Struga
8029	\N	Os.Na Skarpie
8030	\N	Os.Na Skarpie
8031	164	Klasztorna
8032	37	Klasztor Cystersów
8033	\N	Os.Willowe
8034	\N	Bulwarowa
8035	\N	Brama nr 4
8036	\N	Brama nr 5
8037	\N	Koksochemia
8038	\N	Mrozowa
8039	776	Blokowa
8040	\N	Agencja Kraków Wschód
8041	58	Walcownia
8042	227	Zajezdnia Nowa Huta
8043	\N	PH
8044	292	Pleszów
8045	\N	Koksochemia
8046	\N	Brama nr 5
8047	\N	Brama nr 4
8048	812	Kombinat
8049	\N	Mrozowa
8050	776	Blokowa
8051	227	Zajezdnia Nowa Huta
8052	\N	Agencja Kraków Wschód
8053	626	Luborzyca
8054	495	Luborzyca I
8055	499	Kocmyrzów
8056	\N	Dojazdów Dzialki
8057	\N	Dojazdów PKS
8058	\N	Sulechów
8059	\N	Prusy WSR
8060	\N	Prusy Szkola
8061	\N	Prusy
8062	\N	Prusy
8063	\N	Prusy Szkola
8064	\N	Prusy WSR
8065	\N	Sulechów
8066	\N	Dojazdów PKS
8067	499	Kocmyrzów
8068	495	Luborzyca I
8069	\N	Czulice I
8070	\N	Czulice I
8071	474	Siwka
8072	\N	Lesisko
8073	474	Siwka
8074	607	Koszykarska
8075	170	Stoczniowców
8076	437	Saska
8077	309	Szczecinska
8078	765	Lanowa
8079	434	Plaszów Szkola
8080	563	Motyla
8081	\N	Zalew Bagry
8082	498	Kuklinskiego
8083	763	Limanowskiego
8084	736	Korona
8085	\N	Os.Podwawelskie
8086	598	Kapelanka
8087	147	Slomiana
8088	\N	Baluckiego
8089	672	Rynek Debnicki
8090	686	Zielinskiego
8091	\N	Os.Robotnicze
8092	24	Kobierzynska
8093	121	Lipinskiego
8094	491	Norymberska
8095	615	Rostworowskiego
8096	173	Skotniki Szkola
8097	\N	Os.Robotnicze
8098	686	Zielinskiego
8099	\N	Most Grunwaldzki
8100	\N	Most Grunwaldzki
8101	\N	Most Grunwaldzki
8102	\N	Most Grunwaldzki
8103	754	Szwedzka
8104	754	Szwedzka
8105	147	Slomiana
8106	121	Lipinskiego
8107	491	Norymberska
8108	615	Rostworowskiego
8109	\N	Os.Podwawelskie
8110	266	Borsucza
8112	\N	Kamienskiego Wiadukt
8113	306	Kamienskiego
8114	\N	Kamienskiego Wiadukt
8115	386	Rondo Matecznego
8116	386	Rondo Matecznego
8117	386	Rondo Matecznego
8118	736	Korona
8119	266	Borsucza
8120	763	Limanowskiego
8121	86	Powstanców Wielkopolskich
8122	498	Kuklinskiego
8123	498	Kuklinskiego
8124	607	Koszykarska
8125	170	Stoczniowców
8126	170	Stoczniowców
8127	170	Stoczniowców
8128	437	Saska
8129	144	Lipska
8130	309	Szczecinska
8131	31	Rzebika
8132	765	Lanowa
8133	\N	Surzyckiego
8134	427	Maly Plaszów
8135	\N	Surzyckiego
8136	316	Dworcowa
8137	398	Sulkowskiego
8138	579	Wola Duchacka
8139	258	Biezanowska
8140	145	Wlotowa
8141	258	Biezanowska
8142	145	Wlotowa
8143	316	Dworcowa
8144	306	Kamienskiego
8145	579	Wola Duchacka
8146	579	Wola Duchacka
8147	398	Sulkowskiego
8148	\N	Brzegi
8149	411	Brzegi I
8150	411	Brzegi I
8151	156	Ks. Targosza
8152	\N	Wrobela
8153	410	Podwierzbie
8154	\N	Wrobela
8155	156	Ks. Targosza
8156	\N	Nad Drwina
8157	372	Póllanki
8158	\N	Szparagowa
8159	\N	Plk. Dabka
8160	\N	Plk. Dabka
8161	17	Zajezdnia Plaszów
8162	552	Albatrosów
8163	\N	Szparagowa
8164	\N	Szparagowa
8165	\N	Biezanów Szkola
8166	\N	Sucharskiego
8167	\N	Biezanów Szkola
8168	\N	Sucharskiego
8169	\N	Zlocieniowa
8170	\N	Biezanów Potrzask
8171	\N	Pruszynskiego
8172	\N	Drozdzowa
8173	\N	Ks.Laczka
8174	110	Nowy Biezanów
8175	\N	Nowy Biezanów Poludnie
8176	753	Cwiklinskiej
8177	711	Teligi
8178	12	Prokocim Szpital
8179	\N	Wydzial Farmaceutyczny UJ
8180	742	Dom Spokojnej Starosci
8181	20	Piaski Wielkie
8182	810	Jerzmanowskiego
8183	\N	Ks.Laczka
8184	\N	Biezanów Cmentarz
8185	110	Nowy Biezanów
8186	110	Nowy Biezanów
8187	753	Cwiklinskiej
8188	711	Teligi
8189	12	Prokocim Szpital
8190	12	Prokocim Szpital
8191	742	Dom Spokojnej Starosci
8192	679	Prokocim UJ
8193	679	Prokocim UJ
8194	679	Prokocim UJ
8195	810	Jerzmanowskiego
8196	53	Wielicka
8197	\N	Zlocieniowa
8198	\N	Soboniowice Granica Miasta
8199	96	Grabówki
8200	\N	Os.Kurdwanów
8201	701	Stojalowskiego
8202	543	Nowosadecka
8203	99	Witosa
8204	99	Witosa
8205	543	Nowosadecka
8206	543	Nowosadecka
8207	442	Piaski Nowe
8208	442	Piaski Nowe
8209	\N	Os.Kurdwanów
8210	701	Stojalowskiego
8211	20	Piaski Wielkie
8212	20	Piaski Wielkie
8213	\N	Soboniowice Granica Miasta
8214	\N	Lusina Dolna
8215	\N	Lusina I
8216	558	Myslenicka
8217	352	Halszki
8218	\N	Zywiecka
8219	756	Góra Borkowska
8220	243	Las Borkowski
8221	287	Zawila
8222	803	Skosna
8223	792	Borkowska
8224	469	Forteczna
8225	\N	Zawiszy
8226	\N	Os.Kliny
8227	\N	Narvik
8228	151	Judyma
8229	755	Opatkowice
8230	469	Forteczna
8231	792	Borkowska
8232	151	Judyma
8233	287	Zawila
8234	243	Las Borkowski
8235	756	Góra Borkowska
8236	803	Skosna
8237	171	Borek Falecki
8238	352	Halszki
8239	558	Myslenicka
8240	558	Myslenicka
8241	\N	Lusina Dolna
8242	778	Brücknera
8243	385	Kobierzyn
8244	778	Brücknera
8245	385	Kobierzyn
8246	387	Skawina Os. Radziszowskie
8247	665	Skawina Radziszowska
8248	425	Skawina Rynek
8249	703	Skawina Cmentarz
8250	699	Skawina Podlipki
8251	175	Skawina Rzepnik
8252	665	Skawina Radziszowska
8253	490	Skawina Popieluszki
8254	175	Skawina Rzepnik
8255	699	Skawina Podlipki
8256	387	Skawina Os. Radziszowskie
8257	\N	Radziszów Wlosanka
8258	\N	Radziszów Zadworze
8259	152	Radziszów Centrum
8260	239	Radziszów Kamionna
8261	239	Radziszów Kamionna
8262	152	Radziszów Centrum
8263	\N	Radziszów Zadworze
8264	\N	Radziszów Wlosanka
8265	\N	Gaj Szkola
8266	\N	Gaj Zadziele
8267	\N	Mogilany Osrodek Zdrowia
8268	\N	Gaj Zadziele
8269	\N	Gaj Szkola
8270	\N	Radziszów
8271	\N	Radziszów Stare Sanatorium
8272	\N	Radziszów Lesniczówka
8273	\N	Radziszów Podlesie
8274	\N	Radziszów Podlesie
8275	\N	Radziszów Stare Sanatorium
8276	\N	Konary
8277	\N	Konary I
8278	\N	Lusina Górka
8279	\N	Dobrzyczany
8280	\N	Krasnik
8281	\N	Zagrody
8282	\N	Zagrody
8283	\N	Krasnik
8284	\N	Dobrzyczany
8285	\N	Lusina Górka
8286	\N	Konary I
8287	\N	Konary Wlosan
8288	\N	Mogilany Wlosan
8289	\N	Mogilany Wlosan
8290	\N	Konary Wlosan
8291	\N	Wlosan
8292	\N	Wlosan Krzyzówka
8293	\N	Wlosan Kopan
8294	\N	Wlosan Kopan
8295	\N	Wlosan Krzyzówka
8296	\N	Spadochroniarzy
8297	\N	Spadochroniarzy
8298	270	Rondo Hipokratesa
8299	270	Rondo Hipokratesa
8300	68	Skawina Ajka
8301	68	Skawina Ajka
8302	\N	Glogera
8303	\N	Glogera
8304	107	Bora-Komorowskiego
8305	107	Bora-Komorowskiego
8306	\N	Lema
8307	\N	Lema
8308	731	Zlocien
8309	755	Opatkowice
8310	104	Libertów Dolny
8311	104	Libertów Dolny
8312	\N	PB
8313	\N	PW
8314	\N	PP
8315	548	Dworzec Plaszów
8316	238	Grota-Roweckiego
8317	238	Grota-Roweckiego
8318	740	Oleandry
8319	740	Oleandry
8320	63	Salwator
8321	284	Lutnia
8322	171	Borek Falecki
8323	316	Dworcowa
8324	74	Uniwersytet Jagiellonski
8325	154	Krowodrza Urzedy Skarbowe
8326	154	Krowodrza Urzedy Skarbowe
8327	331	Krowoderskich Zuchów
8328	331	Krowoderskich Zuchów
8329	751	Kabel
8330	751	Kabel
8331	\N	Sudolska
8332	728	Kleeberga
8333	30	Szpital Rydygiera
8334	\N	Bulwarowa Ogródki Dzialkowe
8335	\N	Szpital Zeromskiego
8336	\N	Szpital Zeromskiego
8337	\N	Sieroszewskiego
8338	\N	Sieroszewskiego
8339	\N	Stare Wislisko
8340	\N	Stare Wislisko
8341	\N	Lasek Mogilski
8342	\N	Lasek Mogilski
8343	\N	Plac Centralny
8344	\N	Plac Centralny
8345	161	Torfowa
8346	712	Biezanów Bazy
8347	712	Biezanów Bazy
8348	150	Bacutil
8349	150	Bacutil
8350	\N	Rybitwy Rozjazd
8351	\N	Rybitwy Rozjazd
8352	\N	Rybitwy Dom Kultury
8353	\N	Rybitwy Dom Kultury
8354	567	Jezowa
8355	\N	Biskupinska
8356	\N	Obronców Modlina
8357	\N	Obronców Modlina
8358	49	Plac Bohaterów Getta
8359	49	Plac Bohaterów Getta
8360	86	Powstanców Wielkopolskich
8361	672	Rynek Debnicki
8362	\N	Praska
8363	\N	Praska
8364	\N	Luczynskiego
8365	791	Komuny Paryskiej
8366	791	Komuny Paryskiej
8367	71	Siewna Wiadukt
8368	788	Zdrowa
8369	\N	Hallera
8370	\N	Hallera
8371	322	Makowskiego
8372	322	Makowskiego
8373	322	Makowskiego
8374	322	Makowskiego
8375	374	Nowy Prokocim
8376	374	Nowy Prokocim
8377	\N	Lusina Dwór
8378	\N	Lusina I
8379	330	Lusina Granica
8380	330	Lusina Granica
8381	755	Opatkowice
8382	603	Kaszów
8383	603	Kaszów
8384	\N	Dwór Czeczów
8385	\N	Lipowskiego
8386	\N	Weigla
8387	\N	Brzoskwinia Koziary
8388	433	Struga
8389	519	Nowy Kleparz
8390	33	Przewóz
8391	33	Przewóz
8392	617	Na Zaleczu
8393	617	Na Zaleczu
8394	\N	Jordanowska
8395	\N	Jordanowska
8396	\N	Skrajna
8397	\N	Skrajna
8398	\N	Jana Kazimierza
8399	\N	Jana Kazimierza
8400	\N	Petöfiego
8401	\N	Petöfiego
8402	265	Zajezdnia Bienczyce
8403	265	Zajezdnia Bienczyce
8404	\N	Os.Kalinowe
8405	\N	Os.Kalinowe
8406	301	Os.Zlotego Wieku
8407	301	Os.Zlotego Wieku
8408	231	Leczycka
8409	231	Leczycka
8410	\N	Slawka
8411	\N	Slawka
8412	305	Zajezdnia Wola Duchacka
8413	305	Zajezdnia Wola Duchacka
8414	\N	Biezanów Pomnik
8415	\N	Biezanów Pomnik
8416	762	Barbary
8417	\N	Fredry
8418	\N	Fredry
8419	273	Majora
8420	\N	Rzeszotary Panciawa
8421	\N	Droga do Janowic
8422	\N	Ochojno Remiza
8423	\N	Wrzasowice
8424	\N	Wrzasowice
8425	\N	Dabrówki I
8426	\N	Dabrówki I
8427	\N	Dabrówki
8428	\N	Dabrówki
8429	\N	Ochojno Kamieniec
8430	\N	Ochojno Kamieniec
8431	\N	Ochojno Skrzyzowanie
8432	\N	Ochojno Skrzyzowanie
8433	\N	Rzeszotary Górne
8434	\N	Rzeszotary Górne
8435	\N	Rzeszotary Polanki
8436	\N	Rzeszotary Polanki
8437	\N	Rzeszotary
8438	\N	Rzeszotary
8439	\N	Rzeszotary Trafo
8440	\N	Rzeszotary Trafo
8441	\N	Rzeszotary Szkola
8442	\N	Rzeszotary Szkola
8443	\N	Swiatniki Skrzyzowanie
8444	\N	Swiatniki Skrzyzowanie
8445	\N	Piasna Górka 
8446	\N	Piasna Górka 
8447	\N	Rzeszotary Zalesie
8448	\N	Rzeszotary Zalesie
8449	\N	Droga do Janowic
8450	\N	Swiatniki Górne
8451	\N	Swiatniki Górne
8452	\N	Swiatniki Centrum
8453	\N	Swiatniki Centrum
8454	\N	Swiatniki Cmentarz
8455	\N	Swiatniki Cmentarz
8456	\N	Swiatniki I
8457	\N	Swiatniki I
8458	\N	Konary Buk
8459	\N	Konary Buk
8460	\N	Wrzasowice III
8461	\N	Wrzasowice III
8462	\N	Wrzasowice Górka
8463	\N	Wrzasowice II
8464	\N	Wrzasowice II
8465	\N	Wrzasowice I
8466	\N	Wrzasowice I
8467	\N	Swiatniki Górne
8468	\N	Mogilany Osrodek Zdrowia
8469	437	Saska
8470	34	Piekary
8471	70	Piekary Górne
8472	70	Piekary Górne
8473	784	Piekary III
8474	39	Stara Wola
8475	39	Stara Wola
8476	597	Pradnik Bialy Zachód
8477	366	Szczyglice Dom Kultury
8478	164	Klasztorna
8479	499	Kocmyrzów
8480	499	Kocmyrzów
8481	\N	Kocmyrzów I
8482	\N	Kocmyrzów I
8483	\N	Sodfiny
8484	\N	Sodfiny
8485	\N	Sodfiny Kolonia
8486	\N	Sodfiny Kolonia
8487	\N	Gleboka
8488	\N	Gleboka
8489	\N	Karniów
8490	129	Kopiec Wandy
8491	\N	Buków
8492	\N	Buków Klin
8493	\N	Buków Klin
8494	\N	Buków Szkola
8495	\N	Buków Szkola
8496	\N	Kulerzów
8497	\N	Kulerzów
8498	\N	Kulerzów Wawóz
8499	\N	Kulerzów Wawóz
8500	\N	Chorowice
8501	\N	Chorowice
8502	\N	Kopce
8503	\N	Kopce
8504	\N	Mogilany Cmentarz
8505	\N	Mogilany Cmentarz
8506	\N	Burów
8507	\N	Burów I
8508	\N	Balice Grzybów
8509	\N	Balice OSP
8510	\N	Balice OSP
8511	\N	Burów I
8512	\N	Wolowice Szkola
8513	\N	Wolowice
8514	\N	Grotowa
8515	\N	Górskie Domy
8516	\N	Czulice
8517	\N	Górskie Domy
8518	\N	Grotowa
8519	\N	Wolowice
8520	\N	Wolowice Szkola
8521	\N	Podkamycze
8522	756	Góra Borkowska
8523	756	Góra Borkowska
8524	684	Cmentarz Batowice
8525	684	Cmentarz Batowice
8526	332	Wieliczka Cmentarz
8527	176	Wieliczka
8528	332	Wieliczka Cmentarz
8529	357	Wieliczka CPN
8530	357	Wieliczka CPN
8531	\N	Narvik
8532	370	Libertów
8533	370	Libertów
8534	578	Zawila Cmentarz
8535	578	Zawila Cmentarz
8536	\N	Slósarczyka
8537	56	Piasta Kolodzieja
8538	\N	Przy Kuzni
8539	\N	Przy Kuzni
8540	97	Michalowice Kozlica
8541	97	Michalowice Kozlica
8542	\N	Wysylek
8543	\N	Wysylek
8544	699	Skawina Podlipki
8545	\N	Prusy
8546	\N	Glogera
8547	\N	Balice III
8548	\N	Balice I
8549	472	Granica Miasta
8550	395	Olszanica Bory
8551	\N	Balice III
8552	346	Zbydniowice
8553	\N	Trzecia Góra
8554	\N	Soboniowice Granica Miasta
8555	90	Pekowice
8556	104	Libertów Dolny
8557	330	Lusina Granica
8558	103	Pasternik
8559	197	Batowice PKP
8560	\N	Raciborowice
8561	\N	Zastów
8562	\N	Czulice I
8563	\N	Konary Buk
8564	174	Wyzral
8565	\N	Dabrowa Szlachecka Figurka
8566	\N	Grotowa
8567	\N	Michalowice Komora
8568	\N	Aleksandrowice
8569	\N	Brzoskwinia Koziary
8570	283	Zielony Dól
8571	283	Zielony Dól
8572	290	Instytut Pediatrii
8573	290	Instytut Pediatrii
8574	\N	Zawierzbie
8575	\N	Zawierzbie
8576	\N	Wolowice Kapliczka
8577	\N	Wolowice Kapliczka
8578	\N	Dabrowa Szlachecka Figurka
8579	\N	Dabrowa Szlachecka Figurka
8580	\N	Dabrowa Szlachecka Krzyz
8581	\N	Dabrowa Szlachecka Krzyz
8582	\N	Raczna Osiedle
8583	\N	Raczna Osiedle
8584	\N	Surzyckiego
8585	\N	Karniów
8586	799	Wieliczka Kosciól
8587	223	Wielicka Granica Miasta
8588	799	Wieliczka Kosciól
8589	223	Wielicka Granica Miasta
8590	\N	Most Grunwaldzki
8591	\N	Aleja Waszyngtona
8592	\N	Aleja Waszyngtona
8593	77	Cichy Kacik
8594	684	Cmentarz Batowice
8595	\N	Biezanów Drozdzownia PKP
8596	\N	Biezanów Drozdzownia PKP
8597	\N	Swidzinskiego
8598	579	Wola Duchacka
8599	386	Rondo Matecznego
8600	381	Dajwór
8601	\N	Os.Kurdwanów
8602	\N	Zagórzyce Dworskie
8603	\N	Zagórzyce Stare
8604	444	Rondo Grzegórzeckie
8605	732	Tischnera
8606	480	Czerwiakowskiego
8607	\N	Rzaka 
8608	12	Prokocim Szpital
8609	271	Lagiewniki
8610	271	Lagiewniki
8611	271	Lagiewniki
8612	271	Lagiewniki
8613	\N	Domagaly
8614	\N	Domagaly
8615	\N	Beskidzka
8616	\N	Beskidzka
8617	583	Natansona
8618	583	Natansona
8619	796	Slomczynskiego
8620	796	Slomczynskiego
8621	729	Pradnik Czerwony
8622	\N	Zajezdnia Podgórze
8623	682	Chmieleniec
8624	682	Chmieleniec
8625	489	Rynek Falecki
8626	\N	Sucha
8627	\N	Sucha
8628	598	Kapelanka
8629	279	Malczewskiego
8630	598	Kapelanka
8631	686	Zielinskiego
8632	686	Zielinskiego
8633	279	Malczewskiego
8634	558	Myslenicka
8635	\N	Balice Lesna
8636	\N	Balice Lesna
8637	131	Stella-Sawickiego
8638	\N	Iwanowice
8639	\N	Krasieniec Zakupny
8640	\N	Krasieniec Zakupny
8641	\N	Krasieniec
8642	\N	Krasieniec
8643	161	Torfowa
8644	\N	Lubostron
8645	\N	Lubostron
8646	636	Cmentarz Rakowicki
8647	\N	Os.Na Stoku
8648	800	Architektów
8649	746	Libertów Szkola
8650	746	Libertów Szkola
8651	168	Libertów Dzialy
8652	168	Libertów Dzialy
8653	342	Libertów Krzyzówka
8654	342	Libertów Krzyzówka
8655	\N	Droga do Sidziny
8656	\N	Droga do Sidziny
8657	\N	Mala Góra
8658	\N	Nowohucka
8659	\N	Nowohucka
8660	131	Stella-Sawickiego
8661	350	Rondo Ofiar Katynia
8662	369	Zabierzów Gimnazjum
8663	369	Zabierzów Gimnazjum
8664	567	Jezowa
8665	167	Darwina
8666	\N	Sieborowice
8667	\N	Sieborowice
8668	\N	Szparagowa
8669	596	Kliny Zacisze
8670	596	Kliny Zacisze
8671	\N	Lesisko
8672	498	Kuklinskiego
8673	594	Klimeckiego
8674	594	Klimeckiego
8675	\N	Zelków
8676	\N	Bociana
8677	167	Darwina
8678	626	Luborzyca
8679	\N	Wola Luborzycka
8680	\N	Wola Luborzycka
8681	\N	Wola Luborzycka Las
8682	\N	Wola Luborzycka Las
8683	\N	Lososkowice
8684	\N	Lososkowice Szkola
8685	\N	Lososkowice Szkola
8686	\N	Skrzeszowice
8687	\N	Skrzeszowice
8688	\N	Goszyce Remiza
8689	\N	Goszyce Remiza
8690	\N	Goszyce
8691	\N	Goszyce
8692	659	Polana Zywiecka
8693	\N	Trojanowice I
8694	\N	Trojanowice I
8695	\N	Trojanowice Petla
8696	136	Zielonki Rozjazd
8697	33	Przewóz
8698	\N	Sliwiaka
8699	\N	Sliwiaka
8700	\N	Biezanów Cmentarz
8701	53	Wielicka
8702	167	Darwina
8703	\N	Park Jordana
8704	\N	Park Jordana
8705	\N	Zabierzów Mlyn
8706	710	Przegorzaly
8707	\N	Przegorzaly UJ
8708	\N	Panienskich Skal
8709	\N	Panienskich Skal
8710	\N	Czyzyny Dworzec
8711	\N	Skrzyzowanie do Podchruscia
8712	\N	Skrzyzowanie do Podchruscia
8713	\N	Modlnica I Kolonia
8714	\N	Modlnica I Kolonia
8715	\N	Modlnica II
8716	\N	Modlnica II
8717	\N	Szyce II
8718	\N	Szyce II
8719	770	Szyce I
8720	770	Szyce I
8721	\N	Wielka Wies
8722	\N	Wielka Wies
8723	\N	Bialy Kosciól
8724	\N	Bialy Kosciól
8725	\N	Murownia
8726	\N	Murownia
8727	\N	Czajowice
8728	\N	Czajowice
8729	\N	Beblo Stara Wies
8730	\N	Beblo Stara Wies
8731	\N	Beblo Labajowa
8732	\N	Beblo Labajowa
8733	\N	Beblo Lasek
8734	\N	Beblo Lasek
8735	\N	Bedkowice Mosurowa
8736	\N	Bedkowice Mosurowa
8737	\N	Bedkowice Kawiory
8738	\N	Bedkowice Kawiory
8739	\N	Bedkowice Borynia
8740	\N	Bedkowice Borynia
8741	\N	Modlniczka I
8742	\N	Modlniczka I
8743	782	Modlniczka
8744	782	Modlniczka
8745	\N	Modlnica Skrzyzowanie
8746	\N	Modlnica Skrzyzowanie
8747	\N	Modlnica
8748	\N	Modlnica
8749	\N	Tomaszowice Wedonka
8750	\N	Tomaszowice Wedonka
8751	\N	Tomaszowice I
8752	\N	Tomaszowice I
8753	557	Tomaszowice
8754	\N	Trojadyn Szydlo
8755	\N	Trojadyn Szydlo
8756	\N	Trojadyn Szydlo
8757	\N	Trojadyn Trafo
8758	\N	Trojadyn Trafo
8759	\N	Trojadyn
8760	\N	Trojadyn
8761	\N	Trojadyn Skrzyzowanie
8762	90	Pekowice
8763	587	Prokocim
8764	\N	Mlyn
8765	\N	Mlyn
8766	\N	Krzeslawice
8767	\N	Krzeslawice
8768	\N	Krasnowolskiego
8769	\N	Krasnowolskiego
8770	620	Wankowicza
8771	479	Przykopy
8772	184	Turowicza
8773	184	Turowicza
8774	184	Turowicza
8775	\N	Lusina Petla
8776	\N	Lusina Szkola
8777	\N	Lusina Szkola
8778	\N	Lusina Spacerowa
8779	\N	Lusina Spacerowa
8780	\N	Lusina Dwór
8781	\N	Lusina Dwór
8782	\N	Sciejowice
8783	\N	Stopien Wodny
8784	\N	Cmentarz Grebalów I
8785	\N	Cmentarz Grebalów I
8786	720	Skawina Szkola
8787	36	Skawina Sad
8788	36	Skawina Sad
8789	259	Skawina Tyniecka Osiedle
8790	259	Skawina Tyniecka Osiedle
8791	\N	Skawina Tyniecka
8792	794	Skawina Wojska Polskiego
8793	794	Skawina Wojska Polskiego
8794	245	Skawina Samborek Most
8795	245	Skawina Samborek Most
8796	\N	Podgórki Skawinskie
8797	\N	Podgórki Skawinskie
8798	341	Meissnera
8799	341	Meissnera
8800	181	Uniwersytet Ekonomiczny
8801	\N	Muzeum Armii Krajowej
8802	\N	Podgórki Skawinskie
8803	\N	Brzezie Dzialki
8804	\N	Brzezie Dzialki
8805	\N	Krzeszowice
8806	531	Bolechowice
8807	531	Bolechowice
8808	\N	Karniowice
8809	\N	Brzezie Narodowe
8810	\N	Karniowice I
8811	\N	Karniowice I
8812	\N	Zielona Mala
8813	\N	Zielona Mala
8814	\N	Lipka
8815	\N	Lipka
8816	\N	Wieckowice
8817	\N	Wieckowice
8818	422	Kobylany
8819	422	Kobylany
8820	\N	Kobylany I
8821	\N	Kobylany I
8822	\N	Brzezinka Zarzecze
8823	\N	Brzezinka Zarzecze
8824	1	Brzezinka
8825	1	Brzezinka
8826	390	Brzezinka Skrzyzowanie
8827	390	Brzezinka Skrzyzowanie
8828	769	Rudawa Bloki
8829	769	Rudawa Bloki
8830	88	Rudawa Kosciól
8831	\N	Radwanowice Petla
8832	\N	Radwanowice I
8833	\N	Radwanowice I
8834	\N	Radwanowice II
8835	\N	Radwanowice II
8836	312	Dubie
8837	312	Dubie
8838	\N	Pisary
8839	\N	Pisary
8840	\N	Pisary Kiosk
8841	\N	Pisary Kiosk
8842	685	Pisary Mleczarnia
8843	685	Pisary Mleczarnia
8844	635	Rudawa Szkola
8845	635	Rudawa Szkola
8846	\N	Mlynka
8847	\N	Krzeszowice Szkola
8848	\N	Krzeszowice Witaminka
8849	\N	Krzeszowice Witaminka
8850	\N	Nawojowa Góra II
8851	\N	Nawojowa Góra II
8852	\N	Nawojowa Góra I
8853	\N	Nawojowa Góra I
8854	\N	Pisary Skrzyzowanie
8855	\N	Pisary Skrzyzowanie
8856	61	Modlniczka Trzcie
8857	61	Modlniczka Trzcie
8858	\N	Brzezie Narodowe
8859	\N	Brzezie Narodowe
8860	\N	Brzezie
8861	\N	Brzezie
8862	\N	Brzezie Kulka
8863	\N	Brzezie Kulka
8864	\N	Karniowice
8865	94	Uniwersytet Pedagogiczny
8866	319	Leroy Merlin
8867	319	Leroy Merlin
8868	88	Rudawa Kosciól
8869	\N	Ujazd Petla
8870	\N	Ujazd Petla
8871	\N	Brzezie
8872	\N	Brzezie
8873	\N	Zabierzów Mlyn
8874	\N	Zielona
8875	\N	Zielona
8876	\N	Radwanowice Petla
8877	\N	Rudawa
8878	\N	Rudawa
8879	599	Rondo Kocmyrzowskie
8880	445	Skawina Korabniki
8881	512	Brzyczyna
8882	512	Brzyczyna
8883	115	Kleszczów
8884	\N	Burów
8885	587	Prokocim
8886	\N	Michalowice Ujecie Wody
8887	\N	Michalowice Ujecie Wody
8888	\N	Michalowice Las Michalowski
8889	\N	Michalowice Las Michalowski
8890	\N	Michalki
8891	\N	Michalki
8892	\N	Michalowice Banasiówka
8893	\N	Michalowice Banasiówka
8894	\N	Michalowice Komora
8895	129	Kopiec Wandy
8896	129	Kopiec Wandy
8897	181	Uniwersytet Ekonomiczny
8898	\N	Muzeum Armii Krajowej
8899	\N	Cmentarz Rakowicki Zachód
8900	\N	Cmentarz Rakowicki Zachód
8901	\N	Wegrzce Starostwo Powiatowe
8902	112	Rudawa PKP
8903	112	Rudawa PKP
8904	573	Dworzec Glówny
8905	\N	Krakowska Akademia
8906	250	Dworzec Glówny Wschód
8907	720	Skawina Szkola
8908	\N	Zagórzyce Stare
8909	\N	Rudawa Mlyn
8910	\N	Rudawa Mlyn
8911	\N	Kobylany Remiza
8912	\N	Mlynka
8913	\N	Bosutów
8914	\N	Bosutów Polindus
8915	\N	Bosutów Polindus
8916	\N	Bosutów Straz
8917	\N	Bosutów Straz
8918	\N	Bosutów Krzyz
8919	\N	Bosutów Krzyz
8920	\N	Wegrzce Sudól
8921	\N	Wegrzce Sudól
8922	\N	Wegrzce Magiczne Wzgórze
8923	\N	Wegrzce Magiczne Wzgórze
8924	\N	Wegrzce Centrum Medyczne
8925	\N	Wegrzce Centrum Medyczne
8926	\N	Bibice Petla
8927	\N	Bibice Cmentarz
8928	\N	Bibice Cmentarz
8929	\N	Zielonki Cegielnia
8930	\N	Zielonki Cegielnia
8932	\N	Balice III
8933	\N	Wegrzce Centrum
8934	\N	Wegrzce Blonie
8935	\N	Wegrzce Blonie
8936	\N	Wegrzce Petla
8937	\N	Most Kotlarski
8938	576	Dworzec Glówny Zachód
8939	573	Dworzec Glówny
8940	576	Dworzec Glówny Zachód
8941	\N	Przybyslawice III
8942	\N	Przybyslawice III
8943	461	Krowodrza Górka
8944	576	Dworzec Glówny Zachód
8945	553	Politechnika
8946	634	Zielonki UG
8947	634	Zielonki UG
8948	402	Skawina Koncentraty
8949	402	Skawina Koncentraty
8950	402	Skawina Koncentraty
8951	402	Skawina Koncentraty
8952	240	Rzozów Baseny
8953	240	Rzozów Baseny
8954	189	Rzozów I
8955	189	Rzozów I
8956	581	Rzozów Szkola
8957	581	Rzozów Szkola
8958	382	Goluchowice
8959	382	Goluchowice
8960	467	Goluchowice Jurczyce
8961	467	Goluchowice Jurczyce
8962	527	Goluchowice Sklep
8963	527	Goluchowice Sklep
8964	413	Polanka Hallera Dwór
8965	413	Polanka Hallera Dwór
8966	468	Grabie Polanka
8967	468	Grabie Polanka
8968	\N	Krzecin Sklep
8969	\N	Krzecin Sklep
8970	484	Skawina Wyspianskiego
8971	484	Skawina Wyspianskiego
8972	\N	Skawina Korabnicka
8973	\N	Skawina Korabnicka
8974	560	Skawina Korabnicka Szkola
8975	490	Skawina Popieluszki
8976	\N	Skawina  Elektrownia
8977	\N	Skawina  Elektrownia
8978	623	Skawina Zachodnia
8979	623	Skawina Zachodnia
8980	100	Skawina
8981	534	Brzeznica
8982	\N	Skawina  Pilsudskiego
8983	\N	Skawina  Pilsudskiego
8984	40	Skawina Podbory
8985	40	Skawina Podbory
8986	165	Brzeznica Pasieka
8987	616	Brzeznica Kuznia
8988	108	Jaskowice
8989	85	Jaskowice PKP
8990	363	Wielkie Drogi Trzebol
8991	725	Wielkie Drogi PKP
8992	670	Wielkie Drogi
8993	783	Zelczyna Sklep
8994	727	Zelczyna I
8995	18	Borek Szlachecki II
8996	213	Borek Szlachecki I
8997	165	Brzeznica Pasieka
8998	616	Brzeznica Kuznia
8999	108	Jaskowice
9000	85	Jaskowice PKP
9001	363	Wielkie Drogi Trzebol
9002	725	Wielkie Drogi PKP
9003	670	Wielkie Drogi
9004	783	Zelczyna Sklep
9005	727	Zelczyna I
9006	18	Borek Szlachecki II
9007	213	Borek Szlachecki I
9008	\N	Luczyce
9009	\N	Luczyce PKP
9010	\N	Wysiolek Luborzycki
9011	\N	Kapkazy
9012	\N	Kapkazy
9013	\N	Luczyce Las
9014	\N	Luczyce Las
9015	\N	Luczyce
9016	\N	Mala Góra
9017	180	Wola Radziszowska
9018	752	Wola Radziszowska Centrum
9019	752	Wola Radziszowska Centrum
9020	118	Wola Radziszowska Lipki
9021	118	Wola Radziszowska Lipki
9022	666	Wola Radziszowska Most
9023	666	Wola Radziszowska Most
9024	27	Wola Radziszowska Mala Ostra Góra
9025	27	Wola Radziszowska Mala Ostra Góra
9026	273	Majora
9027	\N	Wegrzce Centrum
9028	89	Wola Radziszowska Chorzyny
9029	89	Wola Radziszowska Chorzyny
9030	\N	Marcholta
9031	\N	Bohomolca
9032	\N	Marcholta
9033	\N	Bohomolca
9034	633	Mistrzejowice
9035	633	Mistrzejowice
9036	\N	Os.Oswiecenia
9037	\N	Radziszów Lesniczówka
9038	780	Skawina 29 Listopada
9039	\N	Skawina Centrum Wodne
9040	\N	Skawina Centrum Wodne
9041	353	Skawina Starostwo Powiatowe
9042	690	Skawina Kopernika
9043	\N	Skawina Kopernika I
9044	452	Skawina Cmentarz Komunalny
9045	780	Skawina 29 Listopada
9046	353	Skawina Starostwo Powiatowe
9047	690	Skawina Kopernika
9048	\N	Skawina Kopernika I
9049	220	Rondo Mogilskie
9050	220	Rondo Mogilskie
9051	220	Rondo Mogilskie
9052	220	Rondo Mogilskie
9053	220	Rondo Mogilskie
9054	220	Rondo Mogilskie
9055	220	Rondo Mogilskie
9056	220	Rondo Mogilskie
9057	458	Dworzec Towarowy
9058	458	Dworzec Towarowy
9059	553	Politechnika
9060	\N	Raciborowice Centrum
9061	\N	Raciborowice Centrum
9062	\N	Konczyce
9063	\N	Konczyce
9064	\N	Ksiazniczki Boisko
9065	\N	Ksiazniczki Boisko
9066	453	Biskupa Prandoty
9067	\N	Ksiazniczki Centrum
9068	\N	Ksiazniczki Centrum
9069	\N	Ksiazniczki Las
9070	\N	Ksiazniczki Las
9071	\N	Mlodziejowice Park
9072	\N	Mlodziejowice Park
9073	\N	Mlodziejowice Mlyn
9074	\N	Mlodziejowice Mlyn
9075	\N	Michalowice Ogrodowa
9076	\N	Michalowice Ogrodowa
9077	\N	Korzkiew I
9078	\N	Korzkiew I
9079	\N	Korzkiew II
9080	\N	Korzkiew II
9081	\N	Grebynice I
9082	\N	Grebynice I
9083	\N	Grebynice II
9084	\N	Grebynice II
9085	419	Grebynice Mogielki
9086	419	Grebynice Mogielki
9087	\N	Maszyce II
9088	\N	Maszyce II
9089	135	Maszyce Skrzyzowanie
9090	135	Maszyce Skrzyzowanie
9091	\N	Smardzowice
9092	788	Zdrowa
9093	530	Elektrocieplownia Kraków
9094	242	M1 Al. Pokoju
9095	\N	Lema
9096	\N	Lema
9097	\N	Kraków Plaza
9098	242	M1 Al. Pokoju
9099	\N	Kraków Plaza
9100	449	Rondo Czyzynskie
9101	\N	Nowohucka
9102	\N	Nowohucka
9103	624	Centralna
9104	624	Centralna
9105	771	Cystersów
9106	771	Cystersów
9107	158	Bialucha
9108	158	Bialucha
9109	\N	Wieczysta
9110	\N	Wieczysta
9111	526	AWF
9112	526	AWF
9113	131	Stella-Sawickiego
9114	131	Stella-Sawickiego
9115	621	Czyzyny
9116	621	Czyzyny
9117	449	Rondo Czyzynskie
9118	131	Stella-Sawickiego
9119	418	Komorowskiego
9120	418	Komorowskiego
9121	74	Uniwersytet Jagiellonski
9122	505	Cracovia
9123	86	Powstanców Wielkopolskich
9124	619	Cmentarz Podgórski
9125	619	Cmentarz Podgórski
9126	316	Dworcowa
9127	751	Kabel
9128	316	Dworcowa
9129	\N	Meksyk
9130	\N	Meksyk
9131	\N	Koksochemia
9132	\N	Koksochemia
9133	\N	Jezynowa
9134	\N	Jezynowa
9135	\N	Pradnicka
9136	\N	Pradnicka
9137	726	Bratyslawska
9138	\N	Powstanców Garaze
9139	\N	Powstanców Garaze
9140	372	Póllanki
9141	\N	Dojazdów Dzialki
9142	442	Piaski Nowe
9143	511	Kraków Business Park
9144	511	Kraków Business Park
9145	573	Dworzec Glówny
9146	226	Aleja Przyjazni
9147	226	Aleja Przyjazni
9148	576	Dworzec Glówny Zachód
9149	553	Politechnika
9150	553	Politechnika
9151	273	Majora
9152	\N	Wegrzce Wielkie
9153	811	Uniwersytet Rolniczy
9154	\N	Mydlniki Granica Miasta
9155	\N	Krakówka
9156	\N	Os.Marszowiec
9157	461	Krowodrza Górka
9158	\N	Kokotów I
9159	\N	Czarnochowice I
9160	\N	Czarnochowice I
9161	\N	Kokotów I
9162	\N	Wegrzce Wielkie III
9163	\N	Kokotów II
9164	\N	Wegrzce Wielkie II
9165	\N	Wegrzce Wielkie II
9166	612	Pszona
9167	612	Pszona
9168	\N	Biezanów Granica Miasta
9169	274	Brodowicza
9170	639	Wieliczka Kopalnia Soli
9171	639	Wieliczka Kopalnia Soli
9172	21	Wieliczka Rynek
9173	613	Dabie
9174	613	Dabie
9175	169	Ofiar Dabia
9176	169	Ofiar Dabia
9177	545	Fabryczna
9178	545	Fabryczna
9179	503	Francesco Nullo
9180	503	Francesco Nullo
9181	\N	Kordylewskiego
9182	\N	Kordylewskiego
9183	444	Rondo Grzegórzeckie
9184	444	Rondo Grzegórzeckie
9185	444	Rondo Grzegórzeckie
9186	444	Rondo Grzegórzeckie
9187	566	Jarzebiny
9188	566	Jarzebiny
9189	\N	Pod Fortem
9190	252	Fort Mogila
9191	252	Fort Mogila
9192	56	Piasta Kolodzieja
9193	56	Piasta Kolodzieja
9194	728	Kleeberga
9195	728	Kleeberga
9196	505	Cracovia
9197	\N	Os.Kolorowe
9198	\N	Os.Kolorowe
9199	\N	Bardosa
9200	\N	Bardosa
9201	588	Suche Stawy
9202	588	Suche Stawy
9203	164	Klasztorna
9204	164	Klasztorna
9205	\N	Os.Na Skarpie
9206	\N	Os.Na Skarpie
9207	\N	Plac Centralny
9208	\N	Plac Centralny
9209	96	Grabówki
9210	\N	Podkamycze
9211	7	Bronowice
9212	7	Bronowice
9213	664	Wesele
9214	664	Wesele
9215	\N	Balicka Wiadukt
9216	\N	Balicka Wiadukt
9217	316	Dworcowa
9218	587	Prokocim
9219	587	Prokocim
9220	12	Prokocim Szpital
9221	12	Prokocim Szpital
9222	711	Teligi
9223	711	Teligi
9224	374	Nowy Prokocim
9225	374	Nowy Prokocim
9226	753	Cwiklinskiej
9227	753	Cwiklinskiej
9228	433	Struga
9229	433	Struga
9230	\N	Plac Centralny
9231	812	Kombinat
9232	812	Kombinat
9233	812	Kombinat
9234	650	Rondo Piastowskie
9235	650	Rondo Piastowskie
9236	301	Os.Zlotego Wieku
9237	301	Os.Zlotego Wieku
9238	362	Misnienska
9239	362	Misnienska
9240	704	Hala Targowa
9241	704	Hala Targowa
9242	63	Salwator
9243	63	Salwator
9244	418	Komorowskiego
9245	418	Komorowskiego
9247	708	Jubilat
9248	759	Bienczycka
9249	759	Bienczycka
9250	431	Elektromontaz
9251	431	Elektromontaz
9252	227	Zajezdnia Nowa Huta
9253	227	Zajezdnia Nowa Huta
9254	\N	Krzecin Cmentarz
9255	\N	Krzecin Cmentarz
9256	\N	Krzecin Kosciól
9257	\N	Krzecin Kapliczka
9258	\N	Krzecin
9259	\N	Krzecin Kapliczka
9260	\N	Krzecin Kosciól
9261	599	Rondo Kocmyrzowskie
9262	599	Rondo Kocmyrzowskie
9263	\N	Os.Zgody
9264	\N	Os.Zgody
9265	\N	Plac Centralny
9266	\N	Plac Centralny
9267	\N	Plac Centralny
9268	24	Kobierzynska
9269	24	Kobierzynska
9270	147	Slomiana
9271	147	Slomiana
9272	598	Kapelanka
9273	598	Kapelanka
9274	754	Szwedzka
9275	754	Szwedzka
9276	\N	Most Grunwaldzki
9277	\N	Most Grunwaldzki
9278	601	Orzeszkowej
9279	601	Orzeszkowej
9280	307	Stradom
9281	359	Starowislna
9282	359	Starowislna
9283	307	Stradom
9284	359	Starowislna
9285	359	Starowislna
9286	519	Nowy Kleparz
9287	519	Nowy Kleparz
9288	45	Pedzichów
9289	45	Pedzichów
9290	\N	Basztowa LOT
9291	205	Zelczyna Szkola
9292	205	Zelczyna Szkola
9293	276	Ochodza
9294	736	Korona
9295	83	Plac Wolnica
9296	83	Plac Wolnica
9297	307	Stradom
9298	763	Limanowskiego
9299	763	Limanowskiego
9300	736	Korona
9301	86	Powstanców Wielkopolskich
9302	49	Plac Bohaterów Getta
9303	49	Plac Bohaterów Getta
9304	554	Sw. Wawrzynca
9305	554	Sw. Wawrzynca
9306	777	Miodowa
9307	777	Miodowa
9308	620	Wankowicza
9309	620	Wankowicza
9310	\N	Kocmyrzowska
9311	\N	Kocmyrzowska
9312	793	Teatr Ludowy
9313	299	Kurdwanów
9314	99	Witosa
9315	99	Witosa
9316	543	Nowosadecka
9317	543	Nowosadecka
9318	442	Piaski Nowe
9319	442	Piaski Nowe
9320	87	Dauna
9321	87	Dauna
9322	258	Biezanowska
9323	258	Biezanowska
9324	751	Kabel
9325	258	Biezanowska
9326	258	Biezanowska
9327	145	Wlotowa
9328	145	Wlotowa
9329	547	Solvay
9330	547	Solvay
9331	781	Borek Falecki I
9332	781	Borek Falecki I
9333	16	Sanktuarium Bozego Milosierdzia
9334	16	Sanktuarium Bozego Milosierdzia
9335	736	Korona
9336	262	Smolki
9337	262	Smolki
9338	386	Rondo Matecznego
9339	386	Rondo Matecznego
9340	697	Rzemieslnicza
9341	599	Rondo Kocmyrzowskie
9342	67	DH Wanda
9343	67	DH Wanda
9344	270	Rondo Hipokratesa
9345	270	Rondo Hipokratesa
9346	46	Dunikowskiego
9347	46	Dunikowskiego
9348	220	Rondo Mogilskie
9349	293	Giebultów
9350	293	Giebultów
9351	553	Politechnika
9352	553	Politechnika
9353	403	Dworzec Glówny Tunel
9354	403	Dworzec Glówny Tunel
9355	629	Maszyce Remiza
9356	629	Maszyce Remiza
9357	\N	Smardzowice IV
9358	\N	Smardzowice IV
9359	\N	Giebultów Plac Zabaw
9360	\N	Giebultów Plac Zabaw
9361	549	Giebultów Morgi
9362	47	Bedkowice
9363	47	Bedkowice
9364	8	Rzozów Skotnica
9365	8	Rzozów Skotnica
9366	533	Rzozów Zagonnie
9367	628	Rzozów PKP
9368	675	Radziszów Kladka
9369	\N	Radziszów Zacisze
9370	349	Radziszów PKP
9371	\N	Radziszów Podwale
9372	\N	Radziszów Podwale
9373	\N	Radziszów Zawodzie
9374	\N	Radziszów Zawodzie
9375	470	Rondo Barei
9376	\N	Nielepice
9377	\N	Brzoskwinia
9378	\N	Brzezie Narodowe
9379	\N	Krzysztoforzyce
9380	343	Piekary Palac
9381	343	Piekary Palac
9382	223	Wielicka Granica Miasta
9383	223	Wielicka Granica Miasta
9384	\N	Krzyszkowice Kosciól
9385	\N	Krzyszkowice Kosciól
9386	\N	Krzyszkowice Kasztanowa I
9387	\N	Krzyszkowice Kasztanowa I
9388	\N	Krzyszkowice Kasztanowa II
9389	\N	Krzyszkowice Kasztanowa II
9390	\N	Krzyszkowice Modrzewiowa
9391	\N	Krzyszkowice Modrzewiowa
9392	\N	Krzyszkowice Rózana
9393	\N	Lusina Lany
9394	\N	Brama nr 5
9395	252	Fort Mogila
9396	252	Fort Mogila
9397	816	Przeginia Duchowna Szkola
9398	816	Przeginia Duchowna Szkola
9399	285	Przeginia Duchowna Centrum
9400	285	Przeginia Duchowna Centrum
9401	272	Przeginia Narodowa II
9402	272	Przeginia Narodowa II
9403	122	Czernichów II
9404	122	Czernichów II
9405	488	Nowa Wies Jesionka
9406	488	Nowa Wies Jesionka
9407	206	Raczna Kapliczka
9408	206	Raczna Kapliczka
9409	\N	Dabrowa Szlachecka
9410	\N	Dabrowa Szlachecka
9411	\N	Czernichów Stacja Paliw
9412	\N	Czernichów Stacja Paliw
9413	26	Czernichów GS
9414	26	Czernichów GS
9415	\N	Wolowice Sklep
9416	\N	Wolowice Sklep
9417	\N	Wolowice III
9418	\N	Wolowice III
9419	\N	Wolowice Niwa
9420	\N	Wolowice Niwa
9421	\N	Rybna Nowy Swiat
9422	\N	Rybna
9423	\N	Rybna
9424	\N	Rybna II
9425	\N	Rybna II
9426	\N	Rybna I
9427	\N	Rybna I
9428	\N	Rybna Dól
9429	\N	Rybna Dól
9430	\N	Przeginia Duchowna
9431	\N	Czulówek
9432	\N	Czulówek
9433	\N	Raczna Podlas
9434	\N	Raczna Podlas
9435	\N	Raczna Dzikowiec
9436	\N	Raczna Dzikowiec
9437	397	Czernichów
9438	733	Ratanice
9439	733	Ratanice
9440	127	Ratanice I
9441	127	Ratanice I
9442	263	Klokoczyn
9443	263	Klokoczyn
9444	\N	Kamien
9445	\N	Kamien Dól
9446	\N	Kamien Dól
9447	\N	Rusocice II
9448	\N	Rusocice II
9449	\N	Rusocice I
9450	\N	Rusocice I
9451	\N	Rusocice Leg
9452	\N	Rusocice Leg
9453	517	Czernichów Bór
9454	517	Czernichów Bór
9455	217	Przeginia Narodowa
9456	217	Przeginia Narodowa
9457	69	Przeginia Duchowna Bar
9458	69	Przeginia Duchowna Bar
9459	241	Nowa Wies Szlachecka
9460	\N	Rusocice Sklad
9461	\N	Rusocice Sklad
9462	\N	Grotowa
9463	\N	Jeziorzany
9464	397	Czernichów
9465	22	Rusocice Wies
9466	22	Rusocice Wies
9467	\N	Luczyce Zjawienie
9468	458	Dworzec Towarowy
9469	\N	Lusina Lany
9470	\N	Skawina Tyniecka
9471	533	Rzozów Zagonnie
9472	628	Rzozów PKP
9473	\N	Kokotów II
9474	473	Kaszów II
9475	\N	Raczna Podlas
9476	\N	Raczna Osiedle
9477	\N	Mlynka
9478	293	Giebultów
9479	\N	Rybna Osrodek Zdrowia
9480	\N	Rybna Osrodek Zdrowia
9481	\N	Przeginia Duchowna
9482	205	Zelczyna Szkola
9483	459	Wielkie Drogi Osrodek Zdrowia
9484	459	Wielkie Drogi Osrodek Zdrowia
9485	572	Wielkie Drogi Szkola
9486	572	Wielkie Drogi Szkola
9487	205	Zelczyna Szkola
9488	317	Lobzów PKP
9489	\N	Wrzasowice Kowaleca
9490	\N	Nowy Biezanów Poludnie
9491	\N	Wrzasowice Górka
9492	\N	Wrzasowice Kowaleca
9493	710	Przegorzaly
9494	710	Przegorzaly
9495	710	Przegorzaly
9496	630	Na Krepaku
9497	\N	Zaskale
9498	\N	Nielepice Stadnina
9499	\N	Nielepice Stadnina
9500	\N	Pisary Dwór
9501	\N	Pisary Dwór
9502	477	Muzeum Inzynierii Miejskiej
9503	469	Forteczna
9504	\N	Zawiszy
9505	\N	Most Kotlarski
9506	377	Chelm
9507	24	Kobierzynska
9508	266	Borsucza
9509	266	Borsucza
9510	\N	Brozka
9511	\N	Brozka
9512	610	Teatr Bagatela
9513	64	Batorego
9514	64	Batorego
9515	234	Plac Inwalidów
9516	234	Plac Inwalidów
9517	141	Urzednicza
9518	141	Urzednicza
9519	430	Biprostal
9520	430	Biprostal
9521	94	Uniwersytet Pedagogiczny
9522	94	Uniwersytet Pedagogiczny
9523	586	Glowackiego
9524	586	Glowackiego
9525	129	Kopiec Wandy
9526	677	Skawina PKP
9527	\N	Brama nr 5
9528	\N	Sciejowice Na Bagnach
9529	\N	Sciejowice Na Bagnach
9530	\N	Grotowa I
9531	\N	Grotowa I
9532	\N	Krzysztoforzyce Góra
9533	\N	Krzysztoforzyce Góra
9534	\N	Krzysztoforzyce Sklep 
9535	\N	Krzysztoforzyce Sklep 
9536	\N	Krzysztoforzyce Góra
9537	\N	Kraków Airport T1
9538	\N	Kraków Airport T2
9539	74	Uniwersytet Jagiellonski
9540	722	Puszkarska
9541	722	Puszkarska
9542	305	Zajezdnia Wola Duchacka
9543	305	Zajezdnia Wola Duchacka
9544	644	Bonarka
9545	\N	Krzysztoforzyce przy Dworze
9546	\N	Krzysztoforzyce przy Dworze
9547	644	Bonarka
9548	736	Korona
9549	386	Rondo Matecznego
9550	812	Kombinat
9551	227	Zajezdnia Nowa Huta
9552	812	Kombinat
9553	436	Filharmonia
9554	610	Teatr Bagatela
9555	610	Teatr Bagatela
9556	\N	Basztowa LOT
9557	\N	Basztowa LOT
9558	573	Dworzec Glówny
9559	573	Dworzec Glówny
9560	310	Poczta Glówna
9561	310	Poczta Glówna
9562	494	Lubicz
9563	494	Lubicz
9564	573	Dworzec Glówny
9565	307	Stradom
9566	427	Maly Plaszów
9567	427	Maly Plaszów
9568	552	Albatrosów
9569	552	Albatrosów
9570	594	Klimeckiego
9571	594	Klimeckiego
9572	179	Zablocie
9573	179	Zablocie
9574	498	Kuklinskiego
9575	498	Kuklinskiego
9576	214	Gromadzka
9577	214	Gromadzka
9579	144	Lipska
9580	31	Rzebika
9581	31	Rzebika
9582	599	Rondo Kocmyrzowskie
9583	\N	Wiktorowice Granica
9584	\N	Wiktorowice Granica
9585	\N	Zastów Dzialki
9586	\N	Zastów Dzialki
9587	\N	Wiktorowice Skrzyzowanie
9588	\N	Wiktorowice Skrzyzowanie
9589	\N	Wiktorowice Centrum
9590	\N	Wiktorowice Centrum
9591	\N	Zastów
9592	\N	Maciejowice
9593	\N	Wiktorowice Rozdzielnia Wód
9594	\N	Wiktorowice Rozdzielnia Wód
9595	\N	Maciejowice Góra
9596	\N	Maciejowice Góra
9597	349	Radziszów PKP
9598	\N	Owczary
9599	\N	Owczary
9600	595	Azory
9601	706	Czerwienskiego
9602	212	Fiszera
9603	582	Radzikowskiego Osiedle
9604	\N	Batalionu "Skala" AK
9605	\N	Niepolomice Moczydlo
9606	\N	Niepolomice Moczydlo
9607	\N	Niepolomice Kolejowa
9608	\N	Niepolomice Kolejowa
9609	\N	Niepolomice Dworzec
9610	\N	Niepolomice Batorego
9611	\N	Niepolomice Batorego
9612	\N	Niepolomice Batorego II
9613	\N	Niepolomice Batorego II
9614	\N	Wola Bat. Ruskie
9615	\N	Wola Bat. Ruskie
9616	\N	Chobot Lesniczówka
9617	\N	Niepolomice Jazy
9618	\N	Niepolomice Jazy
9619	\N	Niepolomice Jazy II
9620	\N	Niepolomice Jazy II
9621	\N	Wola Batorska  Zwirownia
9622	\N	Wola Batorska  Zwirownia
9623	\N	Wola Batorska  Kosciól
9624	\N	Wola Batorska  Kosciól
9625	\N	Wola Batorska  Cmentarz
9626	\N	Wola Batorska  Cmentarz
9627	\N	Wola Batorska  Borek
9628	\N	Wola Batorska  Borek
9629	\N	Wola Batorska Mikoniowiec
9630	\N	Wola Batorska Mikoniowiec
9631	\N	Wola Batorska Zamoglice
9632	\N	Wola Batorska Zamoglice
9633	\N	Zabierzów Bochenski Centrum
9634	\N	Zabierzów Bochenski Centrum
9635	\N	Chobot
9636	\N	Chobot
9637	389	Grabie Szczurów
9638	715	Grabie Dom Kultury
9639	539	Brzegi III
9640	\N	Staniatki Wiadukt
9641	539	Brzegi III
9642	389	Grabie Szczurów
9643	715	Grabie Dom Kultury
9644	137	Grabie Kosciól
9645	137	Grabie Kosciól
9646	393	Niepolomice Podgrabie
9647	393	Niepolomice Podgrabie
9648	\N	Niepolomice Pasternik
9649	\N	Niepolomice Pasternik
9650	\N	Niepolomice Katek
9651	\N	Niepolomice Katek
9652	\N	Niepolomice Poreby
9653	\N	Niepolomice Poreby
9654	\N	Niepolomice Diesla
9655	\N	Niepolomice Diesla
9656	\N	Niepolomice Wodna
9657	\N	Niepolomice Wodna
9658	\N	Niepolomice Plaszowska I
9659	\N	Niepolomice Plaszowska I
9660	\N	Niepolomice Kosciuszki
9661	\N	Niepolomice Kosciuszki
9662	\N	Ochmanów Otaczarnia
9663	\N	Ochmanów Oknoplast
9664	\N	Zakrzów
9665	\N	Zakrzów
9666	\N	Podleze Balachówka
9667	\N	Podleze Balachówka
9668	\N	Podleze Przedszkole
9669	\N	Podleze Straz
9670	\N	Podleze Centrum
9671	\N	Podleze Centrum
9672	\N	Staniatki Wiadukt
9673	\N	Niepolomice Wielicka
9674	\N	Niepolomice Wielicka
9675	\N	Niepolomice Boryczów
9676	\N	Niepolomice Boryczów
9677	214	Gromadzka
9678	214	Gromadzka
9679	\N	Rondo Grunwaldzkie
9680	\N	Skala Kmity
9681	31	Rzebika
9682	52	Garbarnia
9683	52	Garbarnia
9684	52	Garbarnia
9685	\N	Slomniki Osiedle
9686	\N	Slomniki Rynek
9687	\N	Slomniki Rynek
9688	\N	Slomniki Zagloby
9689	\N	Slomniki Zagloby
9690	\N	Polanowice
9691	\N	Polanowice
9692	\N	Marszowice Góry
9693	\N	Marszowice Góry
9694	\N	Wysiolek Luborzycki Radwany
9695	\N	Wysiolek Luborzycki Radwany
9696	\N	Wysiolek Luborzycki I
9697	\N	Wysiolek Luborzycki I
9698	\N	Marszowice
9699	\N	Marszowice
9700	\N	Polanowice Kolonia
9701	\N	Polanowice Kolonia
9702	\N	Marszowice I
9703	\N	Marszowice I
9704	\N	Ratajów Skrzyzowanie
9705	\N	Ratajów Skrzyzowanie
9706	\N	Niedzwiedz PKP
9707	\N	Niedzwiedz PKP
9708	\N	Niedzwiedz Felix
9709	\N	Niedzwiedz Felix
9710	\N	Wysiolek Luborzycki
9711	\N	Wysiolek Luborzycki
9712	449	Rondo Czyzynskie
9713	599	Rondo Kocmyrzowskie
9714	405	Agatowa
9715	405	Agatowa
9716	\N	Ochodza Dom Ludowy
9717	\N	Ochodza Dom Ludowy
9718	\N	Ochodza Odwisle
9719	\N	Ochodza Staw
9720	\N	Ochodza Staw
9721	276	Ochodza
9722	171	Borek Falecki
9723	171	Borek Falecki
9724	238	Grota-Roweckiego
9725	\N	Wola Luborzycka Dzialki
9726	\N	Wola Luborzycka Dzialki
9727	\N	Mników Panska Góra
9728	\N	Mników Panska Góra
9729	\N	Mników Skaly
9730	\N	Mników Skaly
9731	\N	Czulów Skaly
9732	\N	Czulów Skaly
9733	436	Filharmonia
9734	435	Wola Radziszowska Podgazle
9735	435	Wola Radziszowska Podgazle
9736	541	Wola Radziszowska Leg
9737	541	Wola Radziszowska Leg
9738	\N	Czulówek Kapliczka
9739	\N	Czulówek
9740	\N	Rybna Nowy Swiat
9741	\N	Rybna Nowy Swiat
9742	\N	Czulów
9743	\N	Rybna Zagórze
9744	\N	Rybna Dolna
9745	\N	Rybna Granica
9746	\N	Rybna Granica
9747	\N	Raczna II
9748	\N	Raczna II
9749	\N	Czulów Kapliczka
9750	\N	Czulów Kapliczka
9751	\N	Raczna Kosciól
9752	\N	Raczna Kosciól
9753	528	Bunscha
9754	528	Bunscha
9755	\N	Konary Sek
9756	\N	Konary Sek
9757	17	Zajezdnia Plaszów
9758	\N	Podgrabie Most
9759	86	Powstanców Wielkopolskich
9760	86	Powstanców Wielkopolskich
9761	\N	Niepolomice Fabryczna
9762	\N	Niepolomice Fabryczna
9763	\N	Niepolomice Wodna
9764	\N	Niepolomice Wodna
9765	271	Lagiewniki
9766	271	Lagiewniki
9767	697	Rzemieslnicza
9768	271	Lagiewniki
9769	271	Lagiewniki
9770	271	Lagiewniki
9771	461	Krowodrza Górka
9772	\N	Dabrowa Szlachecka Krzemiennik
9773	\N	Dabrowa Szlachecka Krzemiennik
9774	445	Skawina Korabniki
9775	370	Libertów
9776	370	Libertów
9777	\N	Morawica
9778	\N	Morawica Krzyzówka
9779	\N	Morawica Krzyzówka
9780	\N	Giebultów Zbiornik
9781	\N	Giebultów Zbiornik
9782	\N	Modlniczka Poligon
9783	\N	Modlniczka Poligon
9784	\N	Skrzyzowanie do Podchruscia
9785	\N	Czulówek Kapliczka
9786	\N	Czulówek Kapliczka
9787	\N	Krzecin Czesna
9788	\N	Krzecin Czesna
9789	\N	Wola Zabierzowska
9790	\N	Wola Zabierzowska
9791	121	Lipinskiego
9792	121	Lipinskiego
9793	238	Grota-Roweckiego
9794	238	Grota-Roweckiego
9795	491	Norymberska
9796	491	Norymberska
9797	355	Ruczaj
9798	355	Ruczaj
9799	347	Kampus UJ
9800	347	Kampus UJ
9801	682	Chmieleniec
9802	682	Chmieleniec
9803	\N	Czerwone Maki
9804	\N	Trojadyn Skrzyzowanie
9805	84	Wodociagi
9806	547	Solvay
9807	167	Darwina
9808	\N	Cmentarz Grebalów I
9809	273	Majora
9810	591	Bronowice Male
9811	591	Bronowice Male
9812	755	Opatkowice
9813	540	Centrum JP II
9814	540	Centrum JP II
9815	703	Skawina Cmentarz
9816	\N	Kopanka
9817	\N	Kopanka II
9818	\N	Kopanka II
9819	760	Kopanka Kapliczka
9820	760	Kopanka Kapliczka
9821	211	Kopanka Szkola
9822	211	Kopanka Szkola
9823	735	Skawina Robotnicza
9824	735	Skawina Robotnicza
9825	\N	Jurczyce Szkola
9826	\N	Jurczyce Podole
9827	749	Skawina Energetyków
9828	749	Skawina Energetyków
9829	\N	Krzecin Szkola
9830	66	Skawina Nad Potokiem
9831	66	Skawina Nad Potokiem
9832	\N	Radziszów Za Mogilka
9833	467	Goluchowice Jurczyce
9834	452	Skawina Cmentarz Komunalny
9835	675	Radziszów Kladka
9836	218	Jurczyce Dom Ludowy
9837	218	Jurczyce Dom Ludowy
9838	\N	Jurczyce Podole
9839	\N	Jurczyce Szkola
9840	\N	Radziszów Za Mogilka
9841	\N	Radziszów Zacisze
9842	\N	Zabawa
9843	\N	Zabawa
9844	\N	Mala Wies
9845	\N	Mala Wies
9846	\N	Mogilany Rynek
9847	\N	Mogilany Rynek
9848	\N	Sulków
9849	\N	Sulków
9850	\N	Mogilany Cicha
9851	\N	Mogilany Wiadukt
9852	\N	Mogilany Wiadukt
9853	703	Skawina Cmentarz
9854	\N	Mogilany Cicha
9855	\N	Czerwone Maki
9856	425	Skawina Rynek
9857	\N	Biezanów Pomnik
9858	\N	Biezanów Pomnik
9859	570	Wieliczka Park
9860	570	Wieliczka Park
9861	\N	Murownia
9862	\N	Michalowice Osrodek Zdrowia
9863	\N	Michalowice Osrodek Zdrowia
9864	\N	Michalowice II
9865	\N	Michalowice Kwiaty Polne
9866	\N	Michalowice Kwiaty Polne
9867	\N	Zabawa I
9868	\N	Wieliczka Niepolomska
9869	\N	Jeziorzany I
9870	\N	Jeziorzany I
9871	784	Piekary III
9872	784	Piekary III
9873	\N	Michalowice Las Michalowski
9874	\N	Sliwiaka Zaklady
9875	\N	Sliwiaka Zaklady
9876	\N	Budzyn
9877	811	Uniwersytet Rolniczy
9878	310	Poczta Glówna
9879	394	Wawel
9880	394	Wawel
9881	557	Tomaszowice
9882	\N	Kraków Airport T2
9883	762	Barbary
9884	110	Nowy Biezanów
9885	445	Skawina Korabniki
9886	\N	Górna Wies
9887	77	Cichy Kacik
9888	762	Barbary
9889	\N	Balice Grzybów
9890	\N	Kobylany Remiza
9891	53	Wielicka
9892	53	Wielicka
9893	\N	Mala Góra
9894	\N	Biezanów Cmentarz
9895	433	Struga
9896	\N	Mala Góra
9897	\N	Czerwone Maki
9898	\N	Czerwone Maki
9899	262	Smolki
9900	262	Smolki
9901	265	Zajezdnia Bienczyce
9902	687	Skarzynskiego
9903	173	Skotniki Szkola
9904	491	Norymberska
9905	615	Rostworowskiego
9906	\N	Pod Fortem
9907	596	Kliny Zacisze
9908	596	Kliny Zacisze
9909	\N	Mochnaniec
9910	\N	Mochnaniec
9911	731	Zlocien
9912	171	Borek Falecki
9913	110	Nowy Biezanów
9914	110	Nowy Biezanów
9915	7	Bronowice
9916	234	Plac Inwalidów
9917	530	Elektrocieplownia Kraków
9918	60	Makuszynskiego
9919	624	Centralna
9920	308	Soltysowska Osiedle
9921	\N	Os.Zgody
9922	793	Teatr Ludowy
9923	\N	Os.Zielone
9924	187	Wiadukty
9925	19	Zeslawice
9926	60	Makuszynskiego
9927	\N	Os.Zgody
9928	793	Teatr Ludowy
9929	308	Soltysowska Osiedle
9930	431	Elektromontaz
9931	642	Lubocza PKP
9932	409	Lubocza Bugaj
9933	724	Lubocza Przychodnia
9934	431	Elektromontaz
9935	431	Elektromontaz
9936	431	Elektromontaz
9937	642	Lubocza PKP
9938	409	Lubocza Bugaj
9939	724	Lubocza Przychodnia
9940	\N	Luczanowice
9941	\N	Wadów
9942	\N	Wadów
9943	\N	Wegrzynowice Dól
9944	\N	Wadów Dzialki
9945	\N	Wadów Tunel
9946	\N	Wadów Dzialki
9947	\N	Wegrzynowice Dól
9948	\N	Zaklad Przeróbki
9949	\N	Zaklad Przeróbki
9950	\N	Leg
9951	617	Na Zaleczu
9952	\N	Os.Jagiellonskie
9953	\N	Os.Jagiellonskie
9954	651	Arka
9955	651	Arka
9956	\N	Barwna
9957	\N	Barwna
9958	\N	Wegrzynowicka
9959	\N	Wegrzynowicka
9960	\N	Wadów Glinik
9961	\N	Wadów Glinik
9962	\N	Wadów Os. Kolejowe
9963	\N	Wadów Os. Kolejowe
9964	\N	Wadów Szkola
9965	\N	Wadów Szkola
9966	\N	Bystronia
9967	\N	Bystronia
9968	\N	Wadowska
9969	\N	Wadowska
9970	\N	Lubocza Trafo
9971	\N	Lubocza Trafo
9972	745	Lubocza Szkola
9973	745	Lubocza Szkola
9974	795	Na Zaleczu Szkola
9975	795	Na Zaleczu Szkola
9976	102	Soltysowska Zaklady
9977	102	Soltysowska Zaklady
9978	551	Soltysowska
9979	551	Soltysowska
9980	42	Chabrowa
9981	42	Chabrowa
9982	\N	Zeslawice Ogródki Dzialkowe
9983	\N	Zeslawice Ogródki Dzialkowe
9984	618	Gustawa Morcinka
9985	412	EC Leg
9986	383	Isep
9987	383	Isep
9988	\N	Zatyka
9989	\N	Zatyka
9990	617	Na Zaleczu
9991	327	Wiklinowa
9992	327	Wiklinowa
9993	\N	Szafranska
9994	\N	Szafranska
9995	\N	Glogera
9996	131	Stella-Sawickiego
9997	693	Tor Kajakowy
9998	693	Tor Kajakowy
9999	\N	Trojadyn Szydlo
10000	586	Glowackiego
10001	586	Glowackiego
10002	\N	Stacja tankowania gazu
10003	412	EC Leg
10004	412	EC Leg
10005	774	Tonie Gliniki
10006	289	Sikorki
10007	289	Sikorki
10008	\N	Odmetowa
10009	\N	Odmetowa
10010	\N	Habina
10011	\N	Habina
10012	\N	Krzysztoforzyce Góra
10013	\N	Luczanowice
10014	\N	Balice PKP
10015	793	Teatr Ludowy
10016	793	Teatr Ludowy
10017	\N	Mobilis
10018	\N	Os.Dywizjonu 303
10019	\N	Wieczysta
10020	270	Rondo Hipokratesa
10021	\N	PH
10022	\N	PH
10023	\N	PH
10024	\N	PH
10025	\N	PT
10026	\N	Os.Dywizjonu 303
10027	\N	Balicka
10028	81	UR Balicka
10029	562	Mydlniki PKP
10030	\N	Zakliki
10031	658	Mydlniki
10032	\N	Mydlniki Stawy
10033	\N	Mydlniki Stawy
10034	658	Mydlniki
10035	658	Mydlniki
10036	562	Mydlniki PKP
10037	324	Katowicka
10038	\N	Pasternik Cmentarz
10039	\N	Ojcowska
10040	\N	Bronowice Wielkie
10041	324	Katowicka
10042	\N	Pasternik Cmentarz
10043	\N	Ojcowska
10044	\N	Bronowice Wielkie
10045	\N	Gaik
10046	\N	Gaik
10047	9	Tonie Skrzyzowanie
10048	\N	Witkowice
10049	\N	Witkowice Nowe
10050	\N	Dozynkowa
10051	71	Siewna Wiadukt
10052	536	Clepardia
10053	536	Clepardia
10054	71	Siewna Wiadukt
10055	71	Siewna Wiadukt
10056	\N	Dozynkowa
10057	\N	Witkowice Nowe
10058	\N	Kaczorówka
10059	\N	Piaszczysta
10060	\N	Kaczorówka
10061	610	Teatr Bagatela
10062	525	Miasteczko Studenckie AGH
10063	525	Miasteczko Studenckie AGH
10064	525	Miasteczko Studenckie AGH
10065	525	Miasteczko Studenckie AGH
10066	604	Kawiory
10067	610	Teatr Bagatela
10068	440	Batowice
10069	158	Bialucha
10070	507	Powstanców
10071	440	Batowice
10072	158	Bialucha
10073	610	Teatr Bagatela
10074	654	Raczkiewicza
10075	654	Raczkiewicza
10076	513	Zakamycze
10077	584	Kosmowskiej
10078	584	Kosmowskiej
10079	448	Olszanica Kapliczka
10080	448	Olszanica Kapliczka
10081	424	Cracovia Blonia
10082	637	Tyniec Kamieniolom
10083	109	Kolna
10084	\N	Kostrze Kapliczka
10085	\N	Dabrowa
10086	117	Kostrze
10087	747	Bagienna
10088	544	Podgórki Tynieckie
10089	747	Bagienna
10090	\N	Dabrowa
10091	\N	Kostrze Kapliczka
10092	109	Kolna
10093	697	Rzemieslnicza
10094	697	Rzemieslnicza
10095	406	Malborska
10096	561	Makowa
10097	\N	Os.Na Kozlówce
10098	87	Dauna
10099	713	Prosta
10100	\N	Prokocim  Rynek
10101	\N	Mlodziezy
10102	\N	Mlodziezy
10103	\N	Prokocim  Rynek
10104	713	Prosta
10105	258	Biezanowska
10106	258	Biezanowska
10107	87	Dauna
10108	561	Makowa
10109	406	Malborska
10110	\N	Fort Swoszowice
10111	\N	Cechowa
10112	663	Kurdwanów Szkola
10113	\N	Luzycka
10114	\N	Bochenka
10115	313	Tuchowska
10116	456	Karpinskiego
10117	\N	Bochenka
10118	\N	Luzycka
10119	\N	Cechowa
10120	663	Kurdwanów Szkola
10121	\N	Fort Swoszowice
10122	785	Wróblowice Rozwidlenie
10123	\N	Chalubinskiego
10124	\N	Wróblowice Szkola
10125	\N	Pytlasinskiego
10126	673	Swoszowice
10127	361	Swoszowice Poczta
10128	98	Swoszowice Pawilon
10129	577	Swoszowice Sklep
10130	\N	Swoszowice Uzdrowisko
10131	202	Wilga
10132	\N	Swoszowice Osiedle
10133	441	Swoszowice Autostrada
10134	299	Kurdwanów
10135	247	Kapielowa
10136	247	Kapielowa
10137	299	Kurdwanów
10138	299	Kurdwanów
10139	352	Halszki
10140	441	Swoszowice Autostrada
10141	\N	Swoszowice Osiedle
10142	202	Wilga
10143	482	Zdrojowa
10144	577	Swoszowice Sklep
10145	361	Swoszowice Poczta
10146	98	Swoszowice Pawilon
10147	673	Swoszowice
10148	673	Swoszowice
10149	\N	Pytlasinskiego
10150	\N	Wróblowice Szkola
10151	\N	Chalubinskiego
10152	785	Wróblowice Rozwidlenie
10153	325	Wrony
10154	738	Warchalowskiego
10155	384	Sidzina
10156	738	Warchalowskiego
10157	216	Podgaje
10158	216	Podgaje
10159	399	Taklinskiego
10160	399	Taklinskiego
10161	329	Sidzina Olszyny
10162	329	Sidzina Olszyny
10163	\N	Na Budzyniu
10164	54	Siewna
10165	54	Siewna
10166	236	Conrada
10167	236	Conrada
10168	196	Zachodnia
10169	196	Zachodnia
10170	406	Malborska
10171	649	Jugowicka
10172	649	Jugowicka
10173	\N	Park "Skaly Twardowskiego"
10174	\N	Park "Skaly Twardowskiego"
10175	522	Pychowice
10176	522	Pychowice
10177	254	Rodzinna
10178	254	Rodzinna
10179	\N	Górka Pychowicka
10180	\N	Górka Pychowicka
10181	244	Fort Bodzów
10182	244	Fort Bodzów
10183	113	Kostrze Szkola
10184	113	Kostrze Szkola
10185	814	Kostrze OSP
10186	814	Kostrze OSP
10187	\N	Waly Wislane
10188	\N	Waly Wislane
10189	773	Boleslawa Smialego
10190	773	Boleslawa Smialego
10191	678	Tyniec
10192	678	Tyniec
10193	481	Bogucianka
10194	481	Bogucianka
10195	604	Kawiory
10196	604	Kawiory
10197	\N	Górnickiego
10198	\N	Górnickiego
10199	\N	Jasnogórska
10200	638	Poroninska
10201	638	Poroninska
10202	764	Zyzna
10203	764	Zyzna
10204	228	Petrazyckiego
10205	228	Petrazyckiego
10206	771	Cystersów
10207	771	Cystersów
10208	\N	Ojcowska Wagroda
10209	\N	Ojcowska Wagroda
10210	\N	Ojcowska Dworek
10211	\N	Ojcowska Dworek
10212	450	Gospodarska
10213	450	Gospodarska
10214	\N	Biezanów Trafo
10215	\N	Biezanów Trafo
10216	148	Prokocim Cmentarz
10217	148	Prokocim Cmentarz
10218	501	Tretówka
10219	501	Tretówka
10220	\N	Rajsko
10221	\N	Rajsko
10222	768	Landaua
10223	768	Landaua
10224	6	Tonie
10225	6	Tonie
10226	\N	Opatkowice Zadworze
10227	\N	Opatkowice Zadworze
10228	\N	Balice III
10229	395	Olszanica Bory
10230	\N	Balice III
10231	\N	Rzepichy
10232	\N	Rzepichy
10233	\N	Chelmska
10234	\N	Chelmska
10235	767	Lesmiana
10236	767	Lesmiana
10237	\N	Olszanica
10238	\N	Olszanica
10239	395	Olszanica Bory
10240	395	Olszanica Bory
10241	\N	Lindego
10242	81	UR Balicka
10243	299	Kurdwanów
10244	258	Biezanowska
10245	258	Biezanowska
10246	347	Kampus UJ
10247	347	Kampus UJ
10248	479	Przykopy
10249	479	Przykopy
10250	479	Przykopy
10251	768	Landaua
10252	768	Landaua
10253	707	Wróblowice Cmentarz
10254	707	Wróblowice Cmentarz
10255	\N	Wróblowice Dom Kultury
10256	\N	Wróblowice Dom Kultury
10257	\N	Jasnogórska
10258	\N	Ojcowska
10259	\N	Ojcowska
10260	\N	Kenara
10261	\N	Kenara
10262	191	Urzad Skarbowy Nowa Huta
10263	191	Urzad Skarbowy Nowa Huta
10264	109	Kolna
10265	109	Kolna
10266	\N	Olszanica
10267	\N	Witkowice
10268	\N	Witkowice
10269	\N	Lindego
10270	\N	TR
10271	713	Prosta
10272	\N	Mydlniki Granica Miasta
10273	395	Olszanica Bory
10274	173	Skotniki Szkola
10275	\N	Prokocim  Rynek
10276	\N	Prokocim  Rynek
10277	\N	Slaskiego
10278	\N	Slaskiego
10279	75	Os.Lokietka
10280	75	Os.Lokietka
10281	767	Lesmiana
10282	\N	Rzepichy
10283	\N	Rzepichy
10284	767	Lesmiana
10285	\N	Wyslouchów
10286	\N	Wyslouchów
10287	\N	Bojki
10288	\N	Bojki
10289	82	Bialopradnicka
10290	82	Bialopradnicka
10291	\N	Niepolomice Dworzec
10292	660	Niepolomice Rynek
10293	660	Niepolomice Rynek
10294	117	Kostrze
10295	601	Orzeszkowej
10296	601	Orzeszkowej
10297	732	Tischnera
10298	325	Wrony
10299	93	Fort Winnica
10300	93	Fort Winnica
10301	199	Winnicka
10302	199	Winnicka
10303	814	Kostrze OSP
10304	359	Starowislna
10305	\N	Cmentarz Batowice Wschód
10306	\N	Cmentarz Batowice Wschód
10307	468	Grabie Polanka
10308	315	Grabie Kuznia
10309	315	Grabie Kuznia
10310	193	Grabie
10311	479	Przykopy
10312	359	Starowislna
10313	355	Ruczaj
10314	355	Ruczaj
10315	228	Petrazyckiego
10316	\N	Piaszczysta
10317	\N	Wadów Osiedle
10318	\N	Wadów Osiedle
10320	482	Zdrojowa
10323	786	Strzelców
10324	786	Strzelców
10325	786	Strzelców
10326	786	Strzelców
10327	\N	Balicka
10328	\N	Mydlniki Granica Miasta
10329	\N	Mydlniki Granica Miasta
10330	103	Pasternik
10331	103	Pasternik
10332	\N	Bronowice Wielkie
10333	9	Tonie Skrzyzowanie
10334	380	AGH
10335	7	Bronowice
10336	380	AGH
10337	611	Kuznicy Kollatajowskiej
10338	\N	Belwederczyków
10339	197	Batowice PKP
10340	611	Kuznicy Kollatajowskiej
10341	\N	Belwederczyków
10342	197	Batowice PKP
10343	\N	Balicka Wiadukt
10344	\N	Balicka Wiadukt
10345	194	Zarzecze
10346	194	Zarzecze
10347	5	Królowej Jadwigi
10348	5	Królowej Jadwigi
10349	\N	Górna Wies
10350	\N	Owczary
10351	375	Bielany
10352	48	Bielany Szkola
10353	\N	Skalna
10354	\N	Skalna
10355	48	Bielany Szkola
10356	\N	Bielanska
10357	\N	Stopien Wodny
10358	\N	Bielanska
10359	\N	Stopien Wodny
10360	63	Salwator
10361	307	Stradom
10362	613	Dabie
10363	304	Grebalów
10364	304	Grebalów
10365	292	Pleszów
10366	292	Pleszów
10367	\N	Wegrzynowice
10368	\N	Wegrzynowice Centrum
10369	\N	Wegrzynowice Centrum
10370	\N	Wrózenicka
10371	\N	Wrózenice Górka
10372	\N	Wrózenice
10373	\N	Hektary
10374	\N	Ostafina
10375	\N	Resztówka
10376	\N	Zablocie Koscielnickie
10377	\N	Koscielniki
10378	\N	Blonia Koscielnickie
10379	\N	Janówka
10380	\N	Wyciaze Zachód
10381	\N	Szymanskiego
10382	\N	Branice Pagórek
10383	\N	Wyciaze Sklep
10384	\N	Wyciaska
10385	\N	Podstawie
10386	\N	Drozyska
10387	\N	Szymanskiego
10388	\N	Szymanskiego
10389	\N	Szymanskiego
10390	\N	Branice Pagórek
10391	\N	Wyciaze
10392	\N	Wyciaze Sklep
10393	\N	Wyciaska
10394	\N	Podstawie
10395	\N	Drozyska
10396	\N	Wyciaze Zachód
10397	\N	Ruszcza Cmentarz
10398	\N	Ruszcza
10399	\N	Ruszcza Cmentarz
10400	\N	Wyciaze Wiadukt
10401	\N	Janówka
10402	\N	Blonia Koscielnickie
10403	\N	Koscielniki
10404	\N	Zablocie Koscielnickie
10405	\N	Resztówka
10406	\N	Ostafina
10407	\N	Hektary
10408	\N	Wrózenicka
10409	\N	Wrózenice Górka
10410	235	Clo
10411	\N	Brzeska
10412	\N	Zakepie
10413	\N	Zakepie
10414	\N	Brzeska
10415	235	Clo
10416	\N	Wyciaze Wiadukt
10417	\N	Chalupki
10418	\N	Chalupki Górne
10419	\N	Chalupki Górne
10420	\N	Przylasek Rusiecki
10421	\N	Wolica Most
10422	\N	Wolica Las
10423	\N	Wolica Kosciól
10424	\N	Wolica
10425	\N	Wolica Sklep
10426	\N	Bartnicza
10427	\N	Siejówka
10428	\N	Przylasek Wyciaski
10429	\N	Przylasek Wyciaski
10430	\N	Siejówka
10431	\N	Bartnicza
10432	\N	Wolica Sklep
10433	\N	Wolica Kosciól
10434	\N	Wolica Las
10435	\N	Wolica
10436	\N	Wolica Most
10437	\N	Kujawy
10438	\N	Oczyszczalnia Scieków "Kujawy"
10439	\N	Oczyszczalnia Scieków "Kujawy"
10440	426	Tyniecka Autostrada
10441	427	Maly Plaszów
10442	415	Jasienskiego
10443	\N	Biezanów Kaim
10444	\N	Kosocicka
10445	\N	Kosocicka
10446	415	Jasienskiego
10447	365	Biezanów
10448	\N	Malinowskiego
10449	3	Soboniowice
10450	\N	Krzemieniecka
10451	\N	Barycz
10452	\N	Zelazowskiego
10453	318	Kosocice
10454	318	Kosocice
10455	\N	Szczegów
10456	\N	Zelazowskiego
10457	\N	Barycz
10458	\N	Krzemieniecka
10459	\N	Malinowskiego
10460	3	Soboniowice
10461	15	Golkowice
10462	41	Zbydniowice Szkola
10463	339	Ukraina
10464	\N	Krakówka
10465	210	Bujaka
10466	178	Opatkowice Wiadukt
10467	178	Opatkowice Wiadukt
10468	210	Bujaka
10469	\N	Krakówka
10470	339	Ukraina
10471	41	Zbydniowice Szkola
10472	4	Skotniki
10473	514	Babinskiego
10474	325	Wrony
10475	4	Skotniki
10476	4	Skotniki
10477	514	Babinskiego
10478	\N	Glogera Granica Miasta
10479	\N	Glogera Granica Miasta
10480	674	Wazewskiego
10481	674	Wazewskiego
10482	278	Smolenskiego
10483	278	Smolenskiego
10484	\N	Na Budzyniu
10485	198	Tonie Katy
10486	198	Tonie Katy
10487	591	Bronowice Male
10488	\N	Druzbackiej
10489	\N	Druzbackiej
10490	\N	Niebieska Autostrada
10491	\N	Niebieska Autostrada
10492	\N	Rybitwy Sklep
10493	\N	Rybitwy Sklep
10494	\N	Biskupinska
10495	375	Bielany
10496	375	Bielany
10497	\N	Luczanowice Skrzyzowanie
10498	\N	Luczanowice Skrzyzowanie
10499	739	Cmentarz Grebalów
10500	739	Cmentarz Grebalów
10501	\N	Os.Marszowiec
10502	\N	Os.Marszowiec
10503	\N	Slona Woda
10504	\N	Slona Woda
10505	\N	Wyciaze
10506	\N	Wyciaze
10507	426	Tyniecka Autostrada
10508	284	Lutnia
10509	284	Lutnia
10510	261	Kantorowice
10511	261	Kantorowice
10512	618	Gustawa Morcinka
10513	\N	Branice Na Dole
10514	\N	Branice Na Dole
10515	723	Branice Szkola
10516	723	Branice Szkola
10517	\N	Branice
10518	\N	Branice
10519	\N	Branice Osrodek Zdrowia
10520	\N	Branice Osrodek Zdrowia
10521	\N	Kakolowa
10522	\N	Kakolowa
10523	\N	Truskawkowa
10524	\N	Truskawkowa
10525	\N	Karowa
10526	\N	Karowa
10527	\N	Gwarecka
10528	\N	Gwarecka
10529	\N	Suchy Jar
10530	\N	Suchy Jar
10531	\N	Igolomska
10532	\N	Igolomska
10533	\N	Rzepakowa
10534	\N	Rzepakowa
10535	\N	Rzepakowa Swietlica
10536	\N	Rzepakowa Swietlica
10537	\N	Zwirownia
10538	\N	Zwirownia
10539	\N	Ciekowiec
10540	\N	Ciekowiec
10541	295	Bronowice Wiadukt
10542	295	Bronowice Wiadukt
10543	346	Zbydniowice
10544	346	Zbydniowice
10545	346	Zbydniowice
10546	\N	Geologów
10547	\N	Geologów
10548	\N	Malborska Szkola
10549	247	Kapielowa
10550	247	Kapielowa
10551	699	Skawina Podlipki
10552	\N	Prusy
10553	346	Zbydniowice
10554	\N	Trzecia Góra
10555	\N	Soboniowice Granica Miasta
10556	103	Pasternik
10557	\N	Czulice I
10558	\N	Wolica Most
10559	\N	Konopnickiej
10560	\N	Konopnickiej
10561	518	Olszanica Ogródki Dzialkowe
10562	518	Olszanica Ogródki Dzialkowe
10563	\N	Balice III
10564	\N	Balice III
10565	223	Wielicka Granica Miasta
10566	\N	Nadbrzezie
10567	\N	Nadbrzezie
10568	\N	Cmentarz Rzaska
10569	17	Zajezdnia Plaszów
10570	149	Herberta
10571	149	Herberta
10572	53	Wielicka
10573	\N	Balicka Wiadukt
10574	514	Babinskiego
10575	567	Jezowa
10576	\N	Druzbackiej
10577	\N	Druzbackiej
10578	\N	Golkowice Kosciól
10579	\N	Golkowice Kosciól
10580	\N	Wyciaze
10581	\N	Wyciaze
10582	\N	Ruszcza Cmentarz
10583	\N	Ruszcza Cmentarz
10584	\N	Ruszcza
10585	\N	Karowa
10586	\N	Karowa
10587	\N	Wrózenice Górka
10588	\N	Wrózenice Górka
10589	\N	Wrózenice
10590	591	Bronowice Male
10591	774	Tonie Gliniki
10592	774	Tonie Gliniki
10593	\N	Jasnogórska
10594	\N	Jasnogórska
10595	\N	Stopien Wodny
10596	\N	Pod Lipa
10597	\N	Pod Lipa
10598	531	Bolechowice
10599	531	Bolechowice
10600	\N	Brzezie
10601	\N	Brzezie
10602	359	Starowislna
10603	777	Miodowa
10604	\N	Piekielko
10605	\N	Piekielko
10606	256	Janasówka
10607	256	Janasówka
10608	\N	Balice III
10609	246	Baczynskiego
10610	246	Baczynskiego
10611	18	Borek Szlachecki II
10612	\N	Aleksandry
10613	\N	Aleksandry
10614	\N	Radziszów
10615	619	Cmentarz Podgórski
10616	619	Cmentarz Podgórski
10617	\N	Krakówka
10618	\N	Os.Marszowiec
10619	\N	Marszowiec
10620	\N	Biezanów Granica Miasta
10621	21	Wieliczka Rynek
10622	\N	Bedkowice Petla
10623	356	Krzyszkowice Os. Szymanowskiego
10624	356	Krzyszkowice Os. Szymanowskiego
10625	223	Wielicka Granica Miasta
10626	\N	Szczegów
10627	\N	Biezanów Granica Miasta
10628	\N	Biezanów Granica Miasta
10629	\N	Wegrzce Wielkie III
10630	\N	Kocmyrzów Krzyzówka
10631	\N	Kocmyrzów Krzyzówka
10632	\N	Rusocice Jalowce
10633	\N	Rusocice Jalowce
10634	694	Rusocice Zaleg
10635	694	Rusocice Zaleg
10636	618	Gustawa Morcinka
10637	618	Gustawa Morcinka
10638	\N	Owczary
10639	\N	Owczary
10640	\N	Wolica Most
10641	144	Lipska
10642	\N	Wegrzce Sudól I
10643	\N	Wegrzce Sudól I
10644	144	Lipska
10645	15	Golkowice
10646	\N	Sanka Skrzyzowanie
10647	\N	Sanka Skrzyzowanie
10648	777	Miodowa
10649	278	Smolenskiego
10650	739	Cmentarz Grebalów
10651	591	Bronowice Male
10652	\N	Dymarek
10653	\N	Dymarek
10654	40	Skawina Podbory
10655	276	Ochodza
10656	512	Brzyczyna
10657	\N	Dziekanowice Stacja Batowice
10658	\N	Dziekanowice Stacja Batowice
10659	\N	Wola Zachariaszowska Kresy
10660	\N	Wola Zachariaszowska Kresy
10661	\N	Wola Zachariaszowska Kresy
10662	\N	Zakonce
10663	\N	Lusina Dolna
10664	\N	Lusina Dolna
10665	\N	Garlica Duchowna Rozjazd
10666	\N	Garlica Duchowna Rozjazd
10667	\N	Garliczka Chochól
10668	\N	Garliczka Chochól
10669	\N	Owczary Górna
10670	\N	Owczary Górna
10671	\N	Owczary Dluga
10672	\N	Owczary Dluga
10673	\N	Owczary Gajowa
10674	\N	Owczary Gajowa
10675	\N	Bosutów Dziekanowice
10676	\N	Bosutów Dziekanowice
10677	445	Skawina Korabniki
10678	\N	Górna Wies
10679	\N	Brzoskwinia Góra
10680	\N	Brzoskwinia Góra
10681	\N	Tomaszowice Gliniki
10682	\N	Tomaszowice Gliniki
10683	\N	Balicka Wiadukt
10684	\N	Balicka Wiadukt
10685	664	Wesele
10686	664	Wesele
10687	160	Mlynka Petla
10688	658	Mydlniki
10689	90	Pekowice
10690	475	Górka Narodowa
10691	\N	Lajkonika
10692	\N	Narama
10693	\N	Pielgrzymowice
10694	360	Rzaska Autostrada
10695	\N	Chrosna
10696	555	Kopiec Kosciuszki
10697	472	Granica Miasta
10698	472	Granica Miasta
10699	185	Hofmana
10700	310	Poczta Glówna
10701	310	Poczta Glówna
10702	292	Pleszów
10703	617	Na Zaleczu
10704	\N	Os.Na Kozlówce
10705	753	Cwiklinskiej
10706	679	Prokocim UJ
10707	96	Grabówki
10708	543	Nowosadecka
10709	\N	Radziszów Lesniczówka
10710	\N	Konary
10711	\N	Krasnik
10712	\N	Lusina Górka
10713	\N	Lema
10714	\N	Lema
10715	\N	Bulwarowa Ogródki Dzialkowe
10716	604	Kawiory
10717	604	Kawiory
10718	374	Nowy Prokocim
10719	374	Nowy Prokocim
10720	\N	Górnickiego
10721	\N	Lusina Dwór
10722	412	EC Leg
10723	\N	Ochojno Remiza
10724	\N	Malborska Szkola
10725	370	Libertów
10726	370	Libertów
10727	472	Granica Miasta
10728	90	Pekowice
10730	\N	Rzaka 
10731	\N	Iwanowice
10732	746	Libertów Szkola
10733	746	Libertów Szkola
10734	168	Libertów Dzialy
10735	168	Libertów Dzialy
10736	342	Libertów Krzyzówka
10737	342	Libertów Krzyzówka
10738	\N	Droga do Sidziny
10739	\N	Droga do Sidziny
10740	\N	Nowohucka
10741	\N	Nowohucka
10742	\N	Przegorzaly UJ
10743	90	Pekowice
10744	\N	Lusina Petla
10745	\N	Rondo Polsad
10746	\N	Rondo Polsad
10747	720	Skawina Szkola
10748	\N	Olszanica
10749	\N	Brzezie Dzialki
10750	\N	Krzeszowice
10751	\N	Karniowice
10752	\N	Karniowice
10753	445	Skawina Korabniki
10754	512	Brzyczyna
10755	512	Brzyczyna
10756	\N	Michalowice Las Michalowski
10757	\N	Michalki
10758	\N	Piekielko
10759	\N	Piekielko
10760	\N	Lindego
10761	\N	Luczyce PKP
10762	\N	Smardzowice
10763	96	Grabówki
10764	549	Giebultów Morgi
10765	\N	Nielepice
10766	\N	Brzezie Narodowe
10767	\N	Krzysztoforzyce
10768	\N	Krzyszkowice Rózana
10769	\N	Kamien
10770	\N	Lusina Lany
10771	533	Rzozów Zagonnie
10772	628	Rzozów PKP
10773	\N	Kokotów II
10774	677	Skawina PKP
10775	\N	Maciejowice
10776	\N	Chobot Lesniczówka
10777	137	Grabie Kosciól
10778	\N	Podleze Centrum
10779	\N	Podleze Centrum
10780	\N	Slomniki Osiedle
10781	\N	Ochodza Odwisle
10782	\N	Mników Panska Góra
10783	\N	Mników Panska Góra
10784	\N	Mników Skaly
10785	\N	Mników Skaly
10786	\N	Rybna Zagórze
10787	\N	Rybna Dolna
10788	137	Grabie Kosciól
10789	\N	Niepolomice Fabryczna
10790	\N	Niepolomice Fabryczna
10791	445	Skawina Korabniki
10792	370	Libertów
10793	370	Libertów
10794	\N	Morawica
10795	\N	Morawica Krzyzówka
10796	\N	Czulówek Kapliczka
10797	\N	Czulówek Kapliczka
10798	167	Darwina
10799	\N	Rondo Polsad
10800	739	Cmentarz Grebalów
10801	\N	Kopanka
10802	512	Brzyczyna
10803	\N	Michalowice Kwiaty Polne
10804	\N	Kraków Airport T2
10805	\N	Cmentarz Grebalów I
10806	\N	Cmentarz Grebalów I
10807	\N	Cmentarz Grebalów I
10808	619	Cmentarz Podgórski
10809	619	Cmentarz Podgórski
10810	\N	Brzegi
10811	\N	Wola Batorska Ruskie
10812	\N	Wola Batorska Ruskie
10813	\N	Podkamycze
10814	\N	Podkamycze
10815	\N	Marszowiec
10816	\N	Trzecia Góra
10817	\N	Trzecia Góra
10818	136	Zielonki Rozjazd
10819	\N	Trojanowice Petla
10820	\N	Trojanowice I
10821	439	Droga do Rzaski
10822	439	Droga do Rzaski
10823	264	Modlniczka Mala
10824	264	Modlniczka Mala
10825	264	Modlniczka Mala
10826	\N	Balice I
10827	\N	Balice II
10828	\N	Balice II
10829	174	Wyzral
10830	787	Wyzral Szkola
10831	529	Wyzral Wielka Droga
10832	\N	Kozierów Skrzyzowanie
10833	\N	Zerkowice Kolonia
10834	\N	Kozierów Skrzyzowanie
10835	\N	Zerkowice Kolonia
10836	307	Stradom
10837	292	Pleszów
10838	\N	Wydzial Farmaceutyczny UJ
10839	\N	Soboniowice Granica Miasta
10840	\N	Soboniowice Granica Miasta
10841	\N	Lusina I
10842	\N	Zywiecka
10843	673	Swoszowice
10844	\N	Wlosan
10845	\N	Glogera
10846	\N	Glogera
10847	284	Lutnia
10848	\N	Os.Jagiellonskie
10849	\N	Os.Jagiellonskie
10850	\N	Wyciaze
10851	\N	Wyciaze
10852	\N	Suchy Jar
10853	\N	Suchy Jar
10854	\N	Droga do Janowic
10855	437	Saska
10856	366	Szczyglice Dom Kultury
10857	\N	Glogera
10858	\N	Trzecia Góra
10859	\N	Soboniowice Granica Miasta
10860	330	Lusina Granica
10861	197	Batowice PKP
10862	\N	Raciborowice
10863	\N	Zastów
10864	\N	Konary Buk
10865	174	Wyzral
10866	\N	Dabrowa Szlachecka Figurka
10867	\N	Grotowa
10868	\N	Michalowice Komora
10869	\N	Aleksandrowice
10870	\N	Brzoskwinia Koziary
10871	283	Zielony Dól
10872	283	Zielony Dól
10873	\N	Raczna Osiedle
10874	\N	Raczna Osiedle
10875	223	Wielicka Granica Miasta
10876	223	Wielicka Granica Miasta
10877	\N	Swidzinskiego
10878	\N	Zagórzyce Dworskie
10879	\N	Cmentarz Rzaska
10880	\N	Droga do Sidziny
10881	\N	Zelków
10882	\N	Wyciaze
10883	\N	Wyciaze
10884	\N	Ruszcza Cmentarz
10885	\N	Wrózenice Górka
10886	\N	Wrózenice Górka
10887	\N	Trojanowice I
10888	\N	Trojanowice I
10889	\N	Trojanowice Petla
10890	109	Kolna
10891	\N	Skrzyzowanie do Podchruscia
10892	\N	Cmentarz Grebalów I
10893	\N	Cmentarz Grebalów I
10894	\N	Podgórki Skawinskie
10895	312	Dubie
10896	312	Dubie
10897	61	Modlniczka Trzcie
10898	61	Modlniczka Trzcie
10899	319	Leroy Merlin
10900	319	Leroy Merlin
10901	\N	Zielona
10902	\N	Zielona
10903	\N	Michalki
10904	\N	Marszowiec
10905	\N	TR
10906	534	Brzeznica
10907	165	Brzeznica Pasieka
10908	616	Brzeznica Kuznia
10909	165	Brzeznica Pasieka
10910	616	Brzeznica Kuznia
10911	180	Wola Radziszowska
10912	\N	Maszyce II
10913	\N	Maszyce II
10914	135	Maszyce Skrzyzowanie
10915	135	Maszyce Skrzyzowanie
10916	\N	Smardzowice
10917	\N	Wegrzce Wielkie
10918	\N	Marszowiec
10919	\N	Czarnochowice I
10920	\N	Czarnochowice I
10921	\N	Biezanów Granica Miasta
10922	\N	Plac Centralny
10923	629	Maszyce Remiza
10924	629	Maszyce Remiza
10925	\N	Smardzowice IV
10926	\N	Smardzowice IV
10927	223	Wielicka Granica Miasta
10928	223	Wielicka Granica Miasta
10929	223	Wielicka Granica Miasta
10930	397	Czernichów
10931	\N	Biezanów Granica Miasta
10932	\N	Biezanów Granica Miasta
10933	\N	Wegrzce Wielkie III
10934	\N	Raczna Podlas
10935	\N	Raczna Osiedle
10936	\N	Mlynka
10937	477	Muzeum Inzynierii Miejskiej
10938	74	Uniwersytet Jagiellonski
10939	\N	Wiktorowice Granica
10940	\N	Wiktorowice Granica
10941	\N	Ochmanów Otaczarnia
10942	\N	Podleze Przedszkole
10943	\N	Wola Luborzycka Dzialki
10944	\N	Sanka Skrzyzowanie
10945	\N	Sanka Skrzyzowanie
10946	86	Powstanców Wielkopolskich
10947	86	Powstanców Wielkopolskich
10948	\N	Morawica Krzyzówka
10949	\N	Skrzyzowanie do Podchruscia
10950	\N	Cmentarz Batowice Wschód
10951	\N	Cmentarz Batowice Wschód
10952	739	Cmentarz Grebalów
10953	479	Przykopy
10954	\N	Mogilany Cicha
10955	359	Starowislna
10956	\N	Michalowice Osrodek Zdrowia
10957	\N	Michalowice Osrodek Zdrowia
10958	\N	Zabawa I
10959	\N	Michalowice Osrodek Zdrowia
10960	355	Ruczaj
10961	355	Ruczaj
10962	687	Skarzynskiego
10963	270	Rondo Hipokratesa
10964	\N	PH
10965	171	Borek Falecki
10966	\N	PT
10967	15	Golkowice
10968	759	Bienczycka
10969	759	Bienczycka
10970	\N	Wieliczka Niepolomska
10971	17	Zajezdnia Plaszów
10972	\N	Soboniowice Granica Miasta
10973	\N	Soboniowice Granica Miasta
10974	617	Na Zaleczu
10975	\N	Rzeszotary Tempo
10976	\N	Rzeszotary Tempo
10977	\N	Luczyce PKP
10978	\N	Luczyce Zjawienie
10979	110	Nowy Biezanów
10980	587	Prokocim
10981	86	Powstanców Wielkopolskich
10982	709	Plac Wszystkich Swietych
10983	709	Plac Wszystkich Swietych
10984	436	Filharmonia
10985	\N	Pradnicka
10986	\N	Pradnicka
10987	\N	Slomniki Kosciuszki
10988	\N	Slomniki Kosciuszki
10989	\N	PT
10990	\N	PT
10991	220	Rondo Mogilskie
10992	220	Rondo Mogilskie
10993	\N	Balice Autostrada
10994	\N	Carrefour
10995	\N	Carrefour petla
10996	\N	Carrefour
10997	\N	Carrefour
10998	\N	Szpital Rydygiera I
10999	\N	Szpital Rydygiera I
11000	\N	Przewóz I
11001	\N	Przewóz I
11002	\N	Skawina Os.Radziszowskie
11003	\N	Skawina Os.Radziszowskie
11004	\N	Wadów os.Kolejowe
11005	\N	Wadów os.Kolejowe
11006	748	M1 Nowohucka
11007	748	M1 Nowohucka
11008	\N	Os.Mistrzejowice Nowe
11009	\N	Os.Mistrzejowice Nowe
11010	\N	Ks.Targosza
11011	\N	Ks.Targosza
11012	\N	Wadów Os.Kolejowe
11013	\N	Wadów Os.Kolejowe
11014	\N	Krzyszkowice Os.Szymanowskiego
11015	\N	Krzyszkowice Os.Szymanowskiego
11016	233	Skawina Elektrownia
11017	233	Skawina Elektrownia
11018	120	Skawina Pilsudskiego
11019	120	Skawina Pilsudskiego
11020	\N	Wola Batorska Zwirownia
11021	\N	Wola Batorska Zwirownia
11022	\N	Wola Batorska Kosciól
11023	\N	Wola Batorska Kosciól
11024	\N	Wola Batorska Cmentarz
11025	\N	Wola Batorska Cmentarz
11026	\N	Wola Batorska Borek
11027	\N	Wola Batorska Borek
11028	\N	Sw.Gertrudy
11029	\N	Sw.Gertrudy
11030	\N	Sw.Wawrzynca
11031	\N	Sw.Wawrzynca
11032	\N	Sw.Wawrzynca
11033	\N	Sw.Wawrzynca
11034	\N	Lipowa
11035	\N	Muzeum Armii Krajowej
11036	\N	Plac Centralny im. R.Reagana
11037	11	Rondo Kocmyrzowskie im. Ks. Gorzelanego
11038	11	Rondo Kocmyrzowskie im. Ks. Gorzelanego
11039	\N	Plac Centralny im. R.Reagana
11040	\N	Plac Centralny im. R.Reagana
11041	\N	Plac Centralny im. R.Reagana
11042	668	Prokocim Rynek
11043	668	Prokocim Rynek
11044	\N	Plac Centralny im. R.Reagana
11045	\N	Plac Centralny im. R.Reagana
11046	11	Rondo Kocmyrzowskie im. Ks. Gorzelanego
11047	\N	Plac Centralny im. R.Reagana
11048	\N	Plac Centralny im. R.Reagana
11049	\N	Plac Centralny im. R.Reagana
11050	11	Rondo Kocmyrzowskie im. Ks. Gorzelanego
11051	11	Rondo Kocmyrzowskie im. Ks. Gorzelanego
11052	\N	Plac Centralny im. R.Reagana
11053	\N	Plac Centralny im. R.Reagana
11054	\N	Plac Centralny im. R.Reagana
11055	11	Rondo Kocmyrzowskie im. Ks. Gorzelanego
11056	11	Rondo Kocmyrzowskie im. Ks. Gorzelanego
11057	11	Rondo Kocmyrzowskie im. Ks. Gorzelanego
11058	\N	Lipowa
11059	\N	PT
11060	708	Jubilat
11061	\N	PH
11062	588	Suche Stawy
11063	588	Suche Stawy
11064	129	Kopiec Wandy
11065	\N	Mrozowa
11066	\N	Mrozowa
11067	776	Blokowa
11068	776	Blokowa
11069	58	Walcownia
11070	642	Lubocza PKP
11071	\N	Mrozowa
11072	\N	Mrozowa
11073	776	Blokowa
11074	776	Blokowa
11075	58	Walcownia
11076	642	Lubocza PKP
11077	\N	Plac Centralny im. R.Reagana
11078	\N	Agencja Kraków Wschód
11079	234	Plac Inwalidów
11080	588	Suche Stawy
11081	\N	Rynek Glówny
11082	\N	Sw.Gertrudy
11083	601	Orzeszkowej
11084	601	Orzeszkowej
11085	\N	Kordylewskiego
11086	\N	Kordylewskiego
11087	242	M1 Al. Pokoju
11088	242	M1 Al. Pokoju
11089	\N	Kraków Plaza
11090	\N	Kraków Plaza
11091	545	Fabryczna
11092	545	Fabryczna
11093	540	Centrum JP II
11094	\N	Glogera I
11095	\N	Glogera I
11096	\N	Glogera
11097	\N	Glogera
11098	\N	Glogera
11099	\N	Glogera Granica Miasta
11100	\N	Glogera Granica Miasta
11101	\N	Glogera Granica Miasta
11102	\N	Glogera Granica Miasta
11103	\N	Glogera
11104	\N	Glogera
11105	\N	Glogera Granica Miasta
11106	\N	Glogera Granica Miasta
11107	\N	Glogera Granica Miasta
11108	\N	Kraków Airport T2
11109	\N	Balice I
11110	\N	Balice I
11111	477	Muzeum Inzynierii Miejskiej
11112	\N	Jeziorzany
11113	\N	Wojewódzki Szpital Okulistyczny
11114	\N	Wojewódzki Szpital Okulistyczny
11115	\N	Wojewódzki Szpital Okulistyczny
11116	\N	Wojewódzki Szpital Okulistyczny
11117	\N	Goszcza
11118	\N	Luczyce Zjawienie
11119	\N	Luczyce
11120	\N	Luczyce Zwierzyniec
11121	\N	Luczyce Zwierzyniec
11122	\N	Sadowie
11123	\N	Sadowie
11124	\N	Goszcza Cmentarz
11125	\N	Goszcza Cmentarz
11126	260	Szczyglice
11127	260	Szczyglice
11128	260	Szczyglice
11129	\N	Szpital Okulistyczny
11130	\N	Szpital Okulistyczny
11131	\N	Goszcza
11132	\N	Luczyce Zwierzyniec
11133	\N	Luczyce Zwierzyniec
11134	\N	Sadowie
11135	\N	Sadowie
11136	\N	Goszcza Cmentarz
11137	\N	Goszcza Cmentarz
11138	611	Kuznicy Kollatajowskiej
11139	\N	Gosciniec
11140	\N	Gosciniec
11141	\N	Goszcza
11142	\N	Spytkowice
11143	\N	Nad Drwina
11144	\N	Os. Gotyk
11145	613	Dabie
11146	\N	Balicka
11147	\N	Gielda Balicka P+R
11148	\N	Gielda Balicka P+R
11149	595	Azory
11150	461	Krowodrza Górka
11151	\N	Swiatniki Krakowska
11152	\N	Swiatniki Krakowska
11153	\N	Swiatniki Krakowska
11154	\N	Swiatniki Krakowska
11155	\N	Biezanów Cmentarz
11156	\N	Bosutów Krakowska
11157	\N	Bosutów Krakowska
11158	\N	Garlica Murowana Kasztany
11159	\N	Garlica Murowana Kasztany
11160	\N	Radziszów Zacisze
11161	\N	Plaszów Tunel
11162	\N	Plaszów Tunel
11163	761	Libertów Zgodna
11164	761	Libertów Zgodna
11165	\N	Cmentarz Salwator
11166	\N	Cmentarz Salwator
11167	101	Radziszów Cmentarz
11168	101	Radziszów Cmentarz
11169	\N	Malborska Szkola
11170	313	Tuchowska
11171	228	Petrazyckiego
11172	228	Petrazyckiego
11173	730	Nalkowskiej
11174	730	Nalkowskiej
11175	730	Nalkowskiej
11176	534	Brzeznica
11177	534	Brzeznica
11178	\N	Swiatniki Krakowska
11179	\N	Swiatniki Krakowska
11180	\N	Kantorowice ???
11181	\N	Kantorowice ???
11182	\N	Rzeszotary Pod Debina
11183	\N	Rzeszotary Pod Debina
11184	553	Politechnika
11185	\N	Galeria Bronowice
11186	\N	Galeria Bronowice
11187	\N	Budzyn Zalew na Piaskach
11188	\N	Budzyn Zalew na Piaskach
11189	\N	Budzyn Plaza Glówna
11190	\N	Budzyn Zalew Budzynski
11191	\N	Budzyn Zalew Budzynski
11192	\N	Budzyn Plaza Glówna
11193	\N	Budzyn Plaza Glówna
11194	\N	Biezanów Kaim
11195	\N	Biezanów Potrzask
11196	\N	Biezanów Kaim
11197	\N	Slósarczyka
11198	\N	Weigla
11199	\N	PW
11200	\N	PW
11201	\N	PW
11202	270	Rondo Hipokratesa
11203	\N	Ugorek
11204	\N	Wieczysta
11205	\N	Bibice Cmentarz
11206	\N	Bibice Cmentarz
11207	\N	Zielonki Galicyjska
11208	\N	Zielonki Galicyjska
11209	\N	Wieczysta
11210	\N	Kraków Airport T2
11211	\N	Bibice Cmentarz
11212	\N	Bibice Cmentarz
11213	\N	Zielonki Galicyjska
11214	\N	Zielonki Galicyjska
11215	449	Rondo Czyzynskie
11216	\N	Kraków Airport T2
11217	\N	Swiatniki Krakowska
11218	\N	Swiatniki Krakowska
11219	449	Rondo Czyzynskie
11220	261	Kantorowice
11221	\N	Zakole
11222	\N	Zakole
11223	\N	Droga do Baryczy
11224	\N	Droga do Baryczy
11225	\N	Hala Widowiskowo Sportowa 
11226	\N	Hala Widowiskowo Sportowa 
11227	341	Meissnera
11228	78	Rondo Mlynskie
11229	\N	Zakole
11230	\N	Zakole
11231	\N	Lasek Legowski
11232	\N	Lasek Legowski
11233	662	Stawowa
11234	662	Stawowa
11235	\N	Narwik
11236	\N	Narwik
11237	\N	Judyma Szkola
11238	621	Czyzyny
11239	458	Dworzec Towarowy
11240	\N	Czyzyny Dworzec
11241	\N	Czyzyny Dworzec
11242	346	Zbydniowice
11243	346	Zbydniowice
11244	346	Zbydniowice
11245	282	Górka Narodowa Wschód
11246	80	Banacha
11247	\N	Plac Matejki
11248	708	Jubilat
11249	80	Banacha
11250	282	Górka Narodowa Wschód
11251	80	Banacha
11252	282	Górka Narodowa Wschód
11253	96	Grabówki
11254	\N	Boisko Kabel
11255	110	Nowy Biezanów
11256	\N	Lipowa
11257	\N	Ogródki Dzialkowe
11258	\N	Ogródki Dzialkowe
11259	\N	Ogródki Dzialkowe
11260	\N	Ogródki Dzialkowe
11261	\N	Ogródki Dzialkowe
11262	\N	Kraków Arena - Lema
11263	\N	Kraków Arena - Lema
11264	\N	Balice Autostrada
11265	\N	Ogródki Dzialkowe
11266	\N	Ogródki Dzialkowe
11267	\N	Kraków Arena Al. Pokoju1
11268	\N	Kraków Arena Al. Pokoju1
11269	\N	Kraków Arena Al. Pokoju1
11270	\N	Kraków Arena Al. Pokoju1
11271	\N	Kraków Arena Al. Pokoju1
11272	\N	Kraków Arena
11273	\N	Kraków Arena
11274	\N	Kraków Arena Al. Pokoju
11275	\N	Kraków Arena Al. Pokoju
11276	\N	Wieczysta
11277	\N	Kraków Arena Al. Pokoju
11278	\N	Kraków Arena Al. Pokoju
11279	\N	Kraków Arena Al. Pokoju
11280	613	Dabie
11281	698	Poziomkowa
11282	698	Poziomkowa
11283	\N	Wieczysta
11284	\N	Modlnica Skrzyzowanie
11285	\N	Modlnica Skrzyzowanie
11286	214	Gromadzka
11287	\N	Wyciaze
11288	\N	Wyciaze
11289	\N	Wieczysta
11290	\N	Wieczysta
11291	\N	Goszyce Remiza
11292	\N	Goszyce Remiza
11293	449	Rondo Czyzynskie
11294	449	Rondo Czyzynskie
11295	449	Rondo Czyzynskie
11296	449	Rondo Czyzynskie
11297	338	Chelmonskiego Osiedle
11298	\N	Wieczysta
11299	\N	Os.Kolorowe
11300	\N	Os.Zgody
11301	569	Muzeum Lotnictwa
11302	569	Muzeum Lotnictwa
11303	\N	Most Grunwaldzki
11304	729	Pradnik Czerwony
11305	756	Góra Borkowska
11306	702	Ludwinów
11307	\N	Centrum Kongresowe
11308	\N	Centrum Kongresowe
11309	\N	Centrum Kongresowe
11310	\N	Centrum Kongresowe
11311	702	Ludwinów
11312	\N	Centrum Kongresowe
11313	\N	Centrum Kongresowe
11314	\N	Centrum Kongresowe
11315	153	Os. Podwawelskie
11316	\N	Centrum Kongresowe
11317	771	Cystersów
11318	158	Bialucha
11319	\N	Wieczysta
11320	\N	Szymanskiego
11321	\N	Os.Podwawelskie
11322	\N	Wola Luborzycka
11323	\N	Kopanka Kosciól
11324	\N	Kopanka Kosciól
11325	\N	Bardosa
11326	405	Agatowa
11327	405	Agatowa
11328	495	Luborzyca I
11329	\N	Buków
11330	639	Wieliczka Kopalnia Soli
11331	\N	Wieliczka Klasnienska
11332	\N	Wieliczka Klasnienska
11333	\N	Wieliczka Sad
11334	\N	Wieliczka Sad
11335	\N	Wieliczka Solne Miasto
11336	\N	Wieliczka Solne Miasto
11337	\N	Krzyszkowice Krzyszkowicka
11338	\N	Krzyszkowice Krzyszkowicka
11339	307	Stradom
11340	381	Dajwór
11341	505	Cracovia
11342	\N	Lindego
11343	791	Komuny Paryskiej
11344	36	Skawina Sad
11345	768	Landaua
11346	768	Landaua
11347	\N	Plac Centralny im. R.Reagana
11348	\N	Plac Centralny im. R.Reagana
11349	\N	Wolowice
11350	\N	Wolowice
11351	\N	Wolowice
11352	\N	Czyzyny Dworzec
11353	762	Barbary
11354	574	Skawina Wyspianskiego Szkola
11355	574	Skawina Wyspianskiego Szkola
11356	639	Wieliczka Kopalnia Soli
11357	608	Lagiewniki ZUS
11358	\N	Wieliczka Rynek Kopalnia
11359	\N	ul. Jedynaka I
11360	\N	ul. Jedynaka I
11361	\N	Grabówki VII
11362	\N	Grabówki VII
11363	\N	Grabówki II
11364	\N	Grabówki II
11365	\N	Siercza XI
11366	\N	Siercza XI
11367	\N	Siercza III
11368	\N	Siercza III
11369	\N	Siercza IV
11370	\N	Siercza IV
11371	\N	Siercza I
11372	\N	Siercza I
11373	\N	Kozmice Wielkie I
11374	\N	Kozmice Wielkie I
11375	\N	Kozmice Wielkie V
11376	\N	Kozmice Wielkie V
11377	\N	Kozmice Wielkie III
11378	\N	Kozmice Wielkie III
11379	\N	Kozmice Wielkie II
11380	\N	Kozmice Wielkie II
11381	\N	Gorzków I
11382	\N	Gorzków I
11383	\N	Byszyce VII
11384	\N	Byszyce VII
11385	\N	Byszyce III
11386	\N	Byszyce III
11387	\N	Byszyce IV
11388	\N	Byszyce IV
11389	\N	Byszyce V
11390	\N	Byszyce V
11391	\N	Byszyce Petla
11392	\N	Siercza III
11393	\N	Siercza III
11394	\N	Siercza II
11395	\N	Siercza II
11396	\N	Roznowa I
11397	\N	Roznowa I
11398	\N	Roznowa II
11399	\N	Roznowa II
11400	\N	Roznowa II 964
11401	\N	Roznowa II 964
11402	\N	Pawlikowice III
11403	\N	Pawlikowice III
11404	\N	Pawlikowice II
11405	\N	Pawlikowice II
11406	\N	Kozmice Male
11407	\N	Kozmice Male
11408	\N	Raciborsko Sieprawówka
11409	\N	Raciborsko Sieprawówka
11410	\N	Raciborsko Lipowa
11411	\N	Raciborsko Lipowa
11412	\N	Raciborsko I
11413	792	Borkowska
11414	792	Borkowska
11415	\N	Judyma Szkola
11416	\N	Os.Kliny
11417	469	Forteczna
11418	405	Agatowa
11419	405	Agatowa
11420	270	Rondo Hipokratesa
11421	759	Bienczycka
11422	759	Bienczycka
11423	220	Rondo Mogilskie
11424	\N	Carrefour petla
11425	\N	Carrefour
11426	776	Blokowa
11427	242	M1 Al. Pokoju
11428	242	M1 Al. Pokoju
11429	477	Muzeum Inzynierii Miejskiej
11430	\N	Wieliczka Rynek Kopalnia
11431	\N	Raczna Osiedle
11432	220	Rondo Mogilskie
11433	220	Rondo Mogilskie
11434	\N	Czulów
11435	\N	Gorzków II
11436	\N	Gorzków III
11437	756	Góra Borkowska
11438	\N	Wieliczka Goliana
11439	\N	Wieliczka Goliana
11440	548	Dworzec Plaszów
11441	548	Dworzec Plaszów
11442	144	Lipska
11443	\N	Lusina Petla
11444	576	Dworzec Glówny Zachód
11445	\N	Skawina Graniczna
11446	\N	Skawina Graniczna
11447	\N	Skawina Bukowska
11448	\N	Skawina Bukowska
11449	366	Szczyglice Dom Kultury
11450	\N	Kleszczów I
11451	\N	Kleszczów I
11452	\N	Plac Centralny im. R.Reagana
11453	360	Rzaska Autostrada
11454	360	Rzaska Autostrada
11455	\N	Gaj Kwiatowa
11456	\N	Gaj Rudawa
11457	\N	Gaj Zgody
11458	\N	Aleja Pokoju
11459	\N	Aleja Pokoju
11460	813	Teatr Variété
11461	813	Teatr Variété
11462	\N	Pisary Kasztanowa
11463	\N	Pisary Kasztanowa
11464	\N	Lokietka
11465	\N	Balicka Wiadukt
11466	\N	Balicka Wiadukt
11467	\N	Port Lotniczy (Airport)
11468	\N	Port Lotniczy (Airport)
11469	305	Zajezdnia Wola Duchacka
11470	43	Kraków Airport
11471	43	Kraków Airport
11472	\N	Wieliczka Kampus
11473	250	Dworzec Glówny Wschód
11474	207	Skawina Centrum Sportowe
11475	207	Skawina Centrum Sportowe
11476	\N	Kleszczów Pod Lipka
11477	\N	Kleszczów Pod Lipka
11478	\N	Bagry
11479	\N	Avia Office
11480	138	Skawina Pileckiego
11481	138	Skawina Pileckiego
11482	421	Skawina Ofiar Katynia
11483	421	Skawina Ofiar Katynia
11484	601	Orzeszkowej
11485	601	Orzeszkowej
11486	\N	Górna Wies
11487	\N	Michalówka
11488	\N	Michalówka
11489	\N	Wegrzce Centrum Medyczne
11490	767	Lesmiana
11491	\N	Rzepichy
11492	\N	Rzepichy
11493	767	Lesmiana
11494	793	Teatr Ludowy
11495	\N	Os.Górali
11496	\N	Os.Górali
11497	793	Teatr Ludowy
11498	\N	Os.Górali
11499	\N	Os.Górali
11500	\N	Rzepichy
11501	\N	Rzepichy
11502	396	Wegrzce
11503	640	Dworzec Plaszów Estakada
11504	640	Dworzec Plaszów Estakada
11505	\N	Bedkowice Dluga
11506	\N	Bedkowice Dluga
11507	498	Kuklinskiego
11508	\N	Plaszowska
11509	\N	Plaszowska
11510	\N	Strycharska
11511	396	Wegrzce
11512	\N	TAURON Arena Kraków Al. Pokoju
11513	\N	TAURON Arena Kraków Al. Pokoju
11514	\N	TAURON Arena Kraków Al. Pokoju
11515	\N	TAURON Arena Kraków
11516	\N	TAURON Arena Kraków
11517	\N	TAURON Arena Kraków Al. Pokoju
11518	\N	TAURON Arena Kraków Al. Pokoju
11519	691	Chopina
11520	79	Modlnica Trojadyn Szydlo
11521	79	Modlnica Trojadyn Szydlo
11522	79	Modlnica Trojadyn Szydlo
11523	464	Giebultów Trojadyn Trafo
11524	464	Giebultów Trojadyn Trafo
11525	\N	Giebultów Trojadyn
11526	\N	Giebultów Trojadyn
11527	\N	Czulów Szkola
11528	\N	Czulów Droga na Czulówek
11529	\N	Czulów
11530	\N	Mników Droga do Kaszowa
11531	\N	Mników Dziady
11532	\N	Czulów Droga na Czulówek
11533	\N	Czulów
11534	\N	Mników Droga do Kaszowa
11535	\N	Mników Dziady
11536	\N	Rybna Nowy Swiat Góra
11537	\N	Rybna Nowy Swiat Góra
11538	\N	Rybna Szkola
11539	\N	Rybna Szkola
11540	\N	Czulów Szkola
11541	\N	Kaszów Wyzral
11542	\N	Liszki Wolowska Droga
11543	\N	Kaszów Wyzral
11544	\N	Liszki Wolowska Droga
11545	\N	Zagacie
11546	\N	Zagacie Witkówki
11547	\N	Zagacie
11548	\N	Zagacie Witkówki
11549	\N	Kaszów Wyzral
11550	\N	Czernichów Zakamycze
11551	\N	Czernichów Zakamycze
11552	\N	Czernichów Ratanice Most
11553	\N	Czernichów Ratanice Most
11554	\N	Czernichów Ratanice
11555	\N	Czernichów Ratanice
11556	\N	Rusocice Stacja Benzynowa
11557	\N	Rusocice Stacja Benzynowa
11558	\N	Rusocice Droga do Kosciola
11559	\N	Rusocice Droga do Kosciola
11560	617	Na Zaleczu
11561	521	Kryspinów Stopien Wodny
11562	757	Piekary Na Brzegu
11563	401	Piekary Korea
11564	294	Piekary Borki
11565	521	Kryspinów Stopien Wodny
11566	757	Piekary Na Brzegu
11567	401	Piekary Korea
11568	294	Piekary Borki
11569	183	Liszki Tyniecka
11570	35	Piekary Dól
11571	183	Liszki Tyniecka
11572	35	Piekary Dól
11573	\N	Raczna OSP
11574	\N	Jeziorzany Petla
11575	\N	Jeziorzany Rondo
11576	\N	Raczna Boisko
11577	\N	Raczna OSP
11578	\N	Lusina
11579	\N	Lusina
11580	521	Kryspinów Stopien Wodny
11581	\N	Przeginia Narodowa Bonar
11582	\N	Przeginia Narodowa Bonar
11583	\N	Wolowice Pichonówka
11584	\N	Wolowice Pichonówka
11585	\N	Jeziorzany Petla
11586	\N	Raczna Boisko
11587	\N	Raczna Boisko
11588	\N	Jeziorzany Rondo
11589	\N	Jeziorzany Rondo
11590	\N	Jeziorzany Petla
11591	\N	Mlynówka SKA
11592	\N	Mlynówka SKA
11600	\N	Godlewskiego
11601	500	Szczyglice Podkamycze
11602	500	Szczyglice Podkamycze
11603	\N	Godlewskiego
11604	\N	Chrosna Petla
11605	\N	Balice Winna Góra
11606	\N	Balice Winna Góra
11607	\N	Burów Centrum
11608	\N	Burów
11609	\N	Burów
11610	\N	Burów Centrum
11611	\N	Bolechowice Zielona
11612	\N	Bolechowice Zielona
11613	\N	Bolechowice Krzewiny
11614	\N	Bolechowice Drogi
11615	\N	Bolechowice Drogi
11616	\N	Bolechowice Krzewiny
11617	\N	Zelków Splawy
11618	\N	Zelków Splawy
11619	\N	Bolechowice Zielona Mala
11620	\N	Bolechowice Zielona Mala
11621	\N	Wieckowice Lipka
11622	\N	Wieckowice Lipka
11623	\N	Dubie Skrzyzowanie
11624	\N	Dubie Skrzyzowanie
11625	\N	Krzeszowice Krakowska Muzeum
11626	\N	Bolechowice Zielona
11627	\N	Bolechowice Zielona
11628	\N	Rudawa Stadion
11629	\N	Rudawa Stadion
11630	\N	Libertów Droga do Sidziny
11631	\N	Libertów Droga do Sidziny
11632	44	Skawina Podgórki Skawinskie
11633	44	Skawina Podgórki Skawinskie
11634	44	Skawina Podgórki Skawinskie
11635	404	Radziszów Petla
11636	\N	Skawina Ogrody
11637	690	Skawina Kopernika
11638	\N	Skawina Ogrody
11639	690	Skawina Kopernika
11640	\N	Krzecin Petla
11641	345	Kopanka Petla
11642	420	Kopanka Druga
11643	420	Kopanka Druga
11644	\N	Raciborsko I
11645	\N	Raciborsko V
11646	\N	Raciborsko V
11647	\N	Grajów VIII
11648	\N	Lusina Zielona
11649	\N	Lusina Dobrzyczany
11650	\N	Lusina Krasnik
11651	\N	Lusina Zagrody
11652	\N	Lusina Zagrody
11653	\N	Lusina Krasnik
11654	\N	Lusina Dobrzyczany
11655	\N	Lusina Zielona
11656	\N	Rzeszotary Panciawa Petla
11657	\N	Rzeszotary Panciawa
11658	\N	Wrzasowice Nad Wilga
11659	\N	Wrzasowice Nad Wilga
11660	\N	Wrzasowice Pod Skala
11661	\N	Wrzasowice Pod Skala
11662	\N	Ochojno Dabrówki
11663	\N	Ochojno Dabrówki
11664	\N	Swiatniki Górne Piasna Górka 
11665	\N	Swiatniki Górne Piasna Górka 
11666	\N	Rzeszotary Panciawa
11667	\N	Swiatniki Bielowicza Szkola
11668	\N	Swiatniki Bielowicza Szkola
11669	\N	Swiatniki Urzad Miasta i Gminy
11670	\N	Swiatniki Urzad Miasta i Gminy
11671	\N	Wrzasowice Zielona
11672	\N	Wrzasowice Zielona
11673	\N	Swiatniki Buk
11674	\N	Swiatniki Buk
11675	\N	Wrzasowice
11676	\N	Wrzasowice
11677	\N	Wrzasowice Pileckiego
11678	\N	Wrzasowice Centrum
11679	\N	Wrzasowice Centrum
11680	\N	Wrzasowice Wrzosowa
11681	\N	Wrzasowice Wrzosowa
11682	\N	Swiatniki Bielowicza Szkola
11683	\N	Mogilany Kopce
11684	\N	Mogilany Kopce
11685	\N	Swiatniki Buk
11686	\N	Wrzasowice Pileckiego
11687	\N	Biezanów Pomnik
11688	408	Nowolipki
11689	187	Wiadukty
11690	801	Zeromskiego
11691	\N	Rynek Glówny
11692	\N	Spytkowice
11693	\N	Cmentarz Póllanki
11694	\N	Cmentarz Póllanki
11695	636	Cmentarz Rakowicki
11696	181	Uniwersytet Ekonomiczny
11697	494	Lubicz
11698	\N	Zielonki Marszowiec Petla
11699	\N	Bibice Rynek
11700	\N	Narama Remiza
11701	\N	Pielgrzymowice Petla
11702	\N	Wola Zachariaszowska Zakonce
11703	\N	Garlica Duchowna Droga do Garliczki
11704	\N	Garlica Murowana Podskale
11705	\N	Garlica Murowana Podskale
11706	\N	Garlica Duchowna Droga do Garliczki
11707	\N	Wola Zachariaszowska Zakonce
11708	\N	Trojanowice Krakowska
11709	\N	Trojanowice Krakowska
11710	\N	Owczary Petla
11711	\N	Owczary
11712	\N	Owczary
11713	\N	Bibice Kosciuszki
11714	\N	Bibice Kosciuszki
11715	323	Maslomiaca Staw
11716	\N	Michalowice Górna
11717	\N	Michalowice Michalówka
11718	\N	Michalowice Gosciniec
11719	323	Maslomiaca Staw
11720	\N	Michalowice Górna
11721	\N	Michalowice Michalówka
11722	\N	Michalowice Gosciniec
11723	391	Maslomiaca
11724	\N	Pielgrzymowice Granica
11725	\N	Pielgrzymowice
11726	391	Maslomiaca
11727	\N	Pielgrzymowice Granica
11728	\N	Pielgrzymowice
11729	\N	Batowice Splawy
11730	\N	Batowice Dlubnia
11731	\N	Raciborowice Granica
11732	\N	Batowice Splawy
11733	\N	Batowice Dlubnia
11734	\N	Raciborowice Granica
11735	\N	Wieclawice Stare Wysylek
11736	\N	Wieclawice Stare Wysylek
11737	\N	Krasieniec Pod Lipa
11738	\N	Krasieniec Pod Lipa
11739	\N	Trojanowice Krakowska
11740	\N	Trojanowice Krakowska
11741	\N	Cmentarz Grebalów Poludnie
11742	\N	Cmentarz Grebalów Poludnie
11743	\N	Michalowice Brzozowa
11744	\N	Michalowice Brzozowa
11745	\N	Wegrzce Bosutów Sudól
11746	\N	Wegrzce Bosutów Sudól
11747	\N	Bibice Rynek
11748	\N	Zielonki Marszowiec Petla
11749	373	Korzkiew Botoja
11750	373	Korzkiew Botoja
11751	221	Korzkiew Zamek
11752	221	Korzkiew Zamek
11753	737	Grebynice OSP
11754	737	Grebynice OSP
11755	140	Grebynice
11756	140	Grebynice
11757	\N	Maszyce
11758	\N	Maszyce
11759	\N	Zielonki Marszowiec Petla
11760	\N	Smardzowice Wolówka
11761	\N	Smardzowice Wolówka
11762	\N	Wegrzce Bosutów
11763	\N	Wegrzce Bosutów
11764	\N	Wola Zachariaszowska Zakonce
11765	\N	Michalowice Gosciniec
11766	\N	Michalowice Gosciniec
11767	\N	Rzaska Cmentarz
11768	\N	Pod Fortem
11769	\N	Hala Sportowa Piaski Wielkie
11770	\N	Hala Sportowa Piaski Wielkie
11771	\N	Cmentarz Prokocim
11772	\N	Cmentarz Prokocim
11773	100	Skawina
11774	708	Jubilat
11775	4	Skotniki
11776	778	Brücknera
11777	778	Brücknera
11778	478	Aleja Róz
11779	602	Gnieznienska
11780	\N	Bibice Rynek
11781	\N	Bibice Rynek
11782	807	Bibice
11783	\N	Bibice Na Czekaj
11784	\N	Bibice Na Czekaj
11785	\N	Bibice Na Czekaj
11786	\N	Bibice Na Czekaj
11787	\N	Wieliczka Goliana
11788	\N	Jezynowa
11789	\N	Jezynowa
11790	129	Kopiec Wandy
11791	129	Kopiec Wandy
11792	\N	Bardosa
11793	\N	Bardosa
11794	\N	Luborzyca Szkola
11795	\N	Kocmyrzów Rondo
11796	\N	Kocmyrzów Rondo
11797	\N	Luborzyca Szkola
11798	\N	Kocmyrzów Rondo
11799	\N	Kocmyrzów Rondo
11800	\N	Kocmyrzów Biblioteka
11801	\N	Kocmyrzów Biblioteka
11802	\N	Kocmyrzów Sodfiny
11803	\N	Kocmyrzów Sodfiny
11804	\N	Gleboka Kolonia
11805	\N	Gleboka Kolonia
11806	\N	Wysiolek Luborzycki Skrzyzowanie
11807	\N	Wysiolek Luborzycki Kapkazy
11808	\N	Wysiolek Luborzycki Kapkazy
11809	\N	Wysiolek Luborzycki
11810	\N	Wysiolek Luborzycki
11811	\N	Marszowice Centrum
11812	\N	Marszowice Centrum
11813	\N	Marszowice
11814	\N	Marszowice
11815	\N	Wysiolek Luborzycki Skrzyzowanie
11816	\N	Wysiolek Luborzycki Skrzyzowanie
11817	\N	Luborzyca Szkola
11818	\N	Bardosa
11819	\N	Wieliczka Os.Asnyka
11820	\N	Wieliczka Os.Asnyka
11821	\N	Bedkowice Cmentarz
11822	490	Skawina Popieluszki
11823	68	Skawina Ajka
11824	68	Skawina Ajka
11825	652	Skawina Energetyków Przejazd PKP
11826	652	Skawina Energetyków Przejazd PKP
11827	93	Fort Winnica
11828	58	Walcownia
11829	\N	Agencja Kraków Wschód
11830	164	Klasztorna
11831	\N	Rzepakowa
11832	\N	Rzepakowa
11833	\N	Prawochenskiego
11834	\N	Prawochenskiego
11835	\N	Millana
11836	\N	Millana
11837	\N	Glogera
11838	\N	Glogera
11839	\N	Balice Medweckiego
11840	502	Balice Olszanica Bory
11841	\N	Balice Medweckiego
11842	502	Balice Olszanica Bory
11843	\N	Balice Medweckiego
11844	502	Balice Olszanica Bory
11845	502	Balice Olszanica Bory
11846	\N	Wieliczka Chopina
11847	\N	Wieliczka Chopina
11848	\N	Wieliczka Dobczycka
11849	\N	Roznowa I
11850	\N	Mietniów I
11851	\N	Mietniów I
11852	\N	Mietniów II
11853	\N	Mietniów II
11854	\N	Mietniów III
11855	\N	Mietniów III
11856	\N	Mietniów IV
11857	\N	Mietniów IV
11858	\N	Choragwica I
11859	\N	Choragwica I
11860	\N	Choragwica IV
11861	\N	Choragwica IV
11862	\N	Choragwica II
11863	\N	Choragwica II
11864	\N	Choragwica VI
11865	\N	Choragwica VI
11866	\N	Choragwica III
11867	\N	Choragwica III
11868	\N	Grajów VIII
11869	\N	Dobranowice V
11870	\N	Dobranowice V
11871	\N	Dobranowice I
11872	\N	Dobranowice I
11873	\N	Dobranowice II
11874	\N	Dobranowice II
11875	\N	Dobranowice III
11876	\N	Dobranowice III
11877	\N	Dobranowice IV
11878	540	Centrum JP II
11879	\N	Grajów VIII
11880	94	Uniwersytet Pedagogiczny
11881	664	Wesele
11882	664	Wesele
11883	415	Jasienskiego
11884	436	Filharmonia
11885	\N	TR
11886	595	Azory
11887	461	Krowodrza Górka
11888	\N	Czyzyny Dworzec
11889	812	Kombinat
11890	633	Mistrzejowice
11891	\N	Nowy Biezanów Poludnie
11892	86	Powstanców Wielkopolskich
11893	\N	Os.Kurdwanów
11894	\N	Czerwone Maki
11895	\N	Pradnicka
11896	\N	Pradnicka
11897	\N	Pobiednik
11898	\N	Podkamycze
11899	\N	Rynek Podgórski
11900	\N	Kraków Airport T2
11901	\N	Kraków Airport T2
11902	347	Kampus UJ
11903	347	Kampus UJ
11904	347	Kampus UJ
11905	347	Kampus UJ
11906	347	Kampus UJ
11907	105	Pielegniarek
11908	689	Stary Kleparz
11909	689	Stary Kleparz
11910	667	TAURON Arena Kraków Wieczysta
11911	667	TAURON Arena Kraków Wieczysta
11912	667	TAURON Arena Kraków Wieczysta
11913	689	Stary Kleparz
11914	333	Szczyglice Autostrada
11915	333	Szczyglice Autostrada
11916	457	Rondo 308. Dywizjonu
11917	457	Rondo 308. Dywizjonu
11918	653	Cienista
11919	653	Cienista
11920	499	Kocmyrzów
11921	499	Kocmyrzów
11922	225	Centrum Kongresowe ICE
11923	225	Centrum Kongresowe ICE
11924	225	Centrum Kongresowe ICE
11925	225	Centrum Kongresowe ICE
11926	416	Cmentarz Olszanica
11927	416	Cmentarz Olszanica
11928	225	Centrum Kongresowe ICE
11929	457	Rondo 308. Dywizjonu
11930	457	Rondo 308. Dywizjonu
11931	416	Cmentarz Olszanica
11932	631	Plaza
11933	631	Plaza
11934	457	Rondo 308. Dywizjonu
11935	457	Rondo 308. Dywizjonu
11936	667	TAURON Arena Kraków Wieczysta
11937	229	Szpital Narutowicza
11938	229	Szpital Narutowicza
11939	225	Centrum Kongresowe ICE
11940	225	Centrum Kongresowe ICE
11941	689	Stary Kleparz
11942	653	Cienista
11943	653	Cienista
11944	\N	Krzysztoforzyce Sklep
11945	\N	Krzysztoforzyce Sklep
11946	689	Stary Kleparz
11947	689	Stary Kleparz
11948	432	Czerwone Maki P+R
11949	432	Czerwone Maki P+R
11950	432	Czerwone Maki P+R
11951	432	Czerwone Maki P+R
11952	667	TAURON Arena Kraków Wieczysta
11953	229	Szpital Narutowicza
11954	229	Szpital Narutowicza
11955	667	TAURON Arena Kraków Wieczysta
11956	225	Centrum Kongresowe ICE
11957	667	TAURON Arena Kraków Wieczysta
11958	432	Czerwone Maki P+R
11959	91	Rzaka
11960	\N	Gleboka Zakret
11961	\N	Gleboka Zakret
11962	\N	Dobranowice IV
11963	\N	Hucisko II
11964	\N	Hucisko II
11965	\N	Hucisko I
11966	\N	Droga do Baryczy
11967	\N	Droga do Baryczy
11968	\N	Mrozowa
11969	\N	Brzezie Kosciól
11970	\N	Brzezie Kosciól
11971	\N	Wieliczka Rynek Kopalnia
11972	109	Kolna
11973	96	Grabówki
11974	477	Muzeum Inzynierii Miejskiej
11975	\N	Biezanów Pomnik
11976	\N	Plaszów Tunel
11977	576	Dworzec Glówny Zachód
11978	\N	Bibice Na Czekaj
11979	\N	Bibice Na Czekaj
11980	\N	Wieliczka Os.Asnyka
11981	\N	Wieliczka Os.Asnyka
11982	164	Klasztorna
11983	336	Pradnik Bialy
11984	91	Rzaka
11985	338	Chelmonskiego Osiedle
11986	475	Górka Narodowa
11987	\N	Habina
11988	\N	Habina
11989	\N	Odmetowa
11990	\N	Odmetowa
11991	\N	Senatorska
11992	591	Bronowice Male
11993	\N	Plac Centralny im. R.Reagana
11994	\N	Sciejowice
11995	\N	Sciejowice
11996	\N	Jeziorzany Rondo
11997	\N	Jeziorzany Rondo
11998	\N	Jeziorzany Rondo
11999	\N	Sciejowice
12000	\N	Sciejowice
12001	\N	Sciejowice Na Bagnach
12002	\N	Sciejowice Na Bagnach
12003	\N	Droga do Jeziorzan
12004	\N	Droga do Jeziorzan
12005	\N	Raczna Boisko
12006	86	Powstanców Wielkopolskich
12007	49	Plac Bohaterów Getta
12008	49	Plac Bohaterów Getta
12009	709	Plac Wszystkich Swietych
12010	709	Plac Wszystkich Swietych
12011	436	Filharmonia
12012	436	Filharmonia
12013	\N	Bulwarowa
12014	271	Lagiewniki
12015	\N	Swiatniki Górne Piasna Górka
12016	\N	Swiatniki Górne Piasna Górka
12017	\N	Konary Pod Sosenka
12018	\N	Konary Pod Sosenka
12019	\N	Wlosan Dzial Wschodni
12020	\N	Wlosan Dzial Wschodni
12021	\N	Mogilany Rynek
12022	494	Lubicz
12023	587	Prokocim
12024	271	Lagiewniki
12025	\N	Wieliczka Rynek Kopalnia
12026	565	Wzgórza Krzeslawickie
12027	454	Kasztanowa
12028	454	Kasztanowa
12029	\N	Jeleniowa
12030	\N	Jeleniowa
12031	\N	Sw.Gertrudy
12032	\N	Cmentarz Póllanki
12033	\N	Cmentarz Póllanki
12034	200	Cholerzyn Granica
12035	200	Cholerzyn Granica
12036	\N	Cholerzyn Zagórze
12037	\N	Cholerzyn Zagórze
12038	\N	Zwirownia
12039	321	Liszki UG
12040	\N	Czulów Skaly
12041	\N	Czulów Skaly
12042	\N	Czulów Kapliczka
12043	\N	Czulów Kapliczka
12044	384	Sidzina
12045	521	Kryspinów Stopien Wodny
12046	521	Kryspinów Stopien Wodny
12047	472	Granica Miasta
12048	472	Granica Miasta
12049	472	Granica Miasta
12050	\N	Jeziorzany Kosciól
12051	\N	Jeziorzany Kosciól
12052	15	Golkowice
12053	\N	Golkowice Kosciól
12054	\N	Golkowice Kosciól
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: stop_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stop_groups (id, name) FROM stdin;
1	Brzezinka
2	Batalionu \\"Skala\\" AK
3	Soboniowice
4	Skotniki
5	Królowej Jadwigi
6	Tonie
7	Bronowice
8	Rzozów Skotnica
9	Tonie Skrzyzowanie
10	Skrzyzowanie do Podchruscia NZ
11	Rondo Kocmyrzowskie im. Ks. Gorzelanego
12	Prokocim Szpital
13	Pawlikowice Mostki
14	Nowa Wies Kosciól
15	Golkowice
16	Sanktuarium Bozego Milosierdzia
17	Zajezdnia Plaszów
18	Borek Szlachecki II
19	Zeslawice
20	Piaski Wielkie
21	Wieliczka Rynek
22	Rusocice Wies
23	Januszowice
24	Kobierzynska
25	Park Jordana NZ
26	Czernichów GS
27	Wola Radziszowska Mala Ostra Góra
28	Agencja Kraków Wschód NZ
29	Os. Jagiellonskie
30	Szpital Rydygiera
31	Rzebika
32	Mników Sklep
33	Przewóz
34	Piekary
35	Piekary Dól
36	Skawina Sad
37	Klasztor Cystersów
38	Kliny
39	Stara Wola
40	Skawina Podbory
41	Zbydniowice Szkola
42	Chabrowa
43	Kraków Airport
44	Skawina Podgórki Skawinskie
45	Pedzichów
46	Dunikowskiego
47	Bedkowice
48	Bielany Szkola
49	Plac Bohaterów Getta
50	Lowinskiego
51	Petla autobusowa Leg
52	Garbarnia
53	Wielicka
54	Siewna
55	Cracovia Stadion
56	Piasta Kolodzieja
57	209, 218, 226, 258, BUS
58	Walcownia
59	Pleszów - \\"Cementownia\\"
60	Makuszynskiego
61	Modlniczka Trzcie
62	Opolska Kladka
63	Salwator
64	Batorego
65	Smardzowice LINIA 267
66	Skawina Nad Potokiem
67	DH Wanda
68	Skawina Ajka
69	Przeginia Duchowna Bar
70	Piekary Górne
71	Siewna Wiadukt
72	Sielanka
73	Park Decjusza
74	Uniwersytet Jagiellonski
75	Os.Lokietka
76	garlica 1
77	Cichy Kacik
78	Rondo Mlynskie
79	Modlnica Trojadyn Szydlo
80	Banacha
81	UR Balicka
82	Bialopradnicka
83	Plac Wolnica
84	Wodociagi
85	Jaskowice PKP
86	Powstanców Wielkopolskich
87	Dauna
88	Rudawa Kosciól
89	Wola Radziszowska Chorzyny
90	Pekowice
91	Rzaka
92	Pawlikowice Taszyce
93	Fort Winnica
94	Uniwersytet Pedagogiczny
95	Malborska Szkola n\\/z
96	Grabówki
97	Michalowice Kozlica
98	Swoszowice Pawilon
99	Witosa
100	Skawina
101	Radziszów Cmentarz
102	Soltysowska Zaklady
103	Pasternik
104	Libertów Dolny
105	Pielegniarek
106	Os. Kurdwanów
107	Bora-Komorowskiego
108	Jaskowice
109	Kolna
110	Nowy Biezanów
111	Osiedle Piastów
112	Rudawa PKP
113	Kostrze Szkola
114	Mrozowa NZ
115	Kleszczów
116	BUS
117	Kostrze
118	Wola Radziszowska Lipki
119	Koksochemia NZ
120	Skawina Pilsudskiego
121	Lipinskiego
122	Czernichów II
123	Sawiczewskich - na zadanie
124	Meksyk NZ
125	Lukasiewicza
126	Pychowicka Górka
127	Ratanice I
128	Na Czekaj
129	Kopiec Wandy
130	Jezynowa NZ
131	Stella-Sawickiego
132	Bielanskie Skaly
133	Giebultów Plac Zabaw NZ
134	Konfederacka
135	Maszyce Skrzyzowanie
136	Zielonki Rozjazd
137	Grabie Kosciól
138	Skawina Pileckiego
139	Grota Roweckiego
140	Grebynice
141	Urzednicza
142	Park \\"Skaly Twardowskiego\\"
143	Os. Zloty Wiek
144	Lipska
145	Wlotowa
146	plk. Dabka
147	Slomiana
148	Prokocim Cmentarz
149	Herberta
150	Bacutil
151	Judyma
152	Radziszów Centrum
153	Os. Podwawelskie
154	Krowodrza Urzedy Skarbowe
155	Bolechowice Drogi NZ
156	Ks. Targosza
157	Opolska
158	Bialucha
159	Zakliki n\\/z
160	Mlynka Petla
161	Torfowa
162	Wesola
163	Medweckiego
164	Klasztorna
165	Brzeznica Pasieka
166	Piekarnia
167	Darwina
168	Libertów Dzialy
169	Ofiar Dabia
170	Stoczniowców
171	Borek Falecki
172	TAURON Arena Kraków Al. Pokoju n\\/z
173	Skotniki Szkola
174	Wyzral
175	Skawina Rzepnik
176	Wieliczka
177	Chelmska N\\/Z
178	Opatkowice Wiadukt
179	Zablocie
180	Wola Radziszowska
181	Uniwersytet Ekonomiczny
182	Radzikowskiego
183	Liszki Tyniecka
184	Turowicza
185	Hofmana
186	Brama nr 5 NZ
187	Wiadukty
188	Os. Dywizjonu 303
189	Rzozów I
190	Lindego n\\/z
191	Urzad Skarbowy Nowa Huta
192	Piekary Sklep
193	Grabie
194	Zarzecze
195	Kleberga
196	Zachodnia
197	Batowice PKP
198	Tonie Katy
199	Winnicka
200	Cholerzyn Granica
201	Grottgera
202	Wilga
203	Zaskale NZ
204	Balice Autostrada NZ
205	Zelczyna Szkola
206	Raczna Kapliczka
207	Skawina Centrum Sportowe
208	Wróblowice Dom Kultury (n\\/z)
209	Farmina
210	Bujaka
211	Kopanka Szkola
212	Fiszera
213	Borek Szlachecki I
214	Gromadzka
215	Slonecznikowa
216	Podgaje
217	Przeginia Narodowa
218	Jurczyce Dom Ludowy
219	Armii Krajowej
220	Rondo Mogilskie
221	Korzkiew Zamek
222	Wieclawice Stare
223	Wielicka Granica Miasta
224	Brzozówka
225	Centrum Kongresowe ICE
226	Aleja Przyjazni
227	Zajezdnia Nowa Huta
228	Petrazyckiego
229	Szpital Narutowicza
230	Kopiec Wandy NZ
231	Leczycka
232	Bolechowice Krzewiny NZ
233	Skawina Elektrownia
234	Plac Inwalidów
235	Clo
236	Conrada
237	Wladyslawa Lokietka
238	Grota-Roweckiego
239	Radziszów Kamionna
240	Rzozów Baseny
241	Nowa Wies Szlachecka
242	M1 Al. Pokoju
243	Las Borkowski
244	Fort Bodzów
245	Skawina Samborek Most
246	Baczynskiego
247	Kapielowa
248	Osiedle Mistrzejowice Nowe
249	Modlnica Skrzyzowanie NZ
250	Dworzec Glówny Wschód
251	Olsza II
252	Fort Mogila
253	Skala Kmity NZ
254	Rodzinna
255	Zagacie II
256	Janasówka
257	Opolska Estakada
258	Biezanowska
259	Skawina Tyniecka Osiedle
260	Szczyglice
261	Kantorowice
262	Smolki
263	Klokoczyn
264	Modlniczka Mala
265	Zajezdnia Bienczyce
266	Borsucza
267	Plac Centralny im. R. Reagana
268	Architektow
269	Jordanowska n\\/z
270	Rondo Hipokratesa
271	Lagiewniki
272	Przeginia Narodowa II
273	Majora
274	Brodowicza
275	Wzgorza Krzeslawickie
276	Ochodza
277	Cholerzyn Sklep
278	Smolenskiego
279	Malczewskiego
280	Brzezie Narodowe NZ
281	Rzaska UR
282	Górka Narodowa Wschód
283	Zielony Dól
284	Lutnia
285	Przeginia Duchowna Centrum
286	Kruszwicka
287	Zawila
288	Sudolska n\\/z
289	Sikorki
290	Instytut Pediatrii
291	Urzad Marszalkowski
292	Pleszów
293	Giebultów
294	Piekary Borki
295	Bronowice Wiadukt
296	Nowa Wies
297	Czarnowiejska
298	Bronowice Wiadukt NZ
299	Kurdwanów
300	Mydlniki Granica Miasta NZ
301	Os.Zlotego Wieku
302	Wybickiego
303	Bosaków
304	Grebalów
305	Zajezdnia Wola Duchacka
306	Kamienskiego
307	Stradom
308	Soltysowska Osiedle
309	Szczecinska
310	Poczta Glówna
311	Zabierzów
312	Dubie
313	Tuchowska
314	Pawlikowice
315	Grabie Kuznia
316	Dworcowa
317	Lobzów PKP
318	Kosocice
319	Leroy Merlin
320	Pilotów
321	Liszki UG
322	Makowskiego
323	Maslomiaca Staw
324	Katowicka
325	Wrony
326	Os. Zgody
327	Wiklinowa
328	Rzepichy N\\/Z
329	Sidzina Olszyny
330	Lusina Granica
331	Krowoderskich Zuchów
332	Wieliczka Cmentarz
333	Szczyglice Autostrada
334	Wislicka
335	Tondosa (NZ)
336	Pradnik Bialy
337	Akacjowa
338	Chelmonskiego Osiedle
339	Ukraina
340	Kobylany Remiza NZ
341	Meissnera
342	Libertów Krzyzówka
343	Piekary Palac
344	TAURON Arena Kraków n\\/z
345	Kopanka Petla
346	Zbydniowice
347	Kampus UJ
348	Bardosa NZ
349	Radziszów PKP
350	Rondo Ofiar Katynia
351	Droga do Niegoszowic NZ
352	Halszki
353	Skawina Starostwo Powiatowe
354	Os. Na Stoku
355	Ruczaj
356	Krzyszkowice Os. Szymanowskiego
357	Wieliczka CPN
358	Baba Jaga
359	Starowislna
360	Rzaska Autostrada
361	Swoszowice Poczta
362	Misnienska
363	Wielkie Drogi Trzebol
364	Instytut Reumatologii
365	Biezanów
366	Szczyglice Dom Kultury
367	Os. Kalinowe
368	Os. Strusia
369	Zabierzów Gimnazjum
370	Libertów
371	Giebultów Trojadyn NZ
372	Póllanki
373	Korzkiew Botoja
374	Nowy Prokocim
375	Bielany
376	Rózyckiego
377	Chelm
378	Panienskich Skal N\\/Z
379	Os. Kolorowe
380	AGH
381	Dajwór
382	Goluchowice
383	Isep
384	Sidzina
385	Kobierzyn
386	Rondo Matecznego
387	Skawina Os. Radziszowskie
388	Olszecka
389	Grabie Szczurów
390	Brzezinka Skrzyzowanie
391	Maslomiaca
392	Kamienskiego Wiadukt n\\/z
393	Niepolomice Podgrabie
394	Wawel
395	Olszanica Bory
396	Wegrzce
397	Czernichów
398	Sulkowskiego
399	Taklinskiego
400	Bibice petla
401	Piekary Korea
402	Skawina Koncentraty
403	Dworzec Glówny Tunel
404	Radziszów Petla
405	Agatowa
406	Malborska
407	Chrosna petla
408	Nowolipki
409	Lubocza Bugaj
410	Podwierzbie
411	Brzegi I
412	EC Leg
413	Polanka Hallera Dwór
414	Rzaska
415	Jasienskiego
416	Cmentarz Olszanica
417	232 LUCZYCE
418	Komorowskiego
419	Grebynice Mogielki
420	Kopanka Druga
421	Skawina Ofiar Katynia
422	Kobylany
423	Hejnal
424	Cracovia Blonia
425	Skawina Rynek
426	Tyniecka Autostrada
427	Maly Plaszów
428	Imbramowska
429	Narzymskiego
430	Biprostal
431	Elektromontaz
432	Czerwone Maki P+R
433	Struga
434	Plaszów Szkola
435	Wola Radziszowska Podgazle
436	Filharmonia
437	Saska
438	Liszki I
439	Droga do Rzaski
440	Batowice
441	Swoszowice Autostrada
442	Piaski Nowe
443	Radziszów Stare Sanatoruim
444	Rondo Grzegórzeckie
445	Skawina Korabniki
446	Trojanowice
447	Aleja 29 Listopada
448	Olszanica Kapliczka
449	Rondo Czyzynskie
450	Gospodarska
451	Elektromontaz NZ
452	Skawina Cmentarz Komunalny
453	Biskupa Prandoty
454	Kasztanowa
455	232 LUCZYCE LAS
456	Karpinskiego
457	Rondo 308. Dywizjonu
458	Dworzec Towarowy
459	Wielkie Drogi Osrodek Zdrowia
460	Nowa Wies Kapliczka
461	Krowodrza Górka
462	Kobylany I NZ
463	Zagórzany
464	Giebultów Trojadyn Trafo
465	Os. Piastów
466	Park Wodny
467	Goluchowice Jurczyce
468	Grabie Polanka
469	Forteczna
470	Rondo Barei
471	Osiedle Oswiecenia
472	Granica Miasta
473	Kaszów II
474	Siwka
475	Górka Narodowa
476	209, 226, 258, BUS
477	Muzeum Inzynierii Miejskiej
478	Aleja Róz
479	Przykopy
480	Czerwiakowskiego
481	Bogucianka
482	Zdrojowa
483	Os Na Stoku
484	Skawina Wyspianskiego
485	Instal
486	Wieliczka Ochronka
487	232 LUCZYCE ZJAWIENIE
488	Nowa Wies Jesionka
489	Rynek Falecki
490	Skawina Popieluszki
491	Norymberska
492	Okulickiego
493	Kryspinów Sanka
494	Lubicz
495	Luborzyca I
496	Kopalina N\\/Z
497	Os. Oswiecenia
498	Kuklinskiego
499	Kocmyrzów
500	Szczyglice Podkamycze
501	Tretówka
502	Balice Olszanica Bory
503	Francesco Nullo
504	Brzezie Kulka NZ
505	Cracovia
506	Powstanców garaze n\\/z
507	Powstanców
508	Wilczkowice
509	Os.Kosciuszkowskie
510	TK BUS Nowa Huta > Wieliczka
511	Kraków Business Park
512	Brzyczyna
513	Zakamycze
514	Babinskiego
515	Kryspinów
516	Zagacie I
517	Czernichów Bór
518	Olszanica Ogródki Dzialkowe
519	Nowy Kleparz
520	Zielonki Transformator
521	Kryspinów Stopien Wodny
522	Pychowice
523	Tomaszowice I NZ
524	ZOO
525	Miasteczko Studenckie AGH
526	AWF
527	Goluchowice Sklep
528	Bunscha
529	Wyzral Wielka Droga
530	Elektrocieplownia Kraków
531	Bolechowice
532	Rondo 308 Dywizjonu
533	Rzozów Zagonnie
534	Brzeznica
535	Przybyszewskiego
536	Clepardia
537	Kozienicka
538	Kaszów Tyralówka
539	Brzegi III
540	Centrum JP II
541	Wola Radziszowska Leg
542	Zabierzów Dzialki
543	Nowosadecka
544	Podgórki Tynieckie
545	Fabryczna
546	Osiedle Zgody
547	Solvay
548	Dworzec Plaszów
549	Giebultów Morgi
550	Krzeszowice Zielona
551	Soltysowska
552	Albatrosów
553	Politechnika
554	Sw. Wawrzynca
555	Kopiec Kosciuszki
556	Bielany Klasztor
557	Tomaszowice
558	Myslenicka
559	Iwanowice - Centrum
560	Skawina Korabnicka Szkola
561	Makowa
562	Mydlniki PKP
563	Motyla
564	Kupaly
565	Wzgórza Krzeslawickie
566	Jarzebiny
567	Jezowa
568	Popielidów
569	Muzeum Lotnictwa
570	Wieliczka Park
571	Wegrzce Wielkie - MPK 243
572	Wielkie Drogi Szkola
573	Dworzec Glówny
574	Skawina Wyspianskiego Szkola
575	Wyzral I
576	Dworzec Glówny Zachód
577	Swoszowice Sklep
578	Zawila Cmentarz
579	Wola Duchacka
580	Przybyslawice
581	Rzozów Szkola
582	Radzikowskiego Osiedle
583	Natansona
584	Kosmowskiej
585	Lublanska
586	Glowackiego
587	Prokocim
588	Suche Stawy
589	Reymana NZ
590	Mydlniki Stawy NZ
591	Bronowice Male
592	Trojanowice Strugi
593	Cholerzyn Skrzyzowanie
594	Klimeckiego
595	Azory
596	Kliny Zacisze
597	Pradnik Bialy Zachód
598	Kapelanka
599	Rondo Kocmyrzowskie
600	Szyce II NZ
601	Orzeszkowej
602	Gnieznienska
603	Kaszów
604	Kawiory
605	Wegrzce petla
606	Mazowiecka
607	Koszykarska
608	Lagiewniki ZUS
609	Marii Dabrowskiej
610	Teatr Bagatela
611	Kuznicy Kollatajowskiej
612	Pszona
613	Dabie
614	Brozka NZ
615	Rostworowskiego
616	Brzeznica Kuznia
617	Na Zaleczu
618	Gustawa Morcinka
619	Cmentarz Podgórski
620	Wankowicza
621	Czyzyny
622	Miechowity
623	Skawina Zachodnia
624	Centralna
625	Przegon
626	Luborzyca
627	Kenara - na zadanie
628	Rzozów PKP
629	Maszyce Remiza
630	Na Krepaku
631	Plaza
632	Pachonskiego
633	Mistrzejowice
634	Zielonki UG
635	Rudawa Szkola
636	Cmentarz Rakowicki
637	Tyniec Kamieniolom
638	Poroninska
639	Wieliczka Kopalnia Soli
640	Dworzec Plaszów Estakada
641	Zeslawice I
642	Lubocza PKP
643	Pawlikowice Brzeziny
644	Bonarka
645	Skrajna N\\/Z
646	Strzelnica
647	Wroclawska
648	Droga do Kaszowa
649	Jugowicka
650	Rondo Piastowskie
651	Arka
652	Skawina Energetyków Przejazd PKP
653	Cienista
654	Raczkiewicza
655	Cmentarz Rakowicki Zachód n\\/z
656	Mackiewicza
657	Libertów Droga Do Sidziny
658	Mydlniki
659	Polana Zywiecka
660	Niepolomice Rynek
661	Swietego Wawrzynca
662	Stawowa
663	Kurdwanów Szkola
664	Wesele
665	Skawina Radziszowska
666	Wola Radziszowska Most
667	TAURON Arena Kraków Wieczysta
668	Prokocim Rynek
669	Trojadyn Skrzyzowanie NZ
670	Wielkie Drogi
671	Kaszów Lysa Góra
672	Rynek Debnicki
673	Swoszowice
674	Wazewskiego
675	Radziszów Kladka
676	Modlnica II NZ
677	Skawina PKP
678	Tyniec
679	Prokocim UJ
680	Cechowa N\\/Z
681	Osiedle Na Skarpie
682	Chmieleniec
683	Balice Instytut NZ
684	Cmentarz Batowice
685	Pisary Mleczarnia
686	Zielinskiego
687	Skarzynskiego
688	Dziady
689	Stary Kleparz
690	Skawina Kopernika
691	Chopina
692	Lekarska
693	Tor Kajakowy
694	Rusocice Zaleg
695	Cholerzyn
696	Przystanek Autobusu dla klientów galeri bronowice
697	Rzemieslnicza
698	Poziomkowa
699	Skawina Podlipki
700	Czulówek Kaplica
701	Stojalowskiego
702	Ludwinów
703	Skawina Cmentarz
704	Hala Targowa
705	Os. Na Lotnisku
706	Czerwienskiego
707	Wróblowice Cmentarz
708	Jubilat
709	Plac Wszystkich Swietych
710	Przegorzaly
711	Teligi
712	Biezanów Bazy
713	Prosta
714	Zabierzów Piekarnia
715	Grabie Dom Kultury
716	Poskwitów
717	Petofiego
718	Damice
719	Brama nr 4 NZ
720	Skawina Szkola
721	Os. Zielone
722	Puszkarska
723	Branice Szkola
724	Lubocza Przychodnia
725	Wielkie Drogi PKP
726	Bratyslawska
727	Zelczyna I
728	Kleeberga
729	Pradnik Czerwony
730	Nalkowskiej
731	Zlocien
732	Tischnera
733	Ratanice
734	Szczyglice Most NZ
735	Skawina Robotnicza
736	Korona
737	Grebynice OSP
738	Warchalowskiego
739	Cmentarz Grebalów
740	Oleandry
741	Przystanek MPK
742	Dom Spokojnej Starosci
743	Sw. Gertrudy
744	Krasieniec Zakupny (MPK Kraków)
745	Lubocza Szkola
746	Libertów Szkola
747	Bagienna
748	M1 Nowohucka
749	Skawina Energetyków
750	Bibice cmentarz
751	Kabel
752	Wola Radziszowska Centrum
753	Cwiklinskiej
754	Szwedzka
755	Opatkowice
756	Góra Borkowska
757	Piekary Na Brzegu
758	Liszki Krzyzówka
759	Bienczycka
760	Kopanka Kapliczka
761	Libertów Zgodna
762	Barbary
763	Limanowskiego
764	Zyzna
765	Lanowa
766	Pleszowska
767	Lesmiana
768	Landaua
769	Rudawa Bloki
770	Szyce I
771	Cystersów
772	Rzaska Jednostka Wojskowa
773	Boleslawa Smialego
774	Tonie Gliniki
775	Tomaszowice Wedonka NZ
776	Blokowa
777	Miodowa
778	Brücknera
779	Wyki
780	Skawina 29 Listopada
781	Borek Falecki I
782	Modlniczka
783	Zelczyna Sklep
784	Piekary III
785	Wróblowice Rozwidlenie
786	Strzelców
787	Wyzral Szkola
788	Zdrowa
789	Orszy-Broniewskiego
790	Michalowice
791	Komuny Paryskiej
792	Borkowska
793	Teatr Ludowy
794	Skawina Wojska Polskiego
795	Na Zaleczu Szkola
796	Slomczynskiego
797	Mlynówka SKA n\\/z
798	Giebultów Zbiornik NZ
799	Wieliczka Kosciól
800	Architektów
801	Zeromskiego
802	Brzezie Dzialki NZ
803	Skosna
804	Gielda Balicka P+R n\\/z
805	Benedyktowicza
806	Os. Na Skarpie
807	Bibice
808	Balice Winna Góra NZ
809	Zabierzów Sklep
810	Jerzmanowskiego
811	Uniwersytet Rolniczy
812	Kombinat
813	Teatr Variété
814	Kostrze OSP
815	Rakowicka NZ
816	Przeginia Duchowna Szkola
\.


--
-- Name: stop_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stop_groups_id_seq', 816, true);


--
-- Name: stop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stop_id_seq', 5506, true);


--
-- Data for Name: stops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stops (id, location, stop_group_id) FROM stdin;
3634	(20.065041166373021,50.079135483326404)	812
3635	(20.038522333474589,50.085391149121904)	653
3636	(20.007083323413298,50.067835588201085)	532
3637	(19.962421861095805,50.069952521666607)	274
3638	(20.026280144794526,50.079017885224879)	11
3639	(19.972860180393923,50.080242062183373)	78
3640	(19.977541557135368,50.081577718454071)	337
3641	(19.96852363514904,50.088574847404288)	388
3642	(19.982814696240837,50.071767874255926)	667
3643	(20.059138546339195,50.09079378863143)	167
3644	(20.060784333027328,50.091901457135805)	566
3645	(20.065214755587732,50.094923133229855)	565
3646	(20.026540821983218,50.080260586189382)	11
3647	(20.020491351005802,50.084550360414561)	67
3648	(20.011253236423101,50.094378728618722)	650
3649	(20.01301192734698,50.09783257564041)	56
3650	(20.021420652610626,50.090080153395235)	270
3651	(19.976271279709405,50.059628782984866)	169
3652	(19.999828786216625,50.094529099961676)	362
3653	(19.996334370783583,50.095030253952409)	633
3654	(19.967381349384539,50.060176456538244)	503
3655	(20.005373498984937,50.067397969036413)	457
3656	(19.925914817099706,50.059497690019235)	505
3657	(19.98394046965609,50.063038122100693)	631
3658	(20.032943422541337,50.082405934306649)	793
3659	(20.028557591705805,50.072355278030329)	379
3660	(20.046241479564173,50.074531387732236)	433
3661	(20.026489860011907,50.079050574647248)	11
3662	(20.019725831788946,50.085766239288915)	67
3663	(20.004638238438559,50.074301639766247)	131
3664	(20.012040632407235,50.101990334890587)	465
3665	(19.999456545896692,50.074035262883392)	526
3666	(20.004320229032174,50.093747571309763)	301
3667	(19.962374419523854,50.058826718670218)	813
3668	(19.944241177836343,50.067274419783637)	576
3669	(19.982008021879437,50.101224480397633)	684
3670	(19.931246629527408,50.088675597880439)	461
3671	(19.934161939270183,50.083725078228092)	726
3672	(19.983159695375463,50.101625051550286)	684
3673	(19.939603889905584,50.054461423497429)	394
3674	(19.828875931498313,50.058289941590971)	513
3675	(19.946898073504286,50.075636122570494)	655
3676	(19.970561862543747,50.083359291973608)	622
3677	(19.947734838898072,50.068245463266294)	403
3678	(19.926006347482343,50.068817360519802)	234
3679	(19.957127683413347,50.012488875717992)	99
3680	(19.965011282443214,50.014112869457868)	543
3681	(19.929657839780873,50.048259653339358)	225
3682	(19.95569278540907,50.012752821848949)	99
3683	(20.02258095946695,50.015412483544935)	110
3684	(19.961415781257898,50.04183559510912)	86
3685	(20.0232537748347,50.015703084127949)	110
3686	(19.99081983286672,50.017830075877271)	587
3687	(19.947642218868026,50.005761057316761)	352
3688	(19.950408079277224,50.013605345220725)	299
3689	(19.95683741810646,50.012343617336001)	99
3690	(19.862033566986298,50.102377327360131)	439
3691	(19.926597355475106,50.013234948919489)	171
3692	(19.927018629928625,50.013089019985216)	171
3693	(19.983338146094042,50.04970704037936)	170
3694	(19.981107889297618,50.048721160928096)	170
3695	(19.991810070907633,50.03943635914473)	765
3696	(20.038834559367814,50.072558287725172)	267
3697	(20.104179541232384,50.071766868427545)	119
3698	(19.949157247866623,50.0311717187966)	392
3699	(20.035496550247984,50.071710290581109)	267
3700	(20.091775246544955,50.069199491485499)	186
3701	(20.059000580212967,50.067502239911875)	588
3702	(19.93634492213269,50.030121131052844)	271
3703	(19.957481399727271,50.074239446044686)	636
3704	(19.973229822323873,50.026461089213086)	406
3705	(19.948268933768301,50.087506154749661)	428
3706	(19.947564937720756,50.088245270971498)	428
3707	(19.934610790185129,50.082829052778862)	726
3708	(19.915208360719078,50.072402468145185)	430
3709	(19.973834325180746,50.096570680117622)	729
3710	(19.963784171818617,50.093007365440513)	507
3711	(19.943193272301581,50.04844061862886)	83
3712	(19.94353433194172,50.047970729136978)	83
3713	(19.945827536830961,50.057363741290288)	359
3714	(19.917730056288832,50.077958161206652)	606
3715	(19.916388616504946,50.081657849448419)	317
3716	(19.93337747695216,50.063806826440747)	610
3717	(19.946752898941295,50.076160578252058)	636
3718	(19.987562457655429,50.089281525660851)	497
3719	(19.906387916371528,50.018901450740913)	161
3720	(19.905117555126534,50.017925545754395)	161
3721	(20.012665838564942,50.069560080960024)	624
3722	(20.016744388830148,50.072411269143515)	449
3723	(20.013006143833792,50.069259925007373)	624
3724	(19.904137040093303,50.04899952393248)	279
3725	(19.916830845716358,50.052936084757931)	63
3726	(20.026361281617227,50.038090560771195)	567
3727	(19.788979664953985,50.083912246125976)	476
3728	(19.789557178082646,50.08368115705548)	57
3729	(19.761875775214062,50.057909570824961)	593
3730	(19.93024834485945,50.096200032359292)	336
3731	(19.775453620164825,50.058293964904493)	695
3732	(19.754553093144576,50.058323217746562)	200
3733	(19.954854343634619,50.045131275617898)	763
3734	(19.955949187827173,50.044975120761791)	763
3735	(20.056793457469322,50.088347027276029)	187
3736	(19.981701830956496,50.023098940212122)	258
3737	(19.977180632384716,50.0266705529734)	751
3738	(19.976112694101374,50.027336578999581)	751
3739	(19.991104649936542,50.017526064249154)	587
3740	(19.980517048942914,50.023355174992162)	258
3741	(19.982043225872758,50.022826193082864)	258
3742	(19.990709778478045,50.017631340953017)	587
3743	(20.006356277132028,50.016599863948471)	711
3744	(19.964682125105583,50.013476096273791)	543
3745	(20.023013130394588,50.015264878230028)	110
3746	(19.987931764309252,50.01948457974467)	145
3747	(20.006841840782869,50.016644790949499)	711
3748	(19.970051488459486,50.033568943104228)	316
3749	(20.018783286777079,50.016079180123342)	753
3750	(20.019107247334745,50.016085131274593)	753
3751	(19.970619781494662,50.032656070029617)	316
3752	(20.012031747589869,50.016118239792149)	374
3753	(20.02027317006619,50.015636783273862)	753
3754	(19.964905251368066,50.038687184639087)	619
3755	(20.023502549720888,50.01495407726037)	110
3756	(19.932684461197791,50.022287069070757)	16
3757	(19.998814575932641,50.014457281859279)	12
3758	(19.929897562211636,50.016811758460705)	547
3759	(19.931038255414503,50.048565844262299)	225
3760	(19.927790016477672,50.01460497099319)	781
3761	(19.93544185588479,50.02968133259332)	271
3762	(19.91050795705743,50.061416056198567)	589
3763	(19.935547551683783,50.029842768048439)	271
3764	(19.937994396858215,50.050502063895372)	601
3765	(19.938699482553176,50.033636585062851)	697
3766	(19.903485430940606,50.063055556459318)	77
3767	(19.948854577343042,50.058663942110563)	704
3768	(19.979718840303718,50.061629040358213)	613
3769	(19.971261835277772,50.060249462914861)	545
3770	(19.979127580853852,50.060730751795091)	613
3771	(19.933582749760888,50.084695870253647)	726
3772	(19.937880151517959,50.080653194534051)	229
3773	(20.012752339805669,50.069411218359647)	624
3774	(19.977920167701711,50.067815974547671)	158
3775	(19.982821234125311,50.071063375294187)	667
3776	(20.036331974537291,50.072960283801393)	267
3777	(20.033937348619645,50.081007497581169)	793
3778	(20.039224569322471,50.085544537949971)	653
3779	(20.043672342422468,50.106435090505435)	19
3780	(20.035246350438257,50.093966925715819)	717
3781	(19.958686885041683,50.066033562837816)	220
3782	(20.050101597432672,50.105453821100916)	641
3783	(20.03294115942748,50.091444894869937)	265
3784	(20.064856848322218,50.095166627517045)	275
3785	(20.038282694862858,50.089265767682882)	60
3786	(20.058566397628567,50.091337271233179)	167
3787	(20.045961356360124,50.086893186170585)	620
3788	(20.056281658461529,50.093583621283699)	354
3789	(20.07208917347549,50.104087151788491)	618
3790	(20.050815065030804,50.095792588046038)	166
3791	(20.061789574674915,50.104279851742426)	261
3792	(20.050209137250391,50.097779099098176)	483
3793	(20.017402954962478,50.095367960831275)	564
3794	(20.038713943781147,50.079115366758792)	801
3795	(20.038261153371703,50.075166149259552)	478
3796	(19.865737278541587,50.08085159418215)	81
3797	(20.069089290329714,50.101314418218692)	304
3798	(20.056013437559979,50.088123565737419)	187
3799	(20.000600424222796,50.087737746734348)	334
3800	(20.054708459054893,50.097215583747811)	268
3801	(20.010016486609857,50.091417066951408)	367
3802	(20.032623066202035,50.093419587438575)	408
3803	(20.027283374785355,50.093405841117374)	50
3804	(19.9051417788267,50.02670575696672)	355
3805	(20.021573538524535,50.092664294143617)	30
3806	(19.912054418192952,50.029522998442388)	491
3807	(19.901668066694526,50.023883067254019)	347
3808	(20.008028466815144,50.010651562542364)	810
3809	(20.009245686794003,50.009684123278078)	810
3810	(19.939994318955399,50.036919357440752)	386
3811	(19.926725179498504,50.056077789705427)	708
3812	(19.965913761957893,50.027303554301056)	561
3813	(19.915885534676448,50.073451882422518)	430
3814	(19.941027220883484,50.036798071301831)	386
3815	(19.974811655090775,50.026002180014331)	406
3816	(19.890904697191331,50.071930986091665)	219
3817	(19.90557386593531,50.06988462825089)	525
3818	(19.904230246856599,50.070371281549136)	525
3819	(19.913023617656904,50.06836213935847)	604
3820	(19.890840827089164,50.071741135984801)	219
3821	(19.935135916418943,50.073804425269998)	519
3822	(19.935301878101768,50.074775887847807)	519
3823	(19.924350753967531,50.064268836943683)	380
3824	(19.936182564668229,50.074773289457823)	519
3825	(19.937128546260396,50.073629159674624)	519
3826	(19.929223824834537,50.071733424633891)	201
3827	(19.923103778232388,50.062749365536376)	380
3828	(19.936381718687613,50.074204325870397)	519
3829	(19.930076432025345,50.071638373851897)	201
3830	(19.92695769349254,50.069411721273831)	234
3831	(19.90371107177404,50.069739369868898)	525
3832	(19.913978148790306,50.068752233132159)	604
3833	(19.913622337000589,50.068448221504042)	604
3834	(19.898978984518379,50.070672275692118)	535
3835	(19.897824796451403,50.071049545153954)	535
3836	(19.948976869310343,50.005609344869299)	352
3837	(20.053853421112166,49.959415335375553)	92
3838	(20.057869945293898,49.966035697778125)	643
3839	(20.058202539211806,49.966432497074379)	643
3840	(20.05803817009058,49.945838244796079)	13
3841	(20.057880422672866,49.945433398872808)	13
3842	(20.054815244501324,49.953575663434577)	314
3843	(20.053708498006301,49.958959192204873)	92
3844	(20.055004591694029,49.953944634812274)	314
3845	(20.216310965507034,50.03332846630218)	660
3846	(19.95592353920344,50.005101652994085)	701
3847	(19.949133527080644,50.014159389020477)	299
3848	(19.948776458005455,50.010430699393737)	210
3849	(19.95019467602242,50.014636654587179)	299
3850	(19.94372937882855,50.005788969054322)	558
3851	(19.950637575786118,50.013720764027418)	299
3852	(19.94541816467995,50.005584366797848)	558
3853	(19.965487039267341,50.00508136878841)	663
3854	(19.948524497996061,50.009630562916811)	210
3855	(19.966429249003056,50.005687464206886)	663
3856	(19.949579863424646,50.005567435353434)	352
3857	(19.954587631475647,50.005206678240853)	701
3858	(20.064785518326232,49.984146224508038)	21
3859	(20.06352144350862,49.984291482890058)	21
3860	(20.065102018990046,49.987373760144031)	332
3861	(20.064540682934535,49.987278457904949)	332
3862	(20.050311396469112,49.987043261701899)	570
3863	(20.050552292366316,49.986738076607367)	570
3864	(20.047539081994469,49.990051526750868)	570
3865	(20.04243006055313,49.993452819239678)	357
3866	(20.043090554523189,49.993009248923727)	357
3867	(20.053569358413625,49.988667423079846)	799
3868	(20.055583026832036,49.988492241303504)	799
3869	(20.074978499318433,49.986279837960865)	176
3870	(20.069851456785273,49.98239775950605)	486
3871	(20.070399130338615,49.981530232527604)	486
3872	(20.028202282830279,49.999752154750695)	223
3873	(20.027687298699277,49.999448646036768)	223
3874	(19.988939771984889,50.05252478476919)	607
3875	(20.004060138576676,50.063997598556966)	748
3876	(20.000258777849439,50.056429326724526)	530
3877	(19.989971416627498,50.052572561617296)	607
3878	(20.001704656146867,50.05699518900775)	530
3879	(20.003478434496458,50.063088916433941)	748
3880	(19.9429495265573,50.00478934328185)	558
3881	(19.924611682613317,50.006754983395069)	756
3882	(19.92563528062885,50.007067544564393)	756
3883	(20.055590319087798,49.984606726268389)	639
3884	(20.057030665329137,49.984202718535435)	639
3885	(19.938070085443854,50.088903753284825)	788
3886	(19.947519088710404,50.095933655476443)	71
3887	(19.938492533363814,50.086890168685443)	692
3888	(19.94531598928026,50.094089217683113)	536
3889	(19.938239567526036,50.086531842324774)	692
3890	(19.938791180573872,50.089009784359966)	788
3891	(19.946421981404029,50.09581077677592)	71
3892	(19.943140717768671,50.09045834486642)	656
3893	(19.944002964148154,50.090715082560621)	656
3894	(19.938669391520762,50.088367562938799)	788
3895	(19.911909327448996,50.046235423722941)	686
3896	(19.90309542098592,50.049750123361662)	279
3897	(19.91113165447257,50.047213675642325)	686
3898	(19.901571339531898,50.048899024913418)	279
3899	(19.892617539104862,50.055235324617456)	555
3900	(19.903533123969652,50.048762651348795)	279
3901	(19.913772875981579,50.057774538364839)	364
3902	(19.905388290599035,50.056452796053406)	625
3903	(19.904677169933819,50.056464363079776)	625
3904	(19.914242094921232,50.05770413037817)	364
3905	(19.902565097972143,50.062779456568755)	77
3906	(19.953607535537571,50.086621863964865)	257
3907	(19.970162716314604,50.085382599580669)	251
3908	(19.963445291473306,50.08492402565804)	585
3909	(19.955478376325914,50.085675128001412)	257
3910	(19.96197376455217,50.085266426402683)	585
3911	(19.946492892304857,50.096301621025752)	71
3912	(19.947269727090998,50.096391391208755)	71
3913	(19.956370797556787,50.092858167564032)	475
3914	(19.920188971403803,50.031723248025429)	139
3915	(19.897504523931133,50.020088579687354)	682
3916	(19.898585789440517,50.020786456945586)	682
3917	(19.924691478331511,50.030537963097657)	121
3918	(19.944778038734597,50.093214985182129)	536
3919	(19.943853682452612,50.089636750717347)	656
3920	(20.066085719146514,50.078598287152005)	812
3921	(20.047484348166734,50.08696879093722)	620
3922	(20.047790119994517,50.087245142284843)	620
3923	(20.000613499991744,50.084784550789237)	188
3924	(19.999583028815579,50.084327150333053)	188
3925	(19.994223639926446,50.087608078692256)	492
3926	(20.002001040243073,50.087636241886912)	334
3927	(20.001317496039292,50.087193258304211)	334
3928	(19.978470774921163,50.08578895424651)	107
3929	(20.065787071936427,50.067858889891902)	348
3930	(20.04623594750808,50.06969838236239)	806
3931	(20.069185263121028,50.068231130211871)	129
3932	(20.052964436461593,50.068490382477023)	164
3933	(20.003687227704486,50.074900359109932)	131
3934	(20.003585387580927,50.07657196205983)	131
3935	(20.00737048741604,50.076346740321547)	163
3936	(20.003362596594599,50.073590435281972)	131
3937	(20.007269485482794,50.075999897168224)	163
3938	(20.051286044170126,50.02183578740388)	731
3939	(19.913777569847355,50.089262750197747)	157
3940	(19.912645342366687,50.089617639978115)	157
3941	(19.997879490814597,50.014393160299988)	12
3942	(19.932161178982653,50.049652641827777)	225
3943	(19.94823305922273,50.031935058718631)	392
3944	(19.972960344136848,50.02643342893262)	406
3945	(19.988312889446547,50.019035896467813)	145
3946	(19.956931882155232,50.028958980177833)	306
3947	(19.932457646897916,50.048236854562731)	225
3948	(19.98809495996403,50.018978480431059)	145
3949	(19.912551716508233,50.000664189634989)	38
3950	(19.905882236153076,50.004682474016384)	792
3951	(19.940088196270949,50.037134017981032)	386
3952	(19.957527416375711,50.028965685700364)	306
3953	(19.9983773758631,50.014397770346733)	12
3954	(19.925242085550991,50.058724962365687)	505
3955	(20.015927823822977,50.092264645000313)	46
3956	(20.012691654826707,50.095763670480096)	728
3957	(19.961744854776498,50.096693223542019)	611
3958	(19.962503333194661,50.098463481492267)	611
3959	(19.958585128737155,50.073651371718029)	636
3960	(19.974491466389537,50.096722560203148)	729
3961	(19.974480737553474,50.096447633779036)	729
3962	(19.974640077532825,50.09674904701717)	729
3963	(19.974326175258966,50.096697665950728)	729
3964	(19.922241783310028,50.066590288846605)	297
3965	(19.964314327194327,50.083242448243368)	303
3966	(20.017961189713844,50.037920324317724)	552
3967	(20.005672732928247,50.067203089787625)	532
3968	(19.973128988028691,50.034599833375552)	548
3969	(20.068343720042407,50.017579959886575)	365
3970	(20.057303580096459,50.017228841962627)	415
3971	(20.018803068068593,50.073095819175698)	449
3972	(19.960162686733465,50.057737993267011)	444
3973	(19.992721854334832,50.039006283692885)	765
3974	(19.982018163982271,50.006091639577903)	20
3975	(20.011504693518305,50.035560567117301)	17
3976	(20.028094743012556,50.038028450868666)	567
3977	(19.989208495800622,49.994404835802101)	318
3978	(19.983042181092966,50.005845127805564)	20
3979	(20.009506028706596,50.037118343822101)	423
3980	(20.006901017019285,50.036175966448297)	146
3981	(19.982303819242418,50.006195742815322)	20
3982	(20.011776351000151,50.035258567145945)	17
3983	(20.006375471690319,50.036504117957548)	146
3984	(19.990064791028828,49.979652350940597)	3
3985	(20.019527180683752,50.03760952334806)	485
3986	(20.009305952677835,50.036946430987989)	423
3987	(20.059907921231485,50.091739099671315)	167
3988	(20.065044435315258,50.095502071282056)	275
3989	(20.056319796120988,50.093180787017161)	354
3990	(20.069525736027941,50.101339061014016)	354
3991	(20.051701451291393,50.095847321873748)	166
3992	(20.062054526634228,50.104194775425242)	261
3993	(20.005290266686444,50.074073568180893)	131
3994	(20.004530866258904,50.067755457206772)	532
3995	(20.004344871827499,50.06973995660212)	532
3996	(19.92238628732073,50.045667717420997)	598
3997	(19.924190491978834,50.040683753974996)	147
3998	(19.925346524064537,50.046732889676292)	754
3999	(19.966139654248423,50.073630584598163)	429
4000	(19.95961459408494,50.06712455135488)	220
4001	(19.98214062358764,50.090119129244982)	466
4002	(20.000107735954259,50.094645021682567)	362
4003	(19.977020118938924,50.081505382629693)	337
4004	(19.958852092353254,50.073722031161793)	636
4005	(19.971412541896822,50.078856198312678)	320
4006	(20.004730858468633,50.094000453328505)	143
4007	(19.972889936150182,50.081470765369566)	78
4008	(19.995001145264808,50.087301971588374)	492
4009	(20.001480021141816,50.088228590984187)	334
4010	(19.971088748977223,50.083115378591252)	622
4011	(19.942126423665655,50.051924137587768)	307
4012	(19.827103075158078,49.909752223796367)	443
4013	(19.844642459005765,49.988536497752278)	699
4014	(19.852624880674028,49.995409658354561)	325
4015	(19.944738559970656,50.070941670060108)	553
4016	(19.945019186088899,50.06536979992552)	573
4017	(19.944421891668753,50.064791448606542)	573
4018	(19.945175089487918,50.067822763889232)	576
4019	(20.00735632199968,50.021805528733438)	148
4020	(19.983119043145081,50.024524031389689)	258
4021	(19.98272542897206,50.02429235558597)	258
4022	(19.996628491765961,50.023780388940139)	668
4023	(19.992823443001296,50.025086121816514)	713
4024	(19.991098195871103,50.025349397395189)	713
4025	(19.997211620769747,50.023478472787843)	668
4026	(19.66804523069041,49.999626929117284)	517
4027	(20.0177653884557,50.006820529877871)	53
4028	(19.952220582019464,50.082451699497966)	811
4029	(20.041790856617098,50.038615435547911)	52
4030	(19.667711882401193,49.99999246391468)	517
4031	(19.962169984905444,50.051060466284774)	179
4032	(20.015711989816253,50.005927354275713)	53
4033	(19.949968699912858,50.079243023144123)	453
4034	(19.961228445721957,50.041768120788561)	86
4035	(20.028345361917445,49.999119321061102)	223
4036	(19.933428438923471,50.06390003320405)	610
4037	(19.942398081147502,50.000606522141162)	441
4038	(20.017965129208335,50.005884355112435)	53
4039	(19.94136945399006,50.001114130197351)	441
4040	(20.016498882886196,50.006845340311287)	53
4041	(19.977730736689978,50.019317779871528)	87
4042	(19.977328070061532,50.018574137421972)	87
4043	(19.932572478971395,50.0630668720286)	610
4044	(19.942025337913378,50.052651770602267)	307
4045	(19.948410168836773,50.044587122463895)	736
4046	(19.933428690380566,50.058539554667476)	436
4047	(19.933480993456357,50.058055080664047)	436
4048	(19.93864047395482,50.066174965544342)	689
4049	(19.946538992772332,50.043431090378192)	736
4050	(19.940456497096392,50.066204386024509)	689
4051	(19.978937227832773,50.023862280134153)	258
4052	(19.964140737979591,50.01360266301171)	543
4053	(19.971730886579337,50.015313660906514)	442
4054	(19.970142767385056,50.01532371919032)	442
4055	(19.966500243722948,50.014040785090572)	543
4056	(19.970328175083264,50.014796916575875)	442
4057	(19.905451154872846,50.134606583252605)	592
4058	(19.899266232340153,50.139035329432403)	446
4059	(19.927635621821224,50.084014170068542)	302
4060	(20.046093622792199,50.074588049397676)	433
4061	(20.047627594891992,50.074832130418088)	433
4062	(20.03353568781958,50.081321651312123)	793
4063	(20.027825264825506,50.087742859695283)	29
4064	(20.035302844465633,50.094193488558602)	717
4065	(20.038906476097026,50.072516378209315)	267
4066	(20.036293417782701,50.07310973313497)	267
4067	(20.046458822313465,50.069570474519963)	681
4068	(20.035942718953919,50.073109062582709)	267
4069	(20.029931469454962,50.072097283050653)	379
4070	(20.038491152794791,50.071142668098219)	267
4071	(20.03472482842281,50.071821937531382)	267
4072	(20.046947571087514,50.069648677676554)	681
4073	(20.045255935389033,50.068471942290039)	681
4074	(19.926712858100842,50.011634256870423)	171
4075	(20.009140158633073,50.086719177860715)	368
4076	(20.027536256804098,50.087895829428213)	29
4077	(19.875265155516985,50.006325578495478)	4
4078	(19.873522976942354,50.0075099414139)	4
4079	(19.875448551558407,50.01634798775811)	173
4080	(19.875700846843927,50.011998618201375)	778
4081	(19.875969151564533,50.012591554031872)	778
4082	(20.065076957099564,50.079398088352832)	812
4083	(19.979473250540735,50.075072439582073)	341
4084	(20.011276957209077,50.094349056681494)	650
4085	(19.845474781990902,50.084063623297283)	658
4086	(19.82747229799287,50.091739267309379)	500
4087	(20.008391570860624,50.056814391356312)	51
4088	(20.013209153528631,50.01631135884125)	374
4089	(19.990919242238334,50.017681045638824)	587
4090	(20.000162469781969,50.014566581876657)	12
4091	(19.921197230536531,50.059789380249697)	740
4092	(20.118574957018723,50.072817456171322)	59
4093	(19.92034914957344,50.059895662781912)	740
4094	(19.924249668215253,50.059355952036583)	505
4095	(20.007931572014485,50.016500538395888)	711
4096	(19.900287064327642,50.001272799624417)	596
4097	(19.975365950347651,50.059651833218595)	169
4098	(20.067007979952674,50.069626717090244)	230
4099	(19.953486668493809,50.084787819731474)	257
4100	(19.951592777471742,50.082075268226447)	811
4101	(19.946652735198398,50.044119999000031)	736
4102	(19.958199645010211,50.088929737184657)	447
4103	(19.922206663135739,50.078809343473921)	291
4104	(19.922620226238308,50.07880682890297)	291
4105	(19.943907997185192,50.010248895913918)	149
4106	(19.930516398122933,50.007441880360147)	649
4107	(19.920218391883935,50.123818487135054)	520
4108	(19.901466146647063,50.124701352996333)	90
4109	(19.878841294505943,50.143937150227288)	133
4110	(19.871002622477107,50.151572561104153)	549
4111	(20.064110272206563,50.087723748956051)	451
4112	(20.071744677255083,50.084077956351706)	114
4113	(20.074140476639144,50.085195934596982)	776
4114	(19.796682131056258,50.142404267774907)	155
4115	(19.791741837325784,50.147130487698348)	531
4116	(19.962031851141148,50.021065825778379)	579
4117	(19.84447624586582,50.085004156652388)	658
4118	(19.880192289659472,50.079630099432677)	591
4119	(19.865440475350198,50.080966342436597)	81
4120	(19.840951068848138,50.087397190008396)	590
4121	(19.845292475596864,50.084210977155067)	658
4122	(19.888736466478406,50.081566738160916)	298
4123	(19.853714360448521,50.082354385602144)	562
4124	(19.880590094784083,50.081149570839983)	591
4125	(19.882308636391741,50.08220678028723)	591
4126	(19.881786527643072,50.082128074216456)	591
4127	(19.852662850695395,50.082461087229547)	562
4128	(19.869711977026469,50.080873219492332)	190
4129	(19.872031417272638,50.080755453752744)	190
4130	(19.848848749475337,50.083328530388968)	159
4131	(19.890814088818047,50.081322154226314)	298
4132	(19.880482135871201,50.081253254982215)	591
4133	(19.84062786266179,50.08777848278379)	590
4134	(19.944614256346597,50.029916947891536)	732
4135	(19.945345577398484,50.029452758093775)	732
4136	(19.90626721696583,50.001047577886169)	469
4137	(20.010949224795013,50.006237149417011)	91
4138	(19.900898691802212,50.001588629736005)	596
4139	(19.962546583815026,50.041869374178894)	86
4140	(19.945670627603533,50.015974657790764)	479
4141	(20.028151572316062,50.078748155580762)	599
4142	(20.026337728469315,50.080685716318357)	11
4143	(19.964248948349564,50.049934441412461)	179
4144	(19.984032754410009,50.045131359436937)	437
4145	(19.967612522274067,50.049006480912112)	594
4146	(19.973543473140609,50.044569436648175)	498
4147	(19.978093673097391,50.040657686256132)	214
4148	(19.973600889177362,50.044572286495253)	498
4149	(20.016566776301886,50.07376586851538)	449
4150	(19.934967859260325,50.091873545398244)	766
4151	(19.927165648510282,50.091583950643582)	62
4152	(19.92715005817038,50.09124062788959)	62
4153	(19.93603789301946,50.091645138536762)	766
4154	(19.935841756485189,50.092309320544217)	766
4155	(19.956053291064563,50.07294142451925)	636
4156	(19.916617358642522,50.05308218133024)	63
4157	(19.916875437441263,50.05322936754996)	63
4158	(19.793619635093762,50.084817072573543)	57
4159	(19.967670525044042,50.04912516866105)	594
4160	(19.982960541356078,50.045264966973519)	437
4161	(20.000117542780966,50.010314693853815)	290
4162	(19.991863882725994,50.009637016982246)	679
4163	(20.003798036464445,50.009403580978869)	742
4164	(20.000223490037083,50.010150073275497)	290
4165	(19.837654131053881,50.08989994247699)	300
4166	(19.902373068570427,50.083948539766709)	706
4167	(19.960345328403601,50.06561673079301)	220
4168	(20.143101998266019,50.060205541742249)	723
4169	(19.991786936854879,50.037210880033108)	434
4170	(20.071718190441032,50.084109723764726)	114
4171	(20.074670045281664,50.085487373370341)	776
4172	(19.962978168009442,50.042149581201983)	86
4173	(19.997086898050526,50.037504498101292)	563
4174	(19.963298021434525,50.041998790763898)	86
4175	(19.963064753069233,50.042163578980272)	86
4176	(19.963576132981839,50.04204137083201)	86
4177	(19.96342936585728,50.042213618942242)	86
4178	(19.963157121642183,50.042177744396668)	86
4179	(19.963636482684674,50.042453676649131)	86
4180	(19.963376476048236,50.042417550646462)	86
4181	(19.96325234006224,50.042189730518196)	86
4182	(19.990943717395623,50.042344795726905)	309
4183	(19.98993923011929,50.042753329687571)	309
4184	(19.963342696978458,50.042203644477468)	86
4185	(19.984351685825771,50.045007726365128)	437
4186	(20.033964254528822,50.075199257777086)	226
4187	(19.982260484803021,50.048440870085955)	170
4188	(19.984373059678859,50.040648466162651)	144
4189	(19.981655646670021,50.040684424527257)	144
4190	(19.990935335492452,50.040552996285498)	31
4191	(19.974156357900682,50.120140927117689)	396
4192	(19.992500739729138,50.040447049029382)	31
4193	(19.953424893867435,50.029755596255455)	644
4194	(19.959775778082957,50.004560265868122)	106
4195	(20.060614934764175,50.047396820226673)	410
4196	(19.932031762397653,50.088091965962462)	461
4197	(19.92678125443075,50.077032128544062)	647
4198	(19.936783379487707,50.083483679416702)	105
4199	(19.871917842484635,49.988426946277798)	384
4200	(19.900864158361145,50.077939888657738)	7
4201	(19.921952272374426,50.058956386712303)	424
4202	(19.925131360610067,50.059827350271064)	505
4203	(19.922727933694091,50.058400079798673)	55
4204	(19.921983369235193,50.058815654558003)	424
4205	(20.011109319145618,50.094179155504172)	650
4206	(20.010971688295513,50.094484424417743)	650
4207	(20.004433552363082,50.093680767541485)	301
4208	(20.004101796635467,50.093991149415984)	143
4209	(19.922629949245984,50.002365967436305)	151
4210	(19.919843217897892,49.997590629560307)	247
4211	(19.921780275721289,50.001442281706595)	151
4212	(19.918447128105328,49.994979750540772)	178
4213	(19.920011777970728,49.997461632070468)	247
4214	(19.918414690140025,49.994447667327336)	178
4215	(20.003643474169934,50.039493439905328)	209
4216	(19.919657977837772,49.981559569188704)	278
4217	(20.005291859248047,50.039079960621784)	209
4218	(20.000702431984422,50.039578935317699)	427
4219	(20.042481776895698,50.038052339292705)	52
4220	(20.043209242272127,50.038319386727835)	52
4221	(20.038308175848499,50.025415698249304)	712
4222	(19.966716077729671,50.060087524545558)	503
4223	(20.042167874621835,50.034148048794492)	150
4224	(20.038142465622769,50.024992747415155)	712
4225	(20.019466076609604,50.085794234845508)	67
4226	(19.968804177448249,50.084901143062382)	251
4227	(19.96783858220266,50.060177127090498)	503
4228	(20.012919223497875,50.086102185968116)	705
4229	(20.013899151797887,50.085748972568382)	705
4230	(20.009410223553317,50.086493788484376)	368
4231	(19.982525520581362,50.090150142286717)	466
4232	(20.013793455998865,50.086622283060017)	705
4233	(20.039210487725143,50.027895316665109)	372
4234	(19.970294563651521,50.077843077676079)	320
4235	(19.959398173344994,50.05834274758098)	444
4236	(19.973073835105819,50.088234793592527)	470
4237	(20.021689292607363,50.092660019373)	30
4238	(20.051316973392829,50.021872332501715)	731
4239	(19.959170772311893,50.064708635403179)	220
4240	(19.905758351624144,50.00458365137797)	792
4241	(19.897013428224199,50.006865875974057)	791
4242	(19.896350084407032,50.007250521510684)	791
4243	(19.900948647945139,50.006532779141935)	287
4244	(20.014267368804298,50.064161883859178)	102
4245	(20.012525274048727,50.068869495957557)	624
4246	(19.799988456582099,50.116981620173526)	369
4247	(19.80099814063837,50.112965095991797)	714
4248	(19.815281238922154,50.109922381320779)	809
4249	(19.831267372292757,50.043291531690357)	556
4250	(19.830957744789515,50.043505856954511)	556
4251	(19.825804047804269,50.044178672322232)	48
4252	(19.827669272717454,50.044065684267451)	48
4253	(19.819296589637446,50.042948544212493)	375
4254	(19.768915316594331,50.059185045030887)	277
4255	(19.860526919890845,50.045217525401569)	630
4256	(19.859374743480629,50.045110153221913)	630
4257	(19.860105561618322,50.04565464165205)	630
4258	(19.872878660045416,50.046117071250137)	710
4259	(19.871464046246814,50.046191921645487)	710
4260	(19.914309066327576,50.05252964627303)	63
4261	(19.933678638733198,50.083480494293489)	726
4262	(19.932149863413372,50.08405029607124)	726
4263	(19.967312198683373,50.120366735589187)	396
4264	(19.966946077152755,50.119306760113858)	396
4265	(19.966789754658549,50.119992567431524)	396
4266	(19.975093538494487,50.128683679013108)	605
4267	(19.958716054064752,50.056986052733293)	444
4268	(19.957735371393426,50.05764646288435)	444
4269	(19.967417475387233,49.973889541051705)	15
4270	(19.945130078667887,50.014246225537363)	479
4271	(19.921621271018097,49.999024689374266)	247
4272	(19.94433128329544,50.010415360510933)	149
4273	(19.946198184589292,50.014612598525076)	479
4274	(19.930440374261138,49.99514998699425)	202
4275	(19.921660163048813,49.998862164271713)	247
4276	(19.930618741160686,49.994903726679013)	202
4277	(20.000497662089881,49.973743695936491)	96
4278	(20.069224322789836,50.068168852671278)	129
4279	(20.084773759005085,50.064709976507686)	130
4280	(19.970158776820114,50.060443839249473)	545
4281	(20.084478045461111,50.06463981997814)	130
4282	(20.094946455791614,50.069830984070592)	124
4283	(20.071053924614546,50.066439246951433)	252
4284	(20.117738945996194,50.073108056754336)	292
4285	(19.969036775261316,50.06653295662889)	771
4286	(20.0952831568421,50.069884795888953)	124
4287	(19.970579045445245,50.066520299955101)	771
4288	(20.092993556171223,50.06975848060813)	186
4289	(20.037702248068086,50.084933078113465)	653
4290	(20.031522438496324,50.076450424463808)	326
4291	(20.04749197569862,50.086937777895486)	620
4292	(19.977296135010448,50.067630483030456)	158
4293	(19.983819434974265,50.071772568121702)	667
4294	(20.03203038182863,50.081867397027764)	793
4295	(20.06422116478555,50.087688461143699)	451
4296	(20.02136658933517,50.090089541126787)	270
4297	(20.065853037514415,50.079825397776631)	812
4298	(20.059091859138533,50.090813653741947)	167
4299	(20.020463020173054,50.084519263553794)	67
4300	(20.015457766693004,50.092550970812709)	46
4301	(20.060250573433219,50.091621166293656)	566
4302	(19.891851265516721,50.00714273023587)	385
4303	(19.898790726973118,50.011716148064437)	803
4304	(19.891814385142762,50.007341381341092)	385
4305	(19.881181773329104,50.007066371097949)	514
4306	(19.87991912343503,50.007085062742043)	514
4307	(19.881101642334755,50.007492674693367)	514
4308	(19.88389667176699,50.01273815351837)	528
4309	(19.883036520863328,50.011893844411702)	528
4310	(19.885703474815074,50.082140144157023)	591
4311	(19.898366518853493,50.08858909663968)	236
4312	(19.900055891438114,50.088571075547861)	236
4313	(19.893995356348508,50.086342578951133)	582
4314	(19.896876048831189,50.085538838255815)	212
4315	(19.981787074911779,50.184017483365295)	508
4316	(19.969599033326205,50.206878537537847)	718
4317	(19.9793751822736,50.220594264795835)	559
4318	(20.022602417139069,50.062772164312996)	289
4319	(20.014568949680491,50.064146628795413)	102
4320	(20.018465025913599,50.064341675682236)	308
4321	(20.005379366317158,50.067362345947913)	457
4322	(19.924456617404584,50.040749971010086)	147
4323	(19.839931242689033,50.041127994843208)	84
4324	(19.872124875493029,50.166284729011409)	737
4325	(19.949969621922207,50.211349025595432)	744
4326	(19.980386375072442,50.159104455476864)	790
4327	(19.913694756643991,50.073444841623854)	430
4328	(19.917266285586233,50.067508526339282)	691
4329	(19.923022892866783,50.066189969151054)	297
4330	(19.918181337955673,50.078502398179722)	606
4331	(19.954045741435493,50.028846578856275)	644
4332	(19.916207818853479,50.081500772582956)	317
4333	(19.928233083879434,50.030409133245875)	266
4334	(19.931715932286096,50.030522540395822)	614
4335	(19.959282083986039,50.064912818564494)	220
4336	(19.959350396496916,50.06497182716285)	220
4337	(19.959867643741745,50.065765258117231)	220
4338	(19.94773525799323,50.068203972845566)	403
4339	(20.00149779077654,50.040063744597255)	427
4340	(19.987937883098567,50.019433533954356)	145
4341	(19.98168003800825,50.023059964362375)	258
4342	(19.976474540861375,50.02729886043528)	751
4343	(19.964438044085171,50.039083145744989)	619
4344	(19.970239243090589,50.033470874837093)	316
4345	(19.93753909187782,50.028806429540083)	271
4346	(19.936223133079579,50.028812296872303)	271
4347	(20.016517323073174,50.082726374464983)	509
4348	(20.016671885367685,50.082611877667631)	509
4349	(19.929249724915337,50.030353058313665)	266
4350	(19.922663141582575,50.043171670474976)	598
4351	(19.774569999932282,50.058453221064774)	695
4352	(20.043162052157271,50.039204850979075)	52
4353	(20.115274247368006,50.014898086147156)	571
4354	(19.927681638469636,50.076579673410741)	647
4355	(20.030852137699554,50.076919391946376)	326
4356	(20.020019198400036,50.015951356099947)	753
4357	(20.030753566518229,50.077216530413864)	546
4358	(19.937909739636154,50.080688649984467)	229
4359	(19.930632822758014,50.084500152814542)	154
4360	(19.93075192960211,50.084950344833999)	154
4361	(19.930723766407425,50.088427493546497)	461
4362	(19.916048395055128,50.087743027333346)	322
4363	(19.923150716890177,50.085550572920255)	237
4364	(19.926256798749165,50.088944237877143)	331
4365	(19.9234598414792,50.08795542475977)	2
4366	(19.922836982254381,50.086404185939443)	237
4367	(19.917424284461049,50.087687874410477)	322
4368	(19.917423194813637,50.087553428683577)	322
4369	(19.909149837286236,50.083318388286131)	182
4370	(19.913929282294788,50.087916951824212)	376
4371	(19.911311446295656,50.08840041999926)	376
4372	(19.925497649778748,50.088655146036693)	331
4373	(19.923415165935296,50.08885756899835)	2
4374	(19.95964149999412,50.065769197611729)	220
4375	(19.898038954077464,50.02076173033123)	682
4376	(19.889093870829722,50.017991595151408)	432
4377	(19.897512822015273,50.020380772831999)	682
4378	(19.889445072572698,50.018393675046639)	432
4379	(19.924092591349762,50.04142387602522)	147
4380	(19.924539095331824,50.040824150853155)	147
4381	(19.9220190761427,50.045073943400212)	598
4382	(19.917574152889785,50.06032439712925)	25
4383	(19.925953290035267,50.034410737639945)	24
4384	(19.925973574240938,50.034630427322128)	24
4385	(19.918120652976711,50.060264969435735)	25
4386	(19.99650913346477,50.083972847285899)	687
4611	(19.955787668553,50.012434393347377)	99
4387	(19.999773465655693,50.08482134734416)	188
4388	(19.99649304021068,50.08409673181481)	687
4389	(19.946544860104552,50.043515747600253)	736
4390	(19.947503079275346,50.044051183574965)	736
4391	(20.051904460986265,50.068746449618963)	164
4392	(20.052464288299234,50.067887220724657)	164
4393	(19.888944253858085,50.018411193224296)	432
4394	(19.914249973910216,50.028513062928994)	615
4395	(19.913322683962122,50.02937924880294)	491
4396	(19.925559759681278,50.034181324950083)	24
4397	(19.890308995332784,50.017637795018459)	432
4398	(19.942839975082819,50.059344720286333)	310
4399	(19.968984388366493,50.083356525945554)	622
4400	(20.108531592998162,50.143365588249878)	495
4401	(20.113236774344614,50.135065827727487)	499
4402	(20.108456742602812,50.143967744173864)	495
4403	(20.113643631924646,50.135778624773359)	499
4404	(20.109430384475445,50.146509975406389)	626
4405	(19.950941335957108,50.051181920061765)	661
4406	(19.927598825266301,50.011698294610682)	171
4407	(19.971595435024057,50.015448525728573)	442
4408	(19.971585628197346,50.015482975350608)	442
4409	(19.979390018242214,50.023640327338114)	258
4410	(19.977518925996776,50.018406666996555)	87
4411	(19.977578940423513,50.018409433024623)	87
4412	(19.998733187652817,50.073961753592556)	526
4413	(19.944688771465792,50.068539332791545)	576
4414	(20.01128735076901,50.074036017254684)	621
4415	(20.011319872553344,50.073998298690384)	621
4416	(20.065998295896406,50.078682692916964)	812
4417	(20.029815463915043,50.07219878789806)	379
4418	(20.004646033608509,50.074265681401634)	131
4419	(20.047494238812504,50.074899688557679)	433
4420	(20.065544583477617,50.08345819843106)	227
4421	(20.065594874896675,50.083563223677828)	227
4422	(19.89109781624046,50.086616834822962)	350
4423	(19.890686264794653,50.087627524707614)	350
4424	(20.065535363384129,50.067805497168706)	348
4425	(20.075087631697755,50.064913992030938)	719
4426	(20.074772891233607,50.064953051699717)	719
4427	(20.07134209444564,50.066204888938699)	252
4428	(20.104349693866823,50.071854459315716)	119
4429	(19.957587766078547,50.098249742961336)	796
4430	(19.947465025434919,50.098929934403884)	54
4431	(19.947387241373491,50.098893892220239)	54
4432	(19.951257333706764,50.098214036053832)	583
4433	(19.958767938045384,50.098444622210138)	796
4434	(19.892754667040776,50.087330386240126)	350
4435	(19.892324759226995,50.088122559909039)	350
4436	(19.768575262782576,50.038833029754301)	321
4437	(19.774088543413995,50.038838897086521)	438
4438	(19.774675947188395,50.038934031687546)	438
4439	(19.768325062972846,50.038573777489148)	321
4440	(19.98962163980806,50.088619439129189)	471
4441	(19.978128793271679,50.040618794225423)	214
4442	(19.975543395237821,50.059044899609802)	169
4443	(19.878153224074453,50.065192774130473)	72
4444	(19.888309157054636,50.062060456914537)	646
4445	(19.886952043111819,50.062695050803825)	646
4446	(19.877303382911691,50.065246921224997)	72
4447	(19.752205489703726,50.16794719568685)	47
4448	(19.951101681764808,50.065065955935466)	494
4449	(19.949375344987203,50.068504631712408)	250
4450	(19.79647585241915,50.023480149168478)	34
4451	(19.979002019944318,50.214266263175944)	716
4452	(19.7210058667971,50.127323631404153)	769
4453	(19.713349333524206,50.119476242196015)	112
4454	(19.707349064318436,50.123410959002769)	635
4455	(20.052122222830718,50.064152077032468)	37
4456	(20.052137394075459,50.065279023914144)	37
4457	(19.853379168140606,50.151266873095437)	770
4458	(19.861600390230279,50.144199671434677)	600
4459	(20.014364682700148,50.096199361807038)	728
4460	(20.045468165177393,50.079050826104343)	721
4461	(19.865571316858734,50.135611070528903)	676
4462	(20.04587703441419,50.079454330923141)	721
4463	(19.729069257650025,50.021850036639279)	787
4464	(19.788870029660472,50.042407827638755)	493
4465	(19.850804331304744,50.106040219046939)	319
4466	(19.883671366209683,50.089775722671952)	324
4467	(19.607476089616029,50.130265092684851)	550
4468	(19.844284887016386,50.006485337569984)	544
4469	(20.045308489921922,50.069840455621176)	806
4470	(20.028070351674302,50.079063566597171)	11
4471	(20.028412836237976,50.080071238996709)	11
4472	(20.056736460527731,50.088357085559835)	187
4473	(19.924781080876439,50.030626727452265)	121
4474	(19.93128158206363,50.088771738309845)	461
4475	(19.931264063886005,50.088723626185612)	461
4476	(19.927038578858173,50.056375850182263)	708
4477	(19.980304483878427,50.158329967623608)	790
4478	(19.983496564064012,50.044385956787721)	437
4479	(19.983741567093773,50.045543246158871)	437
4480	(19.925593790208151,50.046778822505701)	754
4481	(19.941201648288512,50.052068222503351)	307
4482	(19.913149765299664,50.030144768019795)	491
4483	(19.942056937688335,50.052251031811551)	307
4484	(19.939380931281164,50.054313063811264)	394
4485	(19.944971744516948,50.05694665778838)	359
4486	(19.955058191519811,50.046692153626879)	49
4487	(19.948078664566253,50.05393395033073)	777
4488	(19.948897576506312,50.053205646763978)	777
4489	(19.955006475177242,50.046692069807847)	49
4490	(19.913682099970202,50.052804572697141)	63
4491	(19.927069759537972,50.055002726804389)	708
4492	(19.928200059180938,50.055556267689951)	708
4493	(19.921814390067222,50.053412093039157)	418
4494	(19.951062957372159,50.051132718290148)	554
4495	(19.943427630314318,50.048043148780373)	83
4496	(19.937631292812739,50.059115559053566)	709
4497	(19.941818053447886,50.059341870439255)	310
4498	(19.933098862490681,50.059177333679933)	436
4499	(19.94346342104086,50.048052033597735)	83
4500	(19.938240992449579,50.059129053917673)	709
4501	(19.914994119273953,50.052736679281423)	63
4502	(19.932961147821544,50.058659667339953)	436
4503	(19.940887326919523,50.058454059255098)	743
4504	(19.925650368054558,50.059531636727087)	505
4505	(19.933870249039757,50.059032242936013)	436
4506	(19.932596032119307,50.063057987211231)	610
4507	(19.930673223531297,50.06026455034057)	74
4508	(19.942403026470373,50.050856618399592)	307
4509	(19.940783894234357,50.03694416787414)	386
4510	(19.926811429282168,50.068845020800296)	234
4511	(19.900725856958786,50.077784655810973)	7
4512	(19.931536224282041,50.060362367150617)	74
4513	(19.932615478134664,50.063737256644401)	610
4514	(19.897854719845725,50.078849576609173)	664
4515	(19.903371772333571,50.062936030520056)	77
4516	(19.91120994144822,50.061335673747124)	589
4517	(19.960712874857759,50.042435320281186)	86
4518	(19.925895622541415,50.069592854201431)	234
4519	(19.883098630765858,50.082043416994395)	591
4520	(19.940283326976839,50.035861393622184)	386
4521	(19.881925248140586,50.081808388429408)	591
4522	(19.896762390224151,50.079230450289366)	664
4523	(19.889682950984763,50.081337074013959)	295
4524	(19.943084559017421,50.041428066976806)	262
4525	(19.941334920548968,50.05147947762444)	307
4526	(19.916055435853792,50.072862131715226)	430
4527	(19.929371094873289,50.06662633103025)	64
4528	(19.94324582683447,50.04164096731742)	262
4529	(19.901819024770674,50.077124580936037)	7
4530	(19.915045081245239,50.073096322089896)	430
4531	(19.938624045424604,50.066233890323673)	689
4532	(19.936969541557175,50.03048289399382)	271
4533	(19.920025189015803,50.071771897569448)	141
4534	(19.909994062573872,50.074258221507819)	94
4535	(19.95168397257828,50.06556384098397)	494
4536	(19.95221027227856,50.067536438076843)	181
4537	(19.919250198248363,50.071963675514034)	141
4538	(19.939688044213451,50.066298347159091)	689
4539	(19.905845858693283,50.075888836951179)	586
4540	(19.945626287335756,50.064617440296665)	573
4541	(19.951103441964477,50.065048773033965)	494
4542	(19.910769975350632,50.074126960904096)	94
4543	(19.938953789495457,50.06665407512974)	689
4544	(19.952246985014455,50.065181961475389)	494
4545	(19.945349516892975,50.067823099165366)	576
4546	(19.944984485009769,50.064192226348666)	573
4547	(19.942422975399918,50.059813436311792)	310
4548	(19.944908796424102,50.070743857145203)	553
4549	(19.952664571430542,50.068371024175825)	181
4550	(19.940313753285352,50.07594147530309)	458
4551	(19.944522055411682,50.064773176057628)	573
4552	(19.957735790488584,50.057551747378483)	444
4553	(19.940296067469657,50.07598472592349)	458
4554	(19.946128950069067,50.057308672186451)	359
4555	(19.936529659278648,50.073511226296972)	519
4556	(19.945063945451832,50.071226068034768)	553
4557	(19.901478887139888,50.024048274565558)	347
4558	(19.902048353641504,50.024765346382054)	347
4559	(19.935933789782037,50.02949952911348)	271
4560	(19.938360266931738,50.032899145221641)	697
4561	(19.912228258864758,50.029814353396688)	491
4562	(19.905189136579651,50.026934499104328)	355
4563	(19.906038139552091,50.027256531824264)	355
4564	(19.924990963731915,50.030728651394867)	121
4565	(19.924979145248439,50.030764861216568)	121
4566	(19.931897149032693,50.030497143229212)	614
4567	(19.937023688651692,50.030474679728712)	271
4568	(19.928500885685821,50.030509548445906)	266
4569	(19.936008053444141,50.0294345693639)	271
4570	(19.929091893678589,50.030545171534385)	266
4571	(19.979444249155733,50.023622390065327)	258
4572	(20.000165487267111,50.014313364581795)	12
4573	(19.960719831837395,50.042592648603744)	86
4574	(19.976658188359892,50.027105238471989)	751
4575	(20.011739889721355,50.015918079944356)	374
4576	(20.011590943301965,50.016036851512325)	374
4577	(20.001124544628222,50.015004787774558)	12
4578	(20.006959019789235,50.016551668005235)	711
4579	(19.932746822557391,50.022310454580605)	16
4580	(19.925751034711681,50.034094236976131)	24
4581	(19.922010191325342,50.04498777743558)	598
4582	(19.927825136651961,50.014560043992191)	781
4583	(19.929389283603172,50.015766283677891)	547
4584	(19.930953598192445,50.0485727174229)	225
4585	(19.938943395935524,50.050669366682712)	601
4586	(19.944545524740562,50.05730909128161)	359
4587	(19.951131856616254,50.051112434084473)	554
4588	(19.940850530364571,50.058461686787012)	743
4589	(19.946027780497758,50.057258548405478)	359
4590	(19.945151955435161,50.065152457176225)	573
4591	(19.937514029987341,50.069630069851513)	45
4592	(19.945579516316059,50.064665468601838)	573
4593	(19.931423236227261,50.088373094994914)	461
4594	(20.012451848576916,50.102110447563064)	465
4595	(19.944838639894527,50.070740252926839)	553
4596	(19.937545545943266,50.06964264270627)	45
4597	(19.903392894729564,50.062985986662966)	77
4598	(19.942532526874402,50.059228379470284)	310
4599	(19.939675219901602,50.074961966098243)	458
4600	(19.952609753783804,50.065240299521491)	494
4601	(19.958946891678121,50.056918159317604)	444
4602	(19.936581794716375,50.073486583501641)	519
4603	(19.94888282435673,50.058651955989035)	704
4604	(19.948824151034529,50.058681125012072)	704
4605	(19.932024553960929,50.088541068334507)	461
4606	(19.96028447578658,50.057895070132474)	444
4607	(19.96476317810928,50.013461092667086)	543
4608	(19.950510087038822,50.01355077903105)	299
4609	(19.921897035632497,50.053374123017761)	418
4610	(19.945034776428798,50.071223972558982)	553
4612	(19.945391174951737,50.067804491340318)	576
4613	(19.92184976169861,50.053390551547999)	418
4614	(20.020571649638185,50.075691946045623)	759
4615	(19.976290222810576,50.059597434667005)	169
4616	(19.964180887295811,50.093435177778474)	507
4617	(19.962528478904176,50.058858150807112)	813
4618	(19.983995454940892,50.063026638893348)	631
4619	(19.921797039527632,50.053436735834474)	418
4620	(19.979185164528644,50.060724046272554)	613
4621	(19.996323893404622,50.065502233995659)	242
4622	(19.96679335887691,50.060000855666743)	503
4623	(19.997497024572791,50.065670542611372)	242
4624	(19.915405083986542,50.052732655967901)	63
4625	(19.957331196022405,50.073943648681706)	636
4626	(20.066248160430007,50.079200191618888)	812
4627	(20.02119828071946,50.076074747563574)	759
4628	(20.012191171388224,50.069199994399696)	624
4629	(20.065022390909917,50.094522645896234)	565
4630	(20.117356060659233,50.072584690720191)	292
4631	(20.020680279103317,50.084243079844214)	67
4632	(20.020431923312287,50.084899634319811)	67
4633	(19.954273729201816,50.070476977348164)	815
4634	(19.954624092754472,50.071011658951619)	815
4635	(20.023124777344833,50.090298669610945)	270
4636	(20.06704142374636,50.069658652141328)	230
4637	(20.023758616862835,50.090107981313757)	270
4638	(20.07097295542988,50.066219138174091)	252
4639	(20.012640357579301,50.09576434103235)	728
4640	(20.013065990622437,50.098611086807153)	56
4641	(19.996396732143211,50.095280956676334)	633
4642	(19.978440935345869,50.068120656728041)	158
4643	(19.999966165609635,50.094457267051467)	362
4644	(19.97870337273423,50.067971961765721)	158
4645	(20.038379757301612,50.071306199029124)	267
4646	(20.059068054533498,50.067471394508203)	588
4647	(19.905058797985301,50.076197877721199)	586
4648	(20.052133789857095,50.068604879274375)	164
4649	(20.050104698736845,50.068862119882766)	164
4650	(19.928850746324287,50.067028075649375)	64
4651	(19.905065335869779,50.076207433090808)	586
4652	(19.888595818143159,50.081524241911836)	295
4653	(19.902489577024539,50.077114019738048)	7
4654	(19.900687467842232,50.077761689396283)	7
4655	(19.901327593787613,50.077148888455241)	7
4656	(19.890624154892123,50.080848241420874)	295
4657	(19.94504902566419,50.070958852961603)	553
4658	(19.890593896221674,50.08156011645741)	295
4659	(19.999540532566499,50.039930388517767)	427
4660	(19.977126233833104,50.040515193902188)	214
4661	(19.976842422591659,50.0408097339797)	214
4662	(19.968403019562373,50.048377419078939)	594
4663	(19.967571786224653,50.048981335202598)	594
4664	(19.97325119617696,50.044518139400758)	498
4665	(19.972130870998797,50.044965565392175)	498
4666	(19.973223619715526,50.045598985814991)	498
4667	(19.98387442025907,50.040529778413713)	144
4668	(19.982376993257134,50.040828257985709)	144
4669	(20.000620373152344,50.040188383497451)	427
4670	(20.000559939630449,50.040228951908801)	427
4671	(19.992435696160499,50.040329953842047)	31
4672	(19.991001720165571,50.040676461719237)	31
4673	(19.965169868051248,50.049696143905237)	179
4674	(19.959229194177027,50.05844928157029)	444
4675	(20.079490058701595,50.087693155009475)	28
4676	(20.079684686493266,50.087829277117009)	28
4677	(20.083820485157162,50.089836575289013)	58
4678	(20.08368352485931,50.089775052119698)	58
4679	(19.926552679931206,50.013170156807945)	171
4680	(19.810012039311175,49.938464349298215)	152
4681	(19.809499737389189,49.939009843556732)	152
4682	(19.807792678988875,49.940512551157688)	675
4683	(19.803253626963336,49.946399664670643)	628
4684	(19.80404814756514,49.945580417454465)	628
4685	(19.83393466152063,49.906603645688278)	404
4686	(19.831222948205944,49.975415382705421)	703
4687	(19.82927356898486,49.970857639035785)	68
4688	(19.829799868685143,49.968519926240702)	100
4689	(20.013187192942326,50.100698935068664)	111
4690	(20.013024332563674,50.100714273951468)	111
4691	(19.902410787134727,50.02464095893896)	347
4692	(19.906537281886074,50.027116051127081)	355
4693	(19.920251751858586,50.031279258614319)	238
4694	(19.91349962593813,50.029985679497543)	491
4695	(20.021160645974188,50.09022742343398)	270
4696	(19.949336033861329,50.068563472672679)	250
4697	(19.949291777412554,50.068710658892428)	250
4698	(19.801642876630467,49.958153020757635)	189
4699	(19.800894121219983,49.952903099523922)	8
4700	(19.801097550010013,49.949140044094179)	533
4701	(19.801097047095823,49.957916734907172)	189
4702	(20.024426486907686,50.055686019551104)	327
4703	(20.025122520147221,50.055880898799863)	327
4704	(19.966789419382422,50.132895333900699)	807
4705	(19.829211878177517,50.032530592939111)	693
4706	(19.88313199074048,50.082108628201098)	591
4707	(19.889284978222094,50.07730487567332)	194
4708	(19.888621299128797,50.076811684490586)	194
4709	(19.906558739558193,50.069604756503935)	525
4710	(19.875805117719406,50.081610324057408)	804
4711	(19.876285987504474,50.081645947145915)	804
4712	(19.807124725124993,50.029509587397314)	757
4713	(19.801054718484778,50.029108932425601)	401
4714	(19.807090694598088,50.029580330660082)	757
4715	(19.93506089838553,50.043277450093029)	702
4716	(19.801107859750914,50.02904489468537)	401
4717	(19.797316557307454,50.02644809726317)	192
4718	(19.794733841482611,50.023037836138002)	34
4719	(19.795700023461421,50.023864878524137)	34
4720	(19.797535073523193,50.026131680418381)	192
4721	(19.824248869489452,50.10663105940165)	511
4722	(19.824150382127158,50.106579929792275)	511
4723	(19.915637430342514,50.225217471129241)	580
4724	(20.233055325838706,49.87800442442218)	463
4725	(19.937249245666091,50.012407068343038)	540
4726	(19.679948874301289,50.042256031372283)	700
4727	(19.974758346186604,50.045357335546498)	498
4728	(19.78666139817426,50.041942799650712)	493
4729	(19.868173394879928,50.098651319942405)	103
4730	(19.931410160458313,50.095122287249239)	632
4731	(19.888615599434644,50.017336884694544)	432
4732	(19.90749592015203,49.973800860516143)	370
4733	(19.91430537829018,50.047655234301516)	686
4734	(19.855661895650883,50.029197780599247)	113
4735	(19.852882037463388,49.967787599360435)	452
4736	(19.974303376482339,50.095863834223024)	729
4737	(19.967551418199946,50.094941238140699)	506
4738	(19.968260946303587,50.095304593643277)	506
4739	(19.869347531876485,50.067022375955219)	73
4740	(19.865516918307151,50.065241472987935)	454
4741	(19.869909873760378,50.066967223032321)	73
4742	(19.8661485785303,50.06501382049774)	454
4743	(20.041381316828051,50.22363714710491)	162
4744	(20.039442582624019,50.222780265143477)	162
4745	(19.967291160106413,50.133359942793582)	807
4746	(19.989750721116934,50.160461653238713)	97
4747	(19.999498371593546,50.160658041230072)	323
4748	(19.998672837949982,50.160760132810736)	323
4749	(19.989140853842031,50.160306252753884)	97
4750	(19.953155583318448,50.126867488233472)	400
4751	(19.940594547041655,50.125427980182444)	750
4752	(19.942316525229643,50.125759819729069)	750
4753	(19.808215043089803,50.043322628551124)	472
4754	(19.798241416503629,50.04166527483661)	515
4755	(19.851421490835406,50.044081526064446)	132
4756	(19.850809192808583,50.044155035355281)	132
4757	(19.96533926631437,50.088407293159861)	273
4758	(19.95897019336897,50.088653218198971)	447
4759	(19.96357018183059,50.088396899599928)	273
4760	(19.964555139272502,50.091971278389224)	288
4761	(19.947589329058985,50.076221179412016)	655
4762	(19.952675970818859,50.083342695805328)	811
4763	(19.948758017818477,50.078055056007344)	453
4764	(19.984591659713629,50.102278756178805)	684
4765	(19.841228426024173,50.041902650334492)	84
4766	(19.955527997192689,50.086876087088115)	257
4767	(19.811848765753581,50.041834589280739)	472
4768	(19.975142572628069,50.089101733837794)	470
4769	(19.97953259441519,50.076034262971234)	341
4770	(19.992105532994486,50.104136688836235)	440
4771	(20.00139804612877,50.106257394158177)	197
4772	(20.001758048870073,50.106112554871338)	197
4773	(19.973798785911299,50.089637337450561)	470
4774	(19.976836219983312,50.089458719093948)	470
4775	(19.977064375387698,50.078582696812099)	612
4776	(19.920214117113318,50.031864399274866)	238
4777	(19.921131684053734,50.03160824831388)	238
4778	(19.883338437015652,50.155570980375046)	373
4779	(19.881232651481355,50.161673257342443)	221
4780	(19.863761244868414,50.173668682793107)	419
4781	(19.861131841842905,50.179290341432534)	629
4782	(19.86762957700202,50.16769783406744)	140
4783	(19.855909245613532,50.180530276369012)	135
4784	(19.85375291720311,50.191839559225848)	65
4785	(19.739681836715107,50.135308232367265)	390
4786	(19.962513894392657,50.042496759631433)	86
4787	(19.873547871194774,50.166056573607051)	737
4788	(19.765913086515638,49.937522055743443)	413
4789	(19.779175855726123,49.943861037656461)	467
4790	(19.740643660104269,49.927919663648822)	315
4791	(19.734929297615707,49.926402287717337)	193
4792	(19.713567849739945,50.119484372642091)	112
4793	(19.964404851748611,50.099876754186361)	282
4794	(19.964136630847037,50.101533269710551)	80
4795	(20.006231051498613,50.092885827844498)	231
4796	(20.006512431988167,50.092865124543664)	231
4797	(19.980382016482793,50.085839078027504)	107
4798	(19.970702175602867,50.00686453486955)	680
4799	(19.939622665368688,50.054453125413289)	394
4800	(19.81098475917446,49.988883424724634)	245
4801	(20.151828230021891,50.038927493803072)	393
4802	(19.894320071277463,50.094110256260073)	696
4803	(20.070299720967,50.091058824409771)	739
4804	(20.059938431359058,50.090215688769547)	167
4805	(20.059139133072421,50.090559849713848)	167
4806	(20.075100958923795,50.092315020238374)	409
4807	(20.074049532989733,50.092099940602935)	409
4808	(20.070195198634423,50.091124287073541)	739
4809	(19.800852379342189,49.954130880700802)	8
4810	(20.054527661403455,50.096885839676958)	800
4811	(19.898598278476243,50.011397887200928)	803
4812	(19.873928577236939,50.006710475489228)	4
4813	(19.846594017521653,50.067544317065824)	377
4814	(19.846182298437782,50.067864924862221)	377
4815	(19.835775495095589,50.062291462165994)	328
4816	(19.835623279733962,50.062385339481551)	328
4817	(19.847229365782198,50.067798624008105)	377
4818	(19.841158018037504,50.063946385128588)	177
4819	(19.855596181530018,50.066768823384194)	283
4820	(19.841056345552005,50.063738849206004)	177
4821	(19.860727917928955,50.065913198708245)	496
4822	(19.86199408822236,50.065806832356969)	496
4823	(19.85625533439557,50.066743845312743)	283
4824	(19.863479864378888,50.068632874830968)	378
4825	(19.864633130436545,50.068564059405894)	378
4826	(19.858903177608084,50.069769460901284)	5
4827	(19.859314561415829,50.069695951610463)	5
4828	(19.925888749380817,50.049652558008738)	134
4829	(19.912647354023449,50.047159360909767)	686
4830	(20.021280926284732,50.094976777410153)	248
4831	(20.020815982115693,50.095119185945059)	248
4832	(19.949217597569486,50.026044927720527)	722
4833	(19.948642934287903,50.027009684775805)	722
4834	(19.823710248391507,50.067743471085208)	416
4835	(20.065755555980502,50.084332850027209)	227
4836	(19.855445642549,50.055125186409754)	524
4837	(19.892721474704189,50.093840275158861)	662
4838	(19.892606055897488,50.095063530108007)	662
4839	(19.897641232771889,50.093434255769125)	338
4840	(19.920443026888989,50.045426737704759)	598
4841	(19.910018453912102,50.088822365004994)	376
4842	(20.030072117790212,50.08401844483916)	651
4843	(20.030235397264022,50.083538999977634)	651
4844	(19.87066122756087,50.079933189051445)	190
4845	(20.083948141542493,50.160598948812684)	417
4846	(20.075255018304144,50.164728377230176)	487
4847	(20.091787232666491,50.159191459631813)	455
4848	(19.932749085671247,50.045932753199367)	153
4849	(19.971055724278727,50.0326845685004)	316
4850	(19.831102164981218,49.9758899660631)	703
4851	(19.738804251452819,50.137722723395427)	1
4852	(19.928398291190973,50.137251660437073)	76
4853	(19.954767842393892,49.979800962083857)	707
4854	(19.94979083592753,50.013423625559909)	299
4855	(19.906191360742099,50.134221267163724)	592
4856	(19.657374229760194,49.99532064254285)	733
4857	(19.616393428764269,49.99797116796438)	694
4858	(19.696089234690277,49.999589126733952)	255
4859	(19.696759116391917,49.999862544415492)	255
4860	(19.702246832218634,50.004277795731156)	516
4861	(19.660647698225574,50.005949985414276)	217
4862	(19.657481266663723,50.01130023802898)	272
4863	(19.639126742732429,49.995150154632313)	263
4864	(19.655990042270133,50.023928832445336)	816
4865	(19.612967325842078,50.001151597304528)	22
4866	(19.681030055991638,50.026593188007098)	488
4867	(19.676589742785495,49.987128757114277)	397
4868	(19.666591221946902,49.993222233083365)	122
4869	(19.639336877044993,49.994994418871329)	263
4870	(19.660615930812554,50.005675142809224)	217
4871	(19.651608067110033,50.022755449820096)	285
4872	(19.616907155609766,49.997912997556369)	694
4873	(19.650438875436379,49.997014960450343)	127
4874	(19.718486099065071,50.015453554870476)	174
4875	(19.711384866877438,50.033947386032501)	460
4876	(19.689841866978924,50.025793135349204)	241
4877	(19.702381948497788,50.004233790739498)	516
4878	(19.657639684633693,50.011751687333877)	272
4879	(19.65290659154968,50.018592493789924)	69
4880	(19.655828522995961,50.024021787751536)	816
4881	(19.680983620248071,50.026674827744017)	488
4882	(19.704332249728225,50.030770896186851)	296
4883	(19.697771482657203,50.027479741905779)	14
4884	(19.657334750996256,49.995246881794912)	733
4885	(19.666470773998299,49.993101952772832)	122
4886	(19.650401240691107,49.99694723467271)	127
4887	(19.697290529053106,50.027121834640262)	14
4888	(19.704271229473107,50.030811548417226)	296
4889	(19.718973590553645,50.015981698589428)	174
4890	(19.651773693516759,50.022731393757965)	285
4891	(19.710797630741098,50.033917378819154)	460
4892	(19.742706278837204,50.059796923962551)	688
4893	(19.721900886417956,50.059889627811629)	32
4894	(19.804164320743126,50.062546774936656)	502
4895	(19.753937190899389,50.058398990151261)	200
4896	(19.783449452878159,50.052426297406925)	695
4897	(19.783842899413141,50.052182719300674)	695
4898	(19.728581347066296,50.059835732174236)	648
4899	(19.8039503307551,50.061700370354203)	502
4900	(19.81851363606199,50.064406383974756)	518
4901	(19.805824775761803,50.061828362015653)	395
4902	(19.805056239059837,50.062129272339597)	395
4903	(19.824424889456083,50.067601481645454)	416
4904	(19.8328902763852,50.068147227361088)	767
4905	(19.818620086232301,50.064344190253188)	518
4906	(19.828251228254796,50.068054439692958)	448
4907	(19.828723129403468,50.068210846006167)	448
4908	(19.823718462656615,50.06758807060038)	416
4909	(19.823707817639583,50.067651940702568)	416
4910	(19.837203352301202,50.068870334147874)	654
4911	(19.800146623094975,50.071701824858906)	43
4912	(19.775788058101455,50.082545828270611)	808
4913	(19.80715749836639,50.084215754839875)	204
4914	(19.815554991879822,50.092962354620482)	333
4915	(19.803866846999512,50.093144744833516)	260
4916	(19.805019274866819,50.093212219154083)	260
4917	(19.808189394466094,50.093625782256652)	366
4918	(19.837557822986412,50.068747120171224)	654
4919	(19.804605460307158,50.097214829376526)	253
4920	(19.836703539414966,50.107292643019122)	264
4921	(19.832965797332804,50.068292318105023)	767
4922	(19.839331852793094,50.109457856246905)	61
4923	(19.854548695090415,50.119948059525655)	782
4924	(19.836974442525531,50.0902578497425)	300
4925	(19.788929289715924,50.083844185072195)	683
4926	(19.816437019550758,50.107558181711681)	311
4927	(19.835072588695454,50.108388325401961)	264
4928	(19.777507354080399,50.082671221542078)	808
4929	(19.809184242553755,50.086465792927783)	204
4930	(19.826477617543276,50.109094668382397)	542
4931	(19.82582089542964,50.109157532656205)	542
4932	(19.867570736041756,50.12445676906173)	249
4933	(19.80416842787568,50.084941292378574)	204
4934	(19.797143387187901,50.141774032475297)	155
4935	(19.829436597001603,50.091466436361088)	500
4936	(19.835888566969402,50.105516182460548)	360
4937	(19.83775286987327,50.107773931899345)	264
4938	(19.803927448159442,50.093984443893447)	260
4939	(19.815497994938227,50.092917595257518)	333
4940	(19.804900251841758,50.097831485992998)	253
4941	(19.854752459156572,50.119824761729966)	782
4942	(19.839443751200463,50.109425250643568)	61
4943	(19.738612054413064,50.137894217134338)	1
4944	(19.792744145307296,50.146476950707893)	531
4945	(19.752955837675842,50.148171520072481)	462
4946	(19.791234648364764,50.147302232894361)	531
4947	(19.758205088357272,50.148615677121654)	340
4948	(19.753024066367658,50.148039086002342)	462
4949	(19.711562395586665,50.122489787843989)	88
4950	(19.821506059313975,50.122208323535432)	280
4951	(19.761292562391244,50.147989548954598)	422
4952	(19.79909628680829,50.135175127744873)	232
4953	(19.693468381206003,50.144316766622012)	312
4954	(19.70213074285968,50.124640835655413)	685
4955	(19.799220422794292,50.135105474129482)	232
4956	(19.739809493100438,50.135310160204995)	390
4957	(19.810152017094168,50.112242240662113)	809
4958	(19.85443109698889,50.149931384462803)	770
4959	(19.988562837799179,50.089219667215445)	497
4960	(19.898729539079937,50.139631198928981)	446
4961	(19.915539864989597,50.129973486273428)	136
4962	(19.883539267415671,50.155872561251208)	373
4963	(19.8931723372759,50.149422435302114)	23
4964	(19.917053888159813,50.129455484657313)	136
4965	(19.88153314271014,50.161128265998116)	221
4966	(19.916593721675582,50.130015898703505)	136
4967	(19.916488780247843,50.129902575372597)	136
4968	(19.878475592070487,50.144070338668712)	133
4969	(19.884161791364363,50.141637155996477)	293
4970	(19.892796157461476,50.149691578213009)	23
4971	(19.636485353585357,50.134073997124936)	116
4972	(19.74815485117611,49.960504647511982)	783
4973	(20.016805576723296,50.090701587696515)	46
4974	(20.021372121391266,50.093223367085301)	510
4975	(20.016904818456879,50.091071397264528)	46
4976	(20.01585749965534,50.092098599498428)	46
4977	(20.015817182701085,50.092504618888164)	46
4978	(19.736254727964536,50.025095928643225)	529
4979	(19.728620071458948,50.021798068839608)	787
4980	(19.749100832768278,50.03094423394446)	575
4981	(19.74916252357562,50.030858067979857)	575
4982	(19.736186331634656,50.025183854807523)	529
4983	(19.819891537124704,50.04331609066665)	375
4984	(19.759174036364129,50.035286730340594)	758
4985	(19.75747401876248,50.034689519739487)	758
4986	(19.820434935907425,50.043253645487994)	375
4987	(19.720834121601058,50.038840238191028)	473
4988	(19.743879996738571,50.037601644359086)	671
4989	(19.72553687219559,50.03930778075005)	603
4990	(19.653219152719032,50.019532859506967)	69
4991	(19.74323165652811,50.037666185013506)	671
4992	(19.689865839222023,50.025899920795638)	241
4993	(19.734225385387191,50.039600728265953)	538
4994	(19.964530328839114,50.022036533984902)	95
4995	(19.719907669843309,50.038934450782698)	473
4996	(19.837911539300336,49.98344767669758)	175
4997	(19.96064053903336,50.019700916665585)	579
4998	(19.685403062515345,49.992052454676468)	26
4999	(19.895780198810282,49.984330626377869)	399
5000	(19.889725028138713,49.983514396646825)	329
5001	(19.8836924886057,49.971622068605221)	342
5002	(19.890270690035294,49.983788736337686)	329
5003	(19.914978780391152,49.987699229444274)	755
5004	(19.876386989437719,49.971523916519054)	657
5005	(19.884100771109274,49.98282163234952)	764
5006	(19.903501691832759,49.986016227106063)	216
5007	(19.904285986512686,49.986127957875368)	216
5008	(19.913876392485776,49.987495716835205)	755
5009	(19.885006184290063,49.982860189104144)	764
5010	(19.843126172721668,49.98770635406197)	699
5011	(19.869087776697114,49.972548520362977)	512
5012	(19.873753730736723,49.980639068582178)	730
5013	(19.876329489581963,49.971609579569503)	657
5014	(19.868665328777183,49.972831493414127)	512
5015	(19.837179463877163,49.982763042846358)	175
5016	(19.873557929478608,49.980852388017951)	730
5017	(19.883693242976989,49.971701529047294)	342
5018	(19.895274183315706,49.984223421836276)	399
5019	(19.863985041683151,49.990461737092204)	501
5020	(19.859441128153748,49.990232492040406)	738
5021	(19.853126537578955,49.995505295869776)	325
5022	(19.859600468133095,49.990532899450123)	738
5023	(19.864016557639076,49.990539772610724)	501
5024	(19.77887745997316,49.966177016665625)	213
5025	(19.851440936850764,49.99506784434314)	325
5026	(19.776566233992071,49.965368749742623)	213
5027	(19.785638470710978,49.968901386654125)	40
5028	(19.78495107083171,49.968512131070753)	40
5029	(19.770777691660438,49.964761732314798)	18
5030	(19.772364888845402,49.965135565196334)	18
5031	(19.763088385146176,49.977183796636972)	345
5032	(19.64926105040243,49.96296984905436)	616
5033	(19.765876960512969,49.937692543653981)	413
5034	(19.77710016122424,49.94355836713288)	467
5035	(19.649585094779127,49.962823752482052)	616
5036	(19.758491833264856,49.962506078351765)	727
5037	(19.77124699441913,49.940574158146006)	527
5038	(19.734031344328741,49.926462134505982)	193
5039	(19.777803570538563,49.94358912871752)	467
5040	(19.747628635294888,49.960448740217828)	783
5041	(19.743630970395287,49.958885347637896)	205
5042	(19.739400875320708,49.927806843232105)	315
5043	(19.784509763629615,49.946160864249237)	382
5044	(19.751396971323629,49.933277376157349)	468
5045	(19.794933079321055,49.9526869302411)	581
5046	(19.784929445521524,49.946389271110682)	382
5047	(19.79374125650881,49.952428851442384)	581
5048	(19.757932592685108,49.962441118602186)	727
5049	(19.752734387793993,49.933714073312672)	468
5050	(19.773839265613617,49.940897448151418)	527
5051	(19.721518839271312,49.958765067327363)	670
5052	(19.960906161544955,50.098023683032778)	611
5053	(20.021818122459138,50.090937873546977)	270
5054	(19.973009797365563,50.089008778531593)	470
5055	(19.950602958525991,50.050625445510093)	381
5056	(19.947529398451309,50.049956485817802)	477
5057	(19.797241958369224,49.972201425752559)	120
5058	(19.66599116149871,49.960072560403397)	108
5059	(19.674534081032192,49.960620653051905)	85
5060	(19.711584691449101,49.957720095458711)	725
5061	(19.710249454273562,49.958078086543253)	725
5062	(19.744553985572765,49.9589677417461)	205
5063	(19.700963646661815,49.959284242409922)	459
5064	(19.701952124503062,49.958921557459604)	459
5065	(19.666776797283148,49.960021933708212)	108
5066	(19.722913671778429,49.958903536367785)	670
5067	(19.673991185163629,49.960804971102704)	85
5068	(19.693660159150596,49.960986774582516)	572
5069	(19.687439026796199,49.960615288633875)	363
5070	(19.695286164547241,49.960684774611195)	572
5071	(19.685316645093621,49.960801031608206)	363
5072	(19.802911645313856,49.972848676315635)	233
5073	(19.639485572007285,49.964645978231971)	165
5074	(19.638130385902201,49.964945463632347)	165
5075	(19.810145563028723,49.981783952736663)	749
5076	(19.799362663691142,49.972355736590004)	120
5077	(19.802197423344438,49.972851777619809)	233
5078	(20.013715588118373,50.09810926226416)	56
5079	(20.013301438282582,50.09848527444052)	56
5080	(20.019856421840387,50.097643144628677)	286
5081	(20.017528934967174,50.099306449494435)	568
5082	(20.019183438834602,50.097432675040011)	286
5083	(20.01970009934621,50.099442990697128)	568
5084	(20.012898436378009,50.095653783729489)	195
5085	(20.014890479486212,50.0940643234307)	564
5086	(19.990076944788456,50.064415939344372)	172
5087	(19.988977322911097,50.064188035397081)	172
5088	(20.017086957212822,50.07279432211854)	449
5089	(19.946254175702478,49.989906016911789)	673
5090	(19.946767986367004,49.994054891344632)	98
5091	(19.94236086549742,49.990832887764725)	361
5092	(20.018028664034375,50.074187562064054)	449
5093	(19.946078658650038,49.991275284614233)	673
5094	(20.016086744707138,50.073572581828216)	449
5095	(19.945322275707639,49.989626648079025)	673
5096	(20.018857885715335,50.073298074499291)	449
5097	(19.945968520442335,49.994351778355025)	98
5098	(19.938866030969223,49.993077561434568)	577
5099	(19.940097164907343,49.99269643629728)	577
5100	(19.936159682072571,49.992843035783807)	482
5101	(19.934909772671315,49.993136150937765)	482
5102	(19.692360461244505,50.111949879879433)	160
5103	(19.956324194175149,49.98905516992064)	123
5104	(19.959911816371459,49.98197933489962)	627
5105	(19.963703537910078,49.988076582725142)	768
5106	(19.962269897191277,49.988446476112188)	768
5107	(19.962391937701483,49.988317143346222)	768
5108	(19.956758795854682,49.988820644269843)	123
5109	(19.898379846079536,50.11266217401112)	9
5110	(19.898480596555682,50.1127284748652)	9
5111	(19.903115286096465,50.107784325459278)	450
5112	(19.902650844841617,50.108272990414292)	450
5113	(19.933922468296515,50.024577172655825)	608
5114	(19.95789404082052,50.067002175568547)	220
5115	(19.957467234310911,50.065620418830406)	220
5116	(19.970809966877681,50.088768720824703)	388
5117	(19.957737131593092,50.057535654124393)	444
5118	(19.965354269921079,50.075281232790125)	125
5119	(19.946079664478418,50.057282772105644)	359
5120	(19.968737038403845,50.023542259070979)	398
5121	(19.963405645071276,50.016369780706384)	456
5122	(19.933031891084337,50.048518235052256)	225
5123	(19.969262332275715,50.023764463324113)	398
5124	(19.965312360405193,50.022279860634029)	95
5125	(20.010417225400573,50.091470375855579)	367
5126	(19.977068231063157,50.033466264790349)	640
5127	(19.977027830289842,50.033500043860158)	640
5128	(19.982963977936379,50.039813041873344)	144
5129	(20.000153668783639,50.014319148094984)	12
5130	(19.93693651685868,50.029428282936522)	271
5131	(20.01901362147629,50.064365228830148)	308
5132	(19.890903691362951,50.087705979321328)	350
5133	(19.897547020180212,50.058593450304897)	215
5134	(20.027679671167391,50.018163256528396)	762
5135	(20.02839054037554,50.018033756124368)	762
5136	(19.858985320259194,50.081189384880041)	797
5137	(19.858727828193707,50.081359788971547)	797
5138	(20.012169043163851,50.104219250582496)	191
5139	(20.012059491689371,50.104224279724399)	191
5140	(19.831614550722207,50.061456540790886)	584
5141	(19.831017256302061,50.06126417611307)	584
5142	(20.111751165826117,50.038746025599352)	389
5143	(20.101219220669577,50.036969145945591)	539
5144	(20.093693361267185,50.033444136565976)	411
5145	(20.09442602342358,50.033181280082459)	411
5146	(20.13977144904004,50.04040153529516)	137
5147	(20.139607331375885,50.040618626587353)	137
5148	(20.133534726345715,50.039888227544822)	715
5149	(20.102784876363359,50.036792455426699)	539
5150	(20.133715943092312,50.039988475106753)	715
5151	(20.112140421409492,50.038669582642399)	389
5152	(20.073619038442729,50.04061912950155)	284
5153	(20.062259631804892,50.041659742780524)	33
5154	(20.073332125897107,50.040488539450109)	284
5155	(20.062419726155497,50.041796283983217)	33
5156	(19.815332787626687,49.971963463521462)	402
5157	(19.814888127663323,49.971527185461298)	402
5158	(20.053236345400531,50.042733632215118)	156
5159	(20.052475017135293,50.042778056301955)	156
5160	(19.858374866251069,49.974732928149024)	445
5161	(19.858389618400651,49.974807946182437)	445
5162	(19.856462032127837,49.974507874048832)	484
5163	(19.891474247511979,49.972119199282446)	168
5164	(19.897663193358198,49.972374931148266)	746
5165	(19.869437888792671,50.003528369768418)	246
5166	(19.869078053689435,50.003080021767659)	246
5167	(19.830661947426535,49.974213920704528)	490
5168	(19.906814555243045,49.973043639383434)	370
5169	(19.910628740282164,49.979242140599297)	104
5170	(19.85519091651156,49.974835857919992)	484
5171	(19.91285908089759,49.983725452968734)	674
5172	(19.898317149443812,49.972510131246452)	746
5173	(19.913911680298128,49.986441692511136)	755
5174	(19.906899128646074,49.973522078416579)	370
5175	(19.905796321645539,49.973351590506041)	370
5176	(19.829272730794543,49.971345381981443)	68
5177	(19.827959118929183,49.97518504800621)	425
5178	(19.827867169451395,49.97535914013514)	425
5179	(19.822474420587607,49.975780330769588)	720
5180	(19.822761919866451,49.975577740169882)	720
5181	(19.910862092466516,49.97959677892257)	104
5182	(19.911942519785583,49.982938056984608)	674
5183	(19.813359687619624,49.973801782525491)	402
5184	(19.813978272073854,49.973786276004631)	402
5185	(19.806559952489152,49.973034419289945)	623
5186	(19.806955243042808,49.972960658542036)	623
5187	(19.890913246732566,49.972169071606309)	168
5188	(19.873117041371671,49.98045533726463)	730
5189	(19.853346981632427,49.971539590677992)	574
5190	(19.877969744213971,49.981663840064186)	228
5191	(19.878415996738937,49.981671886691231)	228
5192	(19.852924533712468,49.967977198010203)	452
5193	(19.853507159802064,49.971565826034919)	574
5194	(19.84924051962966,49.966335769911744)	690
5195	(19.84876736119551,49.966384720226266)	690
5196	(19.914272940324906,50.027927838449408)	615
5197	(19.915262591632594,50.028157083501206)	615
5198	(19.816187238836193,50.033384373596363)	521
5199	(19.786626864733194,50.028456065987427)	294
5200	(19.911147244812469,50.024115665067086)	196
5201	(19.780707899988187,50.031234666889446)	35
5202	(19.780815691263001,50.031280180623668)	35
5203	(19.786766674878123,50.028492443447192)	294
5204	(19.787718523802511,50.018207680615234)	70
5205	(19.787657587366425,50.018283453019905)	70
5206	(19.910229845510145,50.023119140598787)	196
5207	(19.76911916447952,50.015299830766281)	206
5208	(19.768714737651379,50.015450956480493)	206
5209	(19.768605772910121,50.015457578183998)	206
5210	(19.816279272133045,50.033284293672466)	521
5211	(19.793733293700797,50.020434919926487)	343
5212	(19.793534223500416,50.020532317641361)	343
5213	(19.776150575413709,50.016527528124101)	784
5214	(19.773636675013904,50.034654148108096)	183
5215	(19.774668068199414,50.016476230876656)	784
5216	(19.773565428836946,50.034582399016955)	183
5217	(19.924532725085413,50.007420255049936)	756
5218	(19.925279049743978,50.007368371069305)	756
5219	(19.862470599417776,50.059098459971089)	358
5220	(19.862267170627746,50.059174232375767)	358
5221	(19.870895082659388,50.061650749487427)	39
5222	(19.891447341602799,50.060797471744358)	335
5223	(19.871069342426377,50.062122650636091)	39
5224	(19.893071419161686,50.060587253612766)	335
5225	(19.805602487689637,49.961929654870517)	240
5226	(19.801248172810034,49.94887023063103)	533
5227	(19.806315452373582,49.962905224580879)	240
5228	(19.732684623945858,50.039604248665285)	538
5229	(19.767473545429453,50.038569754175619)	321
5230	(19.865101595004887,50.046792987922061)	203
5231	(19.727890259149632,50.059836235088426)	648
5232	(20.010061162153761,50.008321728736263)	480
5233	(19.974977952049727,50.092651888926923)	786
5234	(19.975440381647815,50.093211967696988)	786
5235	(19.810479498051166,49.981612878092875)	749
5236	(19.817775693306601,49.975868424571956)	36
5237	(19.820012320349434,49.97797001915464)	259
5238	(19.816591246569146,49.975864065982307)	36
5239	(19.821695322687646,49.976477872751701)	677
5240	(19.808942257009136,49.973719472236326)	652
5357	(19.924208345432589,50.017844073655567)	489
5241	(19.808808398015458,49.973791975698781)	652
5242	(19.815190379091774,49.959437966514145)	387
5243	(19.816191094511652,49.961128428746179)	387
5244	(19.82567454740024,49.971221581271578)	207
5245	(19.825395178567447,49.971221916547705)	207
5246	(19.815232791521822,49.954095257612295)	66
5247	(19.822592186327199,49.9693402631043)	665
5248	(19.815146122643,49.954241689460758)	66
5249	(19.822791591803707,49.969393069094281)	665
5250	(19.96088638025347,50.13106682172338)	128
5251	(19.990441725214566,50.073510052830528)	569
5252	(19.990434768234906,50.073545759738067)	569
5253	(19.98520186226466,50.07209602576517)	667
5254	(19.965690468057343,50.1327437890913)	807
5255	(19.735286618147995,50.11291346346826)	351
5256	(19.871300599134941,50.135743839875175)	371
5257	(19.967553681313802,50.119996087830856)	396
5258	(19.896391491008728,50.175560645977406)	224
5259	(19.868885437554525,50.097547842389616)	103
5260	(19.89656072163379,50.175499038989102)	224
5261	(19.920975361559556,50.118282575365072)	634
5262	(19.921278451178296,50.118502767961445)	634
5263	(19.820048949266294,49.978352150120315)	259
5264	(19.814344980337694,49.98654948378595)	794
5265	(19.81431832588558,49.986826840961982)	794
5266	(19.818734750667716,49.996688066226568)	44
5267	(19.922101134974778,50.092711232801378)	779
5268	(19.922368098590852,50.092722632189719)	779
5269	(19.918208579141009,50.092304291402314)	645
5270	(19.917188920619932,50.092504618888164)	645
5271	(19.914930332990821,50.094840487664555)	269
5272	(19.86151003331409,50.102637669272696)	439
5273	(19.849638827668457,50.106354540415964)	319
5274	(19.885533573637758,50.035145998186323)	254
5275	(19.752031229936762,49.934014564541457)	468
5276	(19.780652579427226,49.938418416468807)	218
5277	(19.781503594056431,49.938500140024757)	218
5278	(19.807646666235598,49.940562255843503)	675
5279	(19.806611752650781,49.941326517774847)	101
5280	(19.806460459298474,49.941240938543473)	101
5281	(19.814481521540387,50.008374450907205)	637
5282	(19.953540983226389,50.126597590951263)	400
5283	(19.960644059432695,50.13102189472238)	128
5284	(19.915858796405331,50.087811339844215)	322
5285	(19.889583373975054,50.047524057516853)	805
5286	(19.889702648457217,50.047638554314204)	805
5287	(19.801400220533591,49.98147575015696)	735
5288	(19.800555492331767,49.981494693258128)	735
5289	(19.808271034202988,50.093934990664735)	366
5290	(19.780521989375785,49.981983442032195)	760
5291	(19.790085740896785,49.983714221218484)	211
5292	(19.790171320128167,49.983629144901272)	211
5293	(19.908929560870831,50.086489848989878)	595
5294	(19.906009892538407,50.083518883410022)	602
5295	(19.951494960661734,50.098287042430485)	583
5296	(19.838571195080078,49.971436996183144)	353
5297	(19.949266883160135,49.979611195796025)	208
5298	(19.949706765438691,49.979523940183981)	208
5299	(19.827238945808546,49.909539071998665)	443
5300	(19.947201917494311,49.973150341010829)	346
5301	(19.947527135337452,49.972706435418786)	346
5302	(19.833444990737235,49.974411146886212)	490
5303	(19.83688442088544,49.974258260972306)	560
5304	(19.944407893890457,49.979801548817079)	785
5305	(19.947116589719997,49.972359927541582)	346
5306	(19.944364475632028,49.979455795311196)	785
5307	(19.834407149402519,49.972982283852218)	780
5308	(19.945843965361174,49.975815031848725)	339
5309	(19.960592846004317,49.973476564682358)	41
5310	(19.834460458306694,49.972878599709958)	780
5311	(19.946267670566584,49.975490819833993)	339
5312	(19.961051336107914,49.97347505593978)	41
5313	(19.836917361764932,49.972437543964958)	353
5314	(19.900998520269013,50.115671193431382)	198
5315	(20.013431357781769,50.157799979885965)	391
5316	(20.013187276761357,50.158050850247946)	391
5317	(19.880334865832452,50.129457999228265)	464
5318	(20.028980039625736,50.154688952704078)	222
5319	(19.894301128176267,50.116966281290722)	774
5320	(20.026627742319132,50.154575545554138)	222
5321	(19.907408664539986,50.103705775194101)	698
5322	(19.911877224759849,50.098783754012544)	42
5323	(19.884957569251668,50.125031851438443)	79
5324	(19.909511767865268,50.101507034353602)	75
5325	(19.836796159445043,50.09912472983364)	414
5326	(19.926904636045464,50.05196839403655)	672
5327	(19.92661789113788,50.051703777353367)	672
5328	(19.779397892341191,49.981931893327669)	760
5329	(19.784546644003598,49.976829074494674)	421
5330	(19.774891445918996,49.980346456342403)	420
5331	(19.790302329274766,49.97899294661795)	138
5332	(19.931564471295729,50.095298474853962)	632
5333	(19.774776027112296,49.980165323414809)	420
5334	(19.804751473060435,49.90721686572445)	666
5335	(19.803990228614222,49.907671081057401)	666
5336	(19.793698424983575,49.909906031719601)	435
5337	(19.792398643258476,49.909622723392339)	435
5338	(19.924021261353772,50.094076141914172)	597
5339	(19.77726536853578,49.904051942905141)	89
5340	(19.775570631533128,49.903793445011267)	89
5341	(19.924717881326526,50.094063988154574)	597
5342	(19.817417534583996,50.08740439844513)	734
5343	(19.808320571250761,49.918416094192651)	349
5344	(19.808140863246706,49.918253736728161)	349
5345	(19.799256967892145,49.910014828822789)	118
5346	(19.797945535321617,49.910270393050546)	118
5347	(19.816833651208924,49.9084982910816)	541
5348	(19.817062477165564,49.908171983591075)	541
5349	(19.815043695786215,49.906730882978451)	27
5350	(19.768363787365502,49.902519228090853)	180
5351	(19.813870564618068,49.906940095281641)	27
5352	(19.788357895376578,49.908437019369416)	752
5353	(19.787205718966359,49.907818183458119)	752
5354	(19.804610573268089,50.112728391046176)	714
5355	(19.906613641023995,50.007951667711154)	243
5356	(19.907215880767009,50.008492468103896)	243
5358	(19.909111699626774,50.011079961613575)	659
5359	(19.901717352285175,50.00637561845744)	287
5360	(19.919897532630472,49.981387991630754)	278
5361	(19.918230539727315,49.986961286688874)	638
5362	(19.909183783994081,49.97790883126148)	761
5363	(19.916814417186146,49.986957095737296)	638
5364	(19.913709257336478,50.009536182687071)	578
5365	(19.914933769571117,50.008735375657864)	578
5366	(19.909655852780816,49.97869999910202)	761
5367	(19.918504627961084,49.979932977058866)	330
5368	(19.9184090742649,49.980005648159363)	330
5369	(19.96050299200229,50.024025475788932)	305
5370	(19.960323032541165,50.024122119132521)	305
5371	(19.958563922522131,50.023881977606607)	305
5372	(19.959347295192742,50.023688523281344)	305
5373	(19.936985131897071,50.080777665796177)	229
5374	(19.937065681986581,50.080905070724413)	229
5375	(19.888994796734206,50.017931077810516)	432
5376	(19.889419843044152,50.01848227176319)	432
5377	(19.808539338923566,50.085332140523548)	204
5378	(19.860664550740978,50.101143678851031)	439
5379	(19.845523480848328,50.096824819421869)	281
5380	(19.846054055319229,50.096956080025564)	281
5381	(19.838603130131187,50.098738827011516)	414
5382	(19.810246062047781,50.085740339208108)	204
5383	(19.785252567888847,49.968585891818655)	40
5384	(19.866384277647541,50.022508518952577)	93
5385	(19.852132443862587,50.028692770933048)	814
5386	(19.872202827192524,50.019840475353419)	199
5387	(19.871106977171621,50.020030828374495)	199
5388	(19.865556229433025,50.023338159728695)	93
5389	(19.840877475738296,50.010181673050454)	747
5390	(19.842574056759645,50.018981162640074)	117
5391	(19.842989296242848,50.018957358035067)	117
5392	(19.852221794950424,50.028616830890286)	814
5393	(19.826943064626505,50.021701257857949)	426
5394	(19.86509145290205,50.031497691011026)	244
5395	(19.841217697188082,50.009781772450054)	747
5396	(19.817892369398773,49.999451831159973)	256
5397	(19.835048616452383,50.024955783222168)	109
5398	(19.817879545086925,50.01828663814311)	773
5399	(19.832152752724966,50.023991445262055)	109
5400	(19.817347629511545,50.018354363920764)	773
5401	(19.833058333543846,50.024547584537601)	109
5402	(19.809048539541379,50.015279462741574)	678
5403	(19.808899676940996,50.015510384173979)	678
5404	(19.812038029127251,50.010300947532613)	481
5405	(19.827660890814286,50.0218955503735)	426
5406	(19.81219636327819,50.009910686120861)	481
5407	(19.864927921971145,50.031550748458095)	244
5408	(19.817601098263509,49.999912835834522)	256
5409	(19.875577968143403,50.033919558113979)	126
5410	(19.885716047669831,50.035117164439413)	254
5411	(19.893939197597234,50.036680473200306)	522
5412	(19.898820566548409,50.038000622950136)	142
5413	(19.895213833612843,50.036800166777624)	522
5414	(19.898446817485905,50.03797883000189)	142
5415	(19.934746157921381,50.095680857276733)	82
5416	(19.936152641273878,50.094600849052824)	82
5417	(20.038425019578739,49.988823494116929)	356
5418	(19.988697283526076,50.066970156698432)	344
5419	(20.024730749992898,50.059683349174549)	617
5420	(19.987110673074369,50.064013691811084)	172
5421	(19.988754364286706,50.067895351170726)	344
5422	(19.989281334539214,50.064908543793877)	172
5423	(20.024078973202109,50.060653219190755)	617
5424	(20.021426017028659,50.055160893317257)	383
5425	(20.021063834992532,50.054769961353259)	383
5426	(20.025014225958213,50.059712769654674)	617
5427	(20.003889147751948,50.051257273371299)	412
5428	(20.021115467516097,50.058875752803772)	795
5429	(20.021589799416684,50.058711551320613)	795
5430	(20.012232326532793,50.06686102431911)	551
5431	(20.01209905427234,50.066830765648653)	551
5432	(20.014647152837085,50.057305989977436)	474
5433	(19.989215368961226,49.994162682619418)	318
5434	(19.967129389375145,50.013181472377227)	313
5435	(19.709596755473424,50.082205271544666)	407
5436	(19.811222469948461,49.94691791774386)	239
5437	(19.811259182684349,49.946643829510094)	239
5438	(20.01755315866734,50.006218373953885)	53
5439	(19.865580034038032,50.046764237994175)	203
5440	(20.062804120235025,50.087854255188461)	431
5441	(19.902232336416148,50.062299760250141)	77
5442	(20.073344698751864,50.088431768317122)	642
5443	(20.094590224906739,50.094848199015473)	745
5444	(20.033545578465322,50.075466053755122)	226
5445	(20.073688943515208,50.088711053330854)	642
5446	(20.065635946222212,50.08336658422936)	227
5447	(20.083501386103332,50.094808636432504)	724
5448	(20.066380845957241,50.087987527448917)	431
5449	(20.084665380997052,50.095016675269278)	724
5450	(20.066492241450419,50.08817109112843)	431
5451	(20.093652625217743,50.094971580630187)	745
5452	(20.062680738620315,50.087985599611187)	431
5453	(20.038971687303725,50.07474269551124)	478
5454	(20.034637740448829,50.075321382106324)	226
5455	(20.037685735718838,50.075050395176724)	478
5456	(20.185300354516954,50.080492764907291)	235
5457	(19.90316356585873,50.049765126968339)	279
5458	(20.184911853304868,50.080352535667203)	235
5459	(19.75833408584711,50.148561446208134)	340
5460	(20.042739185142153,50.021873841244286)	405
5461	(19.842044320479062,50.134305924385757)	557
5462	(20.042106099995465,50.021947685811249)	405
5463	(19.871587595499591,50.135689189866497)	371
5464	(19.841710469275654,50.13440047225356)	557
5465	(19.85634158417923,50.133308142631989)	775
5466	(19.828930330049925,50.11669294742822)	802
5467	(19.870408932275325,50.138307780236914)	669
5468	(19.815278891989266,50.124853987453122)	504
5469	(19.868622581071008,50.138048527971762)	669
5470	(19.814417735257223,50.125027325210738)	504
5471	(19.856116949174179,50.133433871179584)	775
5472	(20.014900370131954,50.078113477872449)	609
5473	(19.822484395052385,50.121911855620198)	280
5474	(19.848356647940022,50.135231370315154)	523
5475	(19.875173625134323,50.147584367755172)	798
5476	(19.82899294286662,50.116546683217848)	802
5477	(19.848137377352998,50.135340167418349)	523
5478	(19.874840528302197,50.147796932819659)	798
5479	(19.945570966774824,50.01893539744875)	184
5480	(20.014363928328859,50.078158237235414)	609
5481	(19.917401820960549,50.052624445597928)	63
5482	(19.940660428800612,50.075477034048276)	458
5483	(19.856403861719798,50.099722778625079)	772
5484	(19.884277545447187,50.125375425649537)	79
5485	(19.855586793798466,50.099666871330896)	772
5486	(19.748867564402957,50.104895586349556)	115
5487	(19.880553717324318,50.129050471095972)	464
5488	(19.974188628227893,50.079999154629398)	78
5489	(19.976511253597266,50.078573728175712)	612
5490	(19.87268034421632,50.113341694901408)	10
5491	(19.893363863763426,50.117358386721179)	774
5492	(19.885882847543002,50.109704954752459)	6
5493	(19.886609726186208,50.109892457926463)	6
5494	(19.952709833707697,50.067768365337649)	181
5495	(19.900218667997763,50.05749047566627)	185
5496	(19.871360948837776,50.04782555457399)	710
5497	(19.87180711754371,50.047089874932453)	710
5498	(20.014905231635794,50.056918578412763)	474
5499	(19.743283624327802,49.964590992947137)	276
5500	(20.040515382411201,50.08122073319791)	741
5501	(19.743773881844415,49.959508877414976)	205
5502	(19.62874458218559,49.966865925287465)	534
5503	(19.744026260948971,49.959264377299405)	205
5504	(19.863837184911173,50.006519116639765)	789
5505	(19.85861844435729,50.006258187993971)	537
5506	(19.864738323321347,50.00567103567667)	789
\.


--
-- Data for Name: us_gaz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: us_lex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: us_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY us_rules (id, rule, is_custom) FROM stdin;
\.


SET search_path = tiger, pg_catalog;

--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY pagc_rules (id, rule, is_custom) FROM stdin;
\.


SET search_path = topology, pg_catalog;

--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- Name: points points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY points
    ADD CONSTRAINT points_pkey PRIMARY KEY (id);


--
-- Name: stop_groups stop_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stop_groups
    ADD CONSTRAINT stop_groups_pkey PRIMARY KEY (id);


--
-- Name: stops stops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stops
    ADD CONSTRAINT stops_pkey PRIMARY KEY (id);


--
-- Name: fki_sdsf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sdsf ON points USING btree (stop_group_id);


--
-- Name: fki_stop_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_stop_group ON stops USING btree (stop_group_id);


--
-- Name: points sdsf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY points
    ADD CONSTRAINT sdsf FOREIGN KEY (stop_group_id) REFERENCES stop_groups(id);


--
-- Name: stops stop_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stops
    ADD CONSTRAINT stop_group FOREIGN KEY (stop_group_id) REFERENCES stop_groups(id);


--
-- PostgreSQL database dump complete
--

