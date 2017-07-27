package com.lbg.library.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录过滤器
 * on 2017/7/13.
 */
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("PrivilegeFilter.init  ---> 登录过滤器初始化");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //检查session中是否有用户信息
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse rsp = (HttpServletResponse) servletResponse;

        String uri = req.getRequestURI();
        Object user = req.getSession().getAttribute("user");
        System.out.println("LoginFilter.doFilter  ======>>>" + uri);

        // 分情况判断
        if (uri.contains("login.jsp") || uri.contains("login.action") || uri.contains("checkcode.action")){ //登录请求
            //直接放行
            filterChain.doFilter(req, rsp);
        } else { //非登录请求
            if (null == user) {
                System.out.println("LoginFilter.doFilter(发现没有登录)");
                //带上Error信息转发到登录页
                req.getSession().setAttribute("error", "请先登录再继续访问");
                rsp.sendRedirect("login.jsp");
                return;
            } else {
                //放行
                filterChain.doFilter(req, rsp);
            }
        }
    }

    @Override
    public void destroy() {
        System.out.println("LoginFilter.destroy---> 销毁登录过滤器");
    }
}
