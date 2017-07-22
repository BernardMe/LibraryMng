package com.lbg.library.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 字符集过滤器
 * 2017/7/15.
 */
public class CharsetFilter implements Filter {

    String charset;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        charset = filterConfig.getInitParameter("charset");
        System.out.println("CharsetFilter.init ===>>>初始化字符集过滤器-"+charset);
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse rsp, FilterChain filterChain) throws IOException, ServletException {
        req.setCharacterEncoding(charset);
        //获取请求方法
        String method = ((HttpServletRequest)req).getMethod();
        System.out.println("CharsetFilter.doFilter 请求方式====" + method);

        //TODO 如果是GET请求--Tomcat8.0 URI编码使用UTF-8
        /*if ("GET".equals(method)){
            req = new HttpServletRequestWrapper((HttpServletRequest) req) {
                @Override
                public String getParameter(String name) {
                    String para = super.getParameter(name);
                    if (null != para && para.length()>0){
                        try {
                            return new String(para.getBytes("iso-8859-1"), charset);
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                    }
                    //如果传入para为空，调用父类实现
                    return super.getParameter(name);
                }
            };
        }*/
        rsp.setCharacterEncoding(charset);
        //放行
        filterChain.doFilter(req, rsp);
    }

    @Override
    public void destroy() {
        System.out.println("CharsetFilter.destroy");
    }
}
