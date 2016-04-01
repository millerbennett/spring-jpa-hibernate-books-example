package modules.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="book")
public class Book implements Serializable {
	
	private Integer bookId;
	private String name;
	
	@Id
	@SequenceGenerator(name="book_id_seq", sequenceName="book_bookid_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="book_id_seq")
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
