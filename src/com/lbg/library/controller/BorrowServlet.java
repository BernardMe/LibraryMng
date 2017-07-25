package com.lbg.library.controller;

import com.google.gson.Gson;
import com.lbg.library.entity.R4Borrow;
import com.lbg.library.service.ReaderService;
import com.lbg.library.service.imp.ReaderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * BorrowServlet
 * 2017/7/25.
 */
public class BorrowServlet extends BaseServlet {

    ReaderService service = new ReaderServiceImpl();

    /**
     * 读者借阅检查实体信息
     */
    public void getReaderInfo4Borrow(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        //获取参数
        int rid = Integer.parseInt(req.getParameter("rid"));
        List<R4Borrow> list = service.getReaderInfo4Borrow(rid);

        //响应Ajax
        if (list.size() > 0){
            //返回json
            Gson gson = new Gson();
            rsp.getWriter().print(gson.toJson(list));
            System.out.println(gson.toJson(list));
        } else {
            //list长度=0
            rsp.getWriter().print("null");
        }
    }


}
