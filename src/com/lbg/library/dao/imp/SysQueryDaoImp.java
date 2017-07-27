package com.lbg.library.dao.imp;

import com.lbg.library.dao.SysQueryDao;
import com.lbg.library.entity.BQuery;

import java.util.List;

/**
 * Created by Bernard on 2017/7/26.
 */
public class SysQueryDaoImp extends BaseDaoImp implements SysQueryDao {
    @Override
    public List<BQuery> borrowQuery(String bookname) {
        //定义SQL
        String sql = "SELECT b.bookid, b.bookname, t.rid, r.rname, t.borrowtime, t.limitbacktime, t.ifback " +
                " FROM (tb_bookinfo b RIGHT JOIN tb_borrow t ON b.bookid = t.bookid) LEFT JOIN tb_reader r ON t.rid = r.rid" +
                " WHERE  bookname like '%"+ bookname +"%' ORDER BY t.borrowtime ASC";

        //返回查询结果集
        return baseQuery(BQuery.class, sql);
    }
}
