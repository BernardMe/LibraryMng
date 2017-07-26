package com.lbg.library.service;

import com.lbg.library.entity.Alert4Return;
import com.lbg.library.entity.B4Borrow;
import com.lbg.library.entity.Borrowed;
import com.lbg.library.util.PageUtil;

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
     * 查询已经借图书列表
     * @param rid
     */
    List<Borrowed> listBorrowed(int rid);

    /**
     * 保存借阅记录
     * @return
     */
    int saveBorrow(int rid, String[] bookid, String operator);

    /**
     * 更新续借记录
     * @param swids operator
     */
    int updateBorrow(String[] swids, String operator);

    /**
     * 保存还书记录
     * @return
     */
    int saveReturn(int rid, String[] swids, String operator);

    /**
     * zmw
     * 带分页的借阅到期提醒列表
     * @param pageutil
     */
    void getAlert4ReturnList(PageUtil<Alert4Return> pageutil);

    /**
     * zmw
     * @return
     */
    int queryAlert4ReturnCount();
}
