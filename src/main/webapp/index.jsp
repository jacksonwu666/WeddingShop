<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html>--%>
<html >

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>婚礼策划_结婚拍婚纱照_婚纱摄影_一站式结婚服务网站 - 侣行婚礼</title>

    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/title.ico" type="image/x-icon" />

    <!-- Google fonts include -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,900%7CYesteryear" rel="stylesheet">

    <!-- All Vendor & plugins CSS include -->
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <!-- Main Style CSS -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"type="text/css" />
    <link href="${pageContext.request.contextPath}/css/vendor/bootstrap.min.css" rel="stylesheet"type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carts.css"type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/friendlink.css"type="text/css" />


</head>
<style>

    /* wedding photo 字体样式  */
    .infohead{ margin:45px 0 0 0; color:#737373; font-family:"Times New Roman", Times, serif;}
    .infotitle{ text-align:center; font-size:36px;}
    .infotitle a{color:#737373;font-size:36px;}
    .infotitle a:hover{color:#ff4e7e;}
    .infomore{ margin:15px 0 0 0;}
    .infomore a{ margin:0 auto;display:block;width:226px; height:50px;border:#ff4d7d 1px solid;color:#fff;  text-align:center; line-height:50px; font-family:Verdana, Geneva, sans-serif; font-size:14px;background:#ff4d7d;}
    .infomore a:hover{ }
    .infotitle2{ text-align:center;font-size:14px; color:#737373; margin:20px 0 0 0;font-size:14px;font-family:microsoft yahei, 微软雅黑, Arial, Helvetica, sans-serif;font-weight:bold;}
    .infotitle2 a{ font-size:14px;font-family:microsoft yahei, 微软雅黑, Arial, Helvetica, sans-serif;color:#737373; font-weight:bold;}
    .infotitle2 a:hover{color:#ff4e7e;}


</style>
<body>

    <!-- Start Header Area -->
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
                                <a href="${pageContext.request.contextPath}/admin/adminlogin.jsp">后台管理</a>
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
                                    <img src="${pageContext.request.contextPath}/img/logo/logo.png "style="width: 300px;height: 100px" alt="">
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
                                            <li><a href="vedio.jsp">婚礼·视频</a></li>
                                            <li><a href="weddingphotp.jsp">婚礼美图</a></li>
                                            <li><a href="https://www.hunliji.com/bai_ke">结婚攻略</a></li>
                                            <li><a href="${pageContext.request.contextPath}/cart.jsp">购物车</a></li>
                                            <li><a href="${pageContext.request.contextPath}/order?method=viewMyOrders">我的订单</a></li>
                                            <li><a href="message.jsp">平台规则</a></li>
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
            <!-- header middle area end -->

    <!-- main wrapper start -->
    <main>
        <!-- 轮播图  -->
        <!-- slider area start 第一张  -->
        <section class="slider-area ">
            <div class="hero-slider-active slick-arrow-style slick-arrow-style_hero slick-dot-style ">
                <!-- single slider item start -->
                <div class="hero-single-slide">
                    <div class="hero-slider-item bg-img" data-bg="${pageContext.request.contextPath}/img/slider/lunbotu7.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="hero-slider-content slide-1">
                                        <span>LvxingHuili</span>
                                        <h1>万像</h1>
                                        <h2>& 一屏</h2>
                                        <a href="weddingphotp.jsp" class="btn-hero">更多详情</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- single slider item end -->


                <!-- single slider item start  第2张  " -->
                <div class="hero-single-slide ">
                    <div class="hero-slider-item bg-img " data-bg="${pageContext.request.contextPath}/img/slider/lunbotu02.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="hero-slider-content slide-2">
                                        <span>LvxingHuili</span>
                                        <h1>浪漫</h1>
                                        <h2>& 巴厘岛</h2>
                                        <a href="weddingphotp.jsp" class="btn-hero">更多详情</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- single slider item start  第3张 -->
                <div class="hero-single-slide ">
                    <div class="hero-slider-item bg-img " data-bg="${pageContext.request.contextPath}/img/slider/lunbotu03.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="hero-slider-content slide-2">
                                        <span>LvxingHuili</span>
                                        <h1>人气</h1>
                                        <h2>& 丽江</h2>
                                        <a href="weddingphotp.jsp" class="btn-hero">更多详情</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- single slider item start 第4张 -->
                <div class="hero-single-slide ">
                    <div class="hero-slider-item bg-img " data-bg="${pageContext.request.contextPath}/img/slider/lunbotu04.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="hero-slider-content slide-2">
                                        <span>LvxingHuili</span>
                                        <h1>大理</h1>
                                        <h2>& 天谷</h2>
                                        <a href="weddingphotp.jsp" class="btn-hero">更多详情</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- slider area end -->

        <!-- banner statistics start -->
        <section class="banner-statistics section-space" style="margin-top: -450px">
            <div class="container">
                <div class="row mbn-30">
                    <!-- start store item -->
                    <div class="col-md-4">
                        <div class="banner-item mb-30">
                            <figure class="banner-thumb">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/img/banner/img1-top-floda1.jpg" alt="">
                                </a>
                                <figcaption class="banner-content text-center">
                                    <h2 class="text1">superrise price</h2>
                                    <h2 class="text2">马卡龙气球</h2>
                                    <a class="store-link" href="#"></a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                    <!-- start store item -->

                    <!-- start store item -->
                    <div class="col-md-4">
                        <div class="banner-item mb-30">
                            <figure class="banner-thumb">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/img/banner/img1-top-floda2.jpg" alt="">
                                </a>
                                <figcaption class="banner-content text-center">
                                    <h2 class="text1">Chinese style</h2>
                                    <h2 class="text2">新娘秀禾服头饰</h2>
                                    <a class="store-link" href="#"></a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                    <!-- start store item -->

                    <!-- start store item -->
                    <div class="col-md-4">
                        <div class="banner-item mb-30">
                            <figure class="banner-thumb">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/img/banner/img1-top-floda3.jpg" alt="">
                                </a>
                                <figcaption class="banner-content">
                                    <h2 class="text1">Western-style</h2>
                                    <h2 class="text2">西服定制</h2>
                                    <a class="store-link" href="#"></a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                    <!-- start store item -->
                </div>
            </div>
        </section>
        <!-- banner statistics end -->

        <!-- service policy start -->
        <section class="service-policy-area section-space p-0">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <!-- start policy single item -->
                        <div class="service-policy-item">
                            <div class="icons">
                                <img src="${pageContext.request.contextPath}/img/icon/free_shipping.png" alt="">
                            </div>
                            <div class="policy-terms">
                                <h5>免费送货</h5>
                                <p>免费送货所有订单</p>
                            </div>
                        </div>
                        <!-- end policy single item -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <!-- start policy single item -->
                        <div class="service-policy-item">
                            <div class="icons">
                                <img src="${pageContext.request.contextPath}/img/icon/support247.png" alt="">
                            </div>
                            <div class="policy-terms">
                                <h5>支持24/7</h5>
                                <p>每天24小时支持</p>
                            </div>
                        </div>
                        <!-- end policy single item -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <!-- start policy single item -->
                        <div class="service-policy-item">
                            <div class="icons">
                                <img src="${pageContext.request.contextPath}/img/icon/money_back.png" alt="">
                            </div>
                            <div class="policy-terms">
                                <h5>退款</h5>
                                <p>7天无理由退货</p>
                            </div>
                        </div>
                        <!-- end policy single item -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <!-- start policy single item -->
                        <div class="service-policy-item">
                            <div class="icons">
                                <img src="${pageContext.request.contextPath}/img/icon/promotions.png" alt="">
                            </div>
                            <div class="policy-terms">
                                <h5>订单折扣</h5>
                                <p>订单满99￥折扣优惠</p>
                            </div>
                        </div>
                        <!-- end policy single item -->
                    </div>
                </div>
            </div>
        </section>
        <!-- service policy end -->

        <!-- 商品展示 -->
        <section class="our-product section-space">
            <div class="container">
                <div class="row">
                    <div class="col-12 infohead">
                        <div class="section-title text-center">
                            <div class="infotitle"><a href="#" >热门商品</a></div>
                            <div class="infotitle2">－ <a href="#">爱 是一种陪伴</a> －</div>
                            <p class="infotitle2"></p>
                        </div>
                    </div>
                </div>
                <div class="row mtn-40">
                    <!-- product single item start -->
                    <c:forEach items="${productsHot}" var="product">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product-item mt-40">
                            <figure class="product-thumb">
                                <a href="${pageContext.request.contextPath}/product?method=viewProductById&pid=${product.pid}">
                                    <img class="pri-img" src="${pageContext.request.contextPath}/${product.pimage}" alt="product">
                                    <img class="sec-img" src="${pageContext.request.contextPath}/${product.pimage}" alt="product">
                                </a>


                                <div class="product-badge">
                                    <div class="product-label new">
                                        <span>hot</span>
                                    </div>
                                    <div class="product-label discount">
                                        <span></span>
                                    </div>
                                </div>

                            </figure>
                            <div class="product-caption">
                                <p class="product-name">
                                    <a href="${pageContext.request.contextPath}/product?method=viewProductById&pid=${product.pid}">${product.pname}</a>
                                </p>
                                <div class="price-box">
                                    <span class="price-regular">￥${product.shop_price}</span>
                                    <span class="price-old"><del>￥${product.market_price}</del></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    </c:forEach>
                    <!-- product single item end -->


                    <div class="col-12">
                        <div class="view-more-btn">
                            <a class="btn-hero btn-load-more" href="${pageContext.request.contextPath}/product?method=viewProductListByCid">查看更多商品</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- our product area end -->

        <!-- banner statistics start -->
        <section class="banner-statistics-right">
            <div class="container">
                <div class="row">
                    <!-- start banner item start -->
                    <div class="col-md-6">
                        <div class="banner-item ">
                            <figure class="banner-thumb">
                                <a href="#">
                                    <img src="img/banner/banner-1.jpg" alt="">
                                </a>

                            </figure>
                        </div>
                    </div>
                    <!-- start banner item end -->

                    <!-- start banner item start -->
                    <div class="col-md-6">
                        <div class="banner-item ">
                            <figure class="banner-thumb">
                                <a href="#">
                                    <img src="img/banner/banner-2.jpg" alt="">
                                </a>

                            </figure>
                        </div>
                    </div>
                    <!-- start banner item end -->
                </div>
            </div>
        </section>
        <!-- banner statistics end -->

            </div>

            <!-- wedding photo 开始部分 -->
            <div class="container">

                <!-- 文字部分 -->

                <div class="infohead">
                    <div class="infotitle"><a href="weddingphotp.jsp" >Wedding Photo</a></div>
                    <div class="infomore"><a href="weddingphotp.jsp" >SEE MORE</a></div>
                    <div class="infotitle2">－ <a href="#">主题婚礼</a> －</div>
                </div>

                <!-- 图片部分 -->
                <div class="row" style="margin-top: 20px">

                    <!-- 上侧图 -->
                    <div class="col-md-4 hidden-sm hidden-xs" style="height: 480px;">
                        <img src="img/weddingphoto/weddingphoto03.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>莫奈的法式花园</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">Lomo岚茉婚礼</p>
                        </div>
                    </div>
                    <div class="col-md-4 hidden-sm hidden-xs" style="height: 480px">
                        <img src="img/weddingphoto/weddingphoto04.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>长桌婚礼布置</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">AILAND艾兰婚礼</p>
                        </div>

                    </div>
                    <div class="col-md-4 hidden-sm hidden-xs" style="height: 480px">
                        <img src="img/weddingphoto/weddingphoto06.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>湖光点翠-晚宴篇</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">叙世者</p>
                        </div>

                    </div>
                </div>

                <!-- 下侧图 第一行-->
                <div  class="row" style="margin-top: 20px">
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top: 70px">
                        <img src="img/weddingphoto/weddingphoto01.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>Orange sanguine</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">三亚汇爱婚礼</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height:400px;margin-top: 70px">
                        <img src="img/weddingphoto/weddingphoto02.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>颐雲生花-宴会篇</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">AILAND艾兰婚礼</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top:70px">
                        <img src="img/weddingphoto/weddingphoto07.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>【觅园】Mi.Garden</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">赖梓愈Caleb RAI</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top:70px">
                        <img src="img/weddingphoto/weddingphoto08.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>熏香</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">石鹏</p>
                        </div>
                    </div>
                </div>
                <!-- 下侧图 第二行-->
                <div  class="row" style="margin-top: 20px">
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top: 70px">
                        <img src="img/weddingphoto/weddingphoto14.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>Better Together</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">CHOCO-启蔻婚礼 (成都)</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top: 70px">
                        <img src="img/weddingphoto/weddingphoto15.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>求婚</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">伯妮婚礼策划机构</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top:70px">
                        <img src="img/weddingphoto/weddingphoto16.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>lovely spark</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">伯妮婚礼策划机构</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top:70px">
                        <img src="img/weddingphoto/weddingphoto17.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>Special Gift</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">CHOCO-启蔻婚礼（北京）</p>
                        </div>
                    </div>
                </div>



                <!-- 下侧图 第三行-->
                <div  class="row" style="margin-top: 20px">
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top:70px">
                        <img src="img/weddingphoto/weddingphoto18.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>Dear Daisy</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">Wonderful Days婚礼定制</p>
                        </div>
                    </div>

                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top: 70px">
                        <img src="img/weddingphoto/weddingphoto19.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>润熙宝宝宴</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">曼可瑞尔</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top: 70px">
                        <img src="img/weddingphoto/weddingphoto20.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>The brightest star</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">小井婚礼</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top:70px">
                        <img src="img/weddingphoto/weddingphoto21.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>MUSIC WITH HEART | 心随乐动</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">HANA高级婚礼定制</p>
                        </div>
                    </div>
                </div>


                <!-- 下侧图 第四行-->
                <div  class="row" style="margin-top: 20px">
                    <div class="col-md-3 hidden-sm hidden-xs" style="height:400px;margin-top: 70px">
                        <img src="img/weddingphoto/weddingphoto10.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>BLOOM IN SUNSANNI</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">Kennywind</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top:70px">
                        <img src="img/weddingphoto/weddingphoto11.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>你的美好</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">Dane 邵单骑</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top: 70px">
                        <img src="img/weddingphoto/weddingphoto12.png" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>The Ally</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">YeYe</p>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" style="height: 400px;margin-top:70px">
                        <img src="img/weddingphoto/weddingphoto13.jpg" height="100%" />
                        <div style="margin-top: 20px">
                            <a href="#" style="text-align: center;font-size: 14px"><p>上海老租界区的洋房马路</p></a>
                            <p style="font-size: 5px;text-align: center;color: grey">Liverpool陈</p>
                        </div>
                    </div>
                </div>

            </div>



        </section>
        <!-- wedding photo area end-->
    </main>

    <!-- 友情链接 -->
        <!-- 引入footer.jsp -->
        <jsp:include page="/footer.jsp"></jsp:include>

    <!-- 直达顶部 -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>
        <!-- 引入js文件 -->
    <script src="${pageContext.request.contextPath}/js/vendor.js"></script>
    <script src="${pageContext.request.contextPath}/js/active.js"></script>
</body>

</html>
