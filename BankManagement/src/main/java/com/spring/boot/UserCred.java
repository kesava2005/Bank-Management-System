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
@Table(name="usercred")
public class UserCred {
	@Id
	@Column(name="uid")
	private long uid;
	@Column(name="uname")
	private String uname;
	@Column(name="pass")
	private String pass;
}
