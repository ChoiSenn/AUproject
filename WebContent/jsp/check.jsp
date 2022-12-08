<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDB" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>

<html lang="ko">

<head>
    <!--          meta 선언          -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--          link 선언          -->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/style_index.css">
    <link rel="stylesheet" href="../css/check.css">

    <!--          script 선언          -->
    <script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script src="../js/script.js"></script>

    <title>
        AU
    </title>
</head>

<body>
    <header>
        <div class="header_container">
            <div class="logo_container">
                <a href="./main.jsp" class="main_text">AU Project</a>
            </div>
            <div class="login_container">
                <ul class="login">
					<%
					    String userID = String.valueOf(session.getAttribute("userID"));
					 
					    if(userID == "null"){  // 세션 없으면 로그인/회원가입 메뉴
					%>
					    <li class="menu_login"><a class="menu_title" href="./login.jsp">로그인</a></li>
                    	<li class="menu_join"><a class="menu_title" href="./signup.jsp">회원가입</a></li>
					<%	
					    } else{  // 세션 연결되어 있으면 로그아웃 메뉴
					%>
						<li class="menu_logout"><a class="menu_title" href="./logout.jsp">로그아웃</a></li>
					<%
					    }
					%>
                    
                </ul>
            </div>
            <div class="nav_container" id="nav_menu">
                <div class="menu_container">
                    <ul class="menu">
                        <li class="menu_1">
                            <a class="menu_title">안산대학교</a>
                            <ul class="menu_1_content">
                                <li><a class="menu_index" href="./menu.jsp">오늘의 메뉴</a></li>
                                <li><a class="menu_index" href="./topic.jsp">오늘의 토픽</a></li>
                                <li><a class="menu_index" href="https://www.ansan.ac.kr/www/main">홈페이지 바로가기</a></li>
                            </ul>
                        </li>
                        <li class="menu_2">
                            <a class="menu_title">컴퓨터공학과 관리</a>
                            <ul class="menu_2_content">
                                <li><a class="menu_index" 
                                <%
								    if(userID == "null"){  // 세션 없으면 차단
								%>
                                href="./x.jsp"
                                <%	
								    } else{  // 세션 연결되어 있으면 출석 체크 가능
								%>
								href="./check.jsp"
								<%
								    }
								%>
                                >출석 체크</a></li>
                                <li><a class="menu_index" href="./userDB.jsp">출석 확인</a></li>
                                <li><a class="menu_index" href="./calender.jsp">시간표</a></li>
                            </ul>
                        </li>
                        <li class="menu_3">
                            <a class="menu_title">뭐넣지</a>
                            <ul class="menu_3_content">
                                <li><a class="menu_index" href="#">ㅇ</a></li>
                                <li><a class="menu_index" href="#">ㅇ</a></li>
                                <li><a class="menu_index" href="#">ㅇ</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <div class="main_container">
        <table class = "table table-striped">
        	<thead>
	        	<tr>
	        		<th>학번</th>
	        		<th>이름</th>
	        		<th>출석</th>
	        	</tr>
        	</thead>
        	<tbody>
        		<tr>
	        		<%
	        			UserDB userDB = new UserDB();
	        			ArrayList<UserDB> users = new ArrayList<UserDB>();
	        			users = userDB.getUserAll();
	        			
	        			for (int i = 0; i <= users.size()-1; i++){
	        		%>
	        		<form method="post" action="./check_action.jsp">
	        			<td>
	        			<%=users.get(i).getUserID()%>
	        			</td>
	        			<td>
	        			<%=users.get(i).getUserName()%>
	        			</td>
	        			<td>
	        			<input type="hidden" name = "userID" value="<%=users.get(i).getUserID()%>">
	        			<input type="submit" value="출석 체크">
	        			</td>
	        		</form>
	        		</tr>
	        		<%}%>
        	</tbody>
        </table>
    </div>

    <footer>
        <div class="footer_container">
            <div class="footA">
                202251509 최세은
            </div>
            <div class="footB">
                Copyright © CS All Rights Reserved.
            </div>
        </div>
    </footer>
</body>

</html>