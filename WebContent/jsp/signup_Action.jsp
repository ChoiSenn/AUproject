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
        String userID		= request.getParameter("userID");
        String userPassword = request.getParameter("userPassword");
        String userName		= request.getParameter("userName");
        
     	// -1: 서버 오류 / 0: 이미존재하는 아이디 / 1: 성공
        if(userID == null || userPassword == null || userName == null) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('비어있는 입력 칸이 존재합니다.')");
        	script.println("history.back()");
        	script.println("</script>");
        } else {
        	UserDB userDB = new UserDB();
        	
        	userDB.setUserID(userID);
        	userDB.setUserPassword(userPassword);
        	userDB.setUserName(userName);
        	
            int result = userDB.join(userDB);
            	
            if(result == -1) {
            	PrintWriter script = response.getWriter();
            	script.println("<script>");
            	script.println("alert('!! 서버 오류 !!')");
            	script.println("history.back()");
            	script.println("</script>");
            } else if(result == 0) {
            	PrintWriter script = response.getWriter();
            	script.println("<script>");
            	script.println("alert('이미 같은 학번이 존재합니다.')");
            	script.println("history.back()");
            	script.println("</script>");
            } else {
            	PrintWriter script = response.getWriter();
            	script.println("<script>");
            	script.println("alert('회원가입 되었습니다!')");
            	script.println("location.href = './main.jsp'");
            	script.println("</script>");
            }
        }
        %>
    </body>
    
</html>