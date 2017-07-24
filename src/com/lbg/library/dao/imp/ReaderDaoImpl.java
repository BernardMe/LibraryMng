package com.lbg.library.dao.imp;

import java.util.List;

import com.lbg.library.dao.ReaderDao;
import com.lbg.library.entity.ReaderType;

/**
 * @author zmw
 *
 */
public class ReaderDaoImpl extends BaseDaoImp implements ReaderDao {

	
	public List<ReaderType> getReaderTypeList() {
		String sql = "select * from tb_booktype";
		return baseQuery(ReaderType.class, sql);
	}

}
