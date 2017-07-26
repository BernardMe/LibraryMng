package com.lbg.library.service;

import java.util.List;

import com.lbg.library.entity.Parameter;
import com.lbg.library.util.PageUtil;

public interface ParameterService {
	/**
	 * 增加卡的费用
	 */
	int addParameter(int cost,int validity);
	/**
	 * 更改卡费信息
	 */
	int updateParameter(int cost,int validity);
	/**
	 * 删除本卡的信息
	 */
	int removeParameter(int cost,int validity);
	/**
	 * 显示所有卡费信息
	 */
	void queryAllParameter(PageUtil<Parameter> pu);
	/**
	 * 所有卡类总数
	 */
	int queryAllParameterCount();
	/**
	 * 查询是否有这种卡费信息
	 */
	List<Parameter> queryByCost(int cost);
}
