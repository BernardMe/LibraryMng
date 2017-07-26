package com.lbg.library.dao.imp;

import com.lbg.library.dao.BorrowDao;
import com.lbg.library.entity.B4Borrow;

import java.util.List;

/**
 * BorrowDao接口实现类
 * 2017/7/25.
 */
public class BorrowDaoImp extends BaseDaoImp implements BorrowDao {

    /**
     * 查询借阅图书列表
     * @param bookname
     */
    public List<B4Borrow> getBooks4Borrow(String bookname){
        //定义SQL
        String sql = "SELECT bookid,  bookname, CURDATE() borrowtm, DATE_ADD(CURDATE(),INTERVAL 1 month) limitbacktm, isbn, shelfid, price " +
                " FROM tb_bookinfo " +
                " WHERE bookname like '%"+ bookname +"%'";

        //返回查询结果集
        return baseQuery(B4Borrow.class, sql);
    }

    /**
     * 保存借阅记录
     * @return
     */
    @Override
    public int saveBorrow(int rid, int bookid, String operator){
        //定义SQL
        String sql = "INSERT INTO tb_borrow VALUES(0, ?, ?, CURDATE(), DATE_ADD(CURDATE(),INTERVAL 1 month), 0, 'java1234')";

        //返回查询结果集
        return baseUpdate(sql, rid, bookid);
    }
}
