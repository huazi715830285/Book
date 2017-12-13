package com.jnmd.ssh.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_book")
public class Book {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String sort;
	private String author;
	private int discount;
	private double price;
	private int count;
	private String account;
	public Book() {
		super();
	}
	public Book(int id) {
		super();
		this.id = id;
	}
	public Book(String name, String sort, String author, int discount, double price, int count, String account) {
		super();
		this.name = name;
		this.sort = sort;
		this.author = author;
		this.discount = discount;
		this.price = price;
		this.count = count;
		this.account = account;
	}
	public Book(int id, String name, String sort, String author, int discount, double price, int count,
			String account) {
		super();
		this.id = id;
		this.name = name;
		this.sort = sort;
		this.author = author;
		this.discount = discount;
		this.price = price;
		this.count = count;
		this.account = account;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", sort=" + sort + ", author=" + author + ", discount=" + discount
				+ ", price=" + price + ", count=" + count + ", account=" + account + "]";
	}
}
