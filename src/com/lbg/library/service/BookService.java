package com.lbg.library.service;

import java.util.List;

import com.lbg.library.entity.BookInfo;
import com.lbg.library.entity.BookIsbn;
import com.lbg.library.entity.BookType;
import com.lbg.library.util.PageUtil;

public interface BookService {
	/******************对书的类型的操作*****************************************/
	/**
	 * 增加图书类型
	 * @param type
	 * @return
	 */
	int addBookType(BookType type);
	/**
	 * 修改图书类型的信息
	 * @param typename
	 * @param days
	 * @param typeid
	 * @return
	 */
	int updateBookType(String typename,int days,int typeid);
	/**
	 * 删除图书类型
	 * @param typeid
	 * @return
	 */
	int deleteBookType(int typeid);
	/**
	 * 查询所有的图书类型
	 * @return
	 */
	void queryAllBookType(PageUtil<BookType> pu);
	/**
	 * 查询书的总数
	 * @return
	 */
	int countBookType();
	/**
	 * 用于ajax
	 * @return
	 */
	List<BookType> query4BookType();
	
	
/****************************对书的操作**********************************************/
	/**
	 * 增加书
	 * @param bookInfo
	 * @return
	 */
	int addBook(BookInfo bookInfo);
	/**
	 * 查询所有的图书
	 * @return
	 */
	void queryAllBook(PageUtil<BookInfo> pu);
	/**
	 * 查询书的总数
	 * @return
	 */
	int countBookInfo();
	/**
	 * 删除书
	 * @param bookid
	 * @return
	 */
	int deleteBook(int bookid);
	/**
	 * 查看所有的图书
	 * @param pu
	 */
	void queryAllBook4Sys(PageUtil<BookInfo> pu);
    /**
     * 根据书名模糊查询图书信息
     * @param bookname
     * @param pu
     */
	void queryByName(String bookname,PageUtil<BookInfo> pu);
	
	/*******************国际图书编号********************************/
	/**
	 * 查询所有的出版社
	 * @return
	 */
	List<BookIsbn> queryAllIsbn();
	/**
	 * 修改书的信息
	 * @param bookid
	 * @param bookname
	 * @param typeid
	 * @param isbn
	 * @param shelfid
	 * @return
	 */
	int updateBookInfo(int bookid,String bookname,int typeid,String isbn,int shelfid);

}
