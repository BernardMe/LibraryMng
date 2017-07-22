package com.lbg.library.dao.imp;


import com.lbg.library.util.DBUtil;
import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 基本DAO
 * 2017/6/15.
 */
public abstract class BaseDaoImp {

    /**
     * 泛型方法
     * 第一个<T>声明这是一个泛型方法
     * @param cls
     * @param sql
     * @param paras
     * @param <T>
     * @return
     */
    <T> List<T> baseQuery(Class<T> cls, String sql, Object... paras) {
        List<T> list = new ArrayList<>();

        //获取数据库连接
        Connection conn = DBUtil.getConn();
        //获取prest
        PreparedStatement prest = DBUtil.getPrepStatement(conn, sql);
        //绑定参数
        DBUtil.bindParam(prest, paras);
        //ResultSet
        ResultSet rs = null;

        try {
            rs = prest.executeQuery();
            //获取ResultSet元数据
            ResultSetMetaData metaData = rs.getMetaData();
            while(rs.next()){
                // 通过反射创建实体对象
                T bean = cls.newInstance();

                for(int i=1; i<=metaData.getColumnCount(); i++){
                    //System.out.println("set"+md.getColumnLabel(i).substring(0,1).toUpperCase()
                         //  +md.getColumnLabel(i).substring(1));
                    //使用jar包commons-beanutils中的BeanUtil给bean设置属性值
                    BeanUtils.setProperty(bean, metaData.getColumnName(i).toLowerCase(), rs.getObject(i));
                }
                //将bean加入list
                list.add(bean);
            }
        } catch (SQLException | IllegalAccessException | InstantiationException | InvocationTargetException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeRes(conn, prest, null);
        }

        return list;
    }

    int baseUpdate(String sql, Object... paras) {
        //获取数据库连接
        Connection conn = DBUtil.getConn();
        //获取prest
        PreparedStatement prest = DBUtil.getPrepStatement(conn, sql);
        //绑定参数
        DBUtil.bindParam(prest, paras);
        //rowCount
        int rowCount = 0;

        try{
            //执行更新操作
            rowCount = prest.executeUpdate();
            if(rowCount>0){
                System.out.println("-------->Success");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeRes(conn, prest, null);
        }
        return rowCount>0 ? rowCount : 0;
    }

    /**
     * 查询记录数
     * @param sql
     * @param paras
     * @return
     */
    int queryCount(String sql, Object... paras) {
        //获取数据库连接
        Connection conn = DBUtil.getConn();
        //获取prest
        PreparedStatement prest = DBUtil.getPrepStatement(conn, sql);
        //绑定参数
        DBUtil.bindParam(prest, paras);
        //ResultSet
        ResultSet rs = null;

        try {
            rs = prest.executeQuery();
            if (rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeRes(conn, prest, rs);
        }
        return 0;
    }
}
