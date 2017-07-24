package com.lbg.library.service;

import com.lbg.library.entity.Manager;

import java.util.List;

/**
 * ManagerService接口
 * 2017/7/13.
 */
public interface ManagerService {

    List<Manager> existByName(String uname);

    List<Manager> query4Login(String uname, String upwd);

    int addManager(Manager man);
}
