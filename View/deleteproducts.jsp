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
String STATE = request.getParameter("STATE");
String state_lower = STATE.toLowerCase();
String sql4= "delete from PRODUCT_PRICE where PID=? and STATE_CODE =(select STATE_CODE from states where lower(state_name)=?)";
PreparedStatement pst4 = conn.prepareStatement(sql4);
pst4.setString(1,PID);
pst4.setString(2,state_lower);
pst4.executeUpdate();
String redirectURL = "modifyproducts.jsp";
response.sendRedirect(redirectURL + "?id=" + STATE);
%>