<html>
<body>	

	
	<%@page  import="java.sql.*"%>
     <%
	 Class.forName("oracle.jdbc.driver.OracleDriver");
session.setAttribute("url","(Source of the database)");
session.setAttribute("connuname","(Username");
session.setAttribute("password","(Password)");
String url = (String)session.getAttribute("url");
String connuname = (String)session.getAttribute("connuname");
String password = (String)session.getAttribute("password");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:" + url,connuname,password); 
	 String sql = "SELECT lower(UNAME) UNAME,PSWD FROM CUSTOMER where lower(UNAME)=?";
	 String sql2 = "SELECT distinct lower(state_name) state_name  FROM CUSTOMER c, customer_address ca,states s where c.cid= ca.cid and s.state_code= ca.state_code and lower(UNAME)=?";
	 String USERNAME=request.getParameter("username");
	 String User=USERNAME.toLowerCase();
	 String PASSWORD=request.getParameter("password");
	 PreparedStatement st = conn.prepareStatement(sql);
	 PreparedStatement st2 = conn.prepareStatement(sql2);
	 st.setString(1,User);
	 st2.setString(1,User);
     ResultSet rs = st.executeQuery();
	  ResultSet rs2 = st2.executeQuery();
     String Uname="";
     String PWD ="";
	 while(rs.next()){
		  Uname=rs.getString("UNAME");
		  PWD = rs.getString("PSWD");
	 }
	 if(User.equals(Uname) && PASSWORD.equals(PWD)){	
     if(rs2.next()){
	 session.setAttribute("user",User);
	 session.setAttribute("state",rs2.getString("state_name"));	 
	 String redirectURL = "category.jsp";
     response.sendRedirect(redirectURL);
	 }
	 }
	else 
	{%>
<%
		out.println("<font color=red>");
		out.print("Invalid credentials.....Redirecting.......");
		session.invalidate();
		 out.println("</font>");
	%> 
	<meta http-equiv="refresh" content="2; url=login.jsp" />
	<%}%>
	
	</body>
	</html>
