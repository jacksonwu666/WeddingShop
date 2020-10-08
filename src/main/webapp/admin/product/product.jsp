<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品管理</title>
    <link href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/admin/js/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/index.js"></script>
</head>
<body>
<%@include file="../nav.jsp"%>

<div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-6">
                <div class="input-group">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="selectByLikeName()">查找</button>
                    </span>
                    <input type="text" class="form-control" placeholder="按名称查找" id="searchName" value="${query}">
                </div>
            </div>
            <div class="col-md-4 col-lg-4">
                <input class="btn btn-primary" type="button" value="增加商品" onclick="addGoods()">
                <input class="btn btn-danger" type="button" value="批量下架" onclick="deleteAll()">
            </div>
        </div>
        <div class="row">
            <table class="table table-bordered">
                <tr align="center">
                    <th style="text-align:center"><input type="checkbox" class="choose_all"></th>
                    <th style="text-align:center">商品编号</th>
                    <th style="text-align:center">商品名称</th>
                    <th style="text-align:center">商品日期</th>
                    <th style="text-align:center">商品价格</th>
                    <th style="text-align:center">商品图片</th>
                    <th style="text-align:center">操作</th>
                </tr>
                <c:forEach items="${vo.list}" var="good">
                    <tr class="data" align="center">
                        <td class="datachoose"><input type="checkbox" class="single"></td>
                        <td class="id">${good.pid}</td>
                        <td>${good.pname}</td>
                        <td>${good.pdate}</td>
                        <td>${good.shop_price}</td>
                        <td>
                        	<c:if test="${good.pimage !=null && good.pimage !=''}">
								<img src="${good.pimage}" width="64px" height="auto"/>
							</c:if>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="btn btn-primary" onclick="updateGoods('${good.pid}')">修改</a>|
                            <a href="${pageContext.request.contextPath}/admin?method=delete&code=product&id=${good.pid}" class="btn btn-danger">下架</a>
                        </td>
                    </tr>
                </c:forEach>

                <tr align="right"><td colspan="8"><input class="btn btn-warning" type="button" value="导出excel" onclick="window.location.href='${pageContext.request.contextPath}/admin?method=download&pageNow=${vo.pageNow}'"></td></tr>

                <tr align="center">
                    <td colspan="8">
                        <input class="btn btn-success" type="button" value="首页"
                               onclick="firstPage('${pageContext.request.contextPath}/admin?method=findAll&code=product',$('#searchName').val())"/>&nbsp;&nbsp;
                        <input class="btn btn-success" type="button" id="pre" value="上一页"
                               onclick="prePage('${pageContext.request.contextPath}/admin?method=findAll&code=product',$('#searchName').val())"/>&nbsp;&nbsp;
                        <!-- 当前页 -->
                        <input type="text" id="pageNow" value="${vo.pageNow}" style="text-align:center"/>&nbsp;&nbsp;
                        <input class="btn btn-success" type="button" value="跳转"
                               onclick="skipPage(${vo.myPages},'${pageContext.request.contextPath}/admin?method=findAll&code=product',$('#searchName').val())"/>&nbsp;&nbsp;
                        <input class="btn btn-success" type="button" id="next" value="下一页"
                               onclick="nextPage(${vo.myPages},'${pageContext.request.contextPath}/admin?method=findAll&code=product',$('#searchName').val())"/>&nbsp;&nbsp;
                        <input class="btn btn-success" type="button" value="末页"
                               onclick="lastPage(${vo.myPages},'${pageContext.request.contextPath}/admin?method=findAll&code=product',$('#searchName').val())"/>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>


<%@include file="addModal.jsp"%>
<script type="text/javascript">

	/*添加商品*/
	function addGoods(){
		$("#pid").val("");
		$("#pname").val("");
		$("#pdesc").val("");
		$("#market_price").val("");
		$("#shop_price").val("");
		$("#pic").attr("src","");
		$("#pimage").val("");
		$("#pdate").val("");
		$("#category").html("");

		$.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/admin?method=findAllCategory",
            dataType:"json",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    $text=$("<option value='"+data[i].cid+"'>"+data[i].cname+"</option>");
                    $text.appendTo("#category");
                }
            }
        });

		$("#myModalLabel").text("添加商品");
		$("#goodsform").attr("action","${pageContext.request.contextPath}/admin?method=add");
		$("#myModal").modal();
	}
	
	/* 重写提交方法 */
	$("#goodsform").on("submit",function(){
		if($("#pic").attr("src") == ""){
			alert("请给商品上传图片");
			return false;
		}
		return true;
	});
	
	/*修改商品*/
	function updateGoods(id){
		$.ajax({
			method:"get",
			dataType:"json",
			url:"${pageContext.request.contextPath}/admin?method=findOneById&code=product&id="+id,
			success:function(mapList){
                for(var i=0;i<mapList.length;i++){
                    var map = mapList[i];
                    $("#pid").val(map.pid);
                    $("#pname").val(map.pname);
                    $("#pdesc").val(map.pdesc);
                    $("#market_price").val(map.market_price);
                    $("#shop_price").val(map.shop_price);
                    $("#pic").attr("src",map.pimage);
                    $("#pdate").val(map.date);

                    $("#category").html("");
                    $.ajax({
                        type:"get",
                        url:"${pageContext.request.contextPath}/admin?method=findAllCategory",
                        dataType:"json",
                        success:function(data){
                            for(var j=0;j<data.length;j++){
                                if(data[j].cid==map.cid){
                                    $text=$("<option value='"+data[j].cid+"' selected>"+data[j].cname+"</option>");
                                }else{
                                    $text=$("<option value='"+data[j].cid+"'>"+data[j].cname+"</option>");
                                }
                                $text.appendTo("#category");
                            }
                        }
                    });

                }
				
				$("#myModalLabel").text("修改商品");
				$("#goodsform").attr("action","${pageContext.request.contextPath}/admin?method=update");
				$("#myModal").modal();
			}
		});
	}
	
	/*通过名称模糊查询*/
	function selectByLikeName(){
		window.location.href="${pageContext.request.contextPath}/admin?method=findAll&code=product&query="+$("#searchName").val();
	}
	
	/*删除所有*/
	function deleteAll(){
		var str = "";
		$(".single").each(function(){
			//判断当前的checkbox有没有被选中
			if($(this).prop("checked")){
				var text = $(this).parents(".data").find(".id").text();
				str = str+"id="+text+"&";
			}
		});
		str = str.substr(0,str.length-1);  //id=1&id=2&id=3
		window.location.href="${pageContext.request.contextPath}/admin?method=delete&code=product&"+str;
	}

</script>    
</body>
</html>
