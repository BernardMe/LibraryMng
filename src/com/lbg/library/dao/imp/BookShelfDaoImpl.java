package com.lbg.library.dao.imp;

import java.util.List;

import com.lbg.library.dao.BookShelfDao;
import com.lbg.library.entity.BookShelf;
import com.lbg.library.util.PageUtil;

public class BookShelfDaoImpl extends BaseDaoImp implements BookShelfDao {

	@Override
	public void queryAllShelf(PageUtil<BookShelf> pu) {
		String sql="select * from tb_shelf limit ?,? ";
		List<BookShelf> list = baseQuery(BookShelf.class, sql,pu.getStart(),pu.getSize());
		pu.setList(list);
	}

	@Override
	public int queryAllShelfCount() {
		String sql="select count(*) from tb_shelf";
		return queryCount(sql);
	}

	@Override
	public List<BookShelf> queryAllShelfName() {
		String sql="select * from tb_shelf";
		return baseQuery(BookShelf.class, sql);
	}

	@Override
	public int addShelf(String shelfname) {
		String sql="insert into tb_shelf values(0,?)";
		return baseUpdate(sql, shelfname);
	}

	@Override
	public List<BookShelf> queryByShelfName(String shelfname) {
		String sql="select * from tb_shelf where shelfname=?";
		return baseQuery(BookShelf.class, sql, shelfname);
	}

	@Override
	public int deleteShelf(int shelfid) {
		String sql="delete from tb_shelf where shelfid=?";
		return baseUpdate(sql, shelfid);
	}

	@Override
	public int upadteShelfNamd(int shelfid, String shelfname) {
		String sql="update tb_shelf set shelfname=? where shelfid=?";
		return baseUpdate(sql, shelfname,shelfid);
	}

}
