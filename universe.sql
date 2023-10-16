--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_shape character varying(40) NOT NULL,
    galaxy_size integer NOT NULL,
    distance_from_earth_ly numeric(5,3),
    galaxy_group text,
    active_star_formation boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: misc; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.misc (
    misc_id integer NOT NULL,
    name character varying(30),
    facts text NOT NULL
);


ALTER TABLE public.misc OWNER TO freecodecamp;

--
-- Name: misc_misc_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.misc_misc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.misc_misc_id_seq OWNER TO freecodecamp;

--
-- Name: misc_misc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.misc_misc_id_seq OWNED BY public.misc.misc_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_round boolean,
    distance_from_surface integer,
    radius_km numeric(5,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_type character varying(30),
    habitable_zones boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    solar_radii integer,
    star_type text,
    constellation character varying(30),
    solar_luminosity integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: misc misc_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.misc ALTER COLUMN misc_id SET DEFAULT nextval('public.misc_misc_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MIlky Way', 'barred spiral', 87400, 0.010, 'Local Group', true);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'magellanic sprial', 32200, 0.163, 'Local Group', true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'spiral', 61100, 2.730, 'Local Group', true);
INSERT INTO public.galaxy VALUES (5, 'NGC 300', 'spiral', 94000, 6.070, 'inbetween Local Group and Sculptor Group', true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'barred spiral', 152000, 2.538, 'Local_Group', true);
INSERT INTO public.galaxy VALUES (6, 'IC 342', 'intermediate spiral', 75000, 10.700, 'IC342/Maffei Group', true);
INSERT INTO public.galaxy VALUES (7, 'Messier 82', 'starburst', 40800, 11.420, 'M81 Group', true);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 'lenticular', 60000, 12.010, 'Centaurus A/M83 Group', true);


--
-- Data for Name: misc; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.misc VALUES (1, 'I
', 'tried a composite primary key table');
INSERT INTO public.misc VALUES (2, 'But', 'that was not specified in the requirements');
INSERT INTO public.misc VALUES (3, 'So', 'this is me fulfilling requirements ;p');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4, 'Phobos', false, 9378, 11.1);
INSERT INTO public.moon VALUES (2, 4, 'Deimos', false, 23460, 6.2);
INSERT INTO public.moon VALUES (3, 3, 'Moon', true, 384400, 1737.4);
INSERT INTO public.moon VALUES (4, 6, 'Europa', true, 670900, 1560.8);
INSERT INTO public.moon VALUES (5, 6, 'Ganymede', true, 1070400, 2634.0);
INSERT INTO public.moon VALUES (6, 6, 'Callisto', true, 1882700, 2410.0);
INSERT INTO public.moon VALUES (7, 6, 'Io', true, 422000, 1821.0);
INSERT INTO public.moon VALUES (8, 5, 'Titan', true, 1222000, 2575.0);
INSERT INTO public.moon VALUES (9, 5, 'Rhea', true, 527040, 763.8);
INSERT INTO public.moon VALUES (10, 5, 'Enceladus', true, 238020, 252.3);
INSERT INTO public.moon VALUES (11, 5, 'Iapetus', true, 3560820, 735.0);
INSERT INTO public.moon VALUES (12, 5, 'Hyperion', true, 1481010, 135.0);
INSERT INTO public.moon VALUES (13, 5, 'Mimas', true, 185520, 198.2);
INSERT INTO public.moon VALUES (14, 7, 'Titania', true, 436300, 788.9);
INSERT INTO public.moon VALUES (15, 7, 'Oberon', true, 583520, 761.4);
INSERT INTO public.moon VALUES (16, 7, 'Ariel', true, 190900, 578.9);
INSERT INTO public.moon VALUES (17, 7, 'Umbriel', true, 266300, 584.7);
INSERT INTO public.moon VALUES (18, 8, 'Triton', true, 354800, 1353.4);
INSERT INTO public.moon VALUES (19, 8, 'Nereid', false, 5513818, NULL);
INSERT INTO public.moon VALUES (20, 8, 'Proteus', true, 117647, 210.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Water World', true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', false);
INSERT INTO public.planet VALUES (5, 1, 'Saturn', 'Gas Giant', false);
INSERT INTO public.planet VALUES (6, 1, 'Jupiter', 'Gas Giant', false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', false);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice Giant', false);
INSERT INTO public.planet VALUES (9, 5, 'Proxima b', NULL, true);
INSERT INTO public.planet VALUES (10, 5, 'Proxima d', NULL, true);
INSERT INTO public.planet VALUES (11, 10, 'Kepler-186f', NULL, true);
INSERT INTO public.planet VALUES (12, 10, 'Kepler-186e', NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 1, 'G-type main-sequence aka yellow dwarf', NULL, 1);
INSERT INTO public.star VALUES (2, 1, 'AH Scorpii', 1411, 'Red Supergiant variable', 'Scorpius', 330000);
INSERT INTO public.star VALUES (3, 1, 'PZ Cassiopeiae', 1062, 'Red Supergiant semi-variable', 'Cassiopeia', 229000);
INSERT INTO public.star VALUES (4, 1, 'V766 Centauri', 1100, 'Yellow Supergiant', 'Centaurus', 630000);
INSERT INTO public.star VALUES (5, 1, 'Proxima Centauri', 0, 'Red Dwarf', 'Centaurus', 0);
INSERT INTO public.star VALUES (6, 2, 'WOH G64', 1540, 'Red Supergiant', 'Dorado', 282000);
INSERT INTO public.star VALUES (7, 2, 'IRAS 05280-6910', 1367, 'Red Supergiant', 'Dorado', 220000);
INSERT INTO public.star VALUES (8, 2, 'S Doradus', 380, 'Luminous Blue variable', 'Dorado', 910000);
INSERT INTO public.star VALUES (9, 3, 'M31_v1', NULL, 'Cepheid variable', NULL, NULL);
INSERT INTO public.star VALUES (10, 1, 'Kepler-186', 1, 'M1-type main-sequence dwarf', 'Cygnus', 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: misc_misc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.misc_misc_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: star individual; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT individual UNIQUE (name);


--
-- Name: misc misc_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.misc
    ADD CONSTRAINT misc_name_key UNIQUE (name);


--
-- Name: misc misc_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.misc
    ADD CONSTRAINT misc_pkey PRIMARY KEY (misc_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: moon planetary; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planetary UNIQUE (name);


--
-- Name: galaxy specific; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT specific UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet system; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT system UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

