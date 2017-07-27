package com.lbg.library.dao;

import java.util.List;

import com.lbg.library.entity.BookShelf;
import com.lbg.library.util.PageUtil;

public interface BookShelfDao {
	/**
	 * 查询所有书架
	 * @param pu
	 */
	void queryAllShelf(PageUtil<BookShelf> pu);
	/**
	 * 查询所有书架数量
	 */
	int queryAllShelfCount();
	/**
	 * 查询所有书架集合
	 */
	List<BookShelf> queryAllShelfName();
	/**
	 * 添加书架
	 */
	int addShelf(String shelfname);
	/**
	 * 检查是否有该书架
	 */
	List<BookShelf> queryByShelfName(String shelfname);
	/**
	 * 删除书架
	 */
	int deleteShelf(int shelfid);
	/**
	 * 修改数据名称
	 */
	int upadteShelfNamd(int shelfid,String shelfname);
	/**
	 * 查询书架书的数量
	 */
	int queryShelfCount(int shelfid);
}
