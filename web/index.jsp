<%@ page import="Code.LogService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
  <title>首页</title>  <%--标题--%>
</head>
<body>
<%
  LogService logService = new LogService();// 创建业务系统对象
  session.setAttribute("logService", logService);// 将业务系统对象放入session对象中储存，让其他界面也能够使用该业务系统对象
%>
<center>
  <a href="login.jsp">登录</a>  <%--跳转到login界面--%>
</center>
</body>
</html>

