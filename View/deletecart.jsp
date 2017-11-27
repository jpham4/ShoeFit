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
String PID=request.getParameter("PID");
String user = (String)session.getAttribute("user");
String sql4= "delete from CART where CID=(select CID from CUSTOMER where lower(UNAME)=?) and PID=?";
PreparedStatement pst4 = conn.prepareStatement(sql4);
pst4.setString(1,user);
pst4.setString(2,PID);
pst4.executeUpdate();
String redirectURL = "cart_view.jsp";
response.sendRedirect(redirectURL);
%>