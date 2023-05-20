package com.model;
import java.util.Date;

public class Feedback {
	
	private int id;
	private String fullName;
	private String comment;
	private String nic;
	private Date date;
	private String email;
	private int mobile;

	
	public Feedback(String fullName, String comment, Date date, String email, int mobile) {
		super();
		this.fullName = fullName;
		this.comment = comment;
		this.date = date;
		this.email = email;
		this.mobile = mobile;
		
		
	}

	public Feedback(int id, String fullName, String comment,
			 Date date, String email,int mobile) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.comment = comment;
		this.date = date;
		this.email = email;
		this.mobile = mobile;
		
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	@Override
	public String toString() {
		return "Room [id=" + id + ", fullName=" + fullName + ", comment=" + comment + ", date=" + date +  ", email=" + email + ", mobile=" + mobile + "]";
	}
	

}

