<%@ page import="com.lgh.library.model.Admin" %>
<%@ page import="com.lgh.library.model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<%
    HttpSession session1 = request.getSession();
    Admin admin = (Admin) session1.getAttribute("admin");
    if (admin == null) {
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
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <%
        Book book = (Book) request.getAttribute("book");
    %>
    <div class="layui-row">
        <form class="layui-form" action="./book?action=update" method="post">
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>ISBN</label>
                <div class="layui-input-inline">


                    <input type="text" id="username" value="<%=book.getISBN()%>" name="ISBN" required=""
                           lay-verify="required"
                           autocomplete="off" readonly class="layui-input"></div>

            </div>


            <div class="layui-form-item">
                <label for="title" class="layui-form-label">
                    <span class="x-red">*</span>图书名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="title" value="<%=book.getTitle()%>" name="title" required=""
                           lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>

            <div class="layui-form-item">
                <label for="author" class="layui-form-label">
                    <span class="x-red">*</span>作者</label>
                <div class="layui-input-inline">
                    <input type="text" id="author" value="<%=book.getAuthor()%>" name="author" required=""
                           lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>

            <div class="layui-form-item">
                <label for="publisher" class="layui-form-label">
                    <span class="x-red">*</span>出版社</label>
                <div class="layui-input-inline">
                    <input type="text" id="publisher" name="publisher" value="<%=book.getPublisher()%>" required=""
                           lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>


            <div class="layui-form-item">
                <label for="publicationDate" class="layui-form-label">
                    <span class="x-red">*</span>出版日期</label>
                <div class="layui-input-inline">
                    <input type="date" id="publicationDate" name="publicationDate"
                           value="<%=book.getPublicationDate()%>" required="" lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label for="profile" class="layui-form-label">简介</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id="profile" name="profile"
                              class="layui-textarea"><%=book.getProfile()%></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="room" class="layui-form-label">
                    <span class="x-red">*</span>馆藏室</label>
                <div class="layui-input-inline">
                    <input type="text" id="room" value="<%=book.getRoomNmae()%>" name="room" required=""
                           lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>


            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">修改</button>
            </div>
        </form>
    </div>
</div>
<script>layui.use(['form', 'layer'],
    function () {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;


        //监听提交
        form.on('submit(add)',
            function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
        return false;
    });</script>
<%--        <script>var _hmt = _hmt || []; (function() {--%>
<%--                var hm = document.createElement("script");--%>
<%--                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";--%>
<%--                var s = document.getElementsByTagName("script")[0];--%>
<%--                s.parentNode.insertBefore(hm, s);--%>
<%--            })();</script>--%>
</body>

</html>