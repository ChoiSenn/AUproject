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
    		String userID = request.getParameter("userID");
    		
    		UserDB userDB = new UserDB();
    		userDB.setUserID(userID);
    		userDB.checkAttend(userID);
    		
    		PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('"+ userID +"님, 출석 정상 처리되었습니다!')");
        	script.println("location.href = './check.jsp'");
        	script.println("</script>");
    	%>
    </body>
</html>