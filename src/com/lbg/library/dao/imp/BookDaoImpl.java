package com.lbg.library.dao.imp;

import com.lbg.library.dao.BookDao;
import com.lbg.library.entity.BookType;

public class BookDaoImpl extends BaseDaoImp implements BookDao {

	@Override
	public int addBookType(BookType type) {
		String sql = "insert into tb_booktype values(0,?,?)";
		return baseUpdate(sql,type.getTypename(),type.getDays());
	}

	@Override
	public int updateBookType(String typename,int days,int typeid) {
		String sql = "update tb_booktype set typename = ? and days = ? where typeid = ?";
		return baseUpdate(sql, typename,days,typeid);
	}

	@Override
	public int deleteBookType(int typeid) {
		String sql = "delete from tb_booktype where typeid = ?";
		return baseUpdate(sql, typeid);
	}

}
