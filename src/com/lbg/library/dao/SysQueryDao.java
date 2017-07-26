package com.lbg.library.dao;

import com.lbg.library.entity.BQuery;

import java.util.List;

/**
 * Created by Bernard on 2017/7/26.
 */
public interface SysQueryDao {

    List<BQuery> borrowQuery(String bookname);
}
