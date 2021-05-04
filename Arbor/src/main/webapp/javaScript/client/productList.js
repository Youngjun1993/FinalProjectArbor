$(function(){
	
	$(".p_qna_answer").parent().next().css('display', 'none');
	
	$(".p_qna_answer").click(function(){
		$(this).parent().next().css('display', 'block');
		$(this).parent().next().css('height', '100px');
	});
	
	$(document).on('change', '#p_detailOption>select', ()=>{
		var opt1=""; var opt2="";
		var optName1=""; var optName2="";
		var optPrice1=""; var optPrice2="";
	
		$("select[class=p_optname]").each(function(i, name){
			if(i==0){
				if($(name).val()!=null) {
					opt1 = $(name).children("option:selected").text();
				} else {
					opt1 = '';
				}
				optName1 = $(name).attr('name');
			} else if(i==1) {
				if($(name).val()!=null) {
					opt2 = $(name).children("option:selected").text();
				} else {
					opt2 = '';
				}
				optName2 = $(name).attr('name');
			}
		});
		
		if(opt1.indexOf("(+")>0) {
			<!-- + 추가값이 있다는소리 -->
			optPrice1 = opt1.substring(opt1.indexOf("(+")+2, opt1.lastIndexOf(")"));
		} else {
			optPrice1 = 0;
		}
		if(opt2.indexOf("(+")>0) {
			<!-- + 추가값이 있다는소리 -->
			optPrice2 = opt2.substring(opt2.indexOf("(+")+2, opt2.lastIndexOf(")"));
		} else {
			optPrice2 = 0;
		}
		
		console.log("option Name?"+optName1+", "+optName2);
		console.log("option Value?"+opt1+", "+opt2);
		console.log("option Price?"+optPrice1+", "+optPrice2);
		var tag = "";
		if(opt1!=''){
			tag += "<ul class='p_detailSelect_ul'><li>"+optName1+"</li>";
			tag += "<li><button>-</button><span class='p_selectNum'>1</span><button>+</button></li>";
			tag += "<li class='p_bigPrice'><fmt:formatNumber value="+optPrice1+" pattern='#,###'/>원</li>";
			tag += "<li><img src='./img/cancel.png'/></li></ul>";
		}
		if(opt2!=''){
			tag += "<ul class='p_detailSelect_ul'>><li>"+optName2+"</li>";
			tag += "<li><button>-</button><span class='p_selectNum'>1</span><button>+</button></li>";
			tag += "<li class='p_bigPrice'><fmt:formatNumber value='"+optPrice2+"' pattern='#,###'/>원</li>";
			tag += "<li><img src='./img/cancel.png'/></li></ul>";
		}
		
		console.log("현재까지 금액?"+$("#p_totalprice").text());
		$("#p_detailOptionSelect").html(tag);
	});
});