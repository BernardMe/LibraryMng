package com.lbg.library.service.imp;

import java.util.List;

import com.lbg.library.dao.BookDao;
import com.lbg.library.dao.imp.BookDaoImpl;
import com.lbg.library.entity.BookInfo;
import com.lbg.library.entity.BookIsbn;
import com.lbg.library.entity.BookType;
import com.lbg.library.service.BookService;
import com.lbg.library.util.PageUtil;

public class BookServiceImpl implements BookService {
	BookDao dao = new BookDaoImpl();

	/************ 书的类型 ****************************/
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

	@Override
	public void queryAllBookType(PageUtil<BookType> pu) {
		 dao.queryAllBookType(pu);
	}
	@Override
	public int countBookType() {
		return dao.countBookType();
	}
	@Override
	public List<BookType> query4BookType() {
		return dao.query4BookType();
	}

	/**************** 书的信息 *****************************/

	@Override
	public int addBook(BookInfo bookInfo) {
		return dao.addBook(bookInfo);
	}


	@Override
	public int deleteBook(int bookid) {
		return dao.deleteBook(bookid);
	}


	@Override
	public void queryAllBook(PageUtil<BookInfo> pu) {
		dao.queryAllBook(pu);
	}

	@Override
	public int countBookInfo() {
		return dao.countBookInfo();
	}

	@Override
	public int updateBookInfo(int bookid, String bookname, int typeid, String isbn, int shelfid) {
		return dao.updateBookInfo(bookid, bookname, typeid, isbn, shelfid);
	}
	
	@Override
	public void queryAllBook4Sys(PageUtil<BookInfo> pu) {
		dao.queryAllBook4Sys(pu);
		
	}

	@Override
	public void queryByName(String bookname, PageUtil<BookInfo> pu) {
		dao.queryByName(bookname, pu);
	}

/*****************图书isbn*******************************/
	@Override
	public List<BookIsbn> queryAllIsbn() {
		return dao.queryAllIsbn();
	}


	

	

}
