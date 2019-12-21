<%@ page import="com.lgh.library.Dao.UserDao" %>
<%@ page import="com.lgh.library.model.Admin" %>
<%@ page import="com.lgh.library.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>

    <%
        HttpSession session1 = request.getSession();
        Admin admin = (Admin) session1.getAttribute("admin");
        if (admin == null) {
            request.setAttribute("mags", "您还没有登录");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    %>


    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
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

                <div class="layui-card-header">

                    <button class="layui-btn" onclick="xadmin.open('添加用户','./users-add.jsp',600,600)"><i
                            class="layui-icon"></i>添加
                    </button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>


                            <th>iD</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>手机</th>
                            <th>生效日期</th>
                            <th>失效日期</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            UserDao userDao = new UserDao();
                            List<User> users = userDao.ShowAll();

                            for (User list : users) {


                        %>
                        <tr>

                            <td><%=list.getId()%>
                            </td>
                            <td><%=list.getUsername()%>
                            </td>

                            <td><%=list.getGender()%>
                            </td>
                            <td><%=list.getPhone()%>
                            </td>
                            <td><%=list.getEffectiveDate()%>
                            </td>
                            <td><%=list.getExpirationDate()%>
                            </td>


                            <td class="td-manage">

                                <a title="编辑"
                                   onclick="xadmin.open('编辑','../users?action=to_update&&id=<%=list.getId()%>',600,600)"
                                   href="javascript:">
                                    <i class="layui-icon">&#xe642;</i>
                                </a>

                                <a onclick="xadmin.open('修改密码','../users?action=to_repassword&&id=<%=list.getId()%>',600,400)"
                                   title="修改密码"
                                   href="javascript:">
                                    <i class="layui-icon">&#xe631;</i>
                                </a>
                                <a title="删除" onclick="member_del(this,'<%=list.getId()%>')"
                                   href="../users?action=delete&&id=<%=list.getId()%>">
                                    <i class="layui-icon">&#xe640;</i>
                                </a>
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


        // 监听全选
        form.on('checkbox(checkall)', function (data) {

            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {

            if ($(obj).attr('title') == '启用') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '停用');
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {icon: 5, time: 1000});

            } else {
                $(obj).attr('title', '启用');
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 5, time: 1000});
            }

        });
    }

    /*用户-删除*/
    function member_del() {
        layer.confirm('确认要删除吗？', function () {
            //发异步删除数据

            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }


    function delAll(argument) {
        var ids = [];

        // 获取选中的id 
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？' + ids.toString(), function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</html>