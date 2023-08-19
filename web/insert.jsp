<%@ page import="Code.LogService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insert</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    LogService logService = (LogService) session.getAttribute("logService");// 获取存储在session对象中的业务系统对象
    String year = request.getParameter("YEAR");
    String month = request.getParameter("MONTH");
    String day = request.getParameter("DAY");
    String hour = request.getParameter("HOUR");
    String minute = request.getParameter("MINUTE");
    String second = request.getParameter("SECOND");
    String myqth = request.getParameter("MYQTH");
    String mydev = request.getParameter("MYDEV");
    String myant = request.getParameter("MYANT");
    String opcs = request.getParameter("OPCS");
    String freq = request.getParameter("FREQ");
    String mode = request.getParameter("MODE");
    String myrst = request.getParameter("MYR") + request.getParameter("MYS") + request.getParameter("MYT");
    String oprst = request.getParameter("OPR") + request.getParameter("OPS") + request.getParameter("OPT");
    String mypower = request.getParameter("MYPOWER");
    String oppower = request.getParameter("OPPOWER");
    String opqth = request.getParameter("OPQTH");
    String opdev = request.getParameter("OPDEV");
    String opant = request.getParameter("OPANT");
    String abstr = request.getParameter("ABSTR");
    String qsl = request.getParameter("QSL");

    String sql = "insert into `BG6HXS` (`DATETIME`, `MYQTH`, `MYDEV`, `MYANT`, `OPCS`, `FREQ`, `MODE`, `MYRST`, " +
            "`OPRST`, `MYPOWER`, `OPPOWER`, `OPQTH`, `OPDEV`, `OPANT`, `ABSTR`, `QSL`) values ('" +
            year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second + "', '" + myqth + "', '" +
            mydev + "', '" + myant + "', '" + opcs + "', " + freq + ",' " + mode + "', " + myrst + ", " + oprst + ", " +
            mypower + ", " + oppower + ", '" + opqth + "', '" + opdev + "', '" + opant + "', '" + abstr + "', '" + qsl + "');";

    if (logService.Insert(sql)){
%>
<center>
    <h1>插入成功</h1>
    <a href="show.jsp">返回</a>
</center>
<%
    }else {
%>
<center>
    <h1>插入失败</h1>
    <a href="show.jsp">返回</a>
</center>
<%}%>
</body>
</html>
