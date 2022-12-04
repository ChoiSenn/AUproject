<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>
    <!--          meta 선언          -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--          link 선언          -->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/style_index.css">

    <!--          script 선언          -->
    <script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script src="../js/script.js"></script>

    <title>
        MAIN
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
                    <li class="menu_login"><a class="menu_title" href="#">로그인</a></li>
                    <li class="menu_join"><a class="menu_title" href="#">회원가입</a></li>
                </ul>
            </div>
            <div class="nav_container" id="nav_menu">
                <div class="menu_container">
                    <ul class="menu">
                        <li class="menu_1">
                            <a class="menu_title">안산대학교</a>
                            <ul class="menu_1_content">
                                <li><a class="menu_index" href="#">오늘의 메뉴</a></li>
                                <li><a class="menu_index" href="#">오늘의 토픽</a></li>
                                <li><a class="menu_index" href="#">홈페이지 바로가기</a></li>
                            </ul>
                        </li>
                        <li class="menu_2">
                            <a class="menu_title">컴퓨터공학과 관리</a>
                            <ul class="menu_2_content">
                                <li><a class="menu_index" href="#">출석 체크</a></li>
                                <li><a class="menu_index" href="./userDB.jsp">출석 확인</a></li>
                                <li><a class="menu_index" href="#">시간표</a></li>
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
        <div class="conB">
            <div class="conB_title">
                <h3>About</h3>
            </div>
            <div class="conB_container">
                <div class="conB_small_container">
                    <div class="conB_icon">
                        <i class="fas fa-code icon"></i>
                    </div>
                    <div class="conB_content">
                        <h3>AU Project</h3>
                        <p>Index 1</p>
                    </div>
                </div>
                <div class="conB_small_container">
                    <div class="conB_icon">
                        <i class="fas fa-cogs icon"></i>
                    </div>
                    <div class="conB_content">
                        <h3>Title 2</h3>
                        <p>Index 2</p>
                    </div>
                </div>
                <div class="conB_small_container">
                    <div class="conB_icon">
                        <i class="fas fa-plane icon"></i>
                    </div>
                    <div class="conB_content">
                        <h3>Title 3</h3>
                        <p>Index 3</p>
                    </div>
                </div>
            </div>
        </div>
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