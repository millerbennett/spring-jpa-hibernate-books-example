package modules.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="books")
public class Book {
	
	private Integer id;
	private String name;
	private Set<Chapter> chapters = new HashSet<Chapter>();
	
	@Id
	@SequenceGenerator(name="book_id_seq", sequenceName="book_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="book_id_seq")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@OneToMany(cascade=CascadeType.ALL, orphanRemoval=true, fetch=FetchType.EAGER)
	@JoinColumn(name="book_id")
	public Set<Chapter> getChapters() {
		return chapters;
	}
	public void setChapters(Set<Chapter> chapters) {
		this.chapters = chapters;
	}
	
	@Override
	public String toString() {
		String out = "Book [bookId=" + id + ", name=" + name + "]";
		for (Chapter chap : chapters) {
			System.out.println(chap);
		}
		return out;
	}
	
}
