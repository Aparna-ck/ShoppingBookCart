package com.app.bookcart.dao;

import java.util.List;

import com.app.bookcart.entity.BookCart;
import com.app.bookcart.entity.Order;

public interface BookCartDao {

	public List<BookCart> getBooks();
	public BookCart getBookCart(int theId);
	public  void saveOrder(Order theOrder);



}
