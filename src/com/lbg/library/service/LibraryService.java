package com.lbg.library.service;

import java.util.List;

import com.lbg.library.entity.Library;

public interface LibraryService {
	/**
	 * 显示图书馆信息
	 * @return
	 */
	List<Library> showLibrary();
}
