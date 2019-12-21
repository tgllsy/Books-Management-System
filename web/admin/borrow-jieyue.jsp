<%@ page import="com.lgh.library.Dao.UserDao" %>
<%@ page import="com.lgh.library.model.Admin" %>
<%@ page import="com.lgh.library.model.Book" %>
<%@ page import="com.lgh.library.model.User" %>
<%@ page import="java.util.List" %>
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
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" action="borrow?action=add" method="post">


            <%
                Book book = (Book) request.getAttribute("book");
            %>


            <div class="layui-form-item">
                <label for="isbn" class="layui-form-label">
                    借阅图书</label>
                <div class="layui-input-inline">
                    <input type="text" id="isbn" name="isbn" required="" lay-verify="nikename"
                           autocomplete="off" class="layui-input" readonly value="<%=book.getISBN()%>"></div>
            </div>

            <div class="layui-form-item">
                <label for="userid" class="layui-form-label">
                    <span class="x-red">*</span>借阅者</label>
                <div class="layui-input-inline">
                    <select name="userid" id="userid" class="contrller">
                        <%
                            UserDao userDao = new UserDao();
                            List<User> users = userDao.ShowAll();
                            for (User list : users) {
                        %>
                        <option value="<%=list.getId()%>"><%=list.getUsername()%>
                        </option>
                        <%}%>
                    </select>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">增加</button>
            </div>
        </form>
    </div>
</div>
<script>layui.use(['form', 'layer', 'jquery'],
    function () {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        form.render();
        // //自定义验证规则
        // form.verify({
        //     nikename: function (value) {
        //         if (value.length < 5) {
        //             return '昵称至少得5个字符啊';
        //         }
        //     },
        //     pass: [/(.+){6,12}$/, '密码必须6到12位'],
        //     repass: function (value) {
        //         if ($('#L_pass').val() != $('#L_repass').val()) {
        //             return '两次密码不一致';
        //         }
        //     }
        // });

        // //监听提交
        // form.on('submit(add)',
        //     function () {
        //         // 获得frame索引
        //         var index = parent.layer.getFrameIndex(window.name);
        //         //关闭当前frame
        //         parent.layer.close(index);
        //     });
        return false;


    });</script>
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>