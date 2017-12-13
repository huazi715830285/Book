package com.jnmd.ssh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jnmd.ssh.dao.BookDAO;
import com.jnmd.ssh.domain.Book;
import com.jnmd.ssh.exception.BookException;

@Service
@Transactional
public class BookService {
	@Resource
	private BookDAO bookDAO;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=BookException.class)
	public void saveBook(Book b) throws BookException {
		bookDAO.saveBook(b);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=BookException.class)
	public void updateBook(Book b) throws BookException {
		bookDAO.updateBook(b);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=BookException.class)
	public void deleteBook(Book book) throws BookException {
		bookDAO.delBook(book);
	}
	
	@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
	public Book getBook(int id){
		return bookDAO.getBook(id);
	}
	
	@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
	public List<Book> findBook(){
		return bookDAO.findBook();
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=BookException.class)
	public void testRollback(Book b) throws BookException{
		bookDAO.saveBook(b);
		
		bookDAO.testRollback(new Object());
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=BookException.class)
	public List<Book> limit(int page) {
		List<Book> list = bookDAO.limit(page);
		return list;
	}
}
