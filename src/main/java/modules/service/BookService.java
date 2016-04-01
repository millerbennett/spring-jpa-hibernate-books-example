package modules.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import modules.entities.Book;
import modules.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired BookRepository repository;

	public Book getBook(Integer id) {
		return repository.findOne(id);
	}
	
	public Book saveBook(Book book) {
		repository.save(book);
		return book;
	}
}
