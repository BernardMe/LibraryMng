package com.lbg.library.dao.imp;


import com.lbg.library.dao.ReaderDao;
import com.lbg.library.entity.R4Borrow;
import com.lbg.library.entity.Reader;
import com.lbg.library.entity.ReaderType;
import com.lbg.library.util.PageUtil;

import java.util.List;

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
	
	
	public int queryReaderCount() {
		String sql = "select count(*) from tb_reader";
		return queryCount(sql);
	}
	
	
	public boolean deleteReaderByID(int rid) {
		
		String sql = "delete from tb_reader where rid=?";
		if (baseUpdate(sql, rid)>0){
			return true;
		}else{
			return false;
		}
	}
	
	
	public boolean addReader(Reader reader) {
		
		String sql = "insert into tb_reader values(0,?,?,?,?,?,?,?,?,?,?,?,?)";
		if(baseUpdate(sql,reader.getRname(),reader.getGender(),reader.getVocation(),reader.getBirthday(),reader.getPapertype(),reader.getPaperno(),reader.getTel(),reader.getEmail(),reader.getCreatedate(),reader.getRemark(),reader.getRtypeid(),reader.getOperator())>0){
			return true;
		}else{
			return false;
		}
	}
	
	public List<ReaderType> queryAll() {
		
		String sql = "select * from tb_readertype";
		return baseQuery(ReaderType.class, sql);

	}
	
	
	public boolean updateReader(Reader reader) {
		
		String sql = "update tb_reader set rname=?,gender=?,vocation=?,birthday=?,papertype=?,paperno=?,tel=?,email=? where rid=?";
		int i = baseUpdate(sql, reader.getRname(),reader.getGender(),reader.getVocation(),reader.getBirthday(),reader.getPapertype(),reader.getPaperno(),reader.getTel(),reader.getEmail(),reader.getRid());
		if(i>0){
			return true;
		}else{
			return false;
		}
	}

	
	/**
	 * 读者借阅检查实体
	 * @return list
	 * @author Bernard
	 */
	@Override
	public List<R4Borrow> getReaderInfo4Borrow(int rid) {
		//定义SQL
		String sql = "SELECT r.rid, r.rname, r.gender, r.papertype, r.paperno, t.rtypename, t.count" +
				" FROM tb_reader r, tb_readertype t" +
				" WHERE r.rtypeid = t.rtypeid AND r.rid = ?";

		//返回查询结果集
		return baseQuery(R4Borrow.class, sql, rid);
	}

}
