package com.lbg.library.service;

import java.util.List;

import com.lbg.library.entity.R4Borrow;
import com.lbg.library.entity.ReaderType;


/**
 * @author zmw
 *
 */
public interface ReaderService {
	
	public List<ReaderType> getReaderTypeList();

	/**
	 * 读者借阅检查实体
	 * @return list
	 * @author Bernard
	 */
	List<R4Borrow> getReaderInfo4Borrow(int rid);
}
