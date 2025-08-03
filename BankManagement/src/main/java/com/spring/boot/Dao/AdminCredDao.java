package com.spring.boot.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.boot.AdminCred;

public interface AdminCredDao extends JpaRepository<AdminCred,Long>{
}