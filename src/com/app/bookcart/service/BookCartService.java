package com.app.bookcart.service;

import java.util.List;

import com.app.bookcart.entity.BookCart;
import com.app.bookcart.entity.Order;

public interface BookCartService {

	public List<BookCart> getBooks();
	public BookCart getBookCart(int theId);
	public void saveOrder(Order theOrder);
	public long generateOrderId();

}
