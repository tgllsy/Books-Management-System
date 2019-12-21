<%@ page import="com.lgh.library.Dao.BorrowDao" %>
<%@ page import="com.lgh.library.model.Borrow" %>
<%@ page import="com.lgh.library.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="./admin/css/font.css">
    <link rel="stylesheet" href="./admin/css/xadmin.css">
    <script src="./admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./admin/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("admin");
    if (user == null) {
        request.setAttribute("mags", "您还没有登录");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>


<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">


                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>


                            <th>书号</th>
                            <th>借阅时间</th>
                            <th>应时间</th>
                            <th>实际归还时间</th>
                            <th>是否续借</th>
                            <th>借阅状态</th>


                        </thead>
                        <tbody>
                        <%

                            BorrowDao borrowDao = new BorrowDao();
                            List<Borrow> borrow = borrowDao.show_user(user.getId());


                            for (Borrow list : borrow) {


                        %>
                        <tr>


                            <td><%=list.getISBN()%>
                            </td>
                            <td><%=list.getBorrowingDate()%>
                            </td>
                            <td><%=list.getDueDate()%>
                            </td>
                            <td><%
                                if (list.getReturnDate() != null) {
                                    out.print(list.getReturnDate());
                                } else out.print("未还");

                            %></td>
                            <td><%
                                if (list.getRenew_status() == 1) out.print("否");
                                else out.print("是");
                            %></td>
                            <td><%
                                if (list.getBorrow_status() == 1) out.print("在借");
                                else if (list.getBorrow_status() == 2) out.print("续借");
                                else if (list.getBorrow_status() == 3)
                                    out.print(" <span style=\"color: red\">归还</span>");
                            %>
                            </td>


                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });


    /*用户-删除*/
    function member_update() {
        layer.confirm('确认要归还吗？', function () {
            //发异步删除数据

            layer.msg('已归还!', {icon: 1, time: 1000});
        });
    }


    function delAll(argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？' + data, function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</html>