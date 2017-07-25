
package com.lbg.library.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lbg.library.entity.Reader;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.service.ReaderService;
import com.lbg.library.service.imp.ReaderServiceImpl;
import com.lbg.library.util.PageUtil;


public class ReaderServlet extends BaseServlet {

	ReaderService rs = new ReaderServiceImpl();
	
	public void getReaderTypeList(HttpServletRequest req ,HttpServletResponse resp) throws ServletException, IOException{
		String page = req.getParameter("page");
		PageUtil<ReaderType> pu = new PageUtil<ReaderType>(page,5,rs.queryReaderTypeCount());
		rs.getReaderTypeList(pu);
		req.setAttribute("pu", pu);
		
		//Gson gson = new Gson();
		//System.out.println(gson.toJson(pu));
		
		req.getRequestDispatcher("/readerMng/readerType.jsp").forward(req, resp);
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
			req.getRequestDispatcher("/readerMng/success.jsp").forward(req, resp);
			return;
		} else {
			// 添加失败
			req.getRequestDispatcher("/readerMng/error.jsp").forward(req, resp);
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
	
	
	public void getReaderList(HttpServletRequest req ,HttpServletResponse resp) throws ServletException, IOException{
		String page = req.getParameter("page");
		PageUtil<Reader> pu = new PageUtil<Reader>(page,5,rs.queryReaderCount());
		rs.getReaderList(pu);
		req.setAttribute("pu", pu);
		
		req.getRequestDispatcher("/readerMng/reader.jsp").forward(req, resp);
		return;
	}
	
	
	public void deleteReaderByID(HttpServletRequest req ,HttpServletResponse resp) throws IOException{
		
		int rid = Integer.parseInt(req.getParameter("rid"));
		if(rs.deleteReaderByID(rid)){
			resp.getWriter().print("success");
		}else{
			resp.getWriter().print("fail");
		}
		
	}
	
	
	public void addReader(HttpServletRequest req ,HttpServletResponse resp) throws ServletException, IOException{
		Reader r = new Reader();
		
		r.setRname(req.getParameter("rname"));
		r.setGender(Byte.parseByte(req.getParameter("gender")));
		r.setVocation(req.getParameter("vocation"));
		r.setBirthday(Date.valueOf(req.getParameter("birthday")));
		r.setPapertype(req.getParameter("papertype"));
		r.setPaperno(req.getParameter("paperno"));
		r.setTel(req.getParameter("tel"));
		r.setEmail(req.getParameter("email"));
		r.setCreatedate(Date.valueOf(req.getParameter("createdate")));
		r.setRemark(req.getParameter("remark"));
		r.setRtypeid(Byte.parseByte(req.getParameter("rtypeid")));
		//根据当前登录的用户名设置
		r.setOperator("zmw");
		
		
		if (rs.addReader(r)) {
			// 添加成功
			req.getRequestDispatcher("/readerMng/success.jsp").forward(req, resp);
			return;
		} else {
			// 添加失败
			req.getRequestDispatcher("/readerMng/error.jsp").forward(req, resp);
			return;
		}
	}
	
	
	public void queryReaderType4Ajax(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		List<ReaderType> list = rs.queryAll();
		Gson gson = new Gson();
		resp.getWriter().print(gson.toJson(list));
	}

}
