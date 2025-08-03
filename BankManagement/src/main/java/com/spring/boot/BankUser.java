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
@Table(name="bankuser")
public class BankUser {
	@Id
	@Column(name="uid")
	private long userId;
	@Column(name="uname")
	private String userName;
	@Column(name="mobilenum")
	private long mobileNum;
	@Column(name="address")
	private String address;
	@Column(name="balance")
	private double balance;
}