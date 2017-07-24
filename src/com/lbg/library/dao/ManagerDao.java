package com.lbg.library.dao;

import com.lbg.library.entity.Manager;

import java.util.List;

/**
 * ManagerDao接口
 * 2017/7/13.
 */
public interface ManagerDao {

    List<Manager> existByName(String uname);

    List<Manager> query4Login(String uname, String upwd);

    int addManager(Manager man);
}
