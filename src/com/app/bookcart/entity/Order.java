package com.app.bookcart.entity;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="order_details")
public class Order {

	@Id
	private long order_id;
	private int book_id;
	private String cust_name;
	private long phone_no;
	private String address;
	private Date order_date;
	private int quantity;
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}


	public long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}
	public long getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(long phone_no) {
		this.phone_no = phone_no;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", book_id=" + book_id + ", cust_name=" + cust_name + ", phone_no="
				+ phone_no + ", address=" + address + ", order_date=" + order_date + ", quantity=" + quantity + "]";
	}


}
