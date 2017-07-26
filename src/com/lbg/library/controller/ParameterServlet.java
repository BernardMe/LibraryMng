package com.lbg.library.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbg.library.entity.Parameter;
import com.lbg.library.service.ParameterService;
import com.lbg.library.service.imp.ParameterServiceImpl;
import com.lbg.library.util.PageUtil;


public class ParameterServlet extends BaseServlet {
	/**
	 * 创建service对象
	 */
	private ParameterService ps=new ParameterServiceImpl();
	/**
	 * 增加卡的费用信息
	 */
	public void addParameter(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		int cost=Integer.parseInt(req.getParameter("cost"));
		int validity=Integer.parseInt(req.getParameter("validity"));
		int add = ps.addParameter(cost, validity);
		if(add>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
	/**
	 * 显示卡费信息
	 */
	public void showParameter(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		String page=req.getParameter("page");
		PageUtil pu=new PageUtil<Parameter>(page, 15, ps.queryAllParameterCount());
		ps.queryAllParameter(pu);
		req.setAttribute("pu", pu);
		req.getRequestDispatcher("sysSetting/parameter.jsp").forward(req, rsp);
		return;
	}
	/**
	 * 查询是否有改卡费的信息
	 */
	public void checkCost(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		int cost=Integer.parseInt(req.getParameter("cost"));
		List<Parameter> list = ps.queryByCost(cost);
		if(list.size()>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
	/**
	 * 删除卡费信息
	 */
	public void deleteCost(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		int cost=Integer.parseInt(req.getParameter("cost"));
		int validity=Integer.parseInt(req.getParameter("validity"));
		int del = ps.removeParameter(cost, validity);
//		System.out.println(del);
		if(del>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
	/**
	 * 
	 */
	public void updateCost(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		int cost=Integer.parseInt(req.getParameter("cost"));
		int validity=Integer.parseInt(req.getParameter("validity"));
		int upd=ps.updateParameter(cost, validity);
		if(upd>0){
			rsp.getWriter().print("success");
		}else{
			rsp.getWriter().print("fail");
		}
	}
}
