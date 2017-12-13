package com.jnmd.ssh.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.stereotype.Controller;
import com.jnmd.ssh.domain.Book;
import com.jnmd.ssh.exception.BookException;
import com.jnmd.ssh.service.BookService;
import com.opensymphony.xwork2.validator.annotations.DoubleRangeFieldValidator;
import com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;

@Controller
@Namespace("/")
@ParentPackage("struts-default")
@Results({
	@Result(name="success", location="/booklist.jsp"),
	@Result(name="input", location="/addbook.jsp"),
	@Result(name="one",location="/detils.jsp"),
	@Result(name="addSucc",location="/addSucc.jsp"),
	@Result(name="deleteSuccess",location="/deleteSucc.jsp"),
	@Result(name="limit",location="/limit.jsp")
})
public class BookAction {
	
	@Resource
	private BookService bookService;
	private Book book;
	private List<Book> books;
	private int id;
	private String name;
	private String sort;
	private String author;
	private int discount;
	private double price;
	private int count;
	private String account;
	private List<Book> limitBook;
	private int currentNum;
	private int totalPage;
	private int page;
	private int pageSum;
	
	public int getPageSum() {
		return pageSum;
	}
	public void setPageSum(int pageSum) {
		this.pageSum = pageSum;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentNum() {
		return currentNum;
	}
	public void setCurrentNum(int currentNum) {
		this.currentNum = currentNum;
	}
	private int pageEv = 5;
	public List<Book> getLimitBook() {
		return limitBook;
	}
	public void setLimitBook(List<Book> limitBook) {
		this.limitBook = limitBook;
	}
	@RequiredStringValidator(key = "nameError",trim = true)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@RequiredStringValidator(
			key = "sortError",
			trim = true
			)
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	@RequiredStringValidator(
			key = "authorError",
			trim = true
			)
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	@IntRangeFieldValidator(
			key = "discountError",
			min = "7",
			max = "10"
			)
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	@DoubleRangeFieldValidator(
			key = "priceErroe",
			minInclusive = "0.0",
			maxInclusive = "9999.0"
			)
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@IntRangeFieldValidator(
			key = "countError",
			min = "1",
			max = "5000"
			)
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@StringLengthFieldValidator(
			key = "accountError",
			minLength = "5",
			maxLength = "200",
			trim = true
			)
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Book getBook(){
		return book;
	}
	public List<Book> getBooks() {
		return books;
	}
	
	public int getId() {
		return id;
	}
	
	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Action("bookAction")
	public String books() throws Exception {
		books = bookService.findBook();
		return "success";
	}
	@Action("getBookAction")
	public String getBookk(){
		book = bookService.getBook(id);
		return "one";
	}
	

	@Action("addBookAction")
	public String addBook() throws Exception{
		Book b = new Book(name,sort,author,discount,price,count,account);
		bookService.saveBook(b);
		return "addSucc";
	}
	
	@Action("addBookError")
	public String addBookError() throws Exception{
		Book b = new Book(name,sort,author,discount,price,count,account);
		bookService.testRollback(b);
		return "input";
	}
	@Action("deleteAction")
	public String deleteBook() throws BookException{
		book = new Book(id);
		bookService.deleteBook(book);
		return "deleteSuccess";
	}
	@Action("limitAction")
	public String limitBook(){
		books = bookService.limit(page);
		pageSum = (int) Math.ceil((bookService.findBook().size()*1.0)/5);
		return "limit";
	}
}
