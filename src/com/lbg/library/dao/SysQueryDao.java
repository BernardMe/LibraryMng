package com.lbg.library.dao;

import com.lbg.library.entity.BQuery;

import java.util.List;

/**
 * SysQueryDao接口
 * 2017/7/26.
 */
public interface SysQueryDao {

    /**
     * 图书借阅查询
     * @param bookname
     */
    List<BQuery> borrowQuery(String bookname);
}
