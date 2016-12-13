<%@page import="java.sql.Statement"%>
<%@page import="connection.MyConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String sql="create table user(id int(11) primary key not null auto_increment,department varchar(255),email varchar(255),name varchar(255),password varchgar(255),username varchar(255),type varchar(255), mobile varchar(10))";
MyConnection mc=new MyConnection();
mc.connect();
Statement st=mc.con.createStatement();
st.executeUpdate(sql);
//String s="insert into ()"
%>
</body>
</html>