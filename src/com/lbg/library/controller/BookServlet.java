package com.lbg.library.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lbg.library.entity.BookInfo;
import com.lbg.library.entity.BookIsbn;
import com.lbg.library.entity.BookType;
import com.lbg.library.service.BookService;
import com.lbg.library.service.imp.BookServiceImpl;

public class BookServlet extends BaseServlet {
	// 创建Bookservice对象
	BookService bs = new BookServiceImpl();

	/****************** 对书的类型操作 *******************************/
	/**
	 * 增加图书类型
	 * 
	 * @param rq
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	public void addBookType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 接收前台的数据
		String typename = req.getParameter("typename");
		int days = Integer.parseInt(req.getParameter("days"));
		// 创建booktype对象
		BookType bt = new BookType();
		// 把前台的数据封装到booktype对象中
		bt.setTypename(typename);
		bt.setDays(days);
		if (bs.addBookType(bt) > 0) {
			// 添加成功
			req.getRequestDispatcher("book.action?m=queryAllBookType").forward(req, resp);
		} else {
			// 添加失败
			req.getRequestDispatcher("bookMng/add_bookType.jsp").forward(req, resp);
		}
		return;
	}

	/**
	 * 修改图书类型的信息
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	public void updateBookType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 接收前台的数据
		int typeid = Integer.parseInt(req.getParameter(""));
		String typename = req.getParameter("");
		int days = Integer.parseInt(req.getParameter(""));
		if (bs.updateBookType(typename, days, typeid) > 0) {
			// 修改成功
		} else {
			// 修改失败
		}
	}

	/**
	 * 删除图书类型
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	public void deleteBookType(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 接收前台的数据
		int typeid = Integer.parseInt(req.getParameter("typeid"));
		if (bs.deleteBookType(typeid) > 0) {
			// 删除成功
			resp.getWriter().print("success");
		} else {
			// 删除失败
			resp.getWriter().print("fail");
		}
		return;
	}
	/**
	 * 查询所有的图书类型
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void queryAllBookType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		List<BookType> list = bs.queryAllBookType();
		if(list != null){
			req.setAttribute("list",list);
			req.getRequestDispatcher("bookMng/bookType.jsp").forward(req, resp);
		}
	}
	/**
	 * 以json格式传到前台
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void queryAllType(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		List<BookType> list = bs.queryAllBookType();
		Gson gson = new Gson();
		resp.getWriter().print(gson.toJson(list));
	}

	/********************* 对书的操作 ****************************************/
	/**
	 * 增加书
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void addBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 接收前台的数据
		int barcode = Integer.parseInt(req.getParameter("barcode"));
		String bookname = req.getParameter("bookname");
		int typeid = Integer.parseInt(req.getParameter("typeid"));
		String author = req.getParameter("author");
		String translator = req.getParameter("translator");
		String isbn = req.getParameter("isbn");
		double price = Double.parseDouble(req.getParameter("price"));
		int page = Integer.parseInt(req.getParameter("page"));
		int bookcaseid = Integer.parseInt(req.getParameter("bookcaseid"));
		int del = Integer.parseInt(req.getParameter("del"));
		String operator = req.getParameter("operator");
		Date inTime = Date.valueOf(req.getParameter("inTime"));
		// 创建bookInfo对象，封装数据
		BookInfo bookInfo = new BookInfo();
		bookInfo.setBookid(barcode);
		bookInfo.setBookname(bookname);
		bookInfo.setTypeid(typeid);
		bookInfo.setAuthor(author);
		bookInfo.setTranslator(translator);
		bookInfo.setIsbn(isbn);
		bookInfo.setPrice(price);
		bookInfo.setPage(page);
		bookInfo.setShelfid(bookcaseid);
		bookInfo.setIntime(inTime);
		bookInfo.setOperator(operator);
		bookInfo.setDel(del);
		if (bs.addBook(bookInfo) > 0) {
			// 成功
			req.getRequestDispatcher("bookMng/book.jsp").forward(req, resp);
		} else {
			// 失败
			req.getRequestDispatcher("bookMng/add_book.jsp").forward(req, resp);
		}
		return;
	}

	/**
	 * 对书的删除
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	public void deleteBook(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int bookid = Integer.parseInt(req.getParameter("bookid"));
		if(bs.deleteBook(bookid) > 0){
			resp.getWriter().print("success");
		}else{
			//删除失败
			resp.getWriter().print("fail");
		}
	}
	/**
	 * 查询所有的书的信息
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void queryAllBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		List<BookInfo> books = bs.queryAllBook();
		if(books!=null){
			req.setAttribute("books", books);
			req.getRequestDispatcher("bookMng/book.jsp").forward(req, resp);
		}
	}
	/*************************国际图书编号
	 * @throws IOException *******************************************/
	public void queryAllIsbn(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		List<BookIsbn> list = bs.queryAllIsbn();
		Gson gson = new Gson();
		resp.getWriter().print(gson.toJson(list));
	}

}
