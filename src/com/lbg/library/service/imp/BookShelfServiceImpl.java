package com.lbg.library.service.imp;

import java.util.List;

import com.lbg.library.dao.BookShelfDao;
import com.lbg.library.dao.imp.BookShelfDaoImpl;
import com.lbg.library.entity.BookShelf;
import com.lbg.library.service.BookShelfService;
import com.lbg.library.util.PageUtil;

public class BookShelfServiceImpl implements BookShelfService {
	private BookShelfDao dao=new BookShelfDaoImpl();
	@Override
	public void queryAllShelf(PageUtil<BookShelf> pu) {
		// TODO Auto-generated method stub
		dao.queryAllShelf(pu);
	}
	@Override
	public int queryAllShelfCount() {
		// TODO Auto-generated method stub
		return dao.queryAllShelfCount();
	}
	@Override
	public List<BookShelf> queryAllShelfName() {
		// TODO Auto-generated method stub
		return dao.queryAllShelfName();
	}
	@Override
	public int addShelf(String shelfname) {
		// TODO Auto-generated method stub
		return dao.addShelf(shelfname);
	}
	@Override
	public List<BookShelf> queryByShelfName(String shelfname) {
		// TODO Auto-generated method stub
		return dao.queryByShelfName(shelfname);
	}
	@Override
	public int deleteShelf(int shelfid) {
		// TODO Auto-generated method stub
		return dao.deleteShelf(shelfid);
	}
	@Override
	public int upadteShelfNamd(int shelfid, String shelfname) {
		// TODO Auto-generated method stub
		return dao.upadteShelfNamd(shelfid, shelfname);
	}

}
