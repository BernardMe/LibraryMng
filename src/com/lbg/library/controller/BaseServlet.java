package com.lbg.library.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * 公共Servlet
 * 2017/7/13.
 */
public class BaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        ////获取req中的方法名 m
        String m = req.getParameter("m");

        if (null != m){
          //反射获取方法对象
            Class<?> cls = this.getClass();
            try {
                Method method = cls.getMethod(m, HttpServletRequest.class, HttpServletResponse.class);
                //调用该方法
                method.invoke(this, req, rsp);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }
}
