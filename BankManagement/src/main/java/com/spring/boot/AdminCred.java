package com.spring.boot;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
@Table(name="admincred")
public class AdminCred {
	@Id
	@Column(name="aid")
	private long aid;
	@Column(name="aname")
	private String aname;
	@Column(name="pass")
	private String pass;
}