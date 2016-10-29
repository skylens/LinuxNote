# It's about jsp !

+ 安装 openjdk-8 及 tomcat8

```
$ sudo apt-get install openjdk-8-jdk openjdk-8-jre
$ sudo apt-get install tomcat8
```

+ 安装 mysql

```
# apt-get install mysql-client-5.5 mysql-server-5.5
```

+ tomcat8 的配置文件所在目录

```
# cd /var/lib/tomcat8/webapps/ROOT/     //放网页的目录
# cp mysql-connector-java-5.1.39-bin.jar /usr/share/tomcat8/lib/      //复制 mysql jdbc驱动到lib目录,以便于 jsp 连接数据库
# /etc/init.d/tomcat8 restart   //添加了 mysql jdbc驱动, 需要重启 tomcat8 服务, 否则不生效
```

+ 更改 ROOT 目录得所属者和所属组

```
# pwd 
/var/lib/tomcat8/webapps/
# chown -R tomcat8:tomcat8 ROOT/
```

+ jsp 连接 mysql 操作

```
# vim jspconnectmysql.jsp
<%@ page contentType="text/html;charset=utf-8" %>
...
<%page import="java.util.*"%>
<%page import="java.sql.*"%>
...
<%
		request.setCharacterEncoding("utf-8");
		String driverName="com.mysql.jdbc.Driver";
		String dbURL="jdbc:mysql://localhost:3306/jsp";
		String userName="root";
		String userPwd="123456";
		String sql;
		Statement stmt;

		Class.forName(driverName);
		Connection dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
		stmt=dbConn.createStatement(); // 得到Statement对象
		sql="select * from us where uid='" + teacherNumber + "' and upass='" + teacherPasswd + "'";
		ResultSet rs=stmt.executeQuery(sql); // 通过SQL查询得到结果集
    if(rs.next()){ // 从结果集中获取学生信息并输出，可选择需要信息输出
			  response.sendRedirect("teachersuccess.jsp");//成功跳转
     }else{
        response.sendRedirect("index.jsp");//失败跳转
     }
	%>

```

+ 安装 php 及 mysql

```
$ sudo aptitude install php5 php5-mysql libapache2-mod-php5
$ sudo aptitude install mysql-server mysql-client
```
