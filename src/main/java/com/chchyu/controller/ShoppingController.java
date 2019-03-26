package com.chchyu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chchyu.dao.BookDAO;
import com.chchyu.model.Book;
import com.chchyu.model.User;

@Controller
public class ShoppingController {
	 @Autowired BookDAO bookDAO;
	 
	 @RequestMapping("/index")
	    public String index(Model m,HttpServletRequest request) {
        	User user=new User();
        	HttpSession session = request.getSession();
        	if ((user= (User) session.getAttribute("user"))!=null) {
        		List<Book> books=bookDAO.findAll();
        		m.addAttribute("books", books);
        		return "index";
			}else {
				return "redirect:login";
			}
	    }
}
