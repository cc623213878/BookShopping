package com.chchyu.controller;

 
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chchyu.dao.UserDAO;
import com.chchyu.model.User;
import com.chchyu.util.MD5;

@SuppressWarnings("unused")
@Controller
public class HelloController {
	@Autowired UserDAO userDAO;
	
	@RequestMapping("/hello")
    public String hello(Model m,HttpServletRequest request) throws Exception {
        try {
        	User user=new User();
        	HttpSession session = request.getSession();
        	if ((user= (User) session.getAttribute("user"))!=null) {
				m.addAttribute("user",user.getUsername());
			}else {
				m.addAttribute("user","没有任何用户登录");
			}
        	return "hello";
		} catch (Exception e) {
			// TODO: handle exception
            throw new Exception("hello exception");
        }
    }
	
	//登录页
    @RequestMapping("/login")
    public String login(Model m,HttpServletRequest request) throws Exception {
    	try {
			 return "login"; 
		} catch (Exception e) {
			// TODO: handle exception
           throw new Exception("login exception");
       }
    }
    //注册页
    @RequestMapping("/reg")
    public String reg(Model m) throws Exception {
    	try {
    		return "reg";
		} catch (Exception e) {
			// TODO: handle exception
            throw new Exception("reg exception");
       }
    }
  
    @RequestMapping(value="/logining",method = RequestMethod.POST)
    public  String logining(HttpServletResponse response,Model m,HttpServletRequest request) throws Exception{
        try {
        	User user = new User();
        	user.setUsername(request.getParameter("username"));
        	user.setPassword(MD5.getInstance().getMD5(request.getParameter("password")));
        	if (userDAO.findById(user.getUsername()).get().getPassword().equals(user.getPassword())) {
				if(request.getParameter("remeberbox").equals("on")) {
	        		Cookie cookie1=new Cookie("chchyu_username",user.getUsername());
	        		Cookie cookie2=new Cookie("chchyu_password",request.getParameter("password"));
	        		response.addCookie(cookie1);
	        		response.addCookie(cookie2);
	        	}
	        	HttpSession sessoin = request.getSession();
	        	sessoin.setAttribute("user", user);
				m.addAttribute("user",user.getUsername());
				return "redirect:hello";
			}else {
				m.addAttribute("errorinfo","账号输入错误或密码错误");
				return "redirect:login";
			}
		} catch (Exception e) {
			// TODO: handle exception
           throw new Exception("logining exception");
       }
    }
    
    @RequestMapping(value="/reg_into",method = RequestMethod.POST)
    public  String regInto(Model m,HttpServletRequest request) throws Exception{
        try {
        	User user = new User();
        	user.setUsername(request.getParameter("username"));
        	user.setPassword(MD5.getInstance().getMD5(request.getParameter("password")));
        	if (userDAO.save(user) != null) {
        		m.addAttribute("user",request.getParameter("username"));
				return "redirect:hello";
			}else {
				m.addAttribute("errorinfo","注册失败");
				return "redirect:reg";
			}
		} catch (Exception e) {
			// TODO: handle exception
           throw new Exception("logining exception");
       }
    }
}
