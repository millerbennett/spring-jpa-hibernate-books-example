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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: book_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE book_details (
    book_id integer NOT NULL,
    description character varying,
    author character varying,
    id integer NOT NULL
);


--
-- Name: book_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE book_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: book_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE book_details_id_seq OWNED BY book_details.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE books (
    id integer NOT NULL,
    name character varying
);


--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE book_id_seq OWNED BY books.id;


--
-- Name: chapters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE chapters (
    id integer NOT NULL,
    title character varying,
    book_id integer NOT NULL
);


--
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE chapters_id_seq OWNED BY chapters.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_details ALTER COLUMN id SET DEFAULT nextval('book_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('book_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY chapters ALTER COLUMN id SET DEFAULT nextval('chapters_id_seq'::regclass);


--
-- Name: book_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_details
    ADD CONSTRAINT book_details_pkey PRIMARY KEY (id);


--
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY books
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: book_detail_book_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_details
    ADD CONSTRAINT book_detail_book_fk FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;


--
-- Name: book_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chapters
    ADD CONSTRAINT book_id_fk FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM benmiller;
GRANT ALL ON SCHEMA public TO benmiller;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: book_details; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON TABLE book_details FROM PUBLIC;
REVOKE ALL ON TABLE book_details FROM benmiller;
GRANT ALL ON TABLE book_details TO benmiller;
GRANT ALL ON TABLE book_details TO librarian;


--
-- Name: books; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON TABLE books FROM PUBLIC;
REVOKE ALL ON TABLE books FROM benmiller;
GRANT ALL ON TABLE books TO benmiller;
GRANT ALL ON TABLE books TO librarian;


--
-- Name: book_id_seq; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON SEQUENCE book_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE book_id_seq FROM benmiller;
GRANT ALL ON SEQUENCE book_id_seq TO benmiller;
GRANT ALL ON SEQUENCE book_id_seq TO librarian;


--
-- Name: chapters; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON TABLE chapters FROM PUBLIC;
REVOKE ALL ON TABLE chapters FROM benmiller;
GRANT ALL ON TABLE chapters TO benmiller;
GRANT ALL ON TABLE chapters TO librarian;


--
-- Name: chapters_id_seq; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON SEQUENCE chapters_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE chapters_id_seq FROM benmiller;
GRANT ALL ON SEQUENCE chapters_id_seq TO benmiller;
GRANT ALL ON SEQUENCE chapters_id_seq TO librarian;


--
-- PostgreSQL database dump complete
--

