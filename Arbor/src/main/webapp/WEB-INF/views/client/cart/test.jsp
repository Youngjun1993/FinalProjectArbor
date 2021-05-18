<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
	<c:forEach var="cartList" items="${list }">
		<ul>
			<li>${cartList.cartno }</li>
			<li>${cartList.pno }</li>
			<li>${cartList.userid }</li>
			<li>${cartList.quantity }</li>
			<li>${cartList.optionvalue }</li>
			<li>${cartList.price }</li>
			<li>${cartList.saleprice }</li>
			<li>${cartList.pname }</li>
			<li>${cartList.img1 }</li>
		</ul>
	</c:forEach>
</div>