--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: benmiller
--

CREATE TABLE books (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE books OWNER TO benmiller;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: benmiller
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book_id_seq OWNER TO benmiller;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: benmiller
--

ALTER SEQUENCE book_id_seq OWNED BY books.id;


--
-- Name: chapters; Type: TABLE; Schema: public; Owner: benmiller
--

CREATE TABLE chapters (
    id integer NOT NULL,
    title character varying,
    book_id integer
);


ALTER TABLE chapters OWNER TO benmiller;

--
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: benmiller
--

CREATE SEQUENCE chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chapters_id_seq OWNER TO benmiller;

--
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: benmiller
--

ALTER SEQUENCE chapters_id_seq OWNED BY chapters.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: benmiller
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('book_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: benmiller
--

ALTER TABLE ONLY chapters ALTER COLUMN id SET DEFAULT nextval('chapters_id_seq'::regclass);


--
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: benmiller
--

ALTER TABLE ONLY books
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: benmiller
--

ALTER TABLE ONLY chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: book_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: benmiller
--

ALTER TABLE ONLY chapters
    ADD CONSTRAINT book_id_fk FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: benmiller
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM benmiller;
GRANT ALL ON SCHEMA public TO benmiller;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: books; Type: ACL; Schema: public; Owner: benmiller
--

REVOKE ALL ON TABLE books FROM PUBLIC;
REVOKE ALL ON TABLE books FROM benmiller;
GRANT ALL ON TABLE books TO benmiller;
GRANT ALL ON TABLE books TO librarian;


--
-- Name: book_id_seq; Type: ACL; Schema: public; Owner: benmiller
--

REVOKE ALL ON SEQUENCE book_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE book_id_seq FROM benmiller;
GRANT ALL ON SEQUENCE book_id_seq TO benmiller;
GRANT ALL ON SEQUENCE book_id_seq TO librarian;


--
-- Name: chapters; Type: ACL; Schema: public; Owner: benmiller
--

REVOKE ALL ON TABLE chapters FROM PUBLIC;
REVOKE ALL ON TABLE chapters FROM benmiller;
GRANT ALL ON TABLE chapters TO benmiller;
GRANT ALL ON TABLE chapters TO librarian;


--
-- Name: chapters_id_seq; Type: ACL; Schema: public; Owner: benmiller
--

REVOKE ALL ON SEQUENCE chapters_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE chapters_id_seq FROM benmiller;
GRANT ALL ON SEQUENCE chapters_id_seq TO benmiller;
GRANT ALL ON SEQUENCE chapters_id_seq TO librarian;


--
-- PostgreSQL database dump complete
--

