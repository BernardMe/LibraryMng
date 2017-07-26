package com.lbg.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CheckCodeServlet extends BaseServlet {
	public  void checkcode(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String rand = (String) req.getSession().getAttribute("rand");
		String vcode = req.getParameter("vcode").toLowerCase();
		if(vcode.equals(rand)){
			resp.getWriter().print("&nbsp;<img src='img/ok.png' />");
		}else{
			resp.getWriter().print("&nbsp;<img src='img/no.png' />");
		}
	}
}
