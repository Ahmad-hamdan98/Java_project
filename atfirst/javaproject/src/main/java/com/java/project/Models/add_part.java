package com.java.project.Models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="add_part")
public class add_part {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	 	
	  @NotEmpty(message="amount is required!")
	    @Min(1)
	    private int orderamount;
	 
	 @OneToMany(mappedBy="user_id", fetch = FetchType.LAZY)
	    private List<User> userorder; 
	 
	 @OneToMany(mappedBy="part_id", fetch = FetchType.LAZY)
	 private List<Parts> partorder;
	 //---------------------------------------------------------------
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getOrderamount() {
		return orderamount;
	}
	public void setOrderamount(int orderamount) {
		this.orderamount = orderamount;
	}
	public List<User> getUserorder() {
		return userorder;
	}
	public void setUserorder(List<User> userorder) {
		this.userorder = userorder;
	}
	public List<Parts> getPartorder() {
		return partorder;
	}
	public void setPartorder(List<Parts> partorder) {
		this.partorder = partorder;
	}
	 
	 
}
