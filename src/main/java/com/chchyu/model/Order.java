package com.chchyu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bookorder")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderno")
	private int orderno;
	
	@Column(name = "bookid")
	private String bookid;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "number")
	private int number;
	
	@Column(name = "paid")
	private boolean paid;
	public Order() {
		
	}
	public Order(Integer orderno,String bookid,String username,int number,boolean paid) {
		this.orderno = orderno;
		this.bookid = bookid;
		this.username = username;
		this.number = number;
		this.paid = paid;
	}
	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public boolean isPaid() {
		return paid;
	}

	public void setPaid(boolean paid) {
		this.paid = paid;
	}
}