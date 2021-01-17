
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="studentnodue.Databaseconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String regno=(String)session.getAttribute("regno");
//String sname=(String)session.getAttribute("sname");
%>
//<%	java.util.Date now = new java.util.Date();
//String date=now.toString();
//String DATE_FORMAT = "dd-MM-yyyy";
//SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
//String strDateNew = sdf.format(now) ; %>
<head><meta name="viewport" content="width=device-width"/>
<title>Govt.Polytechnic, Nashik </title>
<!-- STYLES & JQUERY 
================================================== -->
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/icons.css"/>
<link rel="stylesheet" type="text/css" href="css/skinblue.css"/><!-- Change skin color here -->
<link rel="stylesheet" type="text/css" href="css/responsive.css"/>
<script src="js/jquery-1.9.0.min.js"></script><!-- scripts at the bottom of the document -->
</head>
<style>
.title
{
	margin-left:23px;
	margin-top: 20px;
	width: 500px;
	top: 55px;
	color: black;
	font-size: 38px;
	line-height: 26px;
	height: 80px;
	overflow: hidden;
	font-family:sans-serif;
	text-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);
}
</style>
<body>
<div class="boxedtheme">
<!-- TOP LOGO & MENU
================================================== -->
<div class="grid">
	<div class="row space-bot">
		<!--Logo-->
		<div class="c4">
			 <header class="title" style="width:800px;margin-left:-30px;"><b>Govt.Polytechnic, Nashik</b></header>
		</div>
		<!--Menu-->
		<div class="c8">
			<nav id="topNav">
			<ul id="responsivemenu">
			<li><a href="student.jsp">Change Password</a></li>			
                            <li><a href="student.jsp">Logout</a></li>			
			</ul>
			</nav>
		</div>
	</div>
</div>
<!-- HEADER
================================================== -->
<div class="undermenuarea">
	<div class="boxedshadow">
	</div>
	<div class="grid">
		<div class="row">
			<div class="c8">
				<h1 class="titlehead">APPLY CERTIFICATE</h1>
			</div>
			<div class="c4">
				
			</div>
		</div>
	</div>
</div>
<!-- CONTENT
================================================== -->
<div class="grid">
		<div class="shadowundertop"></div>
		
		<div class="row space-top">
			<!-- CONTACT FORM -->
			<div class="c8 space-top">
				<h1 class="maintitle">
				
				</h1>
				<div class="wrapcontact">
					<div class="done">
						<div class="alert-box success ctextarea">
							<a href="" class="close"></a>
						</div>
					</div>
					
						<div class="form">
							<div class="c6 noleftmargin">
							<form name="f" action="upload.jsp" method="get" onsubmit="return valid()">
    	<table align="center" width="713" style="border:1px solid #d2d2d2;">
	<tr bgcolor="#C9C992">
	<td height="23" colspan="4" align="center" style="font-size:14px;">Update Password Here</td>
	</tr>
	<tr bgcolor="#FFFFCC" style="font-size:12px;">
	<td width="202" height="32" class="paragraping">Username</td>
	<td width="201" class="paragraping">Password</td>
	<td width="92" class="paragraping">Update</td>
	<td width="198" class="paragraping">Delete</td>
	</tr>
<%
					try
					{
						Connection conn=Databaseconnection.getconnection();
						Statement state=conn.createStatement();
						String str="select * from sdetail where sprn='"+regno+"'";
						ResultSet rs=state.executeQuery(str);
						while(rs.next())
						{
							
							%>
							<tr><td><%=rs.getString("regno") %></td>
							<td><%=rs.getString("rollno") %></td>
							
<% 
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					%>
                                        <tr style="font-size:12px;">
	
	<td height="41" class="paragraping"><% out.println(rs.getString("sprn"));%></td>
	
	<td class="paragraping"><% out.println(rs.getString("rollno"));%></td>
	
	<td><a onClick="update.jsp" href="update.jsp?<%=s1%>">Update</a></td>
	<td><a onClick="passdelete.jsp" href="passdelete.jsp?<%=s1%>">Delete</a></td>
	</tr>
	
	
		<%
			
	     }
		
	  
	}
	catch(SQLException e1)
	{
		out.println("Your given didn't match to our database");
		System.out.println(e1);
	
	 }

	finally
	{
	     st.close();
	      con.close();
	}
            %>
	
	</table>
       </form> 
        	
							</div>								
						</div>
					
					
				</div>
			</div>
			<div class="c4 space-top">
				<h1 class="maintitle">
				
				</h1>
				<p>
					
				</p>
				
			</div>
		</div>
</div><!-- end grid -->

<!-- FOOTER
================================================== -->
<div id="wrapfooter">
	<div class="grid">
		<div class="row" id="footer">
			<!-- to top button  -->
			<p class="back-top floatright">
				<a href="#top"><span></span></a>
			</p>
			<!-- 1st column -->
			
			<!-- 2nd column -->
			
			<!-- 3rd column -->
			
				
			<!-- 4th column -->
			
			<!-- end 4th column -->
		</div>
	</div>
</div>
<!-- copyright area -->

</div>
<!-- JAVASCRIPTS
================================================== -->
<!-- all -->
<script src="js/modernizr-latest.js"></script>

<!-- menu & scroll to top -->
<script src="js/common.js"></script>

<!-- cycle -->
<script src="js/jquery.cycle.js"></script>

<!-- twitter -->
<script src="js/jquery.tweet.js"></script>

<!-- contact form -->
<script src="js/contact.js"></script>

</body>
</html>