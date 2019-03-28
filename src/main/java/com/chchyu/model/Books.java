package com.chchyu.model;

import javax.persistence.*;
@Entity
@Table(name="books")
public class Books {
	@Id
	@Column(name = "bookid")
	private String bookid;
	
	@Column(name = "bookname")
	private String bookname;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "introduction")
	private String introduction;
	
	@Column(name = "img")
	private String img;
	
	@Column(name = "author")
	private String author;
	
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
}
