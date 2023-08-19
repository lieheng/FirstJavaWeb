<%@ page import="Code.LogService" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QSOLOG</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");// 设置字符集，避免出现乱码
    LogService logService = (LogService) session.getAttribute("logService");// 获取存储在session对象中的业务系统对象
%>

<center>
    <form action="show.jsp" method="post">
        <label>选择表：</label>
        <select name="CallSign" id="CallSign">
            <%
                List<String> tableName = logService.getTableName();
                int num = tableName.size();
                for (int i = 0; i < num; i++) {
                    String name = tableName.get(i);
            %>
            <option value<%=name%>><%=name%>
            </option>
            <%}%>
        </select>
        <input id="submit" type="submit" value="查询">
    </form>
</center>
</body>
</html>
