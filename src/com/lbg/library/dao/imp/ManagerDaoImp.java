package com.lbg.library.dao.imp;

import com.lbg.library.dao.ManagerDao;
import com.lbg.library.entity.Manager;

import java.util.List;

/**
 * ClazzDao接口实现类
 * 2017/7/13.
 */
public class ManagerDaoImp extends BaseDaoImp implements ManagerDao {

    /**
     * 根据name查询是否已存在管理员List
     * @return
     */
    @Override
    public List<Manager> existByName(String uname) {
        //定义SQL
        String sql = "SELECT * FROM t_manager t WHERE mname=?";

        //返回查询结果集
        return baseQuery(Manager.class, sql, uname);
    }

    /**
     * 获取所有管理员实体类List
     * @return
     */
    @Override
    public List<Manager> query4Login(String uname, String upwd) {
        //定义SQL
        String sql = "SELECT * FROM t_manager t WHERE mname=? AND mpwd=?";

        //返回查询结果集
        return baseQuery(Manager.class, sql, uname, upwd);

    }

    /**
     * 添加管理员实体
     * @return
     */
    @Override
    public int addManager(Manager man) {
        //定义SQL
        String sql = "INSERT INTO t_manager VALUES (0, ?, ?)";

        //返回查询结果集
        return baseUpdate(sql, man.getMname(), man.getMpwd());
    }

}
