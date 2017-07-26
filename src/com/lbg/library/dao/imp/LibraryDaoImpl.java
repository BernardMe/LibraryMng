package com.lbg.library.dao.imp;

import java.util.List;

import com.lbg.library.dao.LibraryDao;
import com.lbg.library.entity.Library;

public class LibraryDaoImpl extends BaseDaoImp implements LibraryDao {

	@Override
	public List<Library> showLibrary() {
		String sql="select * from tb_library";
		return baseQuery(Library.class, sql);
	}

}
