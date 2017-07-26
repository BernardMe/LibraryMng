package com.lbg.library.dao.imp;

import com.lbg.library.dao.BorrowDao;
import com.lbg.library.entity.Alert4Return;
import com.lbg.library.entity.B4Borrow;
import com.lbg.library.entity.Borrowed;
import com.lbg.library.util.PageUtil;

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

    @Override
    public List<Borrowed> listBorrowed(int rid) {
        //定义SQL
        String sql = "SELECT t.swid, t.bookid, b.bookname, b.isbn, t.borrowtime, t.limitbacktime, t.ifback" +
                " FROM tb_borrow t LEFT JOIN tb_bookinfo b ON t.bookid = b.bookid" +
                " WHERE ifback = 0 AND rid = ?";

        //返回查询结果集
        return baseQuery(Borrowed.class, sql, rid);
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

    /**
     * 更新续借记录
     * @param swid operator
     */
    @Override
    public int updateBorrow(int swid, String operator) {
        //定义SQL
        String sql = "UPDATE tb_borrow SET limitbacktime = DATE_ADD(limitbacktime,INTERVAL 1 month), operator = 'java1234'" +
                " WHERE swid = ?";

        //返回查询结果集
        return baseUpdate(sql, swid);
    }

    /**
     * 1.由swid更新borrwo表 ifback =1
     * @param swid
     */
    @Override
    public int updateIfback(int swid) {
        //定义SQL
        String sql = "UPDATE tb_borrow SET ifback = 1 WHERE swid = ?";
        //返回查询结果集
        return baseUpdate(sql, swid);
    }

    /**
     * 2.插入return表 记录 (swid已有, rid已有, bookid, backtime, operator)
     * @param swid rid operator
     */
    @Override
    public int saveReturn(int swid, int rid, String operator) {
        //定义SQL
        String sql = "INSERT INTO tb_return VALUES (?, ?, bookidBySwid(swid), CURDATE(), 'java1234')";
        //返回查询结果集
        return baseUpdate(sql, swid, rid);
    }

    @Override
    public void getAlert4ReturnList(PageUtil<Alert4Return> pageutil) {
        String sql = "select b.bookid,b.bookname,r.rid,r.rname,bo.borrowtime,bo.limitbacktime from tb_bookinfo b,tb_reader r,tb_borrow bo where b.bookid=bo.bookid and r.rid=bo.rid and bo.ifback=0 limit ?,?";
        pageutil.setList(baseQuery(Alert4Return.class, sql,pageutil.getStart(),pageutil.getSize()));

    }

    @Override
    public int queryAlert4ReturnCount() {
        String sql = "select count(*) from tb_bookinfo b,tb_reader r,tb_borrow bo where b.bookid=bo.bookid and r.rid=bo.rid and bo.ifback=0";
        return queryCount(sql);
    }
}
