package com.chchyu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chchyu.dao.BookDAO;
import com.chchyu.dao.OrderDAO;
import com.chchyu.model.Books;
import com.chchyu.model.OrderInfo;
import com.chchyu.model.User;

@Controller
public class ShoppingController {
	@Autowired BookDAO bookDAO;
	@Autowired OrderDAO orderDAO;
	
	@RequestMapping("/index")
    public String index(Model m,HttpServletRequest request) {
    	User user=new User();
    	HttpSession session = request.getSession();
    	if ((user= (User) session.getAttribute("user"))!=null) {
    		List<Books> books=bookDAO.findAll();
    		m.addAttribute("books", books);
    		return "index";
		}else {
			return "redirect:login";
		}
    }
	@RequestMapping("/shoppingcar")
    public String shoppingcar(Model m,HttpServletRequest request) {
    	User user=new User();
    	HttpSession session = request.getSession();
    	if ((user= (User) session.getAttribute("user"))!=null) {
    		List<OrderInfo> orders=orderDAO.findUserOrder("admin");
    		m.addAttribute("orders", orders);
    		return "shoppingcar";
		}else {
			return "redirect:login";
		}
    }
	@RequestMapping("/shoppingcost")
    public String shoppingcost(Model m,HttpServletRequest request) {
		double cost=0;
    	User user=new User();
    	HttpSession session = request.getSession();
    	if ((user= (User) session.getAttribute("user"))!=null) {
    		List<OrderInfo> orders=orderDAO.findUserOrder("admin");
    		for(int i = 0;i < orders.size(); i ++){
    			cost+=orders.get(i).getPrice()*orders.get(i).getNumber();
    		}
    		m.addAttribute("cost", new java.text.DecimalFormat("0.00").format(cost));
    		return "shoppingcost";
		}else {
			return "redirect:login";
		}
    }
}
