<%@ page import="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspproject", "root", "");
	Statement st = con.createStatement();
	Statement stmt = con.createStatement();	
%>
