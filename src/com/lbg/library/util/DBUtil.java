package com.lbg.library.util;

import java.sql.*;

/**
 * 配置文件获取Conn
 *
 * 2017/6/14.
 */
public class DBUtil {

    //静态初始化块
    static {
        try {
            Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取数据库连接
     *
     * @return
     */
    public static Connection getConn() {
        //获取Conn对象
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("proxool.myPool");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * 获取预处理发送器
     *
     * @param conn
     * @param sql
     */
    public static PreparedStatement getPrepStatement(Connection conn, String sql) {
        PreparedStatement pst = null;
        try {
            pst = conn.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pst;
    }

    /**
     * 绑定参数
     * @param pst
     * @param para
     * @return
     */
    public static void bindParam(PreparedStatement pst, Object... para) {

        for(int i=0; i<para.length; i++) {
            try {
                pst.setObject(i+1, para[i]);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 统一关闭资源
     * @param conn
     * @param prest
     */
    public static void closeRes(Connection conn, PreparedStatement prest, ResultSet rs){
        //关闭资源
        try {
            if(rs!=null) rs.close();
            if(prest!=null) prest.close();
            if(conn!=null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
