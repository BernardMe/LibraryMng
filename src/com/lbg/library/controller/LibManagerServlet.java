package com.lbg.library.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbg.library.entity.LibManager;
import com.lbg.library.service.LibManagerService;
import com.lbg.library.service.PurviewService;
import com.lbg.library.service.imp.LibManagerServiceImpl;
import com.lbg.library.service.imp.PurviewServiceImpl;


public class LibManagerServlet extends BaseServlet {
	private LibManagerService lms=new LibManagerServiceImpl();
	private PurviewService ps=new PurviewServiceImpl();
	/**
	 * 增加管理员
	 */
	public void addManager(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String mname=req.getParameter("mname").toLowerCase();
		String mpwd=req.getParameter("mpwd");
		int add = lms.addLibManager(mname, mpwd);
		if(add>0){
			List<LibManager> list = lms.queryByMname(mname);
			int mid=list.get(0).getMid();
//			System.out.println(mid);
			//新增管理员赋予权限操作
			int i = ps.addPurview(mid);
//			System.out.println(i);
			if(i>0){
				rsp.getWriter().print("success");
			}else{
				rsp.getWriter().print("fail");
			}
		}else{
			rsp.getWriter().print("fail");
		}
	}
	/**
	 * 根据名称查询是否有该管理员
	 */
	public void queryByMname(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String mname=req.getParameter("mname").toLowerCase();
		List<LibManager> list = lms.queryByMname(mname);
//		System.out.println(mname);
//		System.out.println(list);
//		System.out.println(list.size());
		if(list.size()>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
	/**
	 * 删除管理员
	 */
	public void deleteManager(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String mname=req.getParameter("mname").toLowerCase();
		List<LibManager> list = lms.queryByMname(mname);
		int mid=list.get(0).getMid();
		//先删除权限表中记录
		int del = ps.deleteManagerPur(mid);
		if(del>0){
			int man = lms.deleteManager(mid);
			if(man>0){
				rsp.getWriter().print("success");
			}else{
				rsp.getWriter().print("fail");
			}
		}else{
			rsp.getWriter().print("fail");
		}
	}
	/**
	 * 检验原密码是否正确
	 */
	public void checkManager(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String mname=req.getParameter("mname");
		String mpwd=req.getParameter("mpwd");
		List<LibManager> list = lms.query4Login(mname, mpwd);
		if(list.size()>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
		
	}
	
	/**
	 * 更改管理员密码
	 */
	public void updateMpwd(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String mname=req.getParameter("mname");
		String mpwd=req.getParameter("mpwd");
		int upd = lms.updateMpwd(mname, mpwd);
		if(upd>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
}	
