package com.lbg.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbg.library.entity.BookType;
import com.lbg.library.service.BookService;
import com.lbg.library.service.imp.BookServiceImpl;

public class BookServlet extends BaseServlet {
	//创建Bookservice对象
	BookService bs = new BookServiceImpl();
	/**
	 * 增加图书类型
	 * @param rq
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void addBookType(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
		//接收前台的数据
		String typename = req.getParameter("typename");
		int days = Integer.parseInt(req.getParameter("days"));
		//创建booktype对象
		BookType bt = new BookType();
		//把前台的数据封装到booktype对象中
		bt.setTypename(typename);
		bt.setDays(days);
		if(bs.addBookType(bt)>0){
			//添加成功
			req.getRequestDispatcher("bookType.html").forward(req, resp);
		}else{
			//添加失败
			req.setAttribute("tips", "保存失败");
			req.getRequestDispatcher("add_bookType.html").forward(req, resp);
		}
		return;
	}
	/**
	 * 修改图书类型的信息
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void updateBookType(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
		//接收前台的数据
		int typeid = Integer.parseInt(req.getParameter(""));
		String typename = req.getParameter("");
		int days = Integer.parseInt(req.getParameter(""));
		if(bs.updateBookType(typename, days, typeid)> 0 ){
			//修改成功
		}else{
			//修改失败
		}
	}

}
