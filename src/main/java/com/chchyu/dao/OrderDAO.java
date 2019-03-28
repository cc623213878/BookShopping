package com.chchyu.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.chchyu.model.Order;
import com.chchyu.model.OrderInfo;

public interface OrderDAO extends JpaRepository<Order,Integer>{
	@Query(value = "SELECT new com.chchyu.model.OrderInfo(o.orderno,b.bookname, o.number,o.paid,b.price)"
			+ " FROM Order o,Books b "
			+ "where b.bookid=o.bookid AND o.username=:username and o.paid=0")
	public List<OrderInfo> findUserOrder(@Param("username") String username);
	
	@Query(value = "select new com.chchyu.model.Order(orderno, bookid, username, number, paid) "
			+ "from Order o "
			+ "where o.username=:username and o.bookid=:bookid")
	public Order findOneUserOrder(@Param("username") String username,@Param("bookid") String bookid);
}
