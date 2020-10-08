<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head >
		<meta charset="utf-8" />
		<title>侣行婚礼-购物车</title>
		<link href="${pageContext.request.contextPath}/css/public.css" rel="stylesheet"type="text/css" />
		<link href="${pageContext.request.contextPath}/css/proList.css" rel="stylesheet"type="text/css" />
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

	<c:if test="${empty cart.map}">
		<div style="width:500px;height:500px;margin: auto;margin-top: 50px">
			<img style="width: 500px;height: 450px" src="img/cart-empty.png">
			<a href="${pageContext.request.contextPath}/product?method=index">返回首页</a>
		</div>
	</c:if>


  <c:if test="${!empty cart.map}">
	<div class="cart mt  container" >
			<!-----------------site------------------->
			<div class="site">
				<p class=" wrapper clearfix" >
<%--					<span class="fl">购物车</span>--%>
					<img class="top" src="${pageContext.request.contextPath}/img/cartTop01.jpg">
					<a href="${pageContext.request.contextPath}/product?method=index" class="fr">继续购物&gt;</a>
				</p>
			</div>
			<!-----------------table------------------->
			<div class="table wrapper ">
				<div class="tr">
					<div> <li style="font-size: 18px">商品</li></div>
					<div ><li style="font-size: 18px">单价</li></div>
					<div><li  style="font-size: 18px">数量 </li></div>
					<div><li style="font-size: 18px"> 小计</li></div>
					<div><li style="font-size: 18px">操作</li></div>
				</div>
             <c:forEach items="${cart.map}" var="entry">
				<div class="th">
					<div class="pro clearfix">
						<label class="fl">
							<input type="checkbox"/>
    						<span></span>
						</label>
						<a class="fl" href="#">
							<dl class="clearfix">
								<dt class="fl"><img src="${entry.value.product.pimage}"width="120" height="120"></dt>
								<dd class="fl">
									<p>${entry.value.product.pname}</p>
									<p>旅行婚礼:</p>
									<p>特价商品</p>
								</dd>
							</dl>
						</a>
					</div>
					<div class="price">&emsp;&emsp;&emsp;&emsp;￥${entry.value.product.shop_price}</div>
					<div class="number">
						<p class="num clearfix">
							<img class="fl sub" src="img/sub.jpg">
							<span class="fl">${entry.value.buyNum}</span>
							<img class="fl add" src="img//add.jpg">
						</p>
					</div>
					<div class="price sAll">&emsp;&emsp;&emsp;&emsp;￥${entry.value.subTotal}</div>
					<div class="price"><a  href="javascript:void(0);" class="delete" onclick="delCart('${entry.value.product.pid}')">&emsp;&emsp;&emsp;&emsp;删除</a></div>
				</div>
			 </c:forEach>

				<div class="goOn">空空如也~<a href="${pageContext.request.contextPath}/product?method=index">去逛逛</a></div>
				<div class="tr clearfix">
					<label class="fl">
						<input class="checkAll" type="checkbox"/>
						<span></span>
					</label>
					<p class="fl">
						<a href="#">全选</a>
						<a href="javascript:void(0);" class="del"onclick="clearCart('${entry.value.product.pid}}')">清空购物车</a>
					</p>
					<p class="fr">
						<span>共<small id="sl">0</small>件商品</span>
						<span>合计:&nbsp;<small id="all">￥${entry.value.subTotal}</small></span>
						<a href="${pageContext.request.contextPath}/order?method=submitOrder" class="count">结算</a>
					</p>
				</div>
			</div>
		</div>
		<div class="mask"></div>
		<div class="tipDel">
			<p>确定要删除该商品吗？</p>
			<p class="clearfix">
				<a class="fl cer" href="#">确定</a>
				<a class="fr cancel" href="#">取消</a>
			</p>
		</div>
		<!--返回顶部-->
		<div class="gotop">
			<a href="#" class="dh">
			<dl>
				<dt><img src="img/gt2.png"/></dt>
				<dd>联系<br />客服</dd>
			</dl>
			</a>
			<a href="mygxin.html">
			<dl>
				<dt><img src="img/gt3.png"/></dt>
				<dd>个人<br />中心</dd>
			</dl>
			</a>
			<a href="#" class="toptop" style="display: none;">
			<dl>
				<dt><img src="img/gt4.png"/></dt>
				<dd>返回<br />顶部</dd>
			</dl>
			</a>
			<p>400-800-8200</p>
		</div>
  </c:if>
	<!-- 友情链接 -->
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
	<!----------------mask------------------->
	<div class="mask"></div>
	<!-------------------mask内容------------------->
	<div class="proDets">
		<img class="off" src="img/temp/off.jpg" />
		<div class="proCon clearfix">
			<div class="proImg fr">
				<img class="list" src="img/temp/proDet.jpg"  />
				<div class="smallImg clearfix">
					<img src="img/temp/proDet01.jpg" data-src="img/temp/proDet01_big.jpg">
					<img src="img/temp/proDet02.jpg" data-src="img/temp/proDet02_big.jpg">
					<img src="img/temp/proDet03.jpg" data-src="img/temp/proDet03_big.jpg">
					<img src="img/temp/proDet04.jpg" data-src="img/temp/proDet04_big.jpg">
				</div>
			</div>
			<div class="fl">
				<div class="proIntro change">
					<p>颜色分类</p>
					<div class="smallImg clearfix">
						<p class="fl on"><img src="img/temp/prosmall01.jpg" alt="白瓷花瓶+20支快乐花" data-src="img/temp/proBig01.jpg"></p>
						<p class="fl"><img src="img/temp/prosmall02.jpg" alt="白瓷花瓶+20支兔尾巴草" data-src="img/temp/proBig02.jpg"></p>
						<p class="fl"><img src="img/temp/prosmall03.jpg" alt="20支快乐花" data-src="img/temp/proBig03.jpg"></p>
						<p class="fl"><img src="img/temp/prosmall04.jpg" alt="20支兔尾巴草" data-src="img/temp/proBig04.jpg"></p>
					</div>
				</div>
				<div class="changeBtn clearfix">
					<a href="#2" class="fl"><p class="buy">确认</p></a>
					<a href="#2" class="fr"><p class="cart">取消</p></a>
				</div>
			</div>
		</div>
	</div>
	<div class="pleaseC">
		<p>请选择宝贝</p>
		<img class="off" src="img/temp/off.jpg" />
	</div>


		<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/pro.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/cart.js" type="text/javascript" charset="utf-8"></script>
	</body>

	<script>

		//删除当前购物项
		function delCart(pid) {
			window.location.href="${pageContext.request.contextPath}/cart?method=delCart&pid="+pid;
		}

		//清空购物车
		function clearCart() {
			window.location.href="${pageContext.request.contextPath}/cart?method=clearCart";
		}

	</script>
</html>
