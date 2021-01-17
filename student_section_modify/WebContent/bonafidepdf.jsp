

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="studentnodue.Databaseconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.util.Date"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Anchor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String regno=(String)session.getAttribute("regno");
    String a1="BONAFIDE CERTIFICATE";
    %>
    <%String bdate=null,bplace=null,department=null,shift=null,sname=null,session_year=null,syear=null,purpose=null,centre=null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ecop</title>
</head>
<body>
<%
					try
					{
						Connection conn=Databaseconnection.getconnection();
						Statement state=conn.createStatement();
						String str="select * from bonafide where regno='"+regno+"' ";
						ResultSet rs=state.executeQuery(str);
						while(rs.next())
						{
							
							sname=rs.getString("sname");
							session_year=rs.getString("session_year");
							syear=rs.getString("studying_year");
							purpose=rs.getString("application_purpose");
							centre=rs.getString("centre");
							
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
							
							bdate=rs1.getString("dob");
							bplace=rs1.getString("birth_place");
							department=rs1.getString("branch");
							shift=rs1.getString("shift");
							
						}
					}
					catch(Exception e1)
					{
						e1.printStackTrace();
					}
					%>
					<% 
Document document = new Document();
try
{
	java.util.Date now = new java.util.Date();
	  SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy h-m-s");
	   Date date = new Date();
           String DATE_FORMAT = "dd-MM-yyyy";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
String strDateNew = sdf.format(now) ;
	 String test="E:\\student\\bonafide\\"+regno+""+"-"+dateFormat.format(date)+".pdf";
	 session.setAttribute("test", test);
	  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(test));
	  document.open();
	  Image img = Image.getInstance("E:\\student\\images\\bonf.png");
		 img.scaleToFit(580f,230f); 
	 img.setAlignment(Image.MIDDLE);
	     
	     document.add(img);
              Font Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13,Font.BOLD);
	      Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
              
            
	      Paragraph p1 = new Paragraph("ROLL NO. " +regno, Bold);
	   
                p1.setAlignment(Element.ALIGN_LEFT);
                  p1.setSpacingAfter(15);
	      document.add(p1);
	   
      Paragraph preface = new Paragraph();
      // We add one empty line
          document.add(Chunk.createTabspace(5));  
   String text = "        "+"This is to Certify that, Master /Miss "+sname + " is Studying in our institute in the Academic Year "+session_year+" in "+ syear+ "  "+shift + " shift Diploma in " + department +". ";
   Paragraph p = new Paragraph(text);
   p.setIndentationLeft(10f);
   p.setAlignment(Element.ALIGN_JUSTIFIED);
   document.add(p);
     p.setSpacingAfter(35);
      
     document.add(Chunk.createTabspace(5));  
     String text1="        "+"The Student bears good character and behaviour. His / Her Date of Birth is " +bdate+ " as per our record. This Certificate is issued for the purpose of "+ purpose +" on his /her request as per application dated on "+strDateNew+".";
  Paragraph p4 = new Paragraph(text1);
   p4.setIndentationLeft(10f);
   p4.setAlignment(Element.ALIGN_JUSTIFIED);
   document.add(p4);
    p.setSpacingBefore(35);
    document.add(Chunk.NEWLINE);
       document.add(Chunk.NEWLINE);
       String text2="Principal";
	  Paragraph p0 = new Paragraph(text2, Bold);
   p0.setIndentationRight(70f);
     p0.setSpacingBefore(10);
     p0.setAlignment(Element.ALIGN_RIGHT);
   document.add(p0);
   String text3="Government Polytechnic, Nashik";
   Paragraph pp0 = new Paragraph(text3, Bold);
   
     pp0.setAlignment(Element.ALIGN_RIGHT);
   document.add(pp0);
     Image img1 = Image.getInstance("E:\\student\\images\\foo.png");
		 img1.scaleToFit(500f,80f); 
	 img1.setAlignment(Image.MIDDLE);
	     
	     document.add(img1);
      document.close();%>
      <script>
      alert("Bonafide Certificate Generate Successfully");
      window.location="bonafide.jsp";
      </script>
 
 <%   
} catch (DocumentException e1)
{
   e1.printStackTrace();
} catch (FileNotFoundException e1)
{
   e1.printStackTrace();
}
%>
</body>
</html>