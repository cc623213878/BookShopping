package com.chchyu.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chchyu.model.Book;
public interface BookDAO extends JpaRepository<Book,String>{

}
