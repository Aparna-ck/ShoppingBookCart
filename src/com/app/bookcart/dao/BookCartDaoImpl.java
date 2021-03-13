package com.app.bookcart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.bookcart.entity.BookCart;
import com.app.bookcart.entity.Order;

@Repository
public class BookCartDaoImpl implements BookCartDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<BookCart> getBooks() {
		Session session = sessionFactory.getCurrentSession();
		Query<BookCart> theQuery = session.createQuery("from BookCart",BookCart.class);
		List<BookCart> books = theQuery.getResultList();
		return books;
	}

	@Override
	public BookCart getBookCart(int theId) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		BookCart thebooks = currentSession.get(BookCart.class, theId);
		return thebooks;
	}
	@Override
	public void saveOrder(Order theOrder) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theOrder);
	}


}
