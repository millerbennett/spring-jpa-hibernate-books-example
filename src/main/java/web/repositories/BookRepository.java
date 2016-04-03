package web.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import web.entities.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

}
