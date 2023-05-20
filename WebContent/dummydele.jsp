<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfDocument"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.pdf.PdfPage"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="java.net.URL"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%
response.setContentType("application/pdf");
Rectangle pageSize = new Rectangle(780, 525);
Document document = new Document(pageSize);
PdfWriter writer=PdfWriter.getInstance(document, response.getOutputStream());
//PdfWriter.getInstance(document, response.getOutputStream());
document.open();



float[] colsWidth = {1f, 1f, 1f, 1f}; // Code 1

Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
PdfPTable table1 = new PdfPTable(colsWidth);
table1.setWidthPercentage(100); // Code 2
table1.setHorizontalAlignment(Element.ALIGN_LEFT);//Code 3
Phrase Earnings = new Phrase("Earnings", boldFont );
Phrase Amount = new Phrase("Amount", boldFont );
Phrase Deductions = new Phrase("Deductions", boldFont );
Phrase Amount1 = new Phrase("Amount1", boldFont );

table1.addCell(Earnings);
table1.addCell(Amount);
table1.addCell(Deductions);
table1.addCell(Amount);
table1.addCell("Basic Pay");
table1.addCell("00000");
table1.addCell("PF");
table1.addCell("00000");
table1.addCell("HRA");




document.add(table1);
PdfPTable table2 = new PdfPTable(colsWidth);
table2.setWidthPercentage(100); // Code 2
table2.getDefaultCell().setBorder(0);
table2.setHorizontalAlignment(Element.ALIGN_MIDDLE);//Code 3
Phrase employers_signature = new Phrase("Employer's Signature", boldFont );
Phrase employees_signature = new Phrase("Employee's Signature", boldFont );
document.add( Chunk.NEWLINE );
table2.addCell(" ");
table2.addCell(" ");
table2.addCell(" ");
table2.addCell(" ");
table2.addCell(employers_signature);
table2.addCell("");
table2.addCell(employees_signature);
table2.addCell("");
document.add( Chunk.NEWLINE );
document.add(table2);
PdfContentByte cb = writer.getDirectContent();
cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA, BaseFont.WINANSI, false), 24);
cb.setLineWidth(3);
cb.moveTo(10, 515);
cb.lineTo(770,515 );
cb.moveTo(10, 10);
cb.lineTo(770,10 );
cb.moveTo(770, 515);
cb.lineTo(770, 10);
cb.moveTo(10, 515);
cb.lineTo(10, 10);
cb.stroke();
document.close();
%>
</center>
</body>
</html>