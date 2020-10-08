//注册页面校验
$(function () {

    $("#registForm").validate({
        rules:{
            "username":{
                "required":true,
                "validateName":true
            },
            "password":{
                "required":true,
                "rangelength":[6,12]
            },
            "confirmpwd":{
                "required":true,
                "rangelength":[6,12],
                "equalTo":"#password"
            },
            "email":{
                "required":true,
                "email":true
            },
            "telephone":{
                "required":true
            },
            "address":{
                "required":true
            },
            "name":{
                "required":true
            },
            "sex":{
                "required":true
            },
            "birthday":{
                "required":true,
                "date":true
            }
        },
        messages:{
            "username":{
                "required":"昵称必填",
                "validateName":"用户名不能重复"
            },
            "password":{
                "required":"密码必填",
                "rangelength":"密码长度为6~12"
            },
            "confirmpwd":{
                "required":"重复密码必填",
                "rangelength":"密码长度为6~12",
                "equalTo":"两次密码输入要求一致"
            },
            "email":{
                "required":"邮箱必填",
                "email":"邮箱格式不正确"
            },
            "telephone":{
                "required":"电话必填"
            },
            "address":{
                "required":"地址必填"
            },
            "name":{
                "required":"真实姓名必填"
            },
            "sex":{
                "required":"性别必选"
            },
            "birthday":{
                "required":"生日必填",
                "date":"生日格式不正确"
            }
        },


        //指定错误信息出现的位置  第一个参数：错误信息  第二个参数：产生错误的标签元素
        errorPlacement: function (error, element) {
            //如果是radio或checkbox
            if (element.is(':radio') || element.is(':checkbox')) {
                //将错误信息添加当前元素的祖父结点后面
                error.appendTo(element.parent().parent());
            } else {
                //在当前元素后面插入错误信息
                error.insertAfter(element);
            }
        }
    });
});


/**
 * 自定义检验规则：
 * addMethod("校验规则名称",function(输入框中的值,标签对象,输入参数))
 */
$.validator.addMethod("validateName",function(value,element,params){
    var flag = false;
    $.ajax({
        async:false,
        type:"post",
        url:$("#path").val()+"/user?method=validateName",
        data:{"username":value},
        dataType:"json",
        success:function(content){
            flag = content.flag;
        }
    })
    return !flag;
});