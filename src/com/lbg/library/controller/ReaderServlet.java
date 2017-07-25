
package com.lbg.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.service.ReaderService;
import com.lbg.library.service.imp.ReaderServiceImpl;
import com.lbg.library.util.PageUtil;


public class ReaderServlet extends BaseServlet {

	ReaderService rs = new ReaderServiceImpl();
	
	public void getReaderTypeList(HttpServletRequest req ,HttpServletResponse resp) throws ServletException, IOException{
		String page = req.getParameter("page");
		PageUtil<ReaderType> pu = new PageUtil<ReaderType>(page,10,rs.queryReaderTypeCount());
		rs.getReaderTypeList(pu);
		req.setAttribute("pu", pu);
		
		//Gson gson = new Gson();
		//System.out.println(gson.toJson(pu));
		
		req.getRequestDispatcher("/readerType.jsp").forward(req, resp);
		return;
	}
	
	public void addReaderType(HttpServletRequest req ,HttpServletResponse resp) throws ServletException, IOException{
		ReaderType rt = new ReaderType();
		String rtypename= req.getParameter("rtypename");
		byte count = Byte.parseByte(req.getParameter("count")); 
		rt.setRtypename(rtypename);
		rt.setCount(count);		
		
		if (rs.addReaderType(rt)) {
			// 添加成功
			req.getRequestDispatcher("/success.jsp").forward(req, resp);
			return;
		} else {
			// 添加失败
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
			return;
		}
	}
	
	public void deleteReaderTypeByID(HttpServletRequest req ,HttpServletResponse resp) throws IOException{
		
		byte rtypeid = Byte.parseByte(req.getParameter("rtypeid"));
		if(rs.deleteReaderTypeByID(rtypeid)){
			resp.getWriter().print("success");
		}else{
			resp.getWriter().print("fail");
		}
		
	}
	
	public void updateReaderType(HttpServletRequest req ,HttpServletResponse resp) throws IOException{
		
		ReaderType rt = new ReaderType();
		byte rtypeid = Byte.parseByte(req.getParameter("rtypeid"));
		String rtypename = req.getParameter("rtypename");
		byte count = Byte.parseByte(req.getParameter("count"));
		rt.setRtypeid(rtypeid);
		rt.setRtypename(rtypename);
		rt.setCount(count);
		
		if (rs.updateReaderType(rt)) {
			resp.getWriter().print("success");
		} else {
			resp.getWriter().print("fail");
		}
		
	}

}
