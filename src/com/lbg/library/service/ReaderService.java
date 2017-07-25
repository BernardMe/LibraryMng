package com.lbg.library.service;


import com.lbg.library.entity.R4Borrow;
import com.lbg.library.entity.Reader;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.util.PageUtil;

import java.util.List;


/**
 * @author zmw
 *
 */
public interface ReaderService {
	
	public void getReaderTypeList(PageUtil<ReaderType> pageutil);
	
	public int queryReaderTypeCount();
	
	public boolean deleteReaderTypeByID(byte rtypeid);
	
	public boolean updateReaderType(ReaderType readertype);
	
	public boolean addReaderType(ReaderType readertype);
	
	public void getReaderList(PageUtil<Reader> pageutil);

	/**
	 * 读者借阅检查实体
	 * @return list
	 * @author Bernard
	 */
	List<R4Borrow> getReaderInfo4Borrow(int rid);
}
