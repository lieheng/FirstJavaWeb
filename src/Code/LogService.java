package Code;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LogService {
    String username = null;
    String password = null;
    String url = "jdbc:mysql://localhost:3306/QSOLOG?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";


    String CallSign = null;

    Connection connection = null;
    Statement statement = null;

    public boolean Connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);// 建立连接到数据库的连接。
            if (connection == null) {
                return false;
            }
            statement = connection.createStatement();// 创建一个Statement对象，用于将SQL语句发送到数据库。
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public List<String> getTableName() {
        List<String> res = new ArrayList<String>();
        try {
            DatabaseMetaData databaseMetaData = connection.getMetaData();
            ResultSet rs = databaseMetaData.getTables(connection.getCatalog(), null, null, null);
            while (rs.next()) {
                String tableName = rs.getString("TABLE_NAME"); //表名
                res.add(tableName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return res;
    }

    public List<Log> Search(String sql) {
        List<Log> res = new ArrayList<Log>();
        try {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String DATETIME = resultSet.getString("DATETIME");
                DATETIME = DATETIME.substring(0, DATETIME.length()-2);
                String MYQTH = resultSet.getString("MYQTH");
                String MYDEV = resultSet.getString("MYDEV");
                String MYANT = resultSet.getString("MYANT");
                String OPCS = resultSet.getString("OPCS");
                Float FREQ = resultSet.getFloat("FREQ");
                String MODE = resultSet.getString("MODE");
                Integer MYRST = resultSet.getInt("MYRST");
                Integer OPRST = resultSet.getInt("OPRST");
                Float MYPOWER = resultSet.getFloat("MYPOWER");
                Float OPPOWER = resultSet.getFloat("OPPOWER");
                String OPQTH = resultSet.getString("OPQTH");
                String OPDEV = resultSet.getString("OPDEV");
                String OPANT = resultSet.getString("OPANT");
                String ABSTR = resultSet.getString("ABSTR");
                String QSL = resultSet.getString("QSL");
                res.add(new Log(DATETIME, MYQTH, MYDEV, MYANT, OPCS, FREQ, MODE, MYRST, OPRST, MYPOWER, OPPOWER, OPQTH, OPDEV, OPANT, ABSTR, QSL));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return res;
    }

    public boolean Insert(String sql) {
        try {
            if (statement.executeUpdate(sql) >= 1)
                return true;
            else
                return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setCallSign(String callSign) {
        CallSign = callSign;
    }

    public String getCallSign() {
        return CallSign;
    }

}
