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
	 String STATE=request.getParameter("STATE");
String PNAME=request.getParameter("PNAME");
PNAME=PNAME.toLowerCase();
String WID=request.getParameter("WID");
String Quantity=request.getParameter("Quantity");
String REM_CAPACITY = request.getParameter("REM_CAPACITY");
String PSIZE = request.getParameter("PSIZE");
String orgqty = request.getParameter("orgqty");
int psize = Integer.parseInt(PSIZE);
int qtynew = Integer.parseInt(Quantity);
int qty1 = psize*qtynew;
int orgqty_int = Integer.parseInt(orgqty);
int diff = qty1 - orgqty_int;
int qty2 = Integer.parseInt(REM_CAPACITY);
if(diff>qty2){
String msg= "Entered Stock quantity exceeds warehouse capacity";
String redirectURL = "managestock.jsp";
response.sendRedirect(redirectURL + "?id=" + STATE + "&msg=" + msg);
		}
else{
String sql4= "UPDATE Stock set Quantity=? where PID=(select PID from products where lower(PNAME)=?) and WID=?";
PreparedStatement pst4 = conn.prepareStatement(sql4);
pst4.setString(1,Quantity);
pst4.setString(2,PNAME);
pst4.setString(3,WID);
pst4.executeUpdate();
String redirectURL = "managestock.jsp";
response.sendRedirect(redirectURL + "?id=" + STATE);
}
%>