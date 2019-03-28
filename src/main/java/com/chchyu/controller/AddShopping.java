package com.chchyu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chchyu.dao.OrderDAO;
import com.chchyu.model.Order;
import com.chchyu.model.User;

@RestController
public class AddShopping {
	@Autowired OrderDAO orderDAO;
	
	@RequestMapping("/addshopping")
    public String addshopping(HttpServletRequest request) {
    	User user=new User();
    	HttpSession session = request.getSession();
    	if ((user= (User) session.getAttribute("user"))!=null) {
    		Order order = new Order();
    		Order order1=null;
    		order.setBookid(request.getParameter("bookid"));
    		order.setUsername(user.getUsername());
    		order.setNumber(Integer.parseInt(request.getParameter("number")));
    		order1=orderDAO.findOneUserOrder(order.getUsername(),order.getBookid());
    		if(order1!=null) {
    			order.setOrderno(order1.getOrderno());
    			order.setNumber(order1.getNumber()+1);
    			orderDAO.save(order);
    		}
    		else
    			orderDAO.save(order);
    		return "true";
		}else {
			return "false";
		}
    }
}
