<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%--<!DOCTYPE html>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>会员登录</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/title.ico" type="image/x-icon" />
  <!-- All Vendor & plugins CSS include -->
  <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
  <!-- Main Style CSS -->
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/friendlink.css" rel="stylesheet">

  <style>

      /*友情链接css*/

      * {
          margin: 0;
          padding: 0;
          font-family: '微软雅黑', Arial, Helvetica, sans-serif;
      }

      a {
          text-decoration: none;
      }

      img {
          border: none;
      }

      li {
          list-style: none;
      }

      body {
          font-size: 12px;
      }

      div {
          font-size: 12px;
      }

      span {
          font-size: 12px;
      }
      /*通用结束*/

      .footer {
          background: whitesmoke;
          /*position:absolute;
          left: 30px;
          bottom:5px;
          */

      }

      .footer .alt {
          overflow: hidden;
          padding: 20px 0;
          width: 1160px;
          margin: auto;
      }

      .footer .alt .foot {
          width: 138px;
          float: left;
      }

      .footer .alt .foot p {
          color: black;
          line-height: 40px;
      }

      .footer .alt .foot a {
          color: #999;
          display: block;
          line-height: 24px;
      }

      .footer .alt .foot a:hover {
          color: #CCC;
      }

      .footer .alt .foot img {
          padding-top: 20px;
      }

      .foot{
          margin: 20px;
      }
  </style>

</head>

<body class="bg-gradient-primary" style="background-image: url(img/backgroundwhite.png)" >
<!-- 顶部logo -->
<div class="container">
     <a href="${pageContext.request.contextPath}/product?method=index">
       <img src="${pageContext.request.contextPath}/img/logo/logo.png" style="width: 300px;height: 100px;margin-bottom: 30px;margin-top: 10px">
     </a>
</div>
<%! String remember = ""; %>
<%
  String username = null;
  String password = null;

  Cookie[] cookies = request.getCookies();
  if(cookies!=null){
    for (Cookie cookie : cookies) {
      if(cookie!=null){
        if(cookie.getName().equals("username")){
          username = URLDecoder.decode(cookie.getValue(),"UTF-8");
        }
        if(cookie.getName().equals("password")){
          password = cookie.getValue();
        }
        if(cookie.getName().equals("remember")){
          remember = URLDecoder.decode(cookie.getValue(),"UTF-8");
        }
      }
    }
  }

  if(username!=null && password!=null){
    //直接跳转至UserServlet中进行登录
    request.getRequestDispatcher(request.getContextPath()+"/user?method=login&code=free&username="+username+"&password="+password).forward(request,response);
  }


%>


  <div class="container" style="background-color:whitesmoke">

    <!-- Outer Row -->
    <div class="row justify-content-center" >

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">欢迎回来!</h1>
                  </div>
                  <form class="user" method="post"  id="login-form" action="${pageContext.request.contextPath}/user?method=login">

                    <div class="form-group">
                      <div >
                        <%
                          if(remember==null || remember.equals("")){
                        %>
                        <input type="text" class="form-control form-control-user"
                               id="username" name="username" placeholder="请输入用户名">
                        <%
                          }
                        %>

                        <%
                          if(remember!=null&&!remember.equals("")){
                        %>
                        <input type="text" class="form-control" id="username"
                               name="username" placeholder="请输入用户名" value="<%=remember%>">
                        <%
                          }
                        %>

                      </div>


                    </div>

                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="请输入密码">
                    </div>
                    <c:if test="${msg!=null}">
                      <div class="form-group">
                        <div class="col-sm-6">
                          <span style="color:red">${msg}</span>
                        </div>
                      </div>
                    </c:if>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <label>
                        <input type="checkbox" name="remember" value="remember">记住我
                        </label>
                      </div>
                    </div>
                    <font color="red"></font>
                     <input type="submit" class="btn btn-primary btn-user btn-block" id="login-submit" value="登录" >
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="register.jsp">注册账号</a>                  </div>
<%--                  <div class="text-center">--%>
<%--                    <a class="small" href="#">忘记密码</a>                  </div>--%>
<%--                </div>--%>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
        <!-- 友情链接 -->
        <!-- 引入footer.jsp -->
        <jsp:include page="/footer.jsp"></jsp:include>
  </div>

  </div>


</body>

</html>