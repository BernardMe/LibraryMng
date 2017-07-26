package com.lbg.library.service.imp;

import java.util.List;

import com.lbg.library.dao.LibraryDao;
import com.lbg.library.dao.imp.LibraryDaoImpl;
import com.lbg.library.entity.Library;
import com.lbg.library.service.LibraryService;

public class LibraryServiceImpl implements LibraryService {
	private LibraryDao dao=new LibraryDaoImpl();

	@Override
	public List<Library> showLibrary() {
		// TODO Auto-generated method stub
		return dao.showLibrary();
	}
	
}
