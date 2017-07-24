package com.lbg.library.service.imp;

import java.util.List;

import com.lbg.library.dao.ReaderDao;
import com.lbg.library.dao.imp.BaseDaoImp;
import com.lbg.library.dao.imp.ReaderDaoImpl;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.service.ReaderService;



/**
 * @author zmw
 *
 */
public class ReaderServiceImpl extends BaseDaoImp implements ReaderService {

	ReaderDao dao = new ReaderDaoImpl();
	
	public List<ReaderType> getReaderTypeList() {
		
		return dao.getReaderTypeList();
	}

}
