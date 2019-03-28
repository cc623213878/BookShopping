package com.chchyu.model;

public class OrderInfo {
	private int orderno;
	private String bookname;
	private Integer number;
	private double price;
	private boolean paid;
	public OrderInfo(int orderno,String bookname,Integer number,boolean paid,double price) {
		this.orderno = orderno;
		this.bookname = bookname;
		this.number = number;
		this.paid = paid;
		this.price=price;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public boolean isPaid() {
		return paid;
	}
	public void setPaid(boolean paid) {
		this.paid = paid;
	}
}
