package com.lbg.library.dao.imp;

import java.util.List;

import com.lbg.library.dao.BookDao;
import com.lbg.library.entity.BookInfo;
import com.lbg.library.entity.BookIsbn;
import com.lbg.library.entity.BookType;
import com.lbg.library.util.PageUtil;

public class BookDaoImpl extends BaseDaoImp implements BookDao {
	

	

	/*************************** 对书的类型的操作 *******************************************/
	@Override
	public int addBookType(BookType type) {
		String sql = "insert into tb_booktype values(0,?,?)";
		return baseUpdate(sql, type.getTypename(), type.getDays());
	}

	@Override
	public int updateBookType(String typename, int days, int typeid) {
		String sql = "update tb_booktype set typename = ? and days = ? where typeid = ?";
		return baseUpdate(sql, typename, days, typeid);
	}

	@Override
	public int deleteBookType(int typeid) {
		String sql = "delete from tb_booktype where typeid = ?";
		return baseUpdate(sql, typeid);
	}

	@Override
	public void queryAllBookType(PageUtil<BookType> pu) {
		String sql = "select * from tb_booktype";
		List<BookType> list = baseQuery(BookType.class, sql);
		pu.setList(list);
	}

	@Override
	public int countBookType() {
		String sql = "select count(*) from tb_booktype";
		return queryCount(sql);
	}
	@Override
	public List<BookType> query4BookType() {
		String sql = "select * from tb_booktype";
		return baseQuery(BookType.class, sql);
	}

	/********************************* 对书的操作 ************************************************************/
	@Override
	public int addBook(BookInfo bookInfo) {
		String sql = "insert into tb_bookinfo values(?,?,?,?,?,?,?,?,?,?,?,?)";
		return baseUpdate(sql, bookInfo.getBookid(), bookInfo.getBookname(), bookInfo.getTypeid(), bookInfo.getAuthor(), bookInfo.getTranslator(), bookInfo.getIsbn(),
				bookInfo.getPrice(), bookInfo.getPage(), bookInfo.getShelfid(), bookInfo.getIntime(), bookInfo.getOperator(), bookInfo.getDel());
	}

	@Override
	public int deleteBook(int bookid) {
		String sql = "delete from tb_bookinfo where bookid = ?";
		return baseUpdate(sql, bookid);
	}

	@Override
	public void queryAllBook(PageUtil<BookInfo> pu) {
		String sql = "select bi.bookid,bi.bookname,bt.typename,s.shelfname,p.pubname from tb_bookinfo bi,tb_booktype bt,tb_publishing p,tb_shelf s where bi.typeid = bt.typeid and bi.isbn = p.isbn and bi.shelfid = s.shelfid";
		 List<BookInfo> list = baseQuery(BookInfo.class, sql);
		 pu.setList(list);
	}
	
	@Override
	public int countBookInfo() {
		String sql = "select count(*) from tb_bookinfo";
		return queryCount(sql);
	}

	/********************* 国际图书编号 **************************************/

	@Override
	public List<BookIsbn> queryAllIsbn() {
		String sql = "select * from tb_publishing";
		return baseQuery(BookIsbn.class, sql);
	}

	

	

}
