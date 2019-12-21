<%@ page import="com.lgh.library.model.Book" %>
<%@ page import="com.lgh.library.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("admin");
    if (user == null) {
        request.setAttribute("mags", "您还没有登录");
        request.getRequestDispatcher("login.jsp").forward(request, response);


    }


%>

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
                    <form class="layui-form layui-col-space5" action="users?action=serach" method="post">

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="isbn" placeholder="请输入图书编号" autocomplete="off" class="layui-input">
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="bookname" placeholder="请输入图书名字" autocomplete="off"
                                   class="layui-input">
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
                </div>

                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>ISBN</th>
                            <th>书名</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th>出版日期</th>
                            <th>简介</th>
                            <th>状态</th>
                        </thead>

                        <tbody>
                        <%--  <c:forEach items="${books}" var="book">--%>

                        <%
                            List<Book> books = (List<Book>) request.getAttribute("books");
                            if (books != null) {
                                for (Book list : books) {
                        %>
                        <tr>
                            <%--<td>${book.ISBN}</td>
                            <td>${book.title}</td>
                            <td>${book.author}</td>
                            <td>${book.publisher}</td>
                            <td>${book.publicationDate}</td>
                            <td>${book.profile}</td>
                            <td>${book.status}</td>--%>
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
                            <td>
                                <%
                                    if (list.getStatus() == 0) {
                                        out.print(" <span style=\"color: blue\">在架</span>");
                                    } else {
                                        out.print(" <span style=\"color: red\">已借出</span>");
                                    }
                                %>
                            </td>
                        </tr>
                        <% }
                        }%>
                        <%--  </c:forEach>--%>
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
    });


</script>
</html>