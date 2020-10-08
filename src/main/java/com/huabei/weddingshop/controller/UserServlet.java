package com.huabei.weddingshop.controller;


import com.huabei.weddingshop.entity.User;
import com.huabei.weddingshop.service.UserService;
import com.huabei.weddingshop.utils.CommonUtils;
import com.huabei.weddingshop.utils.MD5Utils;
import com.huabei.weddingshop.utils.MailUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@WebServlet(urlPatterns = "/user")
public class UserServlet extends BaseServlet {

    private UserService service = new UserService();

    //注册
    public void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获得页面表单中的数据
        Map<String, String[]> map = request.getParameterMap();

        //封装User对象
        User user = new User();

        //时间转换器：将String-->Date
        ConvertUtils.register(new Converter() {
            @Override
            public Object convert(Class type, Object o) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date date = null;
                try {
                    date = sdf.parse(o.toString());
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                return date;
            }
        }, Date.class);

        try {
            //给user对象依次赋值属性
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //uid 用户编号
        String uid = CommonUtils.getUUID().replaceAll("-","");
        user.setUid(uid);

        //code  激活码
        String code  = CommonUtils.getUUID().replaceAll("-","");
        user.setCode(code);

        //将密码加密存储
        user.setPassword(MD5Utils.md5(user.getPassword()));

        //执行service中的注册逻辑
        boolean flag = service.regist(user);
        if(flag){
            //注册成功，跳转到registSuccess.jsp
            //发送邮件（包含激活码）
            String emailMsg = "恭喜您注册成功，请点击激活" +
                    "<a style='color:red' href='http://localhost:8080/user?method=active&code="+code+"'>"+code+"</a>";
            try {
                MailUtils.sendMail(user.getEmail(),"邮件激活",emailMsg);
            } catch (MessagingException e) {
                e.printStackTrace();
            }

            request.getRequestDispatcher("registSuccess.jsp").forward(request,response);
        }else{
            //注册失败，跳转到registFail.jsp
            request.getRequestDispatcher("registFail.jsp").forward(request,response);
        }

    }


    //账户激活
    public void active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //根据激活码code，修改状态state
        String code = request.getParameter("code");

        //调用service进行修改状态
        boolean flag = service.active(code);
        if(flag){
            //激活成功
            response.sendRedirect("index.jsp");
        }else{
            //激活失败
            response.sendRedirect("error.jsp");
        }
    }

    //校验用户名是否存在
    public void validateName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        boolean flag = service.validateName(username);

        String json = "{\"flag\":"+flag+"}";
        response.getWriter().write(json);
    }
    //登录
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String code = request.getParameter("code");
        //不是自动登录
        if(code==null){
            password = MD5Utils.md5(password);
        }

        User user = service.login(username, password);
        if(user!=null){
            //状态码为1，才可以登录
            if(user.getState()==1){

                //记住用户名
                String remember = request.getParameter("remember");
                //自动登录
                String free = request.getParameter("free");

                //记住用户名,若点击remember,则在Cookie中存储用户名
                if(remember!=null && remember.equals("remember")){
                    Cookie usernameCookie = new Cookie("remember", URLEncoder.encode(username,"UTF-8"));
                    usernameCookie.setMaxAge(7*24*60*60);
                    response.addCookie(usernameCookie);
                }
                //自动登录,若点击free，则再Cookie中存储用户名和密码
                else if(free!=null && free.equals("free")){
                    Cookie usernameCookie = new Cookie("username", URLEncoder.encode(username,"UTF-8"));
                    Cookie passwordCookie = new Cookie("password",password);
                    usernameCookie.setMaxAge(7*24*60*60);
                    passwordCookie.setMaxAge(7*24*60*60);
                    response.addCookie(usernameCookie);
                    response.addCookie(passwordCookie);
                }

                session.setAttribute("user",user);
                response.sendRedirect(request.getContextPath()+"/product?method=index");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }else{
                request.setAttribute("msg","当前账户未激活，请尽快前往邮箱激活");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        }else{
            request.setAttribute("msg","用户名与密码不匹配");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }

    }

    //登出
    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();

        Cookie usernameCookie = new Cookie("username","");
        Cookie passwordCookie = new Cookie("password","");

        usernameCookie.setMaxAge(0);
        passwordCookie.setMaxAge(0);

        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);

        response.sendRedirect(request.getContextPath()+"/product?method=index");
//        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
}


