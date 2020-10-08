<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>婚品商城</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/title.ico" type="image/x-icon" />

    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/title.ico" type="image/x-icon" />

    <!-- Google fonts include -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,900%7CYesteryear" rel="stylesheet">

    <!-- All Vendor & plugins CSS include -->
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <!-- Main Style CSS -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carts.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/friendlink.css"type="text/css" />

</head>



<body>

<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>
    <!-- main wrapper start -->
    <main>
        <!-- breadcrumb area start -->
        <div class="breadcrumb-area common-bg">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb-wrap">
                            <nav aria-label="breadcrumb">
                                <h1>商品详情</h1>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/product?method=index"><i class="fa fa-home"></i></a></li>
                                    <li class="breadcrumb-item active" aria-current="page">严选好物</li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb area end -->

        <!-- page main wrapper start -->
        <div class="shop-main-wrapper section-space">
            <div class="container">
                <div class="row">
                    <!-- product details wrapper start -->
                    <div class="col-lg-12 order-1 order-lg-2">
                        <!-- product details inner end -->
                        <div class="product-details-inner">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="product-large-slider">
                                        <div class="pro-large-img img-zoom">
                                            <img src="${pageContext.request.contextPath}/${product.pimage}" alt="product-details" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="product-details-des">
                                        <h3 class="product-name">${product.pname}</h3>
                                        <div class="ratings d-flex">
                                            <span><i class="lnr lnr-star"></i></span>
                                            <span><i class="lnr lnr-star"></i></span>
                                            <span><i class="lnr lnr-star"></i></span>
                                            <span><i class="lnr lnr-star"></i></span>
                                            <span><i class="lnr lnr-star"></i></span>
                                            <div class="pro-review">
                                                <span>99+ 条评论</span>
                                            </div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price-regular"style="color: red;font-size: 25px">￥${product.shop_price}</span>
                                            <span class="price-old"><del>￥${product.market_price}</del></span>
                                        </div>
                                        <h5 class="offer-text"><strong>限时抢购</strong>! 还剩:</h5>
                                        <div class="product-countdown" data-countdown="2020/10/5"></div>
                                        <div class="availability">
                                            <i class="fa fa-check-circle"></i>
                                            <span>库存：999+</span>
                                        </div>
                                        <p class="pro-desc">${product.pdesc}</p>
                                        <div class="quantity-cart-box d-flex align-items-center">
                                            <h5>购买数量:</h5>
                                            <div class="quantity" >
                                                <div class="pro-qty" ><input id="quantity" type="text" value="1"name="quantity" maxlength="4" size="10"></div>
                                            </div>
                                        </div>
                                        <c:if test="${cid ==1 } ">
                                            <div class="pro-size">
                                                <h5>尺寸:</h5>
                                                <select class="nice-select">
                                                    <option>S</option>
                                                    <option>M</option>
                                                    <option>L</option>
                                                    <option>XL</option>
                                                </select>
                                            </div>
                                            <div class="color-option">
                                                <h5>颜色:</h5>
                                                <ul class="color-categories">
                                                    <li>
                                                        <a class="c-lightblue" href="#" title="LightSteelblue"></a>
                                                    </li>
                                                    <li>
                                                        <a class="c-darktan" href="#" title="Darktan"></a>
                                                    </li>
                                                    <li>
                                                        <a class="c-grey" href="#" title="Grey"></a>
                                                    </li>
                                                    <li>
                                                        <a class="c-brown" href="#" title="Brown"></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:if>

                                        <div class="action_link">
                                            <a  href="javascript:void(0)" >
                                                <input class="btn btn-cart2" value="加入购物车" type="button" onclick="addCart()">
                                            </a>
                                        </div>
                                        <div class="useful-links">
                                        </div>
                                        <div class="like-icon">
                                            <a  href="#"><i class="fa fa-facebook"></i></a>
                                            <a  href="#"><i class="fa fa-twitter"></i></a>
                                            <a  href="#"><i class="fa fa-pinterest"></i></a>
                                            <a  href="#"><i class="fa fa-google-plus"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- product details inner end -->

                        <!-- product details reviews start -->
                        <div class="product-details-reviews section-space pb-0">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="product-review-info">
                                        <ul class="nav review-tab">
                                            <li>
                                                <a class="active" data-toggle="tab" href="#tab_one">商家描述</a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#tab_two">图文详情</a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#tab_three">评论</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content reviews-tab">
                                            <div class="tab-pane fade show active" id="tab_one">
                                                <div class="tab-one">
                                                    <p style="font-size: 20px;"> 特别说明:请提供身高体重供客服参考</p>
                                                    <img src="/img/des.jpg" style="width: 450px;height: 800px">
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="tab_two">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>颜色</td>
                                                            <td>经典简约款,奢华大裙摆款，奢华大裙摆款</td>
                                                        </tr>
                                                        <tr>
                                                            <td>尺寸</td>
                                                            <td>L, M, S,XL,XXXL</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="tab_three">
                                                <form action="#" class="review-form">
                                                    <h5><span>所有评论</span></h5>
                                                    <div class="total-reviews">
                                                        <div class="rev-avatar">
                                                            <img src="img/about/avatar.jpg" alt="">
                                                        </div>
                                                        <div class="review-box">
                                                            <div class="ratings">
                                                                <span class="good"><i class="fa fa-star"></i></span>
                                                                <span class="good"><i class="fa fa-star"></i></span>
                                                                <span class="good"><i class="fa fa-star"></i></span>
                                                                <span class="good"><i class="fa fa-star"></i></span>
                                                                <span><i class="fa fa-star"></i></span>
                                                            </div>
                                                            <div class="post-author">
                                                                <p><span>一条小团团 -</span> 2020年10月4号</p>
                                                            </div>
                                                            <p>衣服真的好看，今天我和老公订婚啦！婚礼上就穿这套，漂亮出嫁，嘻嘻！</p>
                                                        </div>
                                                    </div>

                                                </form> <!-- end of review-form -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- product details reviews end -->
                    </div>
                    <!-- product details wrapper end -->
                </div>
            </div>
        </div>
        <!-- page main wrapper end -->

    </main>
    <!-- main wrapper end -->
    <script src="${pageContext.request.contextPath}/js/vendor.js"></script>
    <script src="${pageContext.request.contextPath}/js/active.js"></script>
    <!-- 友情链接 -->
    <!-- 引入footer.jsp -->
    <jsp:include page="/footer.jsp"></jsp:include>
</body>
<script>

    function addCart() {
        var buyNum = $("#quantity").val();
        window.location.href="${pageContext.request.contextPath}/cart?method=addCart&pid=${product.pid}&buyNum="+buyNum;
    }

</script>
</html>
