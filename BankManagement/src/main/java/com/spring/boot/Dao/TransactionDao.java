package com.spring.boot.Dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spring.boot.Transaction;

public interface TransactionDao extends JpaRepository<Transaction,Long>{
	@Query("SELECT t FROM Transaction t WHERE t.uid = :uid AND t.rid = :rid AND t.amount = :amount AND t.type = :type AND t.status = :status")
	Optional<Transaction> findByUidAndRidAndAmountAndTypeAndStatus(@Param("uid") Long uid, @Param("rid") Long rid, @Param("amount") Double amount, @Param("type") String type, @Param("status") String status);
	@Query("SELECT t FROM Transaction t")
	List<Transaction> selectAll();
}