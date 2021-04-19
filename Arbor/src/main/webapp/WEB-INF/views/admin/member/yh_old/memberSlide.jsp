<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/Slide.css" type="text/css" />

<div class="w1400_container">
		<div class="menubox">
		  <h1 class="title">관리자 메뉴</h1>
		  <ul>
		    <li class="dropdown">
		      <a href="#" data-toggle="dropdown">11111111111<b class="icon-arrow"></b></a>
		      <ul class="dropdown-menu">
		        <li><a href="#">11</a></li>
		        <li><a href="#">22</a></li>
		        <li><a href="#">33</a></li>
		        <li><a href="#">44</a></li>
		      </ul>
		    </li>
		    <li class="dropdown">
		      <a href="#" data-toggle="dropdown">2222222222<b class="icon-arrow"></b></a>
		      <ul class="dropdown-menu">
		        <li><a href="#">11</a></li>
		        <li><a href="#">22</a></li>
		        <li><a href="#">33</a></li>
		        <li><a href="#">44</a></li>
		      </ul>
		    </li>
		    <li class="dropdown">
		      <a href="#" data-toggle="dropdown">3333333333<b class="icon-arrow"></b></a>
		      <ul class="dropdown-menu">
		        <li><a href="#">11</a></li>
		        <li><a href="#">22</a></li>
		        <li><a href="#">33</a></li>
		        <li><a href="#">44</a></li>
		      </ul>
		    </li>
		    
		  </ul>
		</div>
</div>

<script  type="text/javascript">
// Dropdown Menu
var dropdown = document.querySelectorAll('.dropdown');
var dropdownArray = Array.prototype.slice.call(dropdown,0);
dropdownArray.forEach(function(el){
	var button = el.querySelector('a[data-toggle="dropdown"]'),
			menu = el.querySelector('.dropdown-menu'),
			arrow = button.querySelector('i.icon-arrow');

	button.onclick = function(event) {
		if(!menu.hasClass('show')) {
			menu.classList.add('show');
			menu.classList.remove('hide');
			arrow.classList.add('open');
			arrow.classList.remove('close');
			event.preventDefault();
		}
		else {
			menu.classList.remove('show');
			menu.classList.add('hide');
			arrow.classList.remove('open');
			arrow.classList.add('close');
			event.preventDefault();
		}
	};
})

Element.prototype.hasClass = function(className) {
    return this.className && new RegExp("(^|\\s)" + className + "(\\s|$)").test(this.className);
};
</script>