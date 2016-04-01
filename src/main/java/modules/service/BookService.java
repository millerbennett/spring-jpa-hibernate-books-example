package modules.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import modules.entities.Book;
import modules.entities.Chapter;
import modules.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired BookRepository repository;

	public Book getBook(Integer id) {
		return repository.findOne(id);
	}
	
	public Book saveBook(Book book) {
		for (Chapter chap : book.getChapters()) {
			chap.setBook(book);
		}
		repository.save(book);
		return book;
	}
}
