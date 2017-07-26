package com.lbg.library.dao;

import java.util.List;

import com.lbg.library.entity.LibManager;

public interface LibManagerDao {
	/**
	 * 添加管理员
	 * 
	 */
	int addLibManager(String mname,String mpwd);
	/**
	 * 查询是否有该管理员
	 */
	List<LibManager> queryByMname(String mname);
	/**
	 * 删除管理员
	 */
	int deleteManager(int mid);
	/**
	 * 管理员登陆
	 */
	List<LibManager> query4Login(String mname,String mpwd);
	/**
	 * 更新密码
	 */
	int updateMpwd(String mname,String mpwd);
	
}
