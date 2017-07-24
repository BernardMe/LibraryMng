package com.lbg.library.service.imp;

import com.lbg.library.dao.ManagerDao;
import com.lbg.library.dao.imp.ManagerDaoImp;
import com.lbg.library.entity.Manager;
import com.lbg.library.service.ManagerService;

import java.util.List;

/**
 * Created by Bernard on 2017/7/13.
 */
public class ManagerServiceImp implements ManagerService {

    ManagerDao dao = new ManagerDaoImp();

    @Override
    public List<Manager> existByName(String uname) {
        return dao.existByName(uname);
    }

    @Override
    public List<Manager> query4Login(String uname, String upwd) {
         return dao.query4Login(uname, upwd);
    }

    /**
     * 添加管理员实体
     * @return
     */
    @Override
    public int addManager(Manager man) {
        return dao.addManager(man);
    }
}
