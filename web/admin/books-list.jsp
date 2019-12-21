<%@ page import="com.lgh.library.Dao.BookDao" %>
<%@ page import="com.lgh.library.model.Admin" %>
<%@ page import="com.lgh.library.model.Book" %>
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
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
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
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <%--                <div class="layui-card-body ">--%>
                <%--                    <form class="layui-form layui-col-space5">--%>
                <%--                        <div class="layui-input-inline layui-show-xs-block">--%>
                <%--                            <input class="layui-input" placeholder="开始日" name="start" id="start"></div>--%>
                <%--                        <div class="layui-input-inline layui-show-xs-block">--%>
                <%--                            <input class="layui-input" placeholder="截止日" name="end" id="end"></div>--%>
                <%--                        <div class="layui-input-inline layui-show-xs-block">--%>
                <%--                            <select name="contrller">--%>
                <%--                                <option>支付方式</option>--%>
                <%--                                <option>支付宝</option>--%>
                <%--                                <option>微信</option>--%>
                <%--                                <option>货到付款</option>--%>
                <%--                            </select>--%>
                <%--                        </div>--%>
                <%--                        <div class="layui-input-inline layui-show-xs-block">--%>
                <%--                            <select name="contrller">--%>
                <%--                                <option value="">订单状态</option>--%>
                <%--                                <option value="0">待确认</option>--%>
                <%--                                <option value="1">已确认</option>--%>
                <%--                                <option value="2">已收货</option>--%>
                <%--                                <option value="3">已取消</option>--%>
                <%--                                <option value="4">已完成</option>--%>
                <%--                                <option value="5">已作废</option>--%>
                <%--                            </select>--%>
                <%--                        </div>--%>
                <%--                        <div class="layui-input-inline layui-show-xs-block">--%>
                <%--                            <input type="text" name="username" placeholder="请输入订单号" autocomplete="off"--%>
                <%--                                   class="layui-input"></div>--%>
                <%--                        <div class="layui-input-inline layui-show-xs-block">--%>
                <%--                            <button class="layui-btn" lay-submit="" lay-filter="sreach">--%>
                <%--                                <i class="layui-icon">&#xe615;</i></button>--%>
                <%--                        </div>--%>
                <%--                    </form>--%>
                <%--                </div>--%>
                <%--                <div class="layui-card-header">--%>
                <%--                    <button class="layui-btn layui-btn-danger" onclick="delAll()">--%>
                <%--                        <i class="layui-icon"></i>批量删除--%>
                <%--                    </button>--%>
                <%--                    <button class="layui-btn" onclick="xadmin.open('添加用户','./books-add.jsp',800,600)">--%>
                <%--                        <i class="layui-icon"></i>添加--%>
                <%--                    </button>--%>
                <%--                </div>--%>


                <form class="layui-form layui-col-space5" action="./book?action=serach" method="post">

                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="isbn" placeholder="请输入图书编号" autocomplete="off" class="layui-input">
                    </div>

                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="bookname" placeholder="请输入图书名字" autocomplete="off"
                               class="layui-input">
                    </div>

                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="author" placeholder="请输入作者名字" autocomplete="off"
                               class="layui-input">
                    </div>


                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="publisher" placeholder="请输入出版社名字" autocomplete="off"
                               class="layui-input">
                    </div>

                    <div class="layui-inline layui-show-xs-block">
                        <input class="layui-input" autocomplete="off" placeholder="开始日" name="start" id="start">
                    </div>

                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="profile" placeholder="请输入简介关键字" autocomplete="off"
                               class="layui-input">
                    </div>

                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="room" placeholder="请输入馆藏室名称" autocomplete="off"
                               class="layui-input">
                    </div>


                    <div class="layui-input-inline layui-show-xs-block">
                        <select name="status">
                            <option disabled="disabled" selected="selected">状态</option>
                            <option value="0">在架</option>
                            <option value="1">借出</option>

                        </select>
                    </div>

                    <div class="layui-inline layui-show-xs-block">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach"><i
                                class="layui-icon">&#xe615;</i></button>
                    </div>

                    <span style="color: red;font-size: 20px;margin-left: 30px;margin-bottom: -10px;"><%

                        if (request.getAttribute("mags") != null) {
                            out.print(request.getAttribute("mags"));
                        }
                    %></span>
                </form>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="" lay-skin="primary">
                            </th>
                            <th>ISBN</th>
                            <th>书名</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th>出版日期</th>
                            <th>简介</th>
                            <th>馆藏室</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>


                        <%
                            List<Book> books;
                            if (request.getAttribute("books") != null) {
                                books = (List<Book>) request.getAttribute("books");

                            } else {
                                BookDao bookDao = new BookDao();
                                books = bookDao.ShowAll();

                            }

                            for (Book list : books) {


                        %>

                        <tr>
                            <td>
                                <input type="checkbox" name="" lay-skin="primary"></td>
                            <td><%=list.getISBN() %>
                            </td>
                            <td><%=list.getTitle()%>
                            </td>
                            <td><%=list.getAuthor()%>
                            </td>
                            <td><%=list.getPublisher()%>
                            </td>
                            <td><%=list.getPublicationDate()%>
                            </td>
                            <td><%=list.getProfile()%>
                            </td>
                            <td><%=list.getRoomNmae()%>
                            </td>
                            <td>
                                <%
                                    if (list.getStatus() == 0) {
                                        out.print(" <span style=\"color: blue\">在架</span>");
                                    } else {
                                        out.print(" <span style=\"color: red\">已借出</span>");
                                    }

                                %>

                            </td>
                            <td class="td-manage">


                                <a title="查看" onclick="xadmin.open('编辑','book?action=toUpdate&&id=<%=list.getISBN()%>')"
                                   href="javascript:">
                                    <i class="layui-icon">&#xe63c;</i></a>


                                <a title="删除" onclick="member_del()"
                                   href="./book?action=delect&&id=<%=list.getISBN()%>">
                                    <i class="layui-icon">&#xe640;</i></a>

                                <%
                                    if (list.getStatus() == 0) {


                                %>


                                <a title="借阅" onclick="xadmin.open('借阅','book?action=jieyue&&isbn=<%=list.getISBN()%>')"
                                   href="javascript:">
                                    <i class="iconfont">&#xe726;</i>
                                </a>
                                <%}%>

                            </td>
                        </tr>
                        <%
                            }

                        %>

                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <a class="prev" href="">&lt;&lt;</a>
                            <a class="num" href="">1</a>
                            <span class="current">2</span>
                            <a class="num" href="">3</a>
                            <a class="num" href="">489</a>
                            <a class="next" href="">&gt;&gt;</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['laydate', 'form'],
        function () {
            var laydate = layui.laydate;
//
            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });
//
            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });
        });

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？',
            function (index) {

                if ($(obj).attr('title') == '启用') {

                    //发异步把用户状态进行更改
                    $(obj).attr('title', '停用');
                    $(obj).find('i').html('&#xe62f;');

                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!', {
                        icon: 5,
                        time: 1000
                    });

                } else {
                    $(obj).attr('title', '启用');
                    $(obj).find('i').html('&#xe601;');

                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                    layer.msg('已启用!', {
                        icon: 5,
                        time: 1000
                    });
                }

            });
    }

    // /*用户-删除*/
    function member_del() {
        layer.confirm('确认要删除吗？',
            function () {
                //发异步删除数据

                layer.msg('已删除!', {
                    icon: 1,
                    time: 1000
                });

            });
        // xadmin.father_reload();
    }

    function delAll(argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？' + data,
            function (index) {
                //捉到所有被选中的，发异步进行删除
                layer.msg('删除成功', {
                    icon: 1
                });
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
    }
</script>

</html>