package com.entity;

public class itemorder {
	
	private int id;
	private String orderid;
	private String username;
	private String email;
	private String phone;
	private String address;
	private String item;
	private String company;
	private String price;
	private String paymenttype;
	public itemorder() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPaymenttype() {
		return paymenttype;
	}
	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}

	@Override
	public String toString() {
		return "itemorder [id=" + id + ", orderid=" + orderid + ", username=" + username + ", email=" + email
				+ ", phone=" + phone + ", address=" + address + ", item=" + item + ", company=" + company + ", price="
				+ price + ", paymenttype=" + paymenttype + "]";
	}

	
	
	
	
	
}
