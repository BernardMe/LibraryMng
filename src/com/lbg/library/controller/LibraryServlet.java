package com.lbg.library.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbg.library.entity.Library;
import com.lbg.library.service.LibraryService;
import com.lbg.library.service.imp.LibraryServiceImpl;


public class LibraryServlet extends BaseServlet {
	private LibraryService ls=new LibraryServiceImpl();
	/**
	 * 显示图书管信息
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void showLibrary(HttpServletRequest req,HttpServletResponse rsp) throws ServletException, IOException{
		List<Library> list = ls.showLibrary();
		Library lib=list.get(0);
		req.setAttribute("lib", lib);
		req.getRequestDispatcher("sysSetting/library_modify.jsp").forward(req, rsp);
		return;
	}
}
