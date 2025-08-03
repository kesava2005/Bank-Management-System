package com.spring.boot;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name="Funds")
public class Funds {
	@Id
	@Column(name="uid")
	private long uid;
	@Column(name="rid")
	private long rid;
	@Column(name="amount")
	private double amount;
	@Column(name="status")
	private String status;
}