<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="studentnodue.Databaseconnection"%>
<%@page import="java.sql.Connection"%>
    <% String regno=request.getParameter("regno");
    session.setAttribute("regno", regno);
    String sname=null,ctype=null,purpose=null,date=null,cname=null,bname=null;
    %>
  
					<%
					try
					{
						Connection conn=Databaseconnection.getconnection();
						Statement state=conn.createStatement();
						String str="select * from application_details where regno='"+regno+"' ";
						ResultSet rs=state.executeQuery(str);
						while(rs.next())
						{
							sname=rs.getString("sname");
							ctype=rs.getString("certificate_type");
							purpose=rs.getString("application_purpose");
							date=rs.getString("date");
							
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					%>
                                       <%
					try
					{
						Connection conn1=Databaseconnection.getconnection();
						Statement state1=conn1.createStatement();
						String str1="select * from sdetail where rollno='"+regno+"' ";
						ResultSet rs1=state1.executeQuery(str1);
						while(rs1.next())
						{
							
							//cname=rs1.getString("course");
							bname=rs1.getString("studying_year");
							cname=rs1.getString("branch");
							//shift=rs1.getString("shift");
							
						}
					}
					catch(Exception e1)
					{
						e1.printStackTrace();
					}
					%>
					
				
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
<script type="text/javascript">
function validate() {
	var a=document.form.regno.value;
	var b=document.form.name.value;
	var c=document.form.lab.value;
	var d=document.form.sport.value;
	var e=document.form.libb.value;
	var f=document.form.admin.value;
	var g=document.form.acco.value;
	
	if(a=="" || a==null)
		{
			alert("enter reg no pls...");
			a.focus();
			return false;
		}
	else if(b=="" || b==null)
		{
			alert("enter name pls...");
			b.focus();
			return false;
		}
	else if(document.form.dept.selectedIndex=="")
	{
		alert ( "Please select dept!");
		return false;
	}
	else if(document.form.year.selectedIndex=="")
	{
		alert ( "Please select year!");
		return false;
	}
	else if(document.form.sem.selectedIndex=="")
	{
		alert ( "Please select sem!");
		return false;
	}
	else if(c=="" || c==null)
	{
		alert("enter lab fee...");
		c.focus();
		return false;
	}
	else if(d=="" || d==null)
	{
		alert("enter sport fee...");
		d.focus();
		return false;
	}
	else if(e=="" || e==null)
	{
		alert("enter library fee...");
		e.focus();
		return false;
	}
	else if(f=="" || f==null)
	{
		alert("enter admin fee...");
		f.focus();
		return false;
	}
	else if(g=="" || g==null)
	{
		alert("enter account fee...");
		g.focus();
		return false;
	}
}
</script>
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
			<header class="title" style="width:800px;margin-left:-30px;"><b>College Student Section Management</b></header>
		</div><br>
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
				<h1 class="titlehead">Bonafide Certificate</h1>
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
							<!--  <a href="" class="close">x</a> -->
						</div>
					</div>
					<form action="bonafidedb.jsp" method="post" name="form" id="contactform" onsubmit="return validate()">
						<div class="form">
							<div class="c6 noleftmargin">
							
								<label>Centre</label>
                                                                <input type="text" name="centre" value="Govt. Polytechnic, Nashik" readonly required>
								<label>Appln.for:</label>
								<input type="text" name="ctype" value="<%=ctype%>" readonly>
								<label>Session:</label>
<!--								<input type="text" name="session_year" required>-->
                                                                <select name="session_year" size="1" required >
                                                                     <option>2017-2018</option>
                                                                     <option>2018-2019</option>
                                                                     <option>2020-2021</option>
                                                                </select>
								<label>Student Name</label>
								<input type="text" name="sname" value="<%=sname %>" readonly>
								
							</div>
							<div class="c6 noleftmargin">
							
								<label>Studying Year</label>
                                                                <input type="text" name="syear" value="Third year" readonly> 
                                                                    <label>Course</label>
                                                                <input type="text" name="course" value="<%=cname %>" readonly>    
                                                               <label>Purpose of Application</label>
								<input type="text" name="application_purpose" value="<%=purpose%>" readonly>
                                                                       
							    <label>Remark</label>
								<input type="text" name="remark" required>
							</div>
							
							<input type="submit" class="button" style="font-size:12px;" value="submit">	
							<input type="reset" class="button" style="font-size:12px;" value="reset">													
						</div>
					</form>
				</div>
			</div>
			<div class="c4 space-top">
				<h1 class="maintitle">
				
				</h1>
				
				
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