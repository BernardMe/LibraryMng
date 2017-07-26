package com.lbg.library.service.imp;

import com.lbg.library.dao.BorrowDao;
import com.lbg.library.dao.imp.BorrowDaoImp;
import com.lbg.library.entity.B4Borrow;
import com.lbg.library.service.BorrowService;

import java.util.List;

/**
 * Created by Bernard on 2017/7/25.
 */
public class BorrowServiceImp implements BorrowService {

    BorrowDao dao = new BorrowDaoImp();

    /**
     * 查询借阅图书列表
     * @param bookname
     */
    @Override
    public List<B4Borrow> getBooks4Borrow(String bookname) {
        return dao.getBooks4Borrow(bookname);
    }

    /**
     * 保存借阅记录
     * @return
     */
    @Override
    public int saveBorrow(int rid, String[] bookid, String operator){
        int rc = 0;
        for (int i=0; i<bookid.length; i++){
            int bid = Integer.parseInt(bookid[i]);

            //遍历插入
            rc = rc + dao.saveBorrow(rid, bid, operator);
        }
        return rc;
    }
}
