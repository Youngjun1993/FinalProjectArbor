<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="y_couponList_wrap" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>
    <div id="y_coupon_rightCon">
        <h2>쿠폰내역</h2>
        <div>
            <button>최신순</button>
            <button>할인순</button>
        </div>
        <div>
            <ul class="clearfix">
                <li>쿠폰번호</li>
                <li>쿠폰명</li>
                <li>할인금액</li>
                <li>적용 범위</li>
                <li>유효기간</li>
                <li>　</li>
            </ul>
            <ul class="clearfix">
                <li>-</li>
                <li>-</li>
                <li>-</li>
                <li>-</li>
                <li>-</li>
                <li><a href="#" class="couponSearchBtn">적용상품 보기</a></li>
            </ul>
        </div>
    </div>
</div>