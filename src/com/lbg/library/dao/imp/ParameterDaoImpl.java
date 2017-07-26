package com.lbg.library.dao.imp;

import java.util.List;

import com.lbg.library.dao.ParameterDao;
import com.lbg.library.entity.Parameter;
import com.lbg.library.util.PageUtil;

public class ParameterDaoImpl extends BaseDaoImp implements ParameterDao {

	@Override
	public int addParameter(int cost,int validity) {
		String sql="insert into tb_parameter values(0,?,?)";
		return baseUpdate(sql, cost,validity);
	}

	@Override
	public int updateParameter(int cost, int validity) {
		String sql="update tb_parameter set validity=? where cost=? ";
		return baseUpdate(sql, validity,cost);
	}

	@Override
	public int removeParameter(int cost, int validity) {
		String sql="delete from tb_parameter where cost=? and validity=?";
		return baseUpdate(sql, cost,validity);
	}

	@Override
	public void  queryAllParameter(PageUtil<Parameter> pu) {
		String sql="SELECT * from tb_parameter limit ?,?";
		List<Parameter> list= baseQuery(Parameter.class, sql,pu.getStart(),pu.getSize());
		pu.setList(list);
	}

	@Override
	public int queryAllParameterCount() {
		String sql="SELECT count(*) from tb_parameter";
		return queryCount(sql);
	}

	@Override
	public List<Parameter> queryByCost(int cost) {
		String sql="select * from tb_parameter where cost=?";
		return baseQuery(Parameter.class, sql, cost);
	}
	
}
