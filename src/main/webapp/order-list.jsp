<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>我的订单</title>
		<!--=== Favicon ===-->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/title.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/myorder.css" />
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

		<div class="address mt">
			<div class="wrapper clearfix">
				<a href="${pageContext.request.contextPath}/product?method=index" class="fl">首页</a>
				<span>/</span>
				<a href="${pageContext.request.contextPath}/order?method=viewMyOrders" class="on">我的订单</a>
			</div>
		</div>
		
		<!------------------------------Bott------------------------------>
		<div class="Bott">
			<div class="wrapper clearfix">
				<div class="zuo fl">
					<h3>
						<a ><img style=" width: 50px;height: 50px" src="img/tx.png"/></a>
						<p class="clearfix"><span class="fl">[婚品六人组]</span><span class="fr">[退出登录]</span></p>
					</h3>
					<div>
						<ul>
							<li><a href="${pageContext.request.contextPath}/cart.jsp">我的购物车</a></li>
							<li><a href="order_list.jsp">我的订单</a></li>
						</ul>
					</div>
				</div>
				<div class="you fl">
					<div class="my clearfix"style="margin-bottom: 10px">
						<h2 class="fl">我的订单</h2>
						<a  class="fl">请谨防钓鱼链接或诈骗电话，了解更多&gt;</a>
					</div>
					<c:forEach items="${vo.list}" var="order">
					<div class="dkuang">
						<p class="one">${order.state==0?"未发货":"已发货"}</p>
						<div class="word clearfix">
							<ul class="fl clearfix">
								<li>2020年10月4日 8:53</li>
								<li>婚品六人组</li>
								<li>订单号:${order.oid}</li>
								<li>订单状态:${order.state==0?"未支付":"已支付"}</li>
							</ul>
							<c:forEach items="${order.itemsList}" var="orderItem">
							<p class="fr">订单金额：<span>${orderItem.subtotal}</span>元</p>
						</div>

						<div class="shohou clearfix">
							<a href="#" class="fl"><img src="${orderItem.product.pimage}"/></a>
							<p class="fl"><a href="#">${orderItem.product.pname}</a><a href="#">¥${orderItem.product.shop_price}×${orderItem.count}</a></p>
							</c:forEach>
							<p class="fr">
								<a >待评价</a>
								<a >订单详情</a>
							</p>

						</div>

					</div>
					</c:forEach>

				</div>
			</div>
		</div>
		<!--返回顶部-->
		<div class="gotop">
			<a href="${pageContext.request.contextPath}/cart.jsp">
			<dl>
				<dt><img src="img/gt1.png"/></dt>
				<dd>去购<br />物车</dd>
			</dl>
			</a>
			<a  class="dh">
			<dl>
				<dt><img src="img/gt2.png"/></dt>
				<dd>联系<br />客服</dd>
			</dl>
			</a>
			<a href="#" class="toptop" style="display: none">
			<dl>
				<dt><img src="img/gt4.png"/></dt>
				<dd>返回<br />顶部</dd>
			</dl>
			</a>
			<p>400-800-8200</p>
		</div>

		<!-- 友情链接 -->
		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp"></jsp:include>
		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
