package com.lbg.library.service;


import com.lbg.library.entity.Reader;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.util.PageUtil;


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

}
