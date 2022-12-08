<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDB" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        
        <title>
            AU
        </title>
    </head>
    
    <body>
        <%
	        PrintWriter script = response.getWriter();
	       	script.println("<script>");
	       	script.println("alert('로그인이 필요합니다.')");
	       	script.println("location.href = './login.jsp'");
	       	script.println("</script>");
        %>
    </body>
</html>