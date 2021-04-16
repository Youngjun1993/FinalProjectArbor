<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>QNA</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/qna.css" type="text/css"/>
</head>
<body>
	<div id="header">
        <ul>
            <li></li>
            <li>header</li>
        </ul>
    </div>
    <div id="wrap" class="w1400_container clearfix">
        <div id="leftMenu">
            <ul>
                <li class="title_fs25">My Page</li>
                <li><a href="#">구매내역</a></li>
                <li><a href="#">회원정보수정</a></li>
                <li><a href="#">리뷰관리</a></li>
                <li><a href="#">1:1문의</a></li>
                <li><a href="#">쿠폰내역</a></li>
                <li><a href="#">적립금내역</a></li>
                <li><a href="#">회원탈퇴</a></li>
            </ul>
        </div>
        <div id="rightcon">
            <p class="title_fs25">1:1문의(Q&#38;A)</p>
            <ul class="clearfix">
                <li>문의유형</li>
                <li>제목</li>
                <li>주문번호</li>
                <li>처리상태</li>
                <li>등록일</li>
                
                <li>상품문의</li>
                <li><a href="#" class="wordcut">박ㅇㅇ님의 문의글 입니다.</a></li>
                <li>20202020-202020</li>
                <li><span class="anserWait">답변대기</span></li>
                <li>2021-03-31</li>
                
            </ul>
            <a href="#" id="qnaGo">문의하기</a>
        </div>
    </div>
    <div id="footer">
        
    </div>
</body>
</html>