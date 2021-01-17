

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
<%@page import="com.itextpdf.text.pdf.PdfPageEventHelper"%>
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
    
    %>
 
    <%int id=0;
        String bdate=null,sprn=null,since=null,bplace=null,department=null,shift=null,sname=null,session_year=null,syear=null,purpose=null,centre=null;%>
<% String progress=null,conduct=null,leaving_date=null,remark=null,enrollment=null,mother_name=null,religion=null,caste=null,nationality=null,birthplace=null,dob=null,pschool=null,admission_date=null;
%>
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
						String str="select * from leaving where regno='"+regno+"' ";
						ResultSet rs=state.executeQuery(str);
						while(rs.next())
						{
							
							sname=rs.getString("sname");
							session_year=rs.getString("session_year");
							
							purpose=rs.getString("application_purpose");
							centre=rs.getString("centre");
							progress=rs.getString("progress");
							conduct=rs.getString("conduct");
							leaving_date=rs.getString("leaving_date");
							remark=rs.getString("remark");
							
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
						Connection conn=Databaseconnection.getconnection();
						Statement state=conn.createStatement();
						String str="select * from application_details where regno='"+regno+"' ";
						ResultSet rs=state.executeQuery(str);
						while(rs.next())
						{
							
							id=rs.getInt("id");
							
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
						String str1="select * from sdetail where rollno='"+regno+"'";
						ResultSet rs1=state1.executeQuery(str1);
						while(rs1.next())
						{
                                                    
							sprn=rs1.getString("sprn");
                                                        sname=rs1.getString("full_name");
							enrollment=rs1.getString("rollno");
							mother_name=rs1.getString("mother_name");
							religion=rs1.getString("religion")+" - "+rs1.getString("caste");;
							caste=rs1.getString("caste");
							nationality=rs1.getString("nationality");
							birthplace=rs1.getString("birth_place");
							dob=rs1.getString("dob")+"                                         "+rs1.getString("DOB_IN_WORD");
							pschool=rs1.getString("last_college");
							admission_date=rs1.getString("date_of_admission");
                                                        since="Third year"+" diploma in "+rs1.getString("course")+" since "+rs1.getString("SINCE");
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
{ java.util.Date now = new java.util.Date();
	  SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy h-m-s");
	   Date date = new Date();
           String DATE_FORMAT = "dd-MM-yyyy";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
String strDateNew = sdf.format(now) ;
	 String test="E:\\student\\leaving\\"+regno+""+"-"+dateFormat.format(date)+".pdf";
	 session.setAttribute("test", test);
	  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(test));
	  document.open();
	  Image img = Image.getInstance("E:\\student\\images\\j.png");
		 img.scaleToFit(520f, 180f); 
		 img.setAlignment(Image.MIDDLE);
	    document.add(img);
        Image bg=Image.getInstance("E:\\student\\images\\bg.jpg");
       bg.setAbsolutePosition(150,250);
     bg.scaleAbsolute(280,250);
    document.add(bg);
          String sr="Sr. No   :-"+ id;
          
              Paragraph p0 = new Paragraph(sr);
    p0.setAlignment(Element.ALIGN_RIGHT);
   p0.setIndentationRight(29f);
   
   document.add(p0);
     String rl="Roll No :-"+ enrollment;
          
              Paragraph ppp1 = new Paragraph(rl);
     ppp1.setAlignment(Element.ALIGN_RIGHT);
   ppp1.setIndentationLeft(10f);
   
   document.add(ppp1);
     Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 11,Font.BOLD);
	   
  String t2 = "No Change in any entry in this certificate shall be made except by the authority issuing and any Infringement of this requirnment is liable to involve the imposition of penalty even that of rustication.";
   
         Paragraph pp2 = new Paragraph(t2);
     
   pp2.setIndentationLeft(0f);
   pp2.setAlignment(Element.ALIGN_JUSTIFIED);
   document.add(pp2);
	    
	   
	      PdfPTable table = new PdfPTable(2);
              table.setSpacingBefore(4);
	      table.setWidthPercentage(90);
	      table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
	      table.getDefaultCell().setVerticalAlignment(Element.ALIGN_CENTER);
	      table.getDefaultCell().setFixedHeight(30);
               table.addCell(new Phrase(new Chunk("Register No. of the Candidate")));
	      table.addCell(sprn);
	      table.addCell(new Phrase(new Chunk("Name of the Candidate")));
	      table.addCell(sname);
                 table.addCell(new Phrase(new Chunk("Mother's Name")));
	      table.addCell(mother_name);
                table.addCell(new Phrase(new Chunk("Caste & Sub-Caste")));
	      table.addCell(religion);
                table.addCell(new Phrase(new Chunk("Nationality")));
	      table.addCell(nationality);
                table.addCell(new Phrase(new Chunk("Place of Birth")));
	      table.addCell(birthplace);
                table.addCell(new Phrase(new Chunk("Date of Birth (According to Christian Era)")));
	      table.addCell(dob);
               table.addCell(new Phrase(new Chunk("Institute/School Last attended")));
	      table.addCell(pschool);
                 table.addCell(new Phrase(new Chunk("Date of Admission")));
	      table.addCell(admission_date);
                  table.addCell(new Phrase(new Chunk("Progress")));
	      table.addCell(progress);
	      table.addCell(new Phrase(new Chunk("Conduct")));
	      table.addCell(conduct);
	      table.addCell(new Phrase(new Chunk("Date of Leaving this Institution")));
	      table.addCell(leaving_date);
	      table.addCell(new Phrase(new Chunk("Course and Studying year and Since when")));
	      table.addCell(since);
	    table.addCell(new Phrase(new Chunk("Reason of Leaving this Institute")));
	      table.addCell(purpose);
	      table.addCell(new Phrase(new Chunk("Remarks")));
	      table.addCell(remark);
	    
	    
	    
	     
	   
	  
	     
	   document.add(table); 
           String t="Certified that the above information is in accordance with the Polytechnic Institutiion's register.";
              Paragraph pp3 = new Paragraph(t);
     
   pp3.setIndentationLeft(0f);
   document.add(pp3);
     document.add(Chunk.NEWLINE);
       document.add(Chunk.NEWLINE);
   String d="Date : "+strDateNew+"                                                                                               "+"Principal";
      Paragraph pp4 = new Paragraph(d);
     
   pp4.setIndentationLeft(0f);
   document.add(pp4);
    String p="Place : "+"Nashik road"+"                                                                     "+"  Government Polytechnic, Nashik";
      Paragraph pp5 = new Paragraph(p);
     
   pp5.setIndentationLeft(0f);
   document.add(pp5);
       Paragraph p1 = new Paragraph("                                                                                                                                                                                                                                                  "
               + "                                                                                                                                                                                                   "
               + "                                                                                                                                                                                                            "
               + "                                                                                                                                                                                             ");
     
   p1.setIndentationLeft(5000f);
   document.add(p1);
      document.close();%>
      <script>
      alert("Leaving Certificate Generate Successfully");
      window.location="admin.jsp";
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