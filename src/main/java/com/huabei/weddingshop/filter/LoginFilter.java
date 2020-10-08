package com.huabei.weddingshop.filter;

import com.huabei.weddingshop.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//登录过滤器
@WebFilter(filterName = "f2" , urlPatterns = "/order/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        //获取会话对象
        HttpSession session = request.getSession();
        //从会话中获取登录者的信息
        User user = (User)session.getAttribute("user");
        //若user为null，则直接跳转至登录界面
        if(user==null){
            response.sendRedirect("login.jsp");
            return;
        }

        //若user不为null，则直接将过滤链传递下去
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
