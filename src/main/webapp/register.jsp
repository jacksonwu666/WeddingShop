<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<!DOCTYPE html>--%>
<html >
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>会员注册</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/title.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/validate.js" type="text/javascript" charset="utf-8"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />





  <style>

      body {
          margin-top: 20px;
          margin: 0 auto;
      }

      .carousel-inner .item img {
          width: 100%;
          height: 300px;
      }

      font {
          color: #3164af;
          font-size: 18px;
          font-weight: normal;
          padding: 0 10px;
      }

      .error{
          color: red;
      }
      .d1 d2 {
          display:inline
      }

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
          background: white;
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
          color:black;
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

<body class="bg-gradient-primary">
<%-- 隐藏域：存储项目发布的路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" >

<div class="container">
    <a href="${pageContext.request.contextPath}/product?method=index">
        <img src="${pageContext.request.contextPath}/img/logo/logo.png" style="width: 300px;height: 100px;margin-bottom: 30px;margin-top: 10px">
    </a>
</div>

<div class="container d2">

  <div class="container" >
    <div class="row" >

      <div class="col-md-5" >
          <div class="d1" >
              <img src="img/register.jpg">
          </div>
      </div>


      <div class="col-md-7"
           style="background: #fff; ">
        <font style="color: pink;font-size: 20px;">欢迎加入侣行婚礼</font>


            <form class="form-horizontal" id="registForm" action="${pageContext.request.contextPath}/user?method=regist" method="post">
              <div class="form-group" >

                  <div class="col-sm-6">
<%--                    <label for="username" class="col-sm-2 control-label">昵称</label>--%>
                      <input type="text" class="form-control " id="username" name="username" placeholder="请输入昵称">
                  </div>

              </div>
              <div class="form-group">
                  <div class="col-sm-6">
<%--                    <label for="password" class="col-sm-2 control-label">密码</label>--%>
                      <input type="password" class="form-control " id="password" name="password" placeholder="请输入密码">
                  </div>

              </div>
              <div class="form-group">
                <div class="col-sm-6">
<%--                  <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>--%>
                  <input type="password" class="form-control " id="confirmpwd" name="confirmpwd" placeholder="请输入确认密码">
                </div>

              </div>
              <div class="form-group">
                <div class="col-sm-6">
<%--                  <label for="email" class="col-sm-2 control-label">邮箱</label>--%>
                  <input type="email" class="form-control " id="email" name="email" placeholder="请输入Email">
                </div>

              </div>
              <div class="form-group">
                <div class="col-sm-6">
<%--                  <label for="telephone" class="col-sm-2 control-label">电话</label>--%>
                  <input type="tel" class="form-control " id="telephone" name="telephone" placeholder="请输入电话">
                </div>

              </div>
              <div class="form-group">
                <div class="col-sm-6">
<%--                  <label for="address" class="col-sm-2 control-label">地址</label>--%>
                  <input type="text" class="form-control " id="address" name="address" placeholder="请输入地址">
                </div>

              </div>
              <div class="form-group">
                <div class="col-sm-6">
<%--                  <label for="name" class="col-sm-2 control-label">姓名</label>--%>
                  <input type="tel" class="form-control " id="name" name="name" placeholder="请输入真实姓名">
                </div>
              </div>
                <div class="form-group opt">
                    <%--                <label for="sex1" class="col-sm-2 control-label">性别</label>--%>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <input type="radio" id="sex1" name="sex" value="男">男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="sex2" name="sex" value="女">女
                        </label>
                    </div>
                    <label id="sex-error" class="error" for="sex1" style="display: none"></label>
                </div>
                <div class="form-group">
                <%--  <label for="birthday" class="col-sm-2 control-label">出生日期</label>--%>
                <div class="col-sm-6">
                    <input type="date" class="form-control" id="birthday" name="birthday">
                </div>
         <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10"><br>
                <input type="submit" width="100" value="注册"
                       style="background-color: #0c85d0; height: 35px; width: 100px; color: white;">

            </div>
         </div><br>
                  <div class="form-group">
                <div style="margin-top: 5px">
                  <a  href="login.jsp">已有账号? 登录!</a>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- 引入footer.jsp -->
    <jsp:include page="/footer.jsp"></jsp:include>


</body></html>