<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="y_myPageMain_wrap" class="clearfix w1400_container">
    <div id="y_leftMenu">
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
    <div id="y_myPage_rightCon">
        <div>
            <ul class="clearfix">
                <li>ㅇㅇㅇㅇ님 환영합니다.</li>
                <li>
                    <span><i class="fas fa-gem fa-3x"></i></span>
                    <span>적립금<br/>
                    <a href="#" class="ftBold25_blue">0</a>원</span>
                </li>
                <li>
                    <span><i class="fas fa-tag fa-3x"></i></span>
                    <span>쿠폰<br/>
                    <a href="#" class="ftBold25_blue">0</a>개</span>
                </li>
                <li>
                    <span><i class="fas fa-edit fa-3x"></i></span>
                    <span>리뷰<br/>
                    <a href="#" class="ftBold25_blue">0</a>건</span>
                </li>
            </ul>
        </div>
        <div>
            <ul class="clearfix">
                <li>주문일자</li>
                <li>상품명</li>
                <li>결제금액</li>
                <li>상태</li>
                
                <li>0000-00-00</li>
                <li><a href="#">ㅇㅇㅇㅇㅇ상품</a></li>
                <li>349,999원</li>
                <li>
                    <a href="#" class="statusBtn">배송준비</a> 
                    <a href="#" class="statusBtn">배송완료</a> 
                    <a href="#" class="statusBtn">주문취소</a> 
                    <a href="#" class="statusBtn">리뷰작성</a> 
                    <a href="#" class="statusBtn">교환/환불</a> 
                    <a href="#">배송중입니다.</a> 
                </li>
            </ul>
        </div>
        <ul id="myPagePaging" class="clearfix">
            <li>1</li>
            <li>2</li>
            <li>3</li>
        </ul>
    </div>
</div>