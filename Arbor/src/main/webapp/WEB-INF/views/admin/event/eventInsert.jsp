<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>arbor[admin] > event</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/eventInsert.css" type="text/css"/>
<script>
	$(function(){
		CKEDITOR.replace("j_content");
	});
</script>
</head>
<body>
<div class="w1400_container">
	<form method="post" action="">
		<ul>
			<li>제목 <input type="text" name="subject" id="j_subject"/></li>
			<li>내용<br/>
			<textarea id="j_content"></textarea></li>
		
		</ul>
		
	</form>

</div>
</body>
</html>