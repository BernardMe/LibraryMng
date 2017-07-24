package com.lbg.library.service;

import com.lbg.library.entity.BookType;

public interface BookService {
	/**
	 * 增加图书类型
	 * @param type
	 * @return
	 */
	int addBookType(BookType type);
	/**
	 * 修改图书类型的信息
	 * @param typename
	 * @param days
	 * @param typeid
	 * @return
	 */
	int updateBookType(String typename,int days,int typeid);
	/**
	 * 删除图书类型
	 * @param typeid
	 * @return
	 */
	int deleteBookType(int typeid);

}
