<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>婚品商城</title>
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
    .categories li{
       float: left;
        margin: 22px;
        font-size: 18px;
    }

</style>

<body>


<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>


<!-- main wrapper start -->
    <main>
        <!-- breadcrumb area start -->
        <div class="breadcrumb-area common-bg" >
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb-wrap">
                            <nav aria-label="breadcrumb">
                                <h1>婚品商城</h1>
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
        <div class="sidebar-single container ">
            <div class="sidebar-body" >
                <ul class="shop-categories categories">
                    <li></li>
                    <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid">全部商品</a></li>
                    <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=1">新娘礼服</a></li>
                    <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=2">婚房布置</a></li>
                    <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=3">喜糖请柬</a></li>
                    <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=4">接亲婚宴 </a></li>
                    <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=5">新娘嫁妆 </a></li>
                    <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=6">新郎穿搭 </a></li>
                    <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=7">婚庆床品 </a></li>
                    <li><a href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=8">结婚酒水 </a></li>
                </ul>
            </div>
        </div>
        <!-- page main wrapper start -->
        <div class="shop-main-wrapper section-space pb-0">
            <div class="container">
                <div class="row">
                        </aside>
                    </div>
                    <!-- sidebar area end -->

                    <!-- shop main wrapper start -->
                    <div class="col-lg-9 order-1 order-lg-2 container">
                        <div class="shop-product-wrapper">
                            <!-- shop product top wrap start -->
                            <div class="shop-top-bar">
                                <div class="row align-items-center">
                                    <div class="col-lg-7 col-md-6 order-2 order-md-1">
                                        <div class="top-bar-left">
                                            <div class="product-view-mode">
                                                <a class="active" href="#" data-target="grid-view" data-toggle="tooltip" title="网格"><i class="fa fa-th"></i></a>
                                                <a href="#" data-target="list-view" data-toggle="tooltip" title="列表"><i class="fa fa-list"></i></a>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-6 order-1 order-md-2">
                                        <div class="top-bar-right">
                                          <c:if test="${vo!=null}">
                                            <div class="product-short">
                                                <div>  <input  type="text" class="form-control" id="searchName" placeholder="搜您想要的" name="pname" value="${vo.query}"></div>
                                                <div><input  style="margin: 10px;"type="button" class="btn btn-default" onclick="query()"  value="搜索"></div>
                                            </div>
                                              <script>
                                                  function query() {
                                                      window.location.href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=${cid}&pname="+$("#searchName").val();
                                                  }
                                              </script>
                                          </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- shop product top wrap start -->

                            <!-- product item list wrapper start -->
                            <div class="shop-product-wrap grid-view row mbn-40 ">
                                <!-- product single item start -->
                                <c:forEach items="${vo.list}" var="product">
                                <div class="col-md-4 col-sm-6 ">
                                    <!-- 商品网格 -->
                                    <div class="product-item">
                                        <figure class="product-thumb">
                                            <a href="${pageContext.request.contextPath}/product?method=viewProductById&pid=${product.pid}">
                                                <img class="pri-img" src="${pageContext.request.contextPath}/${product.pimage}" alt="product">
                                                <img class="sec-img" src="${pageContext.request.contextPath}/${product.pimage}" alt="product">
                                            </a>
                                        </figure>
                                        <div class="product-caption">
                                            <p class="product-name">
                                                <a href="href="${pageContext.request.contextPath}/product?method=viewProductById&pid=${product.pid}">
                                                ${product.pname}</a>
                                            </p>
                                            <div class="price-box">
                                                <span class="price-regular"style="color: red">￥${product.shop_price}</span>
                                                <span class="price-old"><del>￥${product.market_price}</del></span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 商品网格结束-->
                                    <!-- 商品列表 -->
                                    <div class="product-list-item">
                                        <figure class="product-thumb">
                                            <a href="${pageContext.request.contextPath}/product?method=viewProductById&pid=${product.pid}">
                                                <img class="pri-img" src="${pageContext.request.contextPath}/${product.pimage}" alt="product">
                                                <img class="sec-img" src="${pageContext.request.contextPath}/${product.pimage}" alt="product">
                                            </a>
                                        </figure>
                                        <div class="product-content-list">
                                            <h5 class="product-name"><a href="${pageContext.request.contextPath}/product?method=viewProductById&pid=${product.pid}"> ${product.pname}</a></h5>
                                            <div class="price-box">
                                                <span class="price-regular"style="color: red">￥${product.shop_price}</span>
                                                <span class="price-old"><del>￥${product.market_price}</del></span>
                                            </div>
                                            <p>
                                                    ${product.pdesc}
                                            </p>

                                        </div>
                                    </div>
                                    <!-- 商品列表结束 -->
                                </div>
                                </c:forEach>
                            </div>

                            <!--分页 -->
                            <%-- 当前商品列表没有数据，则显示图片 --%>
                            <c:if test="${vo.list.size()==0}">
                                <div style="width: 380px; margin: 50px auto;">
                                    <img src="img/cart-empty.png">
                                </div>
                            </c:if>
                            <!-- start pagination area -->
                            <%-- 当前商品列表有数据，则显示数据 --%>
                                <c:if test="${vo.list.size()!=0}">
                                <div class="paginatoin-area text-center">
                                    <ul class="pagination-box">
                                    <%-- 上一页 --%>
                                    <%-- 当前页码如果是第一页的话，则不可以再点击上一页 --%>
                                    <c:if test="${vo.pageNow == 1}">
                                        <li class="disabled">
                                        <a class="previous" href="javascript:void(0)"><i class="lnr lnr-chevron-left"></i></a>
                                        </li>
                                    </c:if>
                                    <%-- 当前页码如果不是第一页的话，则可以再点击上一页 --%>
                                    <c:if test="${vo.pageNow != 1}">
                                        <li>
                                            <a class="previous" href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=${cid}&pageNow=${vo.pageNow-1}&pname=${vo.query}"><i class="lnr lnr-chevron-left"></i></a>
                                        </li>
                                    </c:if>
                                    <%-- 根据实际的总页数，展示页码 --%>
                                    <c:forEach begin="1" end="${vo.myPages}" var="page">
                                        <%-- 若当前页pageNow正好是page，则显示被点击的状态 --%>
                                        <c:if test="${vo.pageNow==page}">
                                            <li class="active">
                                                <a href="javascript:void(0)">${page}</a>
                                            </li>
                                        </c:if>
                                        <%-- 若当前页pageNow不是当前page的值，则显示可以被点击 --%>
                                        <c:if test="${vo.pageNow!=page}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=${cid}&pageNow=${page}&pname=${vo.query}">${page}</a>
                                            </li>
                                        </c:if>

                                    </c:forEach>
                                    <%-- 下一页 --%>
                                    <%-- 当前页码已经是最后一页，则不可以再点击下一页 --%>
                                    <c:if test="${vo.pageNow == vo.myPages}">
                                        <li class="disabled">
                                           <a class="next" href="javascript:void(0)"><i class="lnr lnr-chevron-right"></i></a>
                                        </li>
                                    </c:if>
                                            <%-- 当前页码已经不是最后一页，则可以再点击下一页 --%>
                                        <c:if test="${vo.pageNow != vo.myPages}">
                                            <li>
                                                <a class="next" href="${pageContext.request.contextPath}/product?method=viewProductListByCid&cid=${cid}&pageNow=${vo.pageNow+1}&pname=${vo.query}"><i class="lnr lnr-chevron-right"></i></a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                                </c:if>
                            <!-- 分页结束 -->
                        </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>


    <!-- 主体框架 -->

<!-- 友情链接 -->
<!-- 引入footer.jsp -->
<jsp:include page="/footer.jsp"></jsp:include>

    <!-- 返回顶部 -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>

    <script src="js/vendor.js"></script>
    <!-- Active Js -->
    <script src="js/active.js"></script>
</body>

</html>
