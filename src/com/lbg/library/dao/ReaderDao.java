package com.lbg.library.dao;

import java.util.List;
import com.lbg.library.entity.ReaderType;


/**
 * @author zmw
 *
 */
public interface ReaderDao {
	
	/**
	 * 1.读者类型的 增删改查  
	 * 2.读者档案的 增删改查
	 */

	public List<ReaderType> getReaderTypeList();
	
}
