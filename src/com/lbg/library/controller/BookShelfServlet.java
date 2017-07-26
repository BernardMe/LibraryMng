package com.lbg.library.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lbg.library.entity.BookShelf;
import com.lbg.library.service.BookShelfService;
import com.lbg.library.service.imp.BookShelfServiceImpl;
import com.lbg.library.util.PageUtil;


public class BookShelfServlet extends BaseServlet {
	private BookShelfService bss=new BookShelfServiceImpl();
	/**
	 * 查询所有书架
	 * @param req
	 * @param rsp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void queryAllShelf(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String page=req.getParameter("page");
		PageUtil<BookShelf> pu=new PageUtil<>(page, 15, bss.queryAllShelfCount());
		bss.queryAllShelf(pu);
		req.setAttribute("pu", pu);
		req.getRequestDispatcher("sysSetting/bookcase.jsp").forward(req, rsp);
		return;
	}
	/**
	 * 前台显示所有书架
	 */
	public void query4shelf(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		List<BookShelf> list = bss.queryAllShelfName();
		Gson gson=new Gson();
		rsp.getWriter().print(gson.toJson(list));
	}
	/**
	 * 增加书架
	 */
	public void addShelf(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String shelfname=req.getParameter("shelfname");
//		System.out.println(shelfname);
		int add = bss.addShelf(shelfname);
		if(add>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
	/**
	 * 检查是否存在该书架
	 */
	public void checkShelf(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String shelfname=req.getParameter("shelfname");
//		System.out.println(shelfname);
		List<BookShelf> list = bss.queryByShelfName(shelfname);
//		System.out.println(list);
//		System.out.println(list.size());
		if(list.size()>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
	/**
	 * 删除书架
	 */
	public void deleteShelf(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
//		String shelfname=req.getParameter("shelfname");
		int shelfid=Integer.parseInt(req.getParameter("shelfid"));
		int del = bss.deleteShelf(shelfid);
		if(del>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
	/**
	 * 更改书架名
	 */
	public void updateShelf(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String shelfname=req.getParameter("shelfname");
		int shelfid=Integer.parseInt(req.getParameter("shelfid"));
		int upd = bss.upadteShelfNamd(shelfid, shelfname);
		if(upd>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
}
