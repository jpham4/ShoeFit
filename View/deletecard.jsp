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
	 String CARD_NO=request.getParameter("CARD_NO");
String BILLAID=request.getParameter("BILLAID");
String cartsql = "Select aid from card_info where CARD_NO = ?";
PreparedStatement cartsqlpst = conn.prepareStatement(cartsql);
cartsqlpst.setString(1, CARD_NO);
ResultSet rscartsqlpst = cartsqlpst.executeQuery();
int j=0;
if(rscartsqlpst.next())
	j=rscartsqlpst.getInt("aid");
String user = (String)session.getAttribute("user");
String sql6 = "Update CARD_INFO set AID = null where CARD_NO = ?";
PreparedStatement pst6 = conn.prepareStatement(sql6);
String sql5= "Delete from customer_address where AID = ?";
PreparedStatement pst5 = conn.prepareStatement(sql5);
pst6.setString(1,CARD_NO);
pst5.setInt(1,j);
pst6.executeUpdate();
pst5.executeUpdate();
String sql4= "Delete from CARD_INFO where CARD_NO = ?";
PreparedStatement pst4 = conn.prepareStatement(sql4);
pst4.setString(1,CARD_NO);
pst4.executeUpdate();
if (BILLAID!=null){

}

String redirectURL = "customerinfo.jsp";
response.sendRedirect(redirectURL);
%>