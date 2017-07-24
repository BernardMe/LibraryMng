package com.lbg.library.service.imp;

import com.lbg.library.dao.BookDao;
import com.lbg.library.dao.imp.BookDaoImpl;
import com.lbg.library.entity.BookType;
import com.lbg.library.service.BookService;

public class BookServiceImpl implements BookService {
	BookDao dao = new BookDaoImpl();

	@Override
	public int addBookType(BookType type) {
		return dao.addBookType(type);
	}

	@Override
	public int updateBookType(String typename, int days, int typeid) {
		return dao.updateBookType(typename, days, typeid);
	}

	@Override
	public int deleteBookType(int typeid) {
		return dao.deleteBookType(typeid);
	}

}
