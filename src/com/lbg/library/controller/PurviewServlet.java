package com.lbg.library.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbg.library.entity.LibManager;
import com.lbg.library.entity.Purview;
import com.lbg.library.service.LibManagerService;
import com.lbg.library.service.PurviewService;
import com.lbg.library.service.imp.LibManagerServiceImpl;
import com.lbg.library.service.imp.PurviewServiceImpl;
import com.lbg.library.util.PageUtil;


public class PurviewServlet extends BaseServlet {
	private PurviewService ps=new PurviewServiceImpl();
	private LibManagerService lms=new LibManagerServiceImpl();
	
	/**
	 * 显示所有管理员及其权限
	 */
	
	public  void showAllHasPur(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String page=req.getParameter("page");
		PageUtil<Purview> pu=new PageUtil<>(page, 15, ps.queryAllHasPur());
		ps.showAllManager(pu);
		req.setAttribute("pu",pu);
		req.getRequestDispatcher("sysSetting/manager.jsp").forward(req, rsp);
		return;
	}
	/**
	 * 更该管理员权限
	 */
	public  void updatePurview(HttpServletRequest req, HttpServletResponse rsp)
			throws ServletException, IOException {
		String values = req.getParameter("purview");
		Purview pur=new Purview();
		String mname=req.getParameter("mname");
		List<LibManager> list = lms.queryByMname(mname);
		int mid=list.get(0).getMid();
		int upd = ps.updatePurByMid(pur,values,mid);
		if(upd>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
}
