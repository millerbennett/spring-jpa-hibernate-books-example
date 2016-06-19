package web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import web.entities.Book;
import web.services.BookService;

@RestController
public class BookController {
	
	@Autowired BookService service;
	
	@RequestMapping(value="/books/{id}", method=RequestMethod.GET)
    public Book getBook(@PathVariable("id") Integer id) {
		System.out.println("=== Fetching book ===");
        Book book = service.getBook(id);
        System.out.println(book);
        System.out.println("=== End book ===");
        return book;
    }
	
	@RequestMapping(value="/books", method=RequestMethod.POST)
    public Book createBook(@RequestBody Book book) {
		System.out.println("=== Received book ===");
		book = service.saveBook(book);
        System.out.println("=== End received book ===");
        return book;
    }
	
	@RequestMapping(value="/books/{id}", method=RequestMethod.PUT)
    public Book updateBook(@RequestBody Book book, @PathVariable("id") Integer id) {
		System.out.println("=== Received book to update ===");
		book = service.saveBook(book);
        System.out.println("=== End received book to update ===");
        return book;
    }
}