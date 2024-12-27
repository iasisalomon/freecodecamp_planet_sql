--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    star_count integer,
    infrared_wavelength integer,
    report_file text
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
-- Name: galaxy_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    galaxy_star_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.galaxy_star OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_galaxy_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_galaxy_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_galaxy_star_id_seq OWNED BY public.galaxy_star.galaxy_star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255),
    color text,
    planet_id integer NOT NULL,
    fantasy_name text
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
    name character varying(255),
    weight numeric(2,1),
    has_moons boolean,
    star_id integer NOT NULL
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
    name character varying(255),
    total_planets integer,
    has_habitable_planets boolean,
    galaxy_id integer NOT NULL
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
-- Name: galaxy_star galaxy_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star ALTER COLUMN galaxy_star_id SET DEFAULT nextval('public.galaxy_star_galaxy_star_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1234, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 5678, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 9012, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 3456, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 7890, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 2468, NULL, NULL);


--
-- Data for Name: galaxy_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star VALUES (1, 1, 1, NULL);
INSERT INTO public.galaxy_star VALUES (1, 2, 2, NULL);
INSERT INTO public.galaxy_star VALUES (2, 3, 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 'gray', 4, NULL);
INSERT INTO public.moon VALUES (2, 'Deimos', 'reddish-gray', 4, NULL);
INSERT INTO public.moon VALUES (3, 'Europa', 'white', 5, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 'yellow', 5, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'brown', 5, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', 'dark-gray', 5, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 'orange', 6, NULL);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'white', 6, NULL);
INSERT INTO public.moon VALUES (9, 'Triton', 'blue', 8, NULL);
INSERT INTO public.moon VALUES (10, 'Nereid', 'dark-gray', 8, NULL);
INSERT INTO public.moon VALUES (11, 'Charon', 'gray', 3, NULL);
INSERT INTO public.moon VALUES (12, 'Styx', 'dark-gray', 3, NULL);
INSERT INTO public.moon VALUES (13, 'Nix', 'light-gray', 3, NULL);
INSERT INTO public.moon VALUES (14, 'Hydra', 'white', 3, NULL);
INSERT INTO public.moon VALUES (15, 'Oberon', 'reddish-gray', 7, NULL);
INSERT INTO public.moon VALUES (16, 'Titania', 'brown', 7, NULL);
INSERT INTO public.moon VALUES (17, 'Ariel', 'white', 7, NULL);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'dark-gray', 7, NULL);
INSERT INTO public.moon VALUES (19, 'Miranda', 'light-gray', 7, NULL);
INSERT INTO public.moon VALUES (20, 'Proteus', 'dark-gray', 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3.3, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.8, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 5.9, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.6, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 9.8, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 8.9, true, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 7.5, true, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 6.7, true, 2);
INSERT INTO public.planet VALUES (9, 'Proxima b', 1.2, false, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 5.4, true, 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 0.9, true, 3);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 8.7, false, 4);
INSERT INTO public.planet VALUES (13, 'WASP-12b', 9.2, false, 4);
INSERT INTO public.planet VALUES (14, 'Gliese 581g', 2.3, true, 5);
INSERT INTO public.planet VALUES (15, 'LHS 1140b', 6.4, false, 5);
INSERT INTO public.planet VALUES (16, '55 Cancri e', 8.2, false, 5);
INSERT INTO public.planet VALUES (17, 'GJ 1214b', 5.3, false, 6);
INSERT INTO public.planet VALUES (18, 'Ross 128 b', 1.1, false, 6);
INSERT INTO public.planet VALUES (19, 'K2-18b', 7.9, true, 6);
INSERT INTO public.planet VALUES (20, 'TOI 700 d', 3.7, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 3, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, true, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 0, false, 2);
INSERT INTO public.star VALUES (6, 'Vega', 10, false, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_galaxy_star_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star galaxy_star_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_pk PRIMARY KEY (galaxy_star_id);


--
-- Name: galaxy_star gs_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT gs_id_unique UNIQUE (galaxy_star_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_star galaxy_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star galaxy_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

