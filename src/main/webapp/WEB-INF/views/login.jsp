<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%
        String scheme = "http://";
        String path = request.getContextPath();
        String host = request.getServerName();
        String port = ":"+request.getServerPort();
        if(host.contains("v-ka.com") || host.contains("vi-ni.com")) {
            scheme = "https://";
            port = "";
        }

        String basepath = scheme + host + port + path;
    %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC Demo 首页</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<div class="container">
    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form">
            <h3 class="form-title">账号登录</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="账号" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="密码" id="password" name="password" maxlength="8"/>
                </div>
                <div class="form-group">
                    <hr />
                    <a href="javascript:;" id="register_btn" class="">注册用户</a>
                </div>
                <div class="form-group">
                    <input type="button" id="login" class="btn btn-success pull-right" value="登录"/>
                </div>
            </div>
        </form>
    </div>

</div>
<script type="text/javascript" src="js/main.js" ></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $('#login').click(function () {
            var a='<%= basepath %>';
            var data={};
            var account = $('#username').val();
            var password = $('#password').val();
            if(!account){
                alert("请输入账号");
                return;
            }
            if(!password){
                alert("请输入账号");
                return;
            }
            data.name = account;
            data.password = password;
            $.ajax({
                url:'./user/login',
                type:'POST',
                data:data,
                dataType:'json',
                success:function(data) {
//                        hideLoading('#btnSubmit');
//                    alert(JSON.stringify(data));
                    if(data.code=200){
                        top.location='<%= basepath %>/index';
                    }
                    else {
                        alert(data.message);
                    }
                }
            });
        });
        <%--$('#login_form').bootstrapValidator({--%>
            <%--live : 'disabled',--%>
            <%--feedbackIcons : {--%>
                <%--valid : 'glyphicon glyphicon-ok',--%>
                <%--invalid : 'glyphicon glyphicon-remove',--%>
                <%--validating : 'glyphicon glyphicon-refresh'--%>
            <%--},--%>
            <%--submitHandler : function(validator, form, submitButton) {--%>
<%--//                showLoading('#btnSubmit');--%>
                <%--var account = $('#username').val();--%>
                <%--var password = $('#password').val();--%>
                <%--if(!account){--%>
                    <%--showErrMsg("请输入账号");--%>
                    <%--return;--%>
                <%--}--%>
                <%--if(!password){--%>
                    <%--showErrMsg("请输入密码");--%>
                    <%--return;--%>
                <%--}--%>
                <%--$.ajax({--%>
                    <%--url:'./user/login',--%>
                    <%--type:'POST',--%>
                    <%--data:{name:account, password:password},--%>
                    <%--dataType:'json',--%>
                    <%--success:function(data) {--%>
<%--//                        hideLoading('#btnSubmit');--%>
                        <%--if(data.code=200){--%>
                            <%--top.location='<%= basepath %>/index';--%>
                        <%--}--%>
                        <%--else {--%>
                            <%--//清空总店编号，365天有效--%>
                            <%--alert('错误');--%>
                        <%--}--%>
                    <%--}--%>
                <%--});--%>
            <%--},--%>
            <%--fields : {--%>

            <%--}--%>
        <%--});--%>
    });
    <%--top.location='<%= basepath %>admin/index';--%>
</script>