$(function(){
	
	$(".pTitle").next().next().hide();
	
	$(".pTitle").next().click(function(){
		$(this).parent().next().next().css('display', 'none');
		$(this).next().show();
		$(this).hide();
	});
	
	$(".pTitle").next().next().click(function(){
		$(this).parent().next().next().css('display', 'block');
		$(this).hide();
		$(this).prev().show();
	});
	
});

function optionAdd() {
	var tag = "";
		
	tag += " <input type='text' name='optname' placeholder='옵션명을 입력하세요'/>";
	tag += " <input type='text' name='optvalue' placeholder='옵션값을 입력하세요' />";
	tag += " <input type='color' name='rgbvalue'/>";
	tag += " <input type='text' name='optprice' placeholder='추가가격(-가능, 0가능)'/>";
	tag += " <button type='button' onclick='javascript:optionAdd()'>+</button>";
	
	$("#optionTbl").append(tag);
}