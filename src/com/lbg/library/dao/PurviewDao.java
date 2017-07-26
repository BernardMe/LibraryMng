package com.lbg.library.dao;

import java.util.List;

import com.lbg.library.entity.Purview;
import com.lbg.library.util.PageUtil;

public interface PurviewDao {
	/**
	 * 显示所有的管理员及其权限
	 */
	void showAllManager(PageUtil<Purview> pu);
	/**
	 * 所有有权限的管理员数量
	 */
	int queryAllHasPur();
	/**
	 * 增加管理员时添加默认权限
	 */
	int addPurview(int mid);
	/**
	 * 删除管理员权限
	 */
	int deleteManagerPur(int mid);
	/**
	 * 更该管理员的权限
	 */
	int updatePurByMid(Purview purview);
	/**
	 * 查询管理员权限
	 */
	List<Purview> queryByMid(int mid);
}
