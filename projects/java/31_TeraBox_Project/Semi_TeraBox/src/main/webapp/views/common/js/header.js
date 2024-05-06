$(document).ready(()=>{

	//로고 이미지를 클릭하면 메인화면으로 돌아간다.
	$('.cm-mainLogo').click(()=>{
		location.href = '/'+ window.location.pathname.split('/')[1];
	});

	let selectMenus = $('a[class^=cm-link-area-]');

	//이미지가 있는 팝업메뉴 요소로 클릭이벤트를 만들어준다
	selectMenus.each(element =>{
		//빠른예매 링크는 제외
		if($(selectMenus[element]).attr('class') !== 'cm-link-area-ticket'){
			$(selectMenus[element]).click(function(event){
				let replaceMenu = $(event.target).attr('class').replace('cm-link-area-', '');
				//메뉴가 하나도 떠있지 않을때
				if(!$(event.target).hasClass('on'))
				{
					selectMenus.removeClass('on'); //모든 메뉴에서 on 클래스 제거
					$(event.target).addClass('on');//클릭한 요소만 닫기 버튼이 나타나도록
					$('[id^=cm_layer_').css('display', 'none');//모든메뉴의 팝업 안보이게 한다.
					$('#cm_layer_'+ replaceMenu).css('display', 'block');//선택된 메뉴의 팝업메뉴만 보이게한다
				}
				else//이미 떠있는 메뉴가 있을때
				{
					selectMenus.removeClass('on'); //모든 메뉴에서 on 클래스 제거
					$('[id^=cm_layer_').css('display', 'none');//모든메뉴의 팝업 안보이게 한다.
				}
				// document.getElementsByClassName('cm-login-before')[0].style.display = 'none';
				// document.getElementsByClassName('cm-login-before')[0].style.display = 'block';
			});
		}
	});

	//상단 메뉴 영화 호버 이벤트
	$('a[class^=cm-link-text-]').each(idx=>{
		let menu = $('a[class^=cm-link-text-]')[idx];
		$(menu).attr('idx', idx);
		
		$(menu).mouseover((event)=>{

			//마우스 on 된 메뉴에 스타일 적용
			$(menu).removeClass('on');//모든요소에서 마우스 on 된 스타일을 제거한다.
			$(event.target).addClass('on'); //마우스 over된 요소만 on 스타일 적용

			//서브타이틀 영역
			$('.cm-header-nav').css('display','block');//서브타이틀 영역 나타나게한다.

			//서브메뉴 타이틀 영역
			let thisIndex = $(event.target).attr('idx');//마우스 on 요소가 몇번째인지 가져온다.
			let subMenus = $('.cm-gnb-depth2');
			subMenus.css('display', 'none');
			$(subMenus[thisIndex]).css('display', 'block');
		});
	});
	
	// 서브 메뉴 타이틀 이동할때 서브 배경이 닫히는 현상을 막기위한 이벤트
	$('.cm-header-nav').hover((event=>{
		if(event.type === 'mouseenter'){
			$('.cm-header-nav').css('display','block');
		}
		else{
			$('.cm-header-nav').css('display', 'none');
			$('a[class^=cm-link-text-]').removeClass('on');
		}
	}));
	//로그인 화면 표시
	$('.cm-btn-modal-open').click((event)=>{
		$('.cm-login-modal').fadeIn(200,'linear');
	});
	//로그인 화면 닫기
	$('.cm-login-close-btn').click((event)=>{
		$('.cm-login-modal').fadeOut(200,'linear');
	});

	$('.cm-id-intput-area input').on('keyup', function(event){
		let userId = $('#user_id').val().trim();
		let userPw = $('#user_pw').val().trim();
		if(userId !== '' && userPw !== ''){
			$('#cm_btnlogin').attr('disabled', null);
		}
		else{
			$('#cm_btnlogin').attr('disabled', 'disabled');
		}

	});
});
//TeraModal
//모달 화면 표시
//사용법
//teraModal('alert 창 테서터');
//teraModal('alert 창 테서터', '500px');
//teraModal('alert 창 테서터', '500px', '500px');
let teraModal = function(text, width, height)
{
	if(width === null || width === undefined){
		width = '300px';
	}
	if(height === null || height === undefined){
		height = '180px';
	}
	width  = width.replace('px','');
	height = height.replace('px','');
	
	$('#modalText').html(text);
	$('section.cm-modalSection').css('width', width + 'px');
	$('section.cm-modalSection').css('margin-left', (width/2*-1)+ 'px');
	$('section.cm-modalSection').css('height', height + 'px');
	$('section.cm-modalSection').css('margin-top', (height/2*-1)+ 'px');

	$('.cm-modal').fadeIn(200,'linear');
	//모달 화면 닫기
	$('.cm-close-btn,#cm_btnConfirm').click((event)=>{
		$('.cm-modal').fadeOut(200,'linear');
		$('#cm_btnCancel').removeClass('enable');
	});
}