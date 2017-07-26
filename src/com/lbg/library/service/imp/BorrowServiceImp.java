package com.lbg.library.service.imp;

import com.lbg.library.dao.BorrowDao;
import com.lbg.library.dao.imp.BorrowDaoImp;
import com.lbg.library.entity.Alert4Return;
import com.lbg.library.entity.B4Borrow;
import com.lbg.library.entity.Borrowed;
import com.lbg.library.service.BorrowService;
import com.lbg.library.util.PageUtil;

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
     * 查询已经借图书列表
     * @param rid
     */
    @Override
    public List<Borrowed> listBorrowed(int rid) {
        return dao.listBorrowed(rid);
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

    /**
     * 更新续借记录
     * @param swids operator
     */
    @Override
    public int updateBorrow(String[] swids, String operator) {
        int rc = 0;
        for (int i=0; i<swids.length; i++){
            int swid = Integer.parseInt(swids[i]);

            //遍历更新
            rc = rc + dao.updateBorrow(swid, operator);
        }
        return rc;
    }

    /**
     * 保存还书记录
     * @param
     */
    @Override
    public int saveReturn(int rid, String[] swids, String operator) {
        int rc = 1;
        for (int i=0; i<swids.length; i++){
            int swid = Integer.parseInt(swids[i]);

            int rc1 = dao.saveReturn(swid, rid, operator);
            if (rc1 <= 0){
                return 0;
            }
            int rc2 = dao.updateIfback(swid);
            if (rc2 <= 0){
                return 0;
            }
            rc = rc * (rc1 * rc2);
        }
        return rc;
    }

    @Override
    public void getAlert4ReturnList(PageUtil<Alert4Return> pageutil) {
        dao.getAlert4ReturnList(pageutil);
    }

    @Override
    public int queryAlert4ReturnCount() {
        return dao.queryAlert4ReturnCount();
    }
}
