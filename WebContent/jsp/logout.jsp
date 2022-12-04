<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDB" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        
        <title>
            Jo's
        </title>
    </head>
    
    <body>
    	<%
    		session = request.getSession();
    		session.invalidate();  // 세션 날림
    	
    		PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('로그아웃 되었습니다.')");
        	script.println("location.href = './main.jsp'");
        	script.println("</script>");
    	%>
    </body>
</html>