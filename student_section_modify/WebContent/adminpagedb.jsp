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
String a=request.getParameter("sprn");
String b=request.getParameter("rollno");
String b1=request.getParameter("full_name");
String c=request.getParameter("fname");
String d=request.getParameter("middle_name");
String e=request.getParameter("lname");
String f=request.getParameter("course");
String g=request.getParameter("mother_name");
String h=request.getParameter("email");
String i=request.getParameter("birth_place");
String j=request.getParameter("last_college");
String k=request.getParameter("religion");
String l=request.getParameter("sub_caste");
String m=request.getParameter("address");
String n=request.getParameter("enrollment");
String o=request.getParameter("branch");
String p=request.getParameter("shift");
String q=request.getParameter("mobile");
String r=request.getParameter("dob");
String s=request.getParameter("adate");
String t=request.getParameter("nationality");
String u=request.getParameter("caste");
String v=request.getParameter("category");
String w=request.getParameter("tc_caste");
try
{
	/* Connection con=Databaseconnection.getconnection(); */
	Connection con=Databaseconnection.getconnection();
	String query="insert into sdetail(sprn,rollno,full_name,fname,middle_name,last_name,course,mother_name,emailid,birth_place,last_college,religion,sub_caste,address,enrollment,branch,shift,mobile,dob,date_of_admission,nationality,caste,category,caste_tc) values('"+a+"','"+b+"','"+b1+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+i+"','"+j+"','"+k+"','"+l+"','"+m+"','"+n+"','"+o+"','"+p+"','"+q+"','"+r+"','"+s+"','"+t+"','"+u+"','"+v+"','"+w+"')";
	Statement sta=con.createStatement();
	int x=sta.executeUpdate(query);
	if(x>0)	
	{%>
		
		<script>
		alert("Student Details Upload Successfully");
		window.location="adminpage.jsp";
		</script>

<% 	}
	else
	{%>
		<script>
		alert("Student Details Upload Error");
		window.location="adminpage.jsp";
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