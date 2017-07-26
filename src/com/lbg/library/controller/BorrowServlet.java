package com.lbg.library.controller;

import com.google.gson.Gson;
import com.lbg.library.entity.B4Borrow;
import com.lbg.library.entity.Borrowed;
import com.lbg.library.entity.R4Borrow;
import com.lbg.library.service.BorrowService;
import com.lbg.library.service.ReaderService;
import com.lbg.library.service.imp.BorrowServiceImp;
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

    ReaderService rs = new ReaderServiceImpl();
    BorrowService bs = new BorrowServiceImp();

    /**
     * 读者借阅检查实体信息
     */
    public void getReaderInfo4Borrow(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        //获取参数
        int rid = Integer.parseInt(req.getParameter("rid"));
        List<R4Borrow> list = rs.getReaderInfo4Borrow(rid);

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

    /**
     * 查询借阅图书列表
     */
    public void getBooks4Borrow(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        //获取参数
        String bookname = req.getParameter("bookname");
        List<B4Borrow> list = bs.getBooks4Borrow(bookname);

        //响应Ajax
        if (list.size() > 0){
            //返回json
            Gson gson = new Gson();
            rsp.getWriter().print(gson.toJson(list));
            System.out.println("booklist-->"+gson.toJson(list));
        } else {
            //图书list长度=0
            rsp.getWriter().print("null");
        }
        /*req.setAttribute("bookname", bookname);
        req.setAttribute("list", list);
        req.getRequestDispatcher("borrowReturn/bookBorrow.jsp").forward(req, rsp);
        return;*/
    }

    /**
     * 查询已经借图书列表
     */
    public void listBorrowed(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        //获取参数
        int rid = Integer.parseInt(req.getParameter("rid"));
        List<Borrowed> list = bs.listBorrowed(rid);

        //响应Ajax
        if (list.size() > 0){
            //返回json
            Gson gson = new Gson();
            rsp.getWriter().print(gson.toJson(list));
            System.out.println("listBorrowed-->"+gson.toJson(list));
        } else {
            //图书list长度=0
            rsp.getWriter().print("null");
        }
    }

    /**
     * 保存借阅记录
     */
    public void saveBorrow(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        //获取rid
        int rid = Integer.parseInt(req.getParameter("rid"));
        //获取info
        String[] bookid = req.getParameterValues("bookid[]");
        //获取operator
        String operator = "nul";

        if (bs.saveBorrow(rid, bookid, operator) > 0){
            rsp.getWriter().print("1");
            //req.getRequestDispatcher("borrowReturn/bookBorrow.jsp").forward(req, rsp);
            return;
        } else {
            rsp.getWriter().print("-1");
        }
    }

    /**
     * 更新续借记录
     */
    public void updateBorrow(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        //获取swid
        int swid = Integer.parseInt(req.getParameter("swid"));
        //获取swids
        String[] swids = req.getParameterValues("swids[]");
        //获取operator
        String operator = "nul";

        if (bs.updateBorrow(swids, operator) > 0){
            rsp.getWriter().print("1");
            //req.getRequestDispatcher("borrowReturn/bookBorrow.jsp").forward(req, rsp);
            return;
        } else {
            rsp.getWriter().print("-1");
        }
    }

    /**
     * 保存还书记录
     */
    public void saveReturn(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
        //获取rid
        int rid = Integer.parseInt(req.getParameter("rid"));
        //获取swids
        String[] swids = req.getParameterValues("swids[]");

        if (bs.saveReturn(rid, swids, "nul") > 0){
            rsp.getWriter().print("1");
            //req.getRequestDispatcher("borrowReturn/bookBorrow.jsp").forward(req, rsp);
            return;
        } else {
            rsp.getWriter().print("-1");
        }
    }
}
