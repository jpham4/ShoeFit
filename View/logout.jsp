<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Logout</title>
</head>
<body>
<img src = "images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px" />
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<center><font color ="red" size="5"><a> You have logged out Successfully </a></font><br/><br/><br/>
<%

		session.invalidate();
%>
<font color="green" size="4"><b><a href="login.jsp"> Login </a></b></font><br/><br/><br/>
<font color="green" size="4"><b><a href="main.jsp"> Home </a></b></font>
</center>
<body>
<html>