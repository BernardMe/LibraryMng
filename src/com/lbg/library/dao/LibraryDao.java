package com.lbg.library.dao;

import java.util.List;

import com.lbg.library.entity.Library;

public interface LibraryDao {
	
	/**
	 * 显示图书馆信息
	 * @return
	 */
	List<Library> showLibrary();
	/**
	 * 更新图书馆信息
	 */
	int updateLibrary(Library library);
	
}
