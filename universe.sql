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
    name character varying(50) NOT NULL,
    galaxy_type_id integer NOT NULL,
    description text,
    num_stars_in_blns integer,
    distance_from_earth_in_mlns_of_ly numeric
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    description text,
    has_atmosphere boolean
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
    name character varying(50) NOT NULL,
    star_id integer,
    description text,
    num_moons integer,
    is_rocky boolean
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
    name character varying(50) NOT NULL,
    star_type_id integer,
    galaxy_id integer,
    description text
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 'This is our galaxy.', 300, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 'This is the full-sized galaxy nearest to our own.', 1000, 2.5);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 2, NULL, 20, 0.16);
INSERT INTO public.galaxy VALUES (4, 'NGC 3923', 3, NULL, NULL, 80);
INSERT INTO public.galaxy VALUES (5, 'Hoags Object', 4, NULL, 700, 615);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 4, NULL, NULL, 500);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 1, NULL, NULL, 31);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral Galaxy', 'Resembles a pinwheel. The classic, everyone loves them.');
INSERT INTO public.galaxy_type VALUES (2, 'Magellanic Spiral', 'Dwarf galaxies with only one arm. Oddballs.');
INSERT INTO public.galaxy_type VALUES (3, 'Elliptical Galaxy', 'Round or oval. A bit boring, but they have their charms.');
INSERT INTO public.galaxy_type VALUES (4, 'Ring Galaxy', 'Circular with distinct banding. Kind of nice.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Sole moon of Earth. Sometimes called Luna.', NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 'This world isnt ours. Attempt no landing here.', true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Tethys', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Atlas', 6, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Pandora', 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Titania', 7, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Triton', 8, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Nereid', 8, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Proteus', 8, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Neso', 8, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Charon', 9, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Styx', 9, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Nix', 9, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Kerberos', 9, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Hydra', 9, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Planet closest to the Sun. For a long time, astronomers were not sure if Mercury has a moon.', 0, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, NULL, 0, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'This is the planet we live on.', 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, NULL, 2, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The biggest planet in our star system.', 95, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, NULL, 83, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, NULL, 27, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, NULL, 14, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Once considered a planet. Then not a planet. Now a dwarf planet.', 5, true);
INSERT INTO public.planet VALUES (10, 'Dimidium', 3, 'The first exoplanet confirmed to orbit a Sun-like star.', NULL, false);
INSERT INTO public.planet VALUES (11, 'Draugr', 7, 'The least-massive known exoplanet.', NULL, false);
INSERT INTO public.planet VALUES (12, 'M51-ULS-1b', 8, 'If confirmed, would be the first known exoplanet outside of the Milky Way galaxy.', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, 1, 'The star around which our planet--indeed, our very lives--revolves around. Sometimes called Sol.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 1, 'One of the stars closest to us.');
INSERT INTO public.star VALUES (3, '51 Pegasi', 2, 1, 'The first Sun-like star found to be orbited by an exoplanet.');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 4, 1, 'Say it three times to feel a bit goofy.');
INSERT INTO public.star VALUES (5, 'Polaris Aa', 5, 1, 'The largest star in the triple star system known as Polaris, the North Star.');
INSERT INTO public.star VALUES (6, 'Sirius A', 3, 1, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (7, 'Lich', 6, 1, 'Host star to the first known exoplanet.');
INSERT INTO public.star VALUES (8, 'M51-ULS-1', 7, 7, 'Host star system to a suspected extragalactic planet.');


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Red Dwarf', 'Small and red');
INSERT INTO public.star_type VALUES (2, 'Yellow Dwarf', 'Small and yellow');
INSERT INTO public.star_type VALUES (3, 'Main-Sequence Dwarf', 'Small and white');
INSERT INTO public.star_type VALUES (4, 'Red Supergiant', 'Big and red');
INSERT INTO public.star_type VALUES (5, 'Yellow Supergiant', 'Big and yellow');
INSERT INTO public.star_type VALUES (6, 'Pulsar', 'Dense, decayed and revolving rapidly');
INSERT INTO public.star_type VALUES (7, 'High-Mass X-ray Binary', 'Dense');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy_type name_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT name_pkey UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--