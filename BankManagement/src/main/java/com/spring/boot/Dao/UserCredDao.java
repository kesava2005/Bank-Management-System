package com.spring.boot.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.boot.UserCred;

public interface UserCredDao extends JpaRepository<UserCred,Long>{
}