<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="studentnodue.Databaseconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String regno=(String)session.getAttribute("regno");
    String sname=null,ctype=null,purpose=null,date=null,r=null;%>
    <%
					try
					{
						Connection conn=Databaseconnection.getconnection();
						Statement state=conn.createStatement();
						String str="select * from application_details where regno='"+regno+"' ";
						ResultSet rs=state.executeQuery(str);
						while(rs.next())
						{
							
							date=rs.getString("date");
                                                        r=rs.getString("status");
							
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String a=request.getParameter("centre");
String b=request.getParameter("ctype");
String b1=request.getParameter("session_year");
String c=request.getParameter("sname");
String d=request.getParameter("application_purpose");
String e=request.getParameter("remark");
String f=request.getParameter("course");
String f1=request.getParameter("syear");
String g=request.getParameter("progress");
String h=request.getParameter("conduct");
String i=request.getParameter("leaving_date");
try
{
	/* Connection con=Databaseconnection.getconnection(); */
	Connection con=Databaseconnection.getconnection();
	String query="insert into leaving(regno,sname,certificate_type,application_purpose,date,centre,session_year,studying_year,progress,conduct,leaving_date,remark) values('"+regno+"','"+c+"','"+b+"','"+d+"','"+date+"','"+a+"','"+b1+"','"+f1+"','"+g+"','"+h+"','"+i+"','"+e+"')";
	Statement sta=con.createStatement();
	int x=sta.executeUpdate(query);
	
		
	
}
catch(Exception  x)
{
x.printStackTrace();
}

%>
<%
String s11="Approve";
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
PreparedStatement ps=conn.prepareStatement("update application_details set status='"+s11+"' where regno='"+regno+"'");
ps.executeUpdate();
response.sendRedirect("leavingpdf.jsp");
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
</body>
</html>