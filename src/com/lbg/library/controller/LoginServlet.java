package com.lbg.library.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbg.library.entity.LibManager;
import com.lbg.library.entity.Purview;
import com.lbg.library.service.LibManagerService;
import com.lbg.library.service.PurviewService;
import com.lbg.library.service.imp.LibManagerServiceImpl;
import com.lbg.library.service.imp.PurviewServiceImpl;

/**
 * 登录Servlet
 * 2017/7/13.
 */
public class LoginServlet extends BaseServlet {
	private LibManagerService lms=new LibManagerServiceImpl();
	private PurviewService ps=new PurviewServiceImpl();
    /*@Override
    protected void service(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        //获取req中的方法名 m
        String m = req.getParameter("m");
        if ("login".equals(m)){
            login(req, rsp);
        } else if ("exit".equals(m)) {
            exit(req, rsp);
        }
    }*/

    /**
     * 退出
     * @param req
     * @param rsp
     */
    public void exit(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
        //手动销毁session
        req.getSession().invalidate();
        //跳转
        rsp.sendRedirect("login.jsp");
        return;
    }

    /**
     * 登录
     * @param req
     * @param rsp
     * @throws IOException
     */
    public void login(HttpServletRequest req, HttpServletResponse rsp) throws IOException {

        //获取信息 用户名/密码/角色

        String uname = req.getParameter("mname");
        String upwd = req.getParameter("mpwd");
        List<LibManager> list = lms.query4Login(uname, upwd);
        //继续登录
        if(list.size() == 0) {
            req.getSession().setAttribute("error", "用户名或密码错误，请重新登陆");
            rsp.sendRedirect("login.jsp");
        } else {
            req.getSession().setAttribute("user", list.get(0));
            int mid=list.get(0).getMid();
            List<Purview> listPur= ps.queryByMid(mid);
//            System.out.println(listPur.get(0));
            req.getSession().setAttribute("pur", listPur.get(0));
            rsp.sendRedirect("mainNav.jsp");
        }
    }

}
