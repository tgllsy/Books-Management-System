<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lgh.library.model.User" %>
<!doctype html>

<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>图书管理系统-前台</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="./admin/css/font.css">
    <link rel="stylesheet" href="./admin/css/xadmin.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="./admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>

    <%
        HttpSession session1 = request.getSession();
        User user = (User) session1.getAttribute("admin");
        if (user == null) {
            request.setAttribute("mags", "您还没有登录");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    %>


</head>
<body class="index">
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="index.jsp">图书管理系统 用户中心</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>

    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:"><%=user.getUsername()%>
            </a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->

                <dd>
                    <a href="./admin/login?action=signout">退出</a></dd>
            </dl>
        </li>

    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:">
                    <i class="iconfont left-nav-li" lay-tips="信息管理">&#xe6b8;</i>
                    <cite>会员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('修改信息','users.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>修改信息</cite></a>
                    </li>

                </ul>
            </li>
            <li>
                <a href="javascript:">
                    <i class="iconfont left-nav-li" lay-tips="图书查询">&#xe723;</i>
                    <cite>图书查询</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('查询图书','serach_book.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>图书列表</cite></a>
                    </li>


                </ul>
            </li>


            <li>
                <a href="javascript:">
                    <i class="iconfont left-nav-li" lay-tips="借阅信息">&#xe726;</i>
                    <cite>我的借还记录</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('借阅记录','user_borrow.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>借阅列表</cite></a>
                    </li>


                </ul>
            </li>


        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='./welcome.html' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->

</body>

</html>