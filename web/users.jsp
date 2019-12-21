<%@ page import="com.lgh.library.Dao.UserDao" %>
<%@ page import="com.lgh.library.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("admin");
    if (user == null) {
        request.setAttribute("mags", "您还没有登录");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="./admin/css/font.css">
    <link rel="stylesheet" href="./admin/css/xadmin.css">
    <script type="text/javascript" src="./admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">

        <%
            UserDao userDao = new UserDao();
            User user1 = userDao.getID(user.getId());
        %>

        <form class="layui-form" action="users?action=user_update" method="post">

            <input type="hidden" value="user" name="type">


            <div class="layui-form-item">
                <label for="userid" class="layui-form-label">
                    <span class="x-red">*</span>Userid</label>
                <div class="layui-input-inline">
                    <input type="text" id="userid" name="userid"  required="" lay-verify="nikename"
                           autocomplete="off" class="layui-input"  value="<%=user1.getId()%>" readonly></div>
            </div>


            <div class="layui-form-item">
                <label for="L_username" class="layui-form-label">
                    <span class="x-red">*</span>姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_username" name="username" required="" lay-verify="nikename"
                           autocomplete="off" class="layui-input" readonly value="<%=user1.getUsername()%>"></div>
            </div>


            <div class="layui-form-item">
                <label for="sex" class="layui-form-label">
                    <span class="x-red">*</span>性别</label>


                <div class="layui-input-inline">

                    <input type="radio" id="sex" name="sex" value="男" required=""
                           <% if ("男".equals(user1.getGender())){%>checked="checked"<%}%> lay-verify="required"
                           autocomplete="off" class="layui-input">男

                    <input type="radio" id="sex1" name="sex" value="女" required=""
                           <% if ("女".equals(user1.getGender())){%>checked="checked"<%}%> lay-verify="required"
                           autocomplete="off" class="layui-input">女
                </div>
            </div>

            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>手机</label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" required="" lay-verify="required"
                           autocomplete="off" class="layui-input" value="<%=user1.getPhone()%>"></div>
            </div>

            <div class="layui-form-item">
                <label for="effectiveDate" class="layui-form-label">
                    <span class="x-red">*</span>生效日期</label>
                <div class="layui-input-inline">
                    <input type="date" id="effectiveDate" name="effectiveDate" value="<%=user1.getEffectiveDate()%>"
                           required="" lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>

            <div class="layui-form-item">
                <label for="expirationDate" class="layui-form-label">
                    <span class="x-red">*</span>失效日期</label>
                <div class="layui-input-inline">
                    <input type="date" id="expirationDate" name="expirationDate" value="<%=user1.getExpirationDate()%>"
                           required="" lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>


            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">修改</button>
            </div>
        </form>



    </div>
</div>
<script>layui.use(['form', 'layer', 'jquery'],
    function () {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

    });</script>

</body>

</html>