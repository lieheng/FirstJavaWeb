<%@ page import="Code.LogService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>登录</title> <%--标题--%>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");// 设置字符集，避免出现乱码
    String username = request.getParameter("username");// 获取用户输入的username
    String password = request.getParameter("password");// 获取用户输入的password
    LogService logService = (LogService) session.getAttribute("logService");// 获取存储在session对象中的业务系统对象
    logService.setUsername(username);
    logService.setPassword(password);
    if (logService.Connect()) {// 如果登录成功
        response.sendRedirect("QSOLOG.jsp");
    } else {// 如果登录失败
%>
<center>
    <h1>登录失败</h1>
    <a href="login.jsp">重新登陆</a> <%--跳转到login界面--%>
</center>
<%}%>
</body>
</html>
