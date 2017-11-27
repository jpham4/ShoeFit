
<%@page  import="java.sql.*"%>
     <%
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	  String url = (String)session.getAttribute("url");
     String connuname = (String)session.getAttribute("connuname");
     String password = (String)session.getAttribute("password");
	 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:" + url,connuname,password);
	 //Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","Atos123");
	 String sql = "SELECT lower(email_id) email_id FROM CUSTOMER where lower(email_id)=?";
	 String EmailID=request.getParameter("EmailID");
	 String Email=EmailID.toLowerCase();
	 String Em="";
	 PreparedStatement st = conn.prepareStatement(sql);
	  st.setString(1,Email);
     ResultSet rs = st.executeQuery();
	 while(rs.next()){
		  Em=rs.getString("email_id");
	 }
	 if(Email.equals(Em)){	 
		  out.println("<font color=red>Email id is already used</font>");
	 }
	else 
	{
		  out.println("");
	}
	%> 