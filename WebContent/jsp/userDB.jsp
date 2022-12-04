<%@ page contentType="text/html; charset=euc-kr" language="java" %>
<%@ page import="java.sql.*" %>

<%
 Connection con = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;

 try {
  String DB_SERVER = "localhost:3306";  // MySQL 설치시 등록한 포트로 수정필요
  String DB_USERNAME = "root";          // MySQL 설치시 등록한 user 로 수정필요
  String DB_PASSWORD = "123456";   // MySQL 설치시 등록한 user 로 수정필요
  String DB_DATABASE = "AUproject";       // db 테스트 때 생성한 db 로 수정 필요
  String DB_TABLE = "user";          // db 테스트 때 생성한 table 로 수정필요

  String jdbcUrl = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE;

  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection(jdbcUrl, DB_USERNAME, DB_PASSWORD);
  %>

 <h1>Database 연결 테스트</h1>
  Database 연결 성공<br>
  <%
  
  String query = "select * from "+DB_TABLE;
  pstmt=con.prepareStatement(query);
  rs=pstmt.executeQuery();

  int count=0;
  while(rs.next()) {
   
   String number=rs.getString("id");
   String name = rs.getString("name");
   %>
   <p>[<%=count%>] number : <%=number%>, name : <%=name%></p>
   <%
   count++;
  }
  
 } catch(Exception e) {
  e.printStackTrace();
  out.println("Fail");
 }
%>
