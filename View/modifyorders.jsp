<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>ShoeFit</title> </head> <body>
<%@page  import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
 String url = (String)session.getAttribute("url");
     String connuname = (String)session.getAttribute("connuname");
     String password = (String)session.getAttribute("password");
	 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:" + url,connuname,password);
String pname=request.getParameter("pname");
String order_id=request.getParameter("order_id");
String DATE_DEL=request.getParameter("DATE_DEL");
String STATUS=request.getParameter("STATUS");
String user = (String)session.getAttribute("user");
String user_lower = user.toLowerCase();
String sql4= "UPDATE Orders set DATE_DELIVERED=?,STAFF_ID=(select sid from staff where lower(UNAME)=?),Status=? where order_id=?";
PreparedStatement pst4 = conn.prepareStatement(sql4);
pst4.setString(1,DATE_DEL);
pst4.setString(2,user_lower);
pst4.setString(3,STATUS);
pst4.setString(4,order_id);
pst4.executeUpdate();
String redirectURL = "processorders.jsp";
response.sendRedirect(redirectURL + "?id=" + STATUS);
%>