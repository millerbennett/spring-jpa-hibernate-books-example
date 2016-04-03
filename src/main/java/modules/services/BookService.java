package modules.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import modules.entities.Book;
import modules.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired BookRepository repository;

	public Book getBook(Integer id) {
		return repository.findOne(id);
	}
	
	@Transactional
	public Book saveBook(Book book) {
		return repository.save(book);
	}
}
