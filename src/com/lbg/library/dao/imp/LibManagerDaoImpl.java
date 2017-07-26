package com.lbg.library.dao.imp;

import java.util.List;

import com.lbg.library.dao.LibManagerDao;
import com.lbg.library.entity.LibManager;
import com.lbg.library.util.PageUtil;

public class LibManagerDaoImpl extends BaseDaoImp implements LibManagerDao {

	@Override
	public int addLibManager(String mname, String mpwd) {
		String sql="insert into tb_manager values(0,?,md5(?))";
		return baseUpdate(sql, mname,mpwd);
	}

	@Override
	public List<LibManager> queryByMname(String mname) {
		String sql="select * from tb_manager where mname=?";
		return baseQuery(LibManager.class,sql,mname);
	}

	@Override
	public int deleteManager(int mid) {
		String sql="delete from tb_manager where mid=?";
		return baseUpdate(sql, mid);
	}

	@Override
	public List<LibManager> query4Login(String mname, String mpwd) {
		String sql="select * from tb_manager where mname=? and mpwd=md5(?)";
		return baseQuery(LibManager.class, sql, mname,mpwd);
	}

	@Override
	public int updateMpwd(String mname, String mpwd) {
		String sql="update tb_manager set mpwd=md5(?) where mname=?";
		return baseUpdate(sql, mpwd,mname);
	}


}
