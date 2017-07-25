package com.lbg.library.dao.imp;

import java.util.List;

import com.lbg.library.dao.ReaderDao;
import com.lbg.library.entity.R4Borrow;
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

	/**
	 * 读者借阅检查实体
	 * @return list
	 * @author Bernard
	 */
	@Override
	public List<R4Borrow> getReaderInfo4Borrow(int rid) {
		//定义SQL
		String sql = "SELECT r.rid, r.rname, r.gender, r.papertype, r.paperno, t.rtypename, t.count" +
				" FROM tb_reader r, tb_readertype t" +
				" WHERE r.rtypeid = t.rtypeid AND r.rid = ?";

		//返回查询结果集
		return baseQuery(R4Borrow.class, sql, rid);
	}

}
