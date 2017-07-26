package com.lbg.library.service.imp;

import java.util.Arrays;
import java.util.List;

import com.lbg.library.dao.PurviewDao;
import com.lbg.library.dao.imp.PurviewDaoImpl;
import com.lbg.library.entity.Purview;
import com.lbg.library.service.PurviewService;
import com.lbg.library.util.PageUtil;

public class PurviewServiceImpl implements PurviewService {
	private PurviewDao dao=new PurviewDaoImpl();
	@Override
	public void showAllManager(PageUtil<Purview> pu) {
		dao.showAllManager(pu);

	}
	@Override
	public int queryAllHasPur() {
		return dao.queryAllHasPur();
	}
	@Override
	public int addPurview(int mid) {
		// TODO Auto-generated method stub
		return dao.addPurview(mid);
	}
	@Override
	public int deleteManagerPur(int mid) {
		// TODO Auto-generated method stub
		return dao.deleteManagerPur(mid);
	}
	@Override
	public int updatePurByMid(Purview pur,String values,int mid) {
		// TODO Auto-generated method stub
		if(values!=null){
			if(values.indexOf("1")!=-1){
				pur.setSysset(1);
			}if(values.indexOf("2")!=-1){
				pur.setReaderset(1);
			}if(values.indexOf("3")!=-1){
				pur.setBookset(1);
			}if(values.indexOf("4")!=-1){
				pur.setBorrowback(1);
			}if(values.indexOf("5")!=-1){
				pur.setSysquery(1);
			}
		}
		pur.setMid(mid);
		return dao.updatePurByMid(pur);
	}
	@Override
	public List<Purview> queryByMid(int mid) {
		// TODO Auto-generated method stub
		return dao.queryByMid(mid);
	}
	
}
