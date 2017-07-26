package com.lbg.library.service.imp;

import java.util.List;

import com.lbg.library.dao.LibManagerDao;
import com.lbg.library.dao.imp.LibManagerDaoImpl;
import com.lbg.library.entity.LibManager;
import com.lbg.library.service.LibManagerService;

public class LibManagerServiceImpl implements LibManagerService {
	private LibManagerDao dao=new LibManagerDaoImpl();
	@Override
	public int addLibManager(String mname, String mpwd) {
		// TODO Auto-generated method stub
		return dao.addLibManager(mname, mpwd);
	}
	@Override
	public List<LibManager> queryByMname(String mname) {
		// TODO Auto-generated method stub
		return dao.queryByMname(mname);
	}
	@Override
	public int deleteManager(int mid) {
		// TODO Auto-generated method stub
		return dao.deleteManager(mid);
	}
	@Override
	public List<LibManager> query4Login(String mname, String mpwd) {
		// TODO Auto-generated method stub
		return dao.query4Login(mname, mpwd);
	}
	

}
