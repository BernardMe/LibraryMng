package com.lbg.library.controller;

import java.io.IOException;
import java.sql.Date;
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
	/**
	 * 更新图书管信息
	 * @param req
	 * @param rsp
	 * @throws ServletException
	 * @throws IOException
	 */

	public void updateLibrary(HttpServletRequest req,HttpServletResponse rsp) throws ServletException, IOException{
		Library lib=new Library();
		lib.setLibraryname(req.getParameter("libraryname"));
		lib.setCurator(req.getParameter("curator"));
		lib.setTel(req.getParameter("tel"));
		lib.setAddress(req.getParameter("address"));
		lib.setEmail(req.getParameter("email"));
		lib.setUrl(req.getParameter("url"));
		lib.setCreatedate(Date.valueOf(req.getParameter("createdate")));
		lib.setIntroduce(req.getParameter("introduce"));
		int upd = ls.updateLibrary(lib);
		if(upd>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
}
