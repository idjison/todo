<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<%
	Statement stmt = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/todos?serverTimezone=UTC", "root", "cs1234");

	
	stmt = conn.createStatement();
	if(stmt.execute("select * from todo")){
		rs = stmt.getResultSet();
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ji's todos</title>
</head>
<body>
<div align = "center">
<h1>ji's todos</h1>
<hr>

<%
	while(rs.next()){
		out.println(rs.getInt("id") + " : " + rs.getString("item") + "<br>");
	}
	rs.close();
	stmt.close();
	conn.close();
%>


<br>
<form name = "todoForm" method = "post" action = "write.jsp">
<input type = "text" name = "todo-item" size = "20" ></input>
<input type = "submit" value = "�ۼ�"></input>
</form>
<br>
<form name = "delete" method = "post" action = "delete.jsp">
<input type = "submit" name = "delete" value = "��� ����"></input>
</form>
</div>
</body>
</html>