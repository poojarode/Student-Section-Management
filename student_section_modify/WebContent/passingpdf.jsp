
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
    String a1="PROVISIONAL PASSING CERTIFICATE";
    %>
    <% 
        int roll=0;
        String name=null,dist=null,department=null,sname=null,sprn=null,caste=null,religion=null,course=null,syear=null,shift=null,centre=null,passing_exam=null,final_exam=null,seyear=null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ecop</title>
</head>
<body>

    <%try
{
	/* Connection con=Databaseconnection.getconnection(); */
	Connection con=Databaseconnection.getconnection();
	String str="select * from passing where regno="+regno+"";
	Statement sta=con.createStatement();

	ResultSet rs=sta.executeQuery(str);
						while(rs.next())
						{
							
							syear=rs.getString("studying_year");
                                                        seyear=rs.getString("session_year");
                                                         caste=rs.getString("caste");
                                                            dist=rs.getString("district");
                                                        
                                                }
	
}
catch(Exception  x)
{
x.printStackTrace();
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
                                                      
                                                        roll=rs1.getInt("rollno");
                                                        sprn=rs1.getString("sprn");
							shift=rs1.getString("shift");
							name=rs1.getString("full_name");
							department=rs1.getString("branch");
							shift=rs1.getString("shift");
                                                        religion=rs1.getString("religion");
                                                        caste=rs1.getString("sub_caste");
							
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
	  SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy h-m-s");
	   Date date = new Date();
	 String test="E:\\student\\Caste-Validity\\"+regno+""+"-"+dateFormat.format(date)+".pdf";
	 session.setAttribute("test", test);
	  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(test));
	  document.open();
	 Image img = Image.getInstance("E:\\student\\images\\heading.PNG");
	img.scaleToFit(510f,260f); 
		 img.setAlignment(Image.LEFT);
	     
	     document.add(img);
	      Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 14,Font.BOLD);
	      Paragraph p1 = new Paragraph(centre);
	      p1.setIndentationLeft(220f);
	      document.add(p1);
                Paragraph preface = new Paragraph();
      // We add one empty line
         String t2 = "BY HAND";
   
         Paragraph pp2 = new Paragraph(t2);
     
   pp2.setIndentationLeft(0f);
     String t3 = "TO,";
   
         Paragraph pp3 = new Paragraph(t3);
     
   pp3.setIndentationLeft(0f);
   document.add(pp2);document.add(pp3);
	  if(caste.equals("ST"))
          {
              String st="Hon. Member Secretary and Dy. Director (Research),";
               Paragraph p = new Paragraph(st);
	      p.setIndentationLeft(0f);
	      document.add(p); 
              
              String st1="Scheduled Tribe Certificate Scrutiny Committe,";
               Paragraph pp1 = new Paragraph(st1);
	      pp1.setIndentationLeft(0f);
	      document.add(pp1); 
              
              String st2=dist+" Division,";
               Paragraph ppp2 = new Paragraph(st2);
	      ppp2.setIndentationLeft(0f);
	      document.add(ppp2); 
              
              String st3=dist;
               Paragraph ppp3 = new Paragraph(st3);
	      ppp3.setIndentationLeft(0f);
	      document.add(ppp3); 
          }
          else
          {
              String o1="Hon. Member Secretary and Research officer,";
                Paragraph p2 = new Paragraph(o1);
	      p2.setIndentationLeft(0f);
	      document.add(p2);
               String o2="Divisional Caste Certificate Scrutiny Committe";
                Paragraph pppp2 = new Paragraph(o2);
	      pppp2.setIndentationLeft(0f);
	      document.add(pppp2);
               String o3="District Social Welfare office,";
                Paragraph p7 = new Paragraph(o3);
	      p7.setIndentationLeft(0f);
	      document.add(p7);
               String o4=dist;
                Paragraph pp4 = new Paragraph(o4);
	      pp4.setIndentationLeft(0f);
	      document.add(pp4);
          }
    
       String text = "                 "
               + "Sub:-Verification of Caste Certificate";
   Paragraph p = new Paragraph(text);
      String text3 = "Sir /Madam";
   p.setIndentationLeft(80f);
   Paragraph pp = new Paragraph(text3);
   pp.setIndentationLeft(20f);
   String text1 = "      Mr /Miss  "+name +" is studying in "+syear+" diploma programme in "+department+"-"+shift+" "+"for academic "+seyear+" . "+"His/Her Roll No. is "+roll+" and his Permanant Registration No. is " +sprn+ " The Caste & Sub-Caste is recorded as "+religion+"-"+caste+" in the institute's General Resister.";
   Paragraph ppp = new Paragraph(text1);
   ppp.setIndentationLeft(20f);
   p.setAlignment(Element.ALIGN_JUSTIFIED);
   
   String text2 = "      So,The proposal of Caste Verification  is  forwarding to you for to you for the further necessary action ";
   Paragraph pp1 = new Paragraph(text2);
   pp1.setIndentationLeft(20f);
   String text4 = "            Your's Faithfully"
           + "                                                                                                                                                                                                                                                                                                                                                                     "
           + "";
   Paragraph pppp = new Paragraph(text4);
    pppp.setIndentationLeft(300f);
    String text5 = "               Principle";
         
   Paragraph ppppp = new Paragraph(text5);
   ppppp.setIndentationLeft(300f);
     String text6 = "                  "+"                                      Government polytechnic, Nashik";
   Paragraph pppppp = new Paragraph(text6);
   pppppp.setIndentationLeft(500f);
    String text7 = "Copy to :- Concern student"
            + "                                                                                                                                      I Udersigned, will be responsible to submit the Caste Verification Proposal to the appropriate authority.";
   Paragraph ppp1 = new Paragraph(text7);
   pppppp.setIndentationLeft(100f);
   pp.setAlignment(Element.ALIGN_JUSTIFIED);
   
   document.add(p);
   document.add(pp);
	   document.add(ppp); document.add(pp1); document.add(pppp); document.add(ppppp); document.add(pppppp); document.add(ppp1);
 Image img2 = Image.getInstance("E:\\student\\images\\footer.PNG");
	img2.scaleToFit(510f,200f); 
		 img2.setAlignment(Image.LEFT);
	     
	     document.add(img2);      
document.close();%>
      <script>
      alert("cast Certificate Generate Successfully");
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