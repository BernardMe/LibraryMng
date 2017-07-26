package com.lbg.library.service;

import com.lbg.library.entity.BQuery;

import java.util.List;

/**
 * SysQueryService接口
 * 2017/7/26.
 */
public interface SysQueryService {

    /**
     * 图书借阅查询
     * @param bookname
     */
    List<BQuery> borrowQuery(String bookname);
}
