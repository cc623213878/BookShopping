package com.chchyu.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chchyu.model.Books;
public interface BookDAO extends JpaRepository<Books,String>{

}
