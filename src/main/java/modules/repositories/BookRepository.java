package modules.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import modules.entities.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

}
