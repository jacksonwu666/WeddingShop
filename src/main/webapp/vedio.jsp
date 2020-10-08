<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<!DOCTYPE html>--%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>视频</title>

    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="img/icon/title.ico" type="image/x-icon" />

    <!-- Google fonts include -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,900%7CYesteryear" rel="stylesheet">

    <!-- All Vendor & plugins CSS include -->
    <link href="css/vendor.css" rel="stylesheet">
    <!-- Main Style CSS -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/vendor/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
    <link rel="stylesheet" href="css/friendlink.css">
</head>
<body>
<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>


<div class="container">
    <h4 align="center" style="color: hotpink;font-size: 30px;line-height:50px">中国新娘·2019</h4>
    <div style="width: 75%;margin: auto">
        <video width="100%" height="50%" controls autoplay="autoplay" muted="ture" style="object-fit: fill; border: whitesmoke;margin-top: 10px">
            <source src="#" type="video/mp4">
        </video>
    </div>
    <hr width="80%" color="grey" size="3" style="margin: 10px auto;">
    <div style="width: 80%;margin: auto;font-size:15px;line-height: 20px">
        【大片出品】：婚礼风尚
        <br>
        <br>
        【大片摄影】：<span style="color: hotpink">Sails Chong</span>
        <br>
        <br>
        【大片摄像】：GoldenLove Production
        <br>
        <br>
        【酒店支持】：<span style="color: hotpink">丽江悦榕庄酒店</span>
        <br>
        <br>
        【婚礼机构】：蜜堂婚礼记
        <br>
        <br>
        【中式嫁衣】：<span style="color: hotpink">月白中式嫁衣</span>
        <br>
        <br>
        【婚纱礼服】：B.Bridge Couture
        <br>
        <br>
        【妆容造型】：<span style="color: hotpink">VIGI</span>
        <br>
        <br>
        【创意单品】：很有爱s.creart
        <br>
        <br>
        【外景场地】：<span style="color: hotpink">云南 丽江</span>
        <br>
        <br>
        【特别感谢】：玉龙雪山管委会，丽江市政府新闻办，白沙古镇宣传办
    </div>
</div>


<!-- 友情链接 -->
<!-- 引入footer.jsp -->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>