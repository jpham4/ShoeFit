<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> ShoeFit </title>
</head>
 <link rel="stylesheet" href="style.css">
<body>
<%@page  import="java.sql.*"%>
<% 
Class.forName("oracle.jdbc.driver.OracleDriver");
session.setAttribute("url","(Source of database)"); //@localhost:
session.setAttribute("connuname","(Username)");
session.setAttribute("password","(Password)");
String url = (String)session.getAttribute("url");
String connuname = (String)session.getAttribute("connuname");
String password = (String)session.getAttribute("password");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:" + url,connuname,password);
if(session.getAttribute("user")!=null)
	 session.invalidate();
Statement st = conn.createStatement();
String sql = "select state_name from states where state_name in('Illinois','Arizona','New York')";
ResultSet rs = st.executeQuery(sql);
try{
		%>
		<form action="category.jsp" method="post">
		<button type="button" style="float:right;margin-right:50px;margin-top:50px" onclick="window.location.href='login.jsp'"> LogIn / SignUp </button>
		<div>
		<img src = "images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px" />
		</div>
		<center><div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<a><font size="4.5">Select State :  </font></a><select  style="width:200px" name="sel" id="sel">
	<%
	while(rs.next()){
	%>
		<option> <%out.print(rs.getString("STATE_NAME")); %></option>
	<%
	}
	}
catch (SQLException e){
}
rs.close();
conn.close();
st=null;
rs=null;
conn=null;
	%>
</select>
<input type="submit" value="GO"></div></form><br/><br/><br/>
<img src = "images/untitled.png" width="400" height = "300"/>
</center>
</body>
</html>

