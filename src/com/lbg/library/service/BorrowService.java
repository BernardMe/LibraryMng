package com.lbg.library.service;

import com.lbg.library.entity.B4Borrow;

import java.util.List;

/**
 * BorrowService接口
 * 2017/7/25.
 */
public interface BorrowService {

    /**
     * 查询借阅图书列表
     * @param bookname
     */
    List<B4Borrow> getBooks4Borrow(String bookname);

    /**
     * 保存借阅记录
     * @return
     */
    int saveBorrow(int rid, String[] bookid, String operator);
}
