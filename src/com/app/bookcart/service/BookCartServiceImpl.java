package com.app.bookcart.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bookcart.dao.BookCartDao;
import com.app.bookcart.entity.BookCart;
import com.app.bookcart.entity.Order;

@Service
public class BookCartServiceImpl implements BookCartService {

	@Autowired
	private BookCartDao bookCartDao;

	@Override
	@Transactional
	public List<BookCart> getBooks() {
		// TODO Auto-generated method stub
		return bookCartDao.getBooks();
	}

	@Override
	@Transactional
	public BookCart getBookCart(int theId) {
		// TODO Auto-generated method stub
		return bookCartDao.getBookCart(theId);
	}

	@Override
	@Transactional
	public void saveOrder(Order theOrder) {
		// TODO Auto-generated method stub
		bookCartDao.saveOrder(theOrder);
	}

	@Override
	public long generateOrderId() {
		SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");
		Date date = new Date();
		String order =formatter.format(date).toString()+(new Random().nextInt(100));
		long  orderId =Long.parseLong(order);
		return orderId;

	}

}
