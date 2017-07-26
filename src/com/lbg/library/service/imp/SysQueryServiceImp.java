package com.lbg.library.service.imp;

import com.lbg.library.dao.SysQueryDao;
import com.lbg.library.dao.imp.SysQueryDaoImp;
import com.lbg.library.entity.BQuery;
import com.lbg.library.service.SysQueryService;

import java.util.List;

/**
 * Created by Bernard on 2017/7/26.
 */
public class SysQueryServiceImp implements SysQueryService {

    SysQueryDao dao = new SysQueryDaoImp();

    @Override
    public List<BQuery> borrowQuery(String bookname) {
        return dao.borrowQuery(bookname);
    }
}
