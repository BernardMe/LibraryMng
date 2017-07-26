package com.lbg.library.dao;


import com.lbg.library.entity.R4Borrow;
import com.lbg.library.entity.Reader;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.util.PageUtil;

import java.util.List;


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
	
	
	/**
	 * 获取读者总数目
	 * @return 读者总数
	 */
	public int queryReaderCount();
	
	
	/**
	 * 删除读者根据读者条形码
	 * @param rid
	 * @return
	 */	
	public boolean deleteReaderByID(int rid);
	
	/**
	 * 增加读者
	 * @param reader
	 * @return
	 */
	public boolean addReader(Reader reader);
	
	/**
	 * 查询所有的读者类型列表
	 * @return
	 */
	public List<ReaderType> queryAll();

	/**
	 * 更改读者档案信息
	 * @param reader
	 * @return
	 */
	public boolean updateReader(Reader reader);
	
	/**
	 * 读者借阅检查实体
	 * @return list
	 * @author Bernard
	 */
	List<R4Borrow> getReaderInfo4Borrow(int rid);
	
}
