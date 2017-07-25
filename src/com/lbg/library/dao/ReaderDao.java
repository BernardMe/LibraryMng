package com.lbg.library.dao;

import java.util.List;

import com.lbg.library.entity.R4Borrow;
import com.lbg.library.entity.ReaderType;


/**
 * @author zmw
 *
 */
public interface ReaderDao {
	
	/**
	 * 1.读者类型的 增删改查  
	 * @return list
	 */
	List<ReaderType> getReaderTypeList();

	/**
	 * 2.读者档案的 增删改查
	 * @return list
	 */

	/**
	 * 读者借阅检查实体
	 * @return list
	 * @author Bernard
	 */
	List<R4Borrow> getReaderInfo4Borrow(int rid);
}
