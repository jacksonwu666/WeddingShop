<%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%--头部--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header-area">
    <!-- main header start -->
    <div class="main-header d-none d-lg-block">
        <!-- header top start -->
        <div class="header-top bdr-bottom"style="background-color: whitesmoke">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-9">
                        <div class="welcome-message">
                            <c:if test="${sessionScope.user == null}">
                                <a href="login.jsp">登录</a>
                                <a >/</a>
                                <a href="register.jsp">注册</a>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                                <li >欢迎&nbsp;&nbsp;<a style="color: red">${user.username}&nbsp;</a>&nbsp;<a href="${pageContext.request.contextPath}/user?method=logout">&nbsp;&nbsp;登出</a></li>
                            </c:if>

                        </div>

                    </div>
                    <div class="col-lg-1">
                        <div class="welcome-message"style="margin-left: 10px">
                            <a href="message.jsp">平台规则</a>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="welcome-message"style="margin-left: 10px">
                            <a >客服:400-159-1004</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--    header top end-->

        <!-- header middle area start -->
        <div class="header-main-area sticky">
            <div class="container">
                <div class="row align-items-center position-relative">

                    <!-- start logo area -->
                    <div class="col-lg-3">
                        <div class="logo">
                            <a href="${pageContext.request.contextPath}/product?method=index">
                                <img src="${pageContext.request.contextPath}/img/logo/logo.png" style="width: 300px;height: 100px"alt="">
                            </a>
                        </div>
                    </div>
                    <!-- start logo area -->

                    <!-- main menu area start -->
                    <div class="col-lg-9 position-static">
                        <div class="main-menu-area">
                            <div class="main-menu">
                                <!-- main menu navbar start -->
                                <nav class="desktop-menu">
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/product?method=index">首页</a></li>
                                        <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid">婚品商城</a></li>
                                        <li><a href="${pageContext.request.contextPath}/vedio.jsp">婚礼·视频</a></li>
                                        <li><a href="${pageContext.request.contextPath}/weddingphotp.jsp">婚礼美图</a></li>
                                        <li><a href="https://www.hunliji.com/bai_ke">结婚攻略</a></li>
                                        <li><a href="${pageContext.request.contextPath}/cart.jsp">购物车</a></li>
                                        <li><a href="${pageContext.request.contextPath}/order?method=viewMyOrders">我的订单</a></li>
                                    </ul>
                                </nav>
                                <!-- main menu navbar end -->
                            </div>
                        </div>
                    </div>
                    <!-- main menu area end -->


                </div>
            </div>
        </div>
    </div>
</header>