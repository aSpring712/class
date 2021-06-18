<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>" 
<%
 Class.forName("oracle.jdbc.driver.OracleDriver");
 String url="jdbc:oracle:thin:@localhost:1521:XE";   /* 1521은 DB의 주소 */
 Connection dbconn=DriverManager.getConnection(url, "madang", "madang"); /* 1 Connection 2 Statement 3 ResultSet을 가지고 오겠다 */
 Statement stmt = dbconn.createStatement();
 ResultSet myResultSet=stmt.executeQuery("SELECT * FROM Book");
 %>                                                                        
 <HTML>                         
 
 <head>
 <meta http-equiv="content-type" content="text/html; charset=edu-kr">
 <title>** BOOK LIST **</title>
 </head>
 
 <body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
 <table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7"
 			bordercolordark="white" bordercolorlight="#B9E0FA">
		<tr>
			<td width="150" height="20" bgcolor="#2E9F9">
				<p align="center">
				<span style="font-size:8pt"><b>BOOKNAME</b></span></p>
			</td>
			<td width="150" height="20" bgcolor="#2E9F9">
				<p align="center">
				<span style="font-size:8pt"><b>PUBLISHER</b></span></p>
			</td>
			<td width="50" height="20" bgcolor="#2E9F9">
				<p align="center">
				<span style="font-size:8pt"><b>PRICE</b></span></p>
			</td>
		</tr>                                                               
 <%                                    /* Java : 데이터, 처리 담당 */
 if(myResultSet!=null){      
	 while(myResultSet.next()){
		 String W_BOOKID=myResultSet.getString("bookid");    /* W_~ 변수에 오라클 DB테이블에서 값을 가져와서 담음 */
		 String W_BOOKNAME=myResultSet.getString("bookname");
		 String W_PUBLISHER=myResultSet.getString("publisher");
		 String W_PRICE=myResultSet.getString("price");     /* bookid, bookname.. 이건 DB */
 %>
 <tr>
			<td width="150" height="20">
				<p><span style="font-size:9pt;">
				<a href="bookview.jsp?bookid=<%=W_BOOKID%>">  
				<font face="돋움체" color="black">
				<%=W_BOOKNAME%></font></a></span></p>
			 </td>
			<td width="150" height="20">
				<p align="center"><span style="font-size:9pt;">
				<font face="돋움체"><%=W_PUBLISHER%></font></span></p>
			 </td>
			 
			 <td width="50" height="20">
				<p align="center"><span style="font-size:9pt;">
				<font face="돋움체"><%=W_PRICE%></font></span></p>
			 </td>
		</tr>
<%
	 }
 }
 stmt.close();
 dbconn.close();
 %>
 </table>
 <table cellpadding="0" cellspacing="0" width="400" height="23">
 	<tr>
 		<td width="1350">
 			<p align="right"><b><a href="booklist.jsp">
 			<font size="1" face="돋움체" color="black">LIST</font></a></b></p>
 		</td>
 	</tr>
 </table>
</body>
</HTML>
 