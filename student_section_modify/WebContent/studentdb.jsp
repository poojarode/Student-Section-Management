<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="studentnodue.Databaseconnection"%>
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
String a=request.getParameter("roll");
String b=request.getParameter("name");

String id=null,regno=null,sname=null;
try 
{
	
Connection con = Databaseconnection.getconnection();
PreparedStatement ps=con.prepareStatement("select * from sdetail where rollno='"+a+"' && fname='"+b+"' " );
ResultSet rs=ps.executeQuery();
if(rs.next())
	{
	id=rs.getString("id");
	regno=rs.getString("rollno");
	session.setAttribute("regno", regno);
	sname=rs.getString("full_name");
	session.setAttribute("sname", sname);
	response.sendRedirect("stupage.jsp?success");
	//out.print(name2);
	}
	else
	{
	out.println("enter correct student name and register number!!!");
	}
	

}
catch(Exception e2){
	out.println(e2.getMessage());
}
%>
</body>
</html>