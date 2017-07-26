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
	
	@Override
	public int updateLibrary(Library library) {
		String sql="update tb_library set libraryname=?,curator=?,tel=?,address=?,email=?,url=?,createdate=?,introduce=? where libraryid=1";
		return baseUpdate(sql,library.getLibraryname(),library.getCurator(),library.getTel(),library.getAddress(),library.getEmail(),library.getUrl(),library.getCreatedate(),library.getIntroduce() );
	}

}
