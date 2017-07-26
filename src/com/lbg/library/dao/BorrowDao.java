package com.lbg.library.dao;

import com.lbg.library.entity.B4Borrow;
import com.lbg.library.entity.Borrowed;

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
     * 查询已经借图书列表
     * @param rid
     */
    List<Borrowed> listBorrowed(int rid);

    /**
     * 保存借阅记录
     * @return
     */
    int saveBorrow(int rid, int bookid, String operator);

    /**
     * 更新续借记录
     * @param swid operator
     */
    int updateBorrow(int swid, String operator);

    /**
     * 1.由swid更新borrwo表 ifback =1
     *
     * @param swid
     */
    int updateIfback(int swid);

    /**
     *
     * 2.插入return表 记录 (swid已有, rid已有, bookid, backtime, operator)
     * @param swid rid operator
     */
    int saveReturn(int swid, int rid, String operator);
}
