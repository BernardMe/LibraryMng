package com.lbg.library.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 基础路径监听器
 * 2017/7/13.
 */
public class BasePathListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        //生成一个BasePath
        //http://192.168.2.xxx:808x/LibraryMng
        String basePath = sce.getServletContext().getContextPath() + "/";
        System.out.println("BasePathListener.contextInitialized  生成一个basePath--->"+basePath);
        sce.getServletContext().setAttribute("basePath", basePath);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
