package com.spring.boot.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.boot.BankUser;

public interface BankUserDao extends JpaRepository<BankUser,Long>{
}