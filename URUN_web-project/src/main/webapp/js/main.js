window.onload=function() {
	
	/* 왼쪽 사이드 메뉴 스크립트 */
	$(document).ready(function(){
	    // 왼쪽메뉴 드롭다운
	    $(".sub_menu ul.small_menu").hide();
	    
	    $(".sub_menu ul.big_menu").click(function () {
					$(this).prevAll().css('font-weight','400');
					$(this).nextUntil().css('font-weight','400');
					$(this).css('font-weight','700');
			    // 현재 클릭한 메뉴를 제외한 다른 메뉴의 하위 메뉴 닫기
			    $(".sub_menu ul.big_menu").not(this).find(".small_menu").slideUp(300);
	    });
	});
	
	$(document).click(".sub_menu ul.small_menu", function(){
		
	});







}
    