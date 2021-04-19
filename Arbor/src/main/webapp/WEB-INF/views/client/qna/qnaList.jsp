<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <div id="y_qnaWrap" class="w1400_container clearfix">
        <div id="y_leftMenu">
            <ul>
                <li class="y_title_fs25">My Page</li>
                <li><a href="#">구매내역</a></li>
                <li><a href="#">회원정보수정</a></li>
                <li><a href="#">리뷰관리</a></li>
                <li><a href="#">1:1문의</a></li>
                <li><a href="#">쿠폰내역</a></li>
                <li><a href="#">적립금내역</a></li>
                <li><a href="#">회원탈퇴</a></li>
            </ul>
        </div>
        <div id="y_rightcon">
            <p class="y_title_fs25">1:1문의(Q&#38;A)</p>
            <ul class="clearfix">
                <li>문의유형</li>
                <li>제목</li>
                <li>주문번호</li>
                <li>처리상태</li>
                <li>등록일</li>
                <c:forEach var="data" items="${list }">
	                <li>${data.qnacate }</li>
	                <li><a href="#" class="wordcut">${data.qnasubject }</a></li>
	                <li>${data.orderno }</li>
	                <li><span class="y_anserWait">답변대기</span></li>
	                <li>${data.qnadate }</li>
                </c:forEach>
            </ul>
            <a href="#" id="y_qnaGo">문의하기</a>
        </div>
    </div>