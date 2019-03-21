package com.chchyu.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chchyu.model.User;

public interface UserDAO  extends JpaRepository<User,String>{
	//public User find(@Param("username") String username, @Param("password") String password);
}
