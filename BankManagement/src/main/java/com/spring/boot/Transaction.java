package com.spring.boot;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GenerationType;
import jakarta.persistence.*;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name="Transaction")
public class Transaction {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="tid")
	private long tid;
	@Column(name="uid")
	private long uid;
	@Column(name="rid")
	private long rid;
	@Column(name="type")
	private String type;
	@Column(name="amount")
	private double amount;
	@Column(name="status")
	private String status;
}