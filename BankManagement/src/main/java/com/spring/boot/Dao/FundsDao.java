package com.spring.boot.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.boot.Funds;

public interface FundsDao extends JpaRepository<Funds,Long>{
}