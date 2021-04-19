<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css" type="text/css" />

<div class="w1400_container">
		<div class="menubox">
	  <h1 class="title">Dropdown Menu</h1>
	  <ul>
	    <li class="dropdown">
	      <a href="#" data-toggle="dropdown">First Menu <i class="icon-arrow"></i></a>
	      <ul class="dropdown-menu">
	        <li><a href="#">Home</a></li>
	        <li><a href="#">About Us</a></li>
	        <li><a href="#">Services</a></li>
	        <li><a href="#">Contact</a></li>
	      </ul>
	    </li>
	    <li class="dropdown">
	      <a href="#" data-toggle="dropdown">Second Menu <i class="icon-arrow"></i></a>
	      <ul class="dropdown-menu">
	        <li><a href="#">Home</a></li>
	        <li><a href="#">About Us</a></li>
	        <li><a href="#">Services</a></li>
	        <li><a href="#">Contact</a></li>
	      </ul>
	    </li>
	    <li class="dropdown">
	      <a href="#" data-toggle="dropdown">Third Menu <i class="icon-arrow"></i></a>
	      <ul class="dropdown-menu">
	        <li><a href="#">Home</a></li>
	        <li><a href="#">About Us</a></li>
	        <li><a href="#">Services</a></li>
	        <li><a href="#">Contact</a></li>
	      </ul>
	    </li>
	  </ul>
	
		</div>
</div>

<script>
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

};
</script>