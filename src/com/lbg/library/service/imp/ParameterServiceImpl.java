package com.lbg.library.service.imp;

import java.util.List;

import com.lbg.library.dao.ParameterDao;
import com.lbg.library.dao.imp.ParameterDaoImpl;
import com.lbg.library.entity.Parameter;
import com.lbg.library.service.ParameterService;
import com.lbg.library.util.PageUtil;

public class ParameterServiceImpl implements ParameterService {
	private ParameterDao dao=new ParameterDaoImpl();
	@Override
	public int addParameter(int cost,int validity) {
		// TODO Auto-generated method stub
		return dao.addParameter(cost,validity);
	}
	@Override
	public int updateParameter(int cost, int validity) {
		// TODO Auto-generated method stub
		return dao.updateParameter(cost, validity);
	}
	@Override
	public int removeParameter(int cost, int validity) {
		// TODO Auto-generated method stub
		return dao.removeParameter(cost, validity);
	}
	
	@Override
	public void queryAllParameter(PageUtil<Parameter> pu) {
		// TODO Auto-generated method stub
		dao.queryAllParameter(pu);
	}
	@Override
	public int queryAllParameterCount() {
		// TODO Auto-generated method stub
		return dao.queryAllParameterCount();
	}
	@Override
	public List<Parameter> queryByCost(int cost) {
		// TODO Auto-generated method stub
		return dao.queryByCost(cost);
	}

}
