<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String preference = request.getParameter("preference");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		session.putValue("userid", email);

		String url = "jdbc:mysql://localhost:3307/apparel";
		String userName = "root";
		String userPassword = "jd7325sp";

		Class.forName("com.mysql.cj.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection(url, userName, userPassword);

		Statement st = con.createStatement();
		ResultSet rs;
		int i = st.executeUpdate("insert into info values ('" + email + "','" + password + "','" + fname + "',	'"
				+ lname + "','" + gender + "','" + preference + "')");

		out.println("Registered");
	%>
	<a href="Login.html">Login</a>
	<br />
	<br />
	<a href="index.html">Home</a>

</body>
</html>