<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<head>
    <title>侣行婚礼后台管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/title.ico" type="image/x-icon" />
    <!-- All Vendor & plugins CSS include -->
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <!-- Main Style CSS -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary" style="background-image: url(/img/backgroundwhite.png)" >
<!-- 顶部logo -->
<div class="container">
    <a href="${pageContext.request.contextPath}/product?method=index">
        <img src="${pageContext.request.contextPath}/img/logo/logo.png" style="width: 300px;height: 100px;margin-bottom: 30px;margin-top: 10px">
    </a>
</div>

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
                                    <h1 class="h4 text-gray-900 mb-4">欢迎登录后台管理系统!</h1>
                                </div>
                                <form class="user" method="post"  id="login-form" action="${pageContext.request.contextPath}/admin?method=login">

                                    <div class="form-group">
                                        <div >
                                            <input type="text" class="form-control form-control-user" id="username"
                                                   name="adminName" placeholder="请输入管理员账号" >
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" id="password" name="adminPwd" placeholder="请输入密码">
                                    </div>
                                    <c:if test="${msg!=null}">
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <span style="color:red">${msg}</span>
                                            </div>
                                        </div>
                                    </c:if>
                                    <font color="red"></font>
                                    <input type="submit" class="btn btn-primary btn-user btn-block" id="login-submit" value="登录" >
                                </form>
                                <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


</body>

</html>
