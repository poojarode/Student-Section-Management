<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta name="viewport" content="width=device-width"/>
<title>Govt.Polytechnic, Nashik</title>
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
			<header class="title" style="width:800px;margin-left:-30px;"><b>Govt.Polytechnic, Nashik</b></header>
                </div><br><br>
		<!--Menu-->
		<div class="c8">
			<nav id="topNav">
			<ul id="responsivemenu">
				<li><a href="adminpage.jsp">Student</a></li>
				<li><a href="bonafide.jsp">Bonafide Certificate </a></li>
				<li><a href="leaving.jsp">Leaving Certificate </a></li>
				<li><a href="passing.jsp">Caste Verification</a></li>
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
				<h1 class="titlehead">STUDENT DETAILS</h1>
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
					<form action="adminpagedb.jsp" method="post" name="form" id="contactform" onsubmit="return validate()">
						<div class="form">
							<div class="c6 noleftmargin">
							
								<label>Student PRN:</label>
								<input type="text" name="sprn" required>
								<label>Password:</label>
								<input type="text" name="rollno" required>
								<label>Full Name:</label>
								<input type="text" name="full_name" required>
								<label>First Name:</label>
								<input type="text" name="fname" required>
								<label>Middle Name:</label>
								<input type="text" name="middle_name" required>
                                                                <label>Last Name:</label>
								<input type="text" name="lname" required>
								<label>Course Year:</label>
                                                                <select name="course" size="1" required>
                                                                     <option>First Year</option>
                                                                     <option>Second Year</option>
                                                                     <option>Third Year</option>
                                                                </select>
								<!--<input type="text" name="course" required>-->	
								<label>Mother Name:</label>
								<input type="text" name="mother_name" required>	
								<label>Email:</label>
								<input type="email" name="email" required>
								<label>Place of Birth:</label>
								<input type="text" name="birth_place" required>
								<label>Last College/School Attended:</label>
								<input type="text" name="last_college" required>
								<label>Religion</label>
                                                                <select name="religion" size="1" required>
                                                                     <option>Hindu</option>
                                                                     <option>Muslim</option>
                                                                     <option>Jain</option>
                                                                     <option>Christan</option>
                                                                     <option>Other</option>
                                                                 </select>
                
                                                                <!--<input type="text" name="religion" required>-->
								
							</div>
							<div class="c6 noleftmargin">
							    <label>Sub Caste:</label>
								<input type="text" name="sub_caste" required>
								<label>Address:</label>
								<input type="text" name="address" required>
								<label>Enrollment No:</label>
								<input type="text" name="enrollment" required>
								<label>Branch:</label>
								 <select name="branch" size="1" required>
                                                                     <option>Computer Technology</option>
                                                                     <option>Electrical</option>
                                                                     <option>Information Technology</option>
                                                                     <option>Chemical</option>
                                                                     <option>Civil</option>
                                                                     <option>Mechanical</option>
                                                                     <option>Electronics & Telecommunication</option>
                                                                     <option>Automobile</option>
                                                                 </select>
                                                                <!--<input type="text" name="branch" required>-->
								<label>Shift:</label>
                                                                <select name="shift" size="1" required>
                                                                     <option>1st Shift</option>
                                                                     <option>2nd Shift</option>
                                                                 </select>
								<!--<input type="text" name="shift" required>-->
								<label>Mobile No:</label>
								<input type="text" name="mobile" required>
								<label>Date of Birth:</label>
								<input type="date" name="dob" required>
								<label>Admission Date:</label>
								<input type="date" name="adate" required>
								<label>Nationality:</label>
								<input type="text" value="Indian" name="nationality" required>
								
								<!--<input type="text" name="caste" required>-->
								<label>Category:</label>
<!--								<input type="text" name="category" required>-->
                                                                <select name="category" size="1">
                                                                    <option>Open</option>
                                                                     <option>OBC</option>
                                                                     <option>SC</option>
                                                                     <option>ST</option>
                                                                     <option>NT</option>
                                                                     <option>Other</option>
                                                                 </select>
                                                                <label>Caste:</label>
                                                                 <select name="caste" size="1">
                                                                    <option>Maratha</option>
                                                                     <option>Mali</option>
                                                                     <option>Dhangar</option>
                                                                     <option>Mahar</option>
                                                                     <option>Matang</option>
                                                                     <option>Other</option>
                                                                 </select>
								<label>Caste As Per TC:</label>
                                                                  <select name="tc_caste" size="1">
                                                                     <option>Maratha</option>
                                                                     <option>Mali</option>
                                                                     <option>Dhangar</option>
                                                                     <option>Mahar</option>
                                                                     <option>Matang</option>
                                                                     <option>Other</option>
                                                                 </select>
                                                                <!--<input type="text" name="tc_caste" required>-->
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