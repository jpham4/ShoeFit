<%@page  import="java.sql.*"%>
     <%
	 Class.forName("oracle.jdbc.driver.OracleDriver");
     session.setAttribute("url","@fourier.cs.iit.edu:1521:orcl");
     session.setAttribute("connuname","tpradhan1");
     session.setAttribute("password","YCsBUo3...uK3Z17");
     String url = (String)session.getAttribute("url");
     String connuname = (String)session.getAttribute("connuname");
     String password = (String)session.getAttribute("password");
	 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:" + url,connuname,password);
	 String sql = "SELECT lower(UNAME) UNAME,PSWD FROM STAFF where lower(UNAME)=?";
	 String USERNAME=request.getParameter("username");
	 String User=USERNAME.toLowerCase();
	 String PASSWORD=request.getParameter("password");
	 PreparedStatement st = conn.prepareStatement(sql);
	 st.setString(1,User);
     ResultSet rs = st.executeQuery();
     String Uname="";
     String PWD ="";
	 while(rs.next()){
		  Uname=rs.getString("UNAME");
		  PWD = rs.getString("PSWD");
	 }
	 if(User.equalsIgnoreCase(Uname) && PASSWORD.equals(PWD)){	
     session.setAttribute("user",User);	 
	 String redirectURL = "modifyproducts.jsp";
     response.sendRedirect(redirectURL);
	 }
	else 
	{
		out.println("<font color=red>");
		out.print("Invalid credentials....Redirecting to login page");%>
		<meta http-equiv="refresh" content="2; url=stafflogin.jsp" />
		 <%out.println("</font>");
	}
	%> 