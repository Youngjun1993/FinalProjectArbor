<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/memberUpdate.css" type="text/css" />
<div id="h_memquit_container" class="clearfix w1400_container">
	<%@include file="/WEB-INF/inc/mypageMenu.jspf"%>

	<div class="h_memUpdate_header">회원정보 수정</div>
	<div class="h_memUpdate_container">
		<form method="post" class="h_memUpdate_form" action="memberUpdateOk">
			<ul class = "h_memUpdate_ul">	
			<li>아이디</li>
			<li>${vo.userid }</li>
			<li>비밀번호</li>
			<li><input type="text" name="userpwd" class="h_ipt" size="20" value="" /></li>
			<li>비밀번호 확인</li>
			<li><input type="text" name="pwdCheck" class="h_ipt" size="20" value="" /></li>
			<li>이름</li>
			<li>${vo.username}</li>
			<li>주소</li>
			<li>
			<input type="text" name="zipcode" class="h_ipt" size="20" value="${vo.zipcode }" />
			<input type="button" size="14" class="h_check_btn" value="우편번호" />
			</li>
			<li></li>
			<li>
			<input type="text" name="addr" class="h_ipt" size="20" value="${vo.addr }" />
			</li>
			<li></li>
			<li>
			<input type="text" name="detailaddr" class="h_ipt" size="20" value="${vo.detailaddr }" />
			</li>
			<li>연락처</li>
			<li>
			<select id="tel" name="tel1" class="h_select">
				<option value="010">010</option>
			  	<option value="011">011</option>
				<option value="070">070</option>
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>
				<option value="033">033</option>
				<option value="041">041</option>
				<option value="042">042</option>
				<option value="043">043</option>
				<option value="044">044</option>
				<option value="051">051</option>
				<option value="052">052</option>
				<option value="053">053</option>
				<option value="054">054</option>
				<option value="055">055</option>
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>
				<option value="064">064</option>
			</select>
			-<input type="text" name="tel2" id="tel2" size="5" class="h_ipt" required="required" value="${vo.tel2}">
			-<input type="text" name="tel3" id="tel3" size="5" class="h_ipt" required="required" value="${vo.tel3}">
			</li>
			<li>이메일</li>
			<li>
			<input type="text" name="emailid" id="emailid" size="10px" class="h_ipt emailid" required="required" value="${vo.emailid}"> @ 
			<select name="emaildomain" id="emaildomain" class="h_select emaildomain" required="required" >
				<option value=""></option>
				<option value="gmail.com" <c:if test="${vo.emaildomain eq 'gmail.com' }">selected</c:if>>gmail.com</option>
				<option value="naver.com" <c:if test="${vo.emaildomain eq 'naver.com' }">selected</c:if>>naver.com</option>
				<option value="daum.net" <c:if test="${vo.emaildomain eq 'daum.net' }">selected</c:if>>daum.net</option>
				<option value="nate.com" <c:if test="${vo.emaildomain eq 'nate.com' }">selected</c:if>>nate.com</option>
				<option value="hotmail.com" <c:if test="${vo.emaildomain eq 'hotmail.com' }">selected</c:if>>hotmail.com</option>
			</select>
			</li>
			</ul>
		</form>
			<div class="h_memUpdate_submitbox">
			<input type="button" class="clientSubBtn" value="정보수정" />
			</div>
	</div>
</div>

<script>
	$('.clientSubBtn').click(function() {
		$('.h_memUpdate_form').submit();
	});
</script>