package com.lbg.library.controller;

import com.lbg.library.service.ManagerService;
import com.lbg.library.service.imp.ManagerServiceImp;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 登录Servlet
 * 2017/7/13.
 */
public class LoginServlet extends BaseServlet {

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

        String uname = req.getParameter("uname");
        String upwd = req.getParameter("upwd");
        String role = req.getParameter("role");

        System.out.println("LoginServlet.service  --->" + uname +"@"+ role);

        List<?> list = null;
        //判断角色
        if ("admin".equals(role)){
            ManagerService service = new ManagerServiceImp();

            list = service.query4Login(uname, upwd);

        } else if("student".equals(role)) {

        } else {

        }
        //继续登录
        if(list.size() == 0) {
            req.getSession().setAttribute("error", "用户名 密码错误");
            rsp.sendRedirect("login.jsp");
        } else {
            req.getSession().setAttribute("user", list.get(0));
            req.getSession().setAttribute("role", role);
            rsp.sendRedirect("index.jsp");
        }
    }

}
