<%@ page import="com.lgh.library.Count" %>
<%@ page import="com.lgh.library.model.Admin" %>
<%@ page import="com.lgh.library.model.Main1" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>-->
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>


<%--    <script>--%>

<%--    /*Ajax异步请求*/--%>
<%--    var xmlhttp;--%>

<%--    function createXmlHttpRequest() {--%>
<%--    if (window.XMLHttpRequest) {--%>
<%--    xmlhttp = new XMLHttpRequest();--%>
<%--    } else {--%>
<%--    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");--%>
<%--    }--%>
<%--    }--%>

<%--    // 压面加载完成后触发--%>
<%--    window.onload = function(){--%>

<%--    // 1.创建xmlhttp--%>
<%--    createXmlHttpRequest();--%>

<%--    // 2.服务器建立关系 -->查询数据--%>
<%--    xmlhttp.open("get","TongJiServlet?action=TongJi");--%>

<%--    // 3.发送--%>
<%--    xmlhttp.send();--%>

<%--    // 4.设置回调函数--%>
<%--    xmlhttp.onreadystatechange = findProvinceFun--%>

<%--    }--%>



<%--    function findProvinceFun() {--%>
<%--        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {--%>
<%--            // 5.获取服务端响应的内容--%>
<%--            var result = xmlhttp.responseText;--%>
<%--            // 6.把JSON字符串转成JOSN对象--%>
<%--            var data = JSON.parse(result);--%>
<%--        }--%>

<%--    }--%>

<%--    </script>--%>






    <![endif]-->
    <%
        HttpSession session1 = request.getSession();
        Admin admin = (Admin) session1.getAttribute("admin");
        if (admin == null) {
            request.setAttribute("mags", "您还没有登录");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    %>

</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <blockquote class="layui-elem-quote">欢迎管理员：
                        <span class="x-red"><%=admin.getName()%></span>！当前时间:
                        <%
                            java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            java.util.Date currentTime = new java.util.Date();
                            String time = simpleDateFormat.format(currentTime);
                            out.println(time);
                        %>

                        &nbsp;&nbsp;<span style="color: red;">图表需要刷新此页面方可显示</span>
                    </blockquote>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">数据统计</div>
                <div class="layui-card-body ">
                    <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:" class="x-admin-backlog-body">
                                <h3>图书总数</h3>
                                <p>
                                    <cite>
                                        <%
                                            String sql = "select  COUNT(*)  from books ";

                                            Count count = new Count();
                                            String a = count.Sqlcount(sql);
                                            out.print(a);

                                        %>


                                    </cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:" class="x-admin-backlog-body">
                                <h3>会员数</h3>
                                <p>
                                    <cite>

                                        <%
                                            String sql1 = "select  COUNT(*)  from users ";

                                            String b = count.Sqlcount(sql1);
                                            out.print(b);
                                        %>
                                    </cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:" class="x-admin-backlog-body">
                                <h3>借阅总次数</h3>
                                <p>
                                    <cite><%
                                        String sql2 = "select  COUNT(*)  from borrow ";


                                        String c = count.Sqlcount(sql2);
                                        out.print(c);
                                    %></cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:" class="x-admin-backlog-body">
                                <h3>在架图书</h3>
                                <p>
                                    <cite>


                                        <%


                                            String sql3 = "select  COUNT(*)  from books where status='0' ";

                                            String d = count.Sqlcount(sql3);
                                            out.print(d);
                                        %>

                                    </cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:" class="x-admin-backlog-body">
                                <h3>借出图书</h3>
                                <p>
                                    <cite>

                                        <%


                                            String sql4 = "select  COUNT(*)  from books where status='1' ";

                                            String e = count.Sqlcount(sql4);
                                            out.print(e);
                                        %>


                                    </cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6 ">
                            <a href="javascript:" class="x-admin-backlog-body">
                                <h3>馆藏室</h3>
                                <p>
                                    <cite>
                                        <%


                                            String sql5 = "select  COUNT(*)  from classroom ";

                                            String f = count.Sqlcount(sql5);
                                            out.print(f);
                                        %>


                                    </cite></p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="layui-col-sm12 layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">用户借书总量</div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <div id="main1" class="layui-col-sm12" style="height: 300px;"></div>

                </div>
            </div>
        </div>


<%--        <div class="layui-col-sm12 layui-col-md6">--%>
<%--            <div class="layui-card">--%>
<%--                <div class="layui-card-header">用户来源</div>--%>
<%--                <div class="layui-card-body" style="min-height: 280px;">--%>
<%--                    <div id="main3" class="layui-col-sm12" style="height: 300px;"></div>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <div class="layui-col-sm12 layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">最爱图书TOP5</div>
                <div class="layui-card-body" style="min-height: 280px;">
                    <div id="main2" class="layui-col-sm12" style="height: 300px;"></div>

                </div>
            </div>
        </div>



        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">开发团队</div>
                <div class="layui-card-body ">
                    <table class="layui-table">
                        <tbody>

                        <tr>
                            <th>开发者</th>
                            <td>tgllsy</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <style id="welcome_style"></style>
        <div class="layui-col-md12">
            <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由x-admin提供技术支持。</blockquote>
        </div>
    </div>
</div>
</div>

<script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>
<script type="text/javascript">


    var myChart = echarts.init(document.getElementById('main1'));

    // 指定图表的配置项和数据


    <%
        String sqlmain1= "SELECT  users.userID,COUNT(*),users.username FROM borrow,users WHERE borrow.userid=users.userID GROUP BY userid";
        List<Main1> lists = count.getmain1(sqlmain1);
    %>

    var option = {
        xAxis: {
            type: 'category',
            data: [
                <% for (Main1 list:lists){%>'<%=list.getName()%>', <%}%>]
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [

                <%for (Main1 list:lists){%>'<%=list.getCount()%>', <%} %>
            ],
            type: 'bar'
        }]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);



    var myChart = echarts.init(document.getElementById('main2'));

    // 指定图表的配置项和数据


    <%
        String sqlmain2= " SELECT  Book_isbn,COUNT(Book_isbn) ,books.title FROM borrow,books  where books.ISBN=borrow.Book_isbn GROUP BY Book_isbn ORDER BY  Book_isbn asc  LIMIT 0,5";
        List<Main1> lists2 = count.getmain1(sqlmain2);
    %>

    var option = {
        xAxis: {
            type: 'category',
            data: [
                <% for (Main1 list:lists2){%>'<%=list.getName()%>', <%}%>]
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [<%for (Main1 list:lists2){%>'<%=list.getCount()%>', <%} %>],
            type: 'bar'
        }]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

<%--    // 基于准备好的dom，初始化echarts实例--%>
<%--    var myChart = echarts.init(document.getElementById('main3'));--%>

<%--<%--%>

<%--        String sqlmain2= " SELECT  Book_isbn,COUNT(Book_isbn) ,books.title FROM borrow,books  where books.ISBN=borrow.Book_isbn GROUP BY Book_isbn ORDER BY  Book_isbn asc  LIMIT 0,4";--%>
<%--        List<Main1> lists2 = count.getmain1(sqlmain2);--%>

<%--        List list_main2_name = new ArrayList();--%>
<%--        List list_main2_count = new ArrayList();--%>
<%--        for (Main1 li:lists2){--%>
<%--            list_main2_name.add(li.getName());--%>
<%--            list_main2_count.add(li.getCount());--%>
<%--        }--%>


<%--%>--%>


<%--    // 指定图表的配置项和数据--%>
<%--    var option = {--%>
<%--        tooltip: {--%>
<%--            trigger: 'item',--%>
<%--            formatter: "{a} <br/>{b} : {c} ({d}%)"--%>
<%--        },--%>
<%--        legend: {--%>
<%--            orient: 'vertical',--%>
<%--            left: 'left',--%>
<%--            data: [--%>
<%--                <%  for(Object list:list_main2_name){%>--%>
<%--                '<%=list.toString()%>',--%>
<%--<%}%>--%>
<%--            ]--%>
<%--        },--%>
<%--        series: [--%>
<%--            {--%>
<%--                name: '访问来源',--%>
<%--                type: 'pie',--%>
<%--                radius: '55%',--%>
<%--                center: ['50%', '60%'],--%>
<%--                data: [--%>
<%--                    {value: 335, name: '直接访问'},--%>
<%--                    {value: 310, name: '邮件营销'},--%>
<%--                    {value: 234, name: '联盟广告'},--%>
<%--                    {value: 135, name: '视频广告'},--%>
<%--                    {value: 1548, name: '搜索引擎'}--%>
<%--                ],--%>
<%--                itemStyle: {--%>
<%--                    emphasis: {--%>
<%--                        shadowBlur: 10,--%>
<%--                        shadowOffsetX: 0,--%>
<%--                        shadowColor: 'rgba(0, 0, 0, 0.5)'--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--        ]--%>
<%--    };--%>

<%--    // 使用刚指定的配置项和数据显示图表。--%>
<%--    myChart.setOption(option);--%>


</script>


</body>
</html>