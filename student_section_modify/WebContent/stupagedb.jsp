<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="studentnodue.Databaseconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String a=request.getParameter("regno");
String b=request.getParameter("sname");
String b1=request.getParameter("certificate_type");
String c=request.getParameter("appliaction_purpose");
String d=request.getParameter("date");
String s=request.getParameter("syear");
String e="pending";
try
{
	
	Connection con=Databaseconnection.getconnection();
	String query="insert into application_details(regno,sname,certificate_type,application_purpose,date,status) values('"+a+"','"+b+"','"+b1+"','"+c+"','"+d+"','"+e+"')";
	Statement sta=con.createStatement();
	int x=sta.executeUpdate(query);
	if(x>0)	
	{%>
	 <script>
	 alert("Application Request Send Successfully");
	 window.location="stupage.jsp";
	 </script>
		

<% 	}
	else
	{%>
		 <script>
	 alert("Application Request Send Error");
	 window.location="stupage.jsp";
	 </script>
		
<% 	}
}
catch(Exception  x)
{
x.printStackTrace();
}

%>
</body>
</html>