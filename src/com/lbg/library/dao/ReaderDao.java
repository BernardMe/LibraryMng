package com.lbg.library.dao;


import com.lbg.library.entity.Reader;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.util.PageUtil;


/**
 * @author zmw
 * 1.读者类型的 增删改查  
 * 2.读者档案的 增删改查
 */
public interface ReaderDao {

	/**
	 * 带分页功能的查询读者类型
	 * @param pageutil
	 */
	public void getReaderTypeList(PageUtil<ReaderType> pageutil);
	
	/**
	 * 获取读者类型总数目
	 * @return 读者类型总数
	 */
	public int queryReaderTypeCount();
	
	/**
	 * 增加新的读者类型
	 * @param readertype
	 */
	public boolean addReaderType(ReaderType readertype);
	
	/**
	 * 根据读者类型id删除相应的读者类型
	 * @param rtypeid
	 * @return 
	 */
	public boolean deleteReaderTypeByID(byte rtypeid);
	
	/**
	 * 更改相应的读者类型
	 * @param rtypeid
	 * @return
	 */	
	public boolean updateReaderType(ReaderType readertype);
	
	
	/**
	 * 带分页功能的查询读者档案
	 * @param pageutil
	 */
	public void getReaderList(PageUtil<Reader> pageutil);
	
	
	
}
