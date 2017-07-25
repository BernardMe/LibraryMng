package com.lbg.library.dao.imp;


import com.lbg.library.dao.ReaderDao;
import com.lbg.library.entity.Reader;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.util.PageUtil;

/**
 * @author zmw
 *
 */
public class ReaderDaoImpl extends BaseDaoImp implements ReaderDao {
	

	public int queryReaderTypeCount() {
		String sql = "select count(*) from tb_readertype";
		return queryCount(sql);
	}

	public void getReaderTypeList(PageUtil<ReaderType> pageutil) {
		String sql = "select * from tb_readertype limit ?,?";	
		pageutil.setList(baseQuery(ReaderType.class, sql,pageutil.getStart(),pageutil.getSize()));
	}

	public boolean addReaderType(ReaderType readertype) {
		String sql = "insert into tb_readertype values(0,?,?)";
		if(baseUpdate(sql,readertype.getRtypename(),readertype.getCount())>0){
			return true;
		}else{
			return false;
		}
	}

	public boolean deleteReaderTypeByID(byte rtypeid) {
		String sql = "delete from tb_readertype where rtypeid=?";
		if (baseUpdate(sql, rtypeid)>0){
			return true;
		}else{
			return false;
		}
		
	}

	public boolean updateReaderType(ReaderType readertype) {
		String sql = "update tb_readertype set rtypename=?,count=? where rtypeid=?";
		if(baseUpdate(sql,readertype.getRtypename(),readertype.getCount(),readertype.getRtypeid())>0){
			return true;
		}else{
			return false;
		}
	}

	public void getReaderList(PageUtil<Reader> pageutil) {
		String sql = "select r.*,rt.rtypename from tb_reader r,tb_readertype rt where r.rtypeid=rt.rtypeid limit ?,?";	
		pageutil.setList(baseQuery(Reader.class, sql,pageutil.getStart(),pageutil.getSize()));

	}

}
