package com.model;

import java.sql.Date;

public class Income {
	
	private int id;
	private String invoiceId;
	private String month;
	private String division;
	private String remark;
	private Double total;
	


	
	public Income(String invoiceId,String month,String division,String remark,Double total) {
		super();
		this.invoiceId = invoiceId;
		this.month = month;
		this.division = division;	
		this.remark = remark;
		this.total = total;
		
		
	}
	public Income(int id, String invoiceId,String month,String division,String remark,Double total) {
		super();
		this.id = id;
		this.invoiceId = invoiceId;
		this.month = month;
		this.division = division;
		this.remark = remark;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "Income [id=" + id + ", invoiceId=" + invoiceId + ", month=" + month + ", division=" + division
				+ ", remark=" + remark + ", total=" + total + "]";
	}
	
	

}
