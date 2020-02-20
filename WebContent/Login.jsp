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
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");

		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3307/apparel";
		String userName = "root";
		String userPassword = "jd7325sp";

		java.sql.Connection con = DriverManager.getConnection(url, userName, userPassword);

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from info where uemail='" + email + "'");

		if (rs.next()) {
			if (rs.getString(2).equals(pwd)) {
				String[] id = email.split("@");
				out.println("Welcome " + id[0] + "<br/> <br/>");

				String gender = rs.getString(5);
				String preference = rs.getString(6);

				ResultSet resultSet;
				if (preference.equalsIgnoreCase("new arrival"))
					resultSet = st.executeQuery(
							"select * from clothes where gender='" + gender + "' order by preference desc");
				else
					resultSet = st.executeQuery(
							"select * from clothes where gender='" + gender + "' order by preference");

				while (resultSet.next()) {
					out.println(
							resultSet.getString(1) + " | " + resultSet.getString(2) + " | " + resultSet.getString(3)
									+ " | " + resultSet.getString(5) + " | " + resultSet.getString(6) + "<br/>");
				}

			} else {
				out.println("Invalid password try again");
			}
		} else {
			out.println("Email Id not Registered");
		}
	%>
	</br>
	</br>
	<a href="index.html">Home</a>
</body>
</html>