<%@ page contentType="text/html; charset=euc-kr" language="java" %>
<%@ page import="java.sql.*" %>

<%
 Connection con = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;

 try {
  String DB_SERVER = "localhost:3306";  // MySQL ��ġ�� ����� ��Ʈ�� �����ʿ�
  String DB_USERNAME = "root";          // MySQL ��ġ�� ����� user �� �����ʿ�
  String DB_PASSWORD = "123456";   // MySQL ��ġ�� ����� user �� �����ʿ�
  String DB_DATABASE = "AUproject";       // db �׽�Ʈ �� ������ db �� ���� �ʿ�
  String DB_TABLE = "user";          // db �׽�Ʈ �� ������ table �� �����ʿ�

  String jdbcUrl = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE;

  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection(jdbcUrl, DB_USERNAME, DB_PASSWORD);
  %>

 <h1>Database ���� �׽�Ʈ</h1>
  Database ���� ����<br>
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
