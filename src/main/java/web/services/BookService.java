package web.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.entities.Book;
import web.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired BookRepository repository;

	public Book getBook(Integer id) {
		return repository.findOne(id);
	}
	
	@Transactional
	public Book saveBook(Book book) {
		repository.save(book);
		return getBook(book.getId());
	}
}
