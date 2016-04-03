A sample application built to illustrate Spring JPA in conjunction with Hibernate on a simple PostgreSQL setup. To build and deploy the application to tomcat:

```bash
./gradlew deploywar
```

Table Structure (see the full sql dump in **library.sql**):

```sql
CREATE TABLE books (
    id integer NOT NULL,
    name character varying
);

CREATE TABLE chapters (
    id integer NOT NULL,
    title character varying,
    book_id integer NOT NULL
);

ALTER TABLE ONLY chapters
    ADD CONSTRAINT book_id_fk FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;
```