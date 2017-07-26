package com.lbg.library.controller;

import com.google.gson.Gson;
import com.lbg.library.entity.BQuery;
import com.lbg.library.service.SysQueryService;
import com.lbg.library.service.imp.SysQueryServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * SysQueryServlet
 * 2017/7/26.
 */
public class SysQueryServlet extends BaseServlet {

    SysQueryService service = new SysQueryServiceImp();

    public void borrowQuery(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        //获取bookname
        String bookname = req.getParameter("bookname");
        List<BQuery> list = service.borrowQuery(bookname);

        //放入JSP作用域
        req.setAttribute("bqList", list);
        req.getRequestDispatcher("sysQuery/borrowQuery.jsp").forward(req, rsp);
        //print json
        Gson gson = new Gson();
        rsp.getWriter().print(gson.toJson(list));
        System.out.println("bqList-->"+gson.toJson(list));
        return;

    }
}
