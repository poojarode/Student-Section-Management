<%-- 
    Document   : passdb
    Created on : Mar 29, 2019, 2:38:27 PM
    Author     : lenovo
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="studentnodue.Databaseconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int roll=Integer.parseInt(request.getParameter("roll"));
             String branch=request.getParameter("branch");
             String dob=request.getParameter("dob");
              String mb=request.getParameter("mb");
                 String pass=request.getParameter("pass");
              

try{
	/* Connection con=Databaseconnection.getconnection(); */
	Connection con=Databaseconnection.getconnection();
	 PreparedStatement pstmt=null; //create statement  
  
  pstmt=con.prepareStatement("update sdetail set password=? where roll='"+roll+"' && dob='"+dob+"' && branch='"+branch+"'"); //sql update query 
  pstmt.setString(1,pass);
  //pstmt.setInt(2,roll);
  //pstmt.setString(3,dob);
   //pstmt.setString(4,branch);
  int a=pstmt.executeUpdate(); //execute query
  
     if(a>0)
	{%>
	 <script>
	 alert("Password updated successfully");
	 window.location="student.jsp";
	 </script> 
        <% 	}
	else
	{%>
	 <script>
	 alert("Something went wring");
	 window.location="password.jsp";
	 </script>
         <% 	}
 con.close(); //connection close
}
catch(Exception  x)
{
x.printStackTrace();
}

%>
            <%  try
{
	/* Connection con=Databaseconnection.getconnection(); */
	Connection con=Databaseconnection.getconnection();
	String query="insert into sdetail(mb,password) values('"+mb+"','"+pass+"') where rollno='"+roll+"'";
	Statement sta=con.createStatement();
	int x=sta.executeUpdate(query);
 }
catch(Exception  x)
{
x.printStackTrace();
}
        %>
    </body>
</html>
