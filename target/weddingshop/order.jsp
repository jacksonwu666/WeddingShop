<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>订单详情</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/proList.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mygxin.css" />
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/title.ico" type="image/x-icon" />

		<!--=== Favicon ===-->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/title.ico" type="image/x-icon" />

		<!-- Google fonts include -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,900%7CYesteryear" rel="stylesheet">

		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/friendlink.css"type="text/css" />
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carts.css">

	</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>


		<div class="order cart mt">
			<!-----------------site------------------->
			<div class="site">
				<p class="wrapper clearfix">
					<span class="fl">订单确认</span>
					<img class="top" src="img/cartTop02.png">
				</p>
			</div>
			<!-----------------orderCon------------------->
			<div class="orderCon wrapper clearfix" >
				<div class="orderL fl" >
					<!--------h3---------------->
					<h3>收件信息<a href="#" class="fr">新增地址</a></h3>
					<!--------addres---------------->
                    <form id="orderForm" method="post" action="${pageContext.request.contextPath}/order?method=confirmOrder">
					<div class="addres clearfix">
						<div class="addre fl on">
							<div class="tit clearfix">
								<p class="fl">${user.username}
									<span class="default">[默认地址]</span>
								</p>
								<p class="fr">
									<a href="#">删除</a>
									<span>|</span>
									<a href="#" class="edit">编辑</a>
								</p>
							</div>
							<div class="addCon">
								<p>安徽省淮北市烈山区烈山镇淮北师范大学滨湖校区</p>
								<p>${user.telephone}</p>
							</div>
						</div>
						<div class="addre fl">
							<div class="tit clearfix">
								<p class="fl">黄庆
								</p>
								<p class="fr">
									<a href="#" class="setDefault">设为默认</a>
									<span>|</span>
									<a href="#">删除</a>
									<span>|</span>
									<a href="#" class="edit">编辑</a>
								</p>
							</div>
							<div class="addCon">
								<p>安徽省淮北市烈山区烈山镇淮北师范大学滨湖校区</p>
								<p>15732570937</p>
							</div>
						</div>
						<div class="addre fl">
							<div class="tit clearfix">
								<p class="fl">成斌
								</p>
								<p class="fr">
									<a  class="setDefault">设为默认</a>
									<span>|</span>
									<a href="#">删除</a>
									<span>|</span>
									<a href="#" class="edit">编辑</a>
								</p>
							</div>
							<div class="addCon">
								<p>安徽省淮北市烈山区烈山镇淮北师范大学滨湖校区</p>
								<p>15732570990</p>
							</div>
						</div>
                    </div>
                    </form>
					<h3>支付方式</h3>
					<!--------way---------------->
					<div class="way clearfix">
                        <img class="on" src="img/way01.jpg">
						<img src="img/way02.jpg">
						<img src="img/way03.jpg">
						<img src="img/way04.jpg">
					</div>
					<h3>选择快递</h3>
					<!--------dis---------------->
					<div class="dis clearfix">
						<span class="on">顺风快递</span>
						<span>百世汇通</span>
						<span>圆通快递</span>
						<span>中通快递</span>
					</div>
				</div>
				<div class="orderR fr" >
					<div class="msg">
						<h3>订单内容<a href="cart.jsp" class="fr">返回购物车</a></h3>
						<!--------ul---------------->
                     <c:forEach items="${orders.itemsList}" var="orderItem">
						<ul class="clearfix">
							<li class="fl">
								<img src="${orderItem.product.pimage}"width="120" height="120">
							</li>
							<li class="fl">
								<p>${orderItem.product.pname}</p>
								<p>商品描述：${orderItem.product.pdesc}</p>
								<p>数量：${orderItem.count}</p>
							</li>
							<li class="fr">￥${orderItem.product.shop_price}</li>
						</ul>
					 </c:forEach>
					</div>

					<!--------tips---------------->
					<div class="tips">
						<p><span class="fl">商品金额：</span><span class="fr">￥${orders.total}</span></p>
						<p><span class="fl">优惠金额：</span><span class="fr">￥0.00</span></p>
						<p><span class="fl">运费：</span><span class="fr">免运费</span></p>
					</div>

					<!--------tips count---------------->
					<div class="count tips">
						<p><span class="fl">合计：￥${orders.total}元</span><span class="fr"></span></p>
					</div>
					<!--<input type="button" name="" value="去支付"> -->
					<a  href="javascript:document.getElementById('orderForm').submit();" class="pay">去支付</a>
				</div>
			</div>
		</div>



		<!--返回顶部-->
		<div class="gotop">
			<a href="cart.jsp">
			<dl>
				<dt><img src="img/gt1.png"/></dt>
				<dd>去购<br />物车</dd>
			</dl>
			</a>
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


		<!-- 友情链接 -->
		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp"></jsp:include>


		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
