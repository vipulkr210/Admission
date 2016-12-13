

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String check=request.getParameter("check");
String username=request.getParameter("username");
String password=request.getParameter("password");

try{
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Class Obtained");
Connection con=DriverManager.getConnection("jdbc:mysql:///vkgc","root","root");
System.out.println("Connection Obtained");
Statement st=con.createStatement();
String sql="Select * from user_login where ";
ResultSet rs=st.executeQuery(sql);
while(rs.next()){
	
}


}
catch(Exception e){
	e.printStackTrace();
}




%>