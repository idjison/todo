<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
   
<%
	Statement stmt = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/todos?serverTimezone=UTC", "root", "id*2041427");
	String item = request.getParameter("delete");
	String sql = "delete from todo";  
	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	sql = "alter table todo auto_increment = 1";  
	stmt.executeUpdate(sql);
	
	response.sendRedirect("todo.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	insert <%= item %>!!
</body>
</html>