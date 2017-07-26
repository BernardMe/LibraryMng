package com.lbg.library.dao.imp;

import java.util.List;

import com.lbg.library.dao.PurviewDao;
import com.lbg.library.entity.Purview;
import com.lbg.library.util.PageUtil;

public class PurviewDaoImpl extends BaseDaoImp implements PurviewDao {

	@Override
	public void showAllManager(PageUtil<Purview> pu) {
		String sql="SELECT m.mname,p.* from tb_manager m,tb_purview p where p.mid=m.mid limit ?,?";
		List<Purview> list = baseQuery(Purview.class, sql, pu.getStart(),pu.getSize());
		pu.setList(list);
	}

	@Override
	public int queryAllHasPur() {
		String sql="SELECT count(*) from tb_manager m,tb_purview p where p.mid=m.mid ";
		return queryCount(sql);
	}

	@Override
	public int addPurview(int mid) {
		String sql="insert into tb_purview values(?,0,0,0,0,0)";
		return baseUpdate(sql, mid);
	}

	@Override
	public int deleteManagerPur(int mid) {
		String sql="delete from tb_purview where mid=?";
		return baseUpdate(sql, mid);
	}

	@Override
	public int updatePurByMid(Purview purview) {
		String sql="update tb_purview set sysset=?,readerset=?,bookset=?,borrowback=?,sysquery=? where mid=?";
		return baseUpdate(sql, purview.getSysset(),purview.getReaderset(),purview.getBookset(),purview.getBorrowback(),purview.getSysquery(),purview.getMid());
	}

	@Override
	public List<Purview> queryByMid(int mid) {
		String sql="select * from tb_purview where mid=?";
		return baseQuery(Purview.class, sql, mid);
	}

}
