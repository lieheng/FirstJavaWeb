<%@ page import="Code.LogService" %>
<%@ page import="Code.Log" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%
    request.setCharacterEncoding("UTF-8");// 设置字符集，避免出现乱码
    LogService logService = (LogService) session.getAttribute("logService");// 获取存储在session对象中的业务系统对象
    String CallSign = request.getParameter("CallSign");
    if (CallSign != null) {
        logService.setCallSign(CallSign);
    } else {
        CallSign = logService.getCallSign();
    }
    String sql = "SELECT * FROM " + CallSign + ";";
    List<Log> Logs = logService.Search(sql);
%>
<head>
    <title>LOG</title>
</head>
<body>
<center>
    <div style="height:300px; overflow:auto;">
        <table>
            <tr>
                <th>时间</th>
                <th>我的位置</th>
                <th>我的设备</th>
                <th>我的天线</th>
                <th>对方呼号</th>
                <th>通联频率(MHz)</th>
                <th>模式</th>
                <th>己方RST评价</th>
                <th>对方RST评价</th>
                <th>己方功率(W)</th>
                <th>对方功率(W)</th>
                <th>对方位置</th>
                <th>对方设备</th>
                <th>对方天线</th>
                <th>摘要</th>
                <th>QSL卡片</th>
                <th>操作</th>
            </tr>
            <%
                int num = Logs.size();
                for (int i = 0; i < num; i++) {
                    Log tmp = Logs.get(i);
            %>
            <tr>
                <th><%=tmp.getDATETIME()%>
                </th>
                <th><%=tmp.getMYQTH()%>
                </th>
                <th><%=tmp.getMYDEV()%>
                </th>
                <th><%=tmp.getMYANT()%>
                </th>
                <th><%=tmp.getOPCS()%>
                </th>
                <th><%=String.format("%.3f", tmp.getFREQ())%>
                </th>
                <th><%=tmp.getMODE()%>
                </th>
                <th><%=tmp.getMYRST()%>
                </th>
                <th><%=tmp.getOPRST()%>
                </th>
                <th><%=tmp.getMYPOWER()%>
                </th>
                <th><%=tmp.getOPPOWER()%>
                </th>
                <th><%=tmp.getOPQTH()%>
                </th>
                <th><%=tmp.getOPDEV()%>
                </th>
                <th><%=tmp.getOPANT()%>
                </th>
                <th><%=tmp.getABSTR()%>
                </th>
                <th><%=tmp.getQSL()%>
                </th>
                <th></th>
            </tr>
            <%}%>
        </table>
    </div>
    <form action="insert.jsp" method="post">
        <label>日期：</label>
        <select name="YEAR" id="YEAR" onchange="ChangeDay();">
            <%
                Date d = new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy");
                Integer year = Integer.parseInt(df.format(d));
                for (int i = 0; i < 100; i++) {
            %>
            <option value<%=year - i%>><%=year - i%>
            </option>
            <%}%>
        </select>
        <label>年</label>
        <select name="MONTH" id="MONTH" onchange="ChangeDay();">

            <%
                for (int i = 1; i <= 12; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <label>月</label>
        <select name="DAY" id="DAY"></select>
        <script>
            let first_keywords = {};
            //定义每个字母对应的第二个下拉框
            first_keywords[1] = 31;
            first_keywords[2] = 28;
            first_keywords[3] = 31;
            first_keywords[4] = 30;
            first_keywords[5] = 31;
            first_keywords[6] = 30;
            first_keywords[7] = 31;
            first_keywords[8] = 31;
            first_keywords[9] = 30;
            first_keywords[10] = 31;
            first_keywords[11] = 30;
            first_keywords[12] = 31;

            function ChangeDay() {
                var target1 = document.getElementById("YEAR");
                var target2 = document.getElementById("MONTH");
                var target3 = document.getElementById("DAY");
                var selectedYear = target1.options[target1.selectedIndex].value;
                var selectedMonth = target2.options[target2.selectedIndex].value;
                if ((selectedYear % 4 == 0 && selectedYear % 100 != 0) || (selectedYear % 400 == 0)) {
                    first_keywords[2] = 29;
                }
                while (target3.options.length) {
                    target3.remove(0);
                }
                var numOfDay = first_keywords[selectedMonth];

                for (var i = 1; i <= numOfDay; i++) {
                    var item = new Option(i.toString());
                    target3.options.add(item);
                }
            }
        </script>
        <label>日</label>
        <br>
        <label>时间：</label>
        <select name="HOUR" id="HOUR">
            <%
                for (int i = 0; i < 24; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <label>:</label>
        <select name="MINUTE" id="MINUTE">
            <%
                for (int i = 0; i < 60; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <label>:</label>
        <select name="SECOND" id="SECOND">
            <%
                for (int i = 0; i < 60; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <br>
        <label>我的位置：</label>
        <input id="MYQTH" type="text" name="MYQTH"><br/>
        <label>我的设备：</label>
        <input id="MYDEV" type="text" name="MYDEV"><br/>
        <label>我的天线：</label>
        <input id="MYANT" type="text" name="MYANT"><br/>
        <label>对方呼号：</label>
        <input id="OPCS" type="text" name="OPCS"><br/>
        <label>通联频率(MHz)：</label>
        <input id="FREQ" type="text" name="FREQ" οnkeyup="value=value.replace(/[^\-?\d.]/g,'')"><br/>
        <label>模式：</label>
        <select name="MODE" id="MODE">
            <option value="NFM">NFM</option>
            <option value="WFM">WFM</option>
            <option value="LSB">LSB</option>
            <option value="USB">USB</option>
            <option value="SSB">SSB</option>
            <option value="CW">CW</option>
            <option value="AM">AM</option>
            <option value="FM">FM</option>
            <option value="FSK">FSK</option>
            <option value="RTTY">RTTY</option>
            <option value="SSTV">SSTV</option>
        </select>
        <br>
        <label>己方RST评价：</label>
        <select name="MYR" id="MYR">
            <%
                for (int i = 1; i <= 5; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <label>R</label>
        <select name="MYS" id="MYS">
            <%
                for (int i = 1; i <= 9; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <label>S</label>
        <select name="MYT" id="MYT">
            <%
                for (int i = 1; i <= 9; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <label>T</label>
        <br>
        <label>对方RST评价：</label>
        <select name="OPR" id="OPR">
            <%
                for (int i = 1; i <= 5; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <label>R</label>
        <select name="OPS" id="OPS">
            <%
                for (int i = 1; i <= 9; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <label>S</label>
        <select name="OPT" id="OPT">
            <%
                for (int i = 1; i <= 9; i++) {
            %>
            <option value=<%=i%>><%=i%>
            </option>
            <%}%>
        </select>
        <label>T</label>
        <br>
        <label>己方功率(W)：</label>
        <input id="MYPOWER" type="text" name="MYPOWER" οnkeyup="value=value.replace(/[^\-?\d.]/g,'')"><br/>
        <label>对方功率(W)：</label>
        <input id="OPPOWER" type="text" name="OPPOWER" οnkeyup="value=value.replace(/[^\-?\d.]/g,'')"><br/>
        <label>对方位置：</label>
        <input id="OPQTH" type="text" name="OPQTH"><br/>
        <label>对方设备：</label>
        <input id="OPDEV" type="text" name="OPDEV"><br/>
        <label>对方天线：</label>
        <input id="OPANT" type="text" name="OPANT"><br/>
        <label>摘要：</label>
        <input id="ABSTR" type="text" name="ABSTR"><br/>
        <label>QSL卡片：</label>
        <select id="QSL" name="QSL">
            <option value="双方无需交换卡片">双方无需交换卡片</option>
            <option value="双方需要交换卡片">双方需要交换卡片</option>
            <option value="我的卡片已寄出尚未收到回卡">我的卡片已寄出尚未收到回卡</option>
            <option value="收到对方卡片而我的卡片未寄出">收到对方卡片而我的卡片未寄出</option>
            <option value="双方卡片均已妥收">双方卡片均已妥收</option>
        </select>
        <br>
        <input id="submit" type="submit" value="添加">
    </form>
</center>
</body>
</html>
