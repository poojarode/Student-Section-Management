<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="studentnodue.Databaseconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String status1="pending"; 
    String aa="Leaving Certificate";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta name="viewport" content="width=device-width"/>
<title>Salique Theme Multipurpose Responsive </title>
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
table
{
	width: 100%;
	height: auto;
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
			<header class="title" style="width:800px;margin-left:-30px;"><b>Govt. Polytechnic, Nashik</b></header>
		</div><br><br>
		<!--Menu-->
		<div class="c8">
			<nav id="topNav">
			<ul id="responsivemenu">
				<li><a href="adminpage.jsp">Student</a></li>
				<li><a href="bonafide.jsp">Bonafide Certificate </a></li>
				<li><a href="leaving.jsp">Leaving Certificate </a></li>
				<li><a href="passing.jsp">Passing Certificate </a></li>
				<li><a href="admin.jsp">Logout</a></li>
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
				<h1 class="titlehead">Leaving Certificate</h1>
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
		
		
					
					<table>
					<tr><th>Register Number</th><th>Student Name</th><th>Certification</th><th>Application Purpose</th><th>Date</th><th>Status</th><th>Action</th></tr>
					<%
					try
					{
						Connection conn=Databaseconnection.getconnection();
						Statement state=conn.createStatement();
						String str="select * from application_details where status='"+status1+"' and certificate_type='"+aa+"' ";
						ResultSet rs=state.executeQuery(str);
						while(rs.next())
						{
							
							%>
							<tr><td><%=rs.getString("regno") %></td>
							<td><%=rs.getString("sname") %></td>
							<td><%=rs.getString("certificate_type") %></td>
							<td><%=rs.getString("application_purpose") %></td>
							<td><%=rs.getString("date") %></td>
							<td><%=rs.getString("status") %></td>
							<td><a href="generate_leaving.jsp?regno=<%=rs.getString("regno") %>">Generate Certificate</a></td></tr>
							<%
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					%>
					</table>
				
			</div>
			<div class="c4 space-top">
				<h1 class="maintitle">
				
				</h1>
				<p>
					
				</p>
				
			</div>
		</div>
<!-- end grid -->

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