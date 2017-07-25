package com.lbg.library.service.imp;


import com.lbg.library.dao.ReaderDao;
import com.lbg.library.dao.imp.BaseDaoImp;
import com.lbg.library.dao.imp.ReaderDaoImpl;
import com.lbg.library.entity.Reader;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.service.ReaderService;
import com.lbg.library.util.PageUtil;



/**
 * @author zmw
 *
 */
public class ReaderServiceImpl extends BaseDaoImp implements ReaderService {

	ReaderDao dao = new ReaderDaoImpl();
	

	public int queryReaderTypeCount() {		
		return dao.queryReaderTypeCount();
	}

	
	public void getReaderTypeList(PageUtil<ReaderType> pageutil) {		
		dao.getReaderTypeList(pageutil);		
	}


	public boolean deleteReaderTypeByID(byte rtypeid) {
		return dao.deleteReaderTypeByID(rtypeid);

	}


	public boolean addReaderType(ReaderType readertype) {
		return dao.addReaderType(readertype);
	}


	public boolean updateReaderType(ReaderType readertype) {
		return dao.updateReaderType(readertype);
	}


	public void getReaderList(PageUtil<Reader> pageutil) {
		dao.getReaderList(pageutil);
	}

}
