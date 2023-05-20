package com.model;

import java.util.Date;

public class Expense {
	
	private int id;
	private String invoiceId;
	private String month;
	private String division;
	private int quantity;
	private String type;
	private Double total;
	

	
	public Expense(String invoiceId,String month,String division,int quantity,String type,Double total) {
		super();
		this.invoiceId = invoiceId;
		this.month = month;
		this.division = division;
		this.quantity = quantity;
		this.type = type;
		this.total = total;
		
		
	}
	public Expense(int id, String invoiceId,String month,String division,int quantity,String type,Double total) {
		super();
		this.id = id;
		this.invoiceId = invoiceId;
		this.month = month;
		this.division = division;
		this.quantity = quantity;
		this.type = type;
		this.total = total;
		
		
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	
	@Override
	public String toString() {
		return "Expense [id=" + id + ", invoiceId=" + invoiceId + ", month=" + month + ", division=" + division
				+ ", quantity=" + quantity + ", type=" + type + ", total=" + total + "]";
	}
	
	
	
	
	

}
