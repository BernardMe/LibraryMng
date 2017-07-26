package com.lbg.library.dao;

import com.lbg.library.entity.B4Borrow;

import java.util.List;

/**
 * BorrowDao接口
 * 2017/7/25.
 */
public interface BorrowDao {

    /**
     * 查询借阅图书列表
     * @param bookname
     */
    List<B4Borrow> getBooks4Borrow(String bookname);


    /**
     * 保存借阅记录
     * @return
     */
    int saveBorrow(int rid, int bookid, String operator);
}
