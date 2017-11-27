
<%@page  import="java.sql.*"%>
     <%
	 Class.forName("oracle.jdbc.driver.OracleDriver");
 String url = (String)session.getAttribute("url");
     String connuname = (String)session.getAttribute("connuname");
     String password = (String)session.getAttribute("password");
	 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:" + url,connuname,password);
	 
	 String sql = "SELECT lower(UNAME) UNAME FROM CUSTOMER where lower(UNAME)=?";
	 String USERNAME=request.getParameter("username");
	 String User=USERNAME.toLowerCase();
	 PreparedStatement st = conn.prepareStatement(sql);
	  st.setString(1,User);
     ResultSet rs = st.executeQuery();
     String Uname="";
	 while(rs.next()){
		  Uname=rs.getString("UNAME");
	 }
	 if(User.equals(Uname)){	 
	 
		  out.println("<font color=red>");
	  out.print("User already exists");
	  out.println("</font>");
	 }
	else 
	{
		  out.println("<font color=green>");
		out.print("Username Available");
		 out.println("</font>");
	}
	%> 
