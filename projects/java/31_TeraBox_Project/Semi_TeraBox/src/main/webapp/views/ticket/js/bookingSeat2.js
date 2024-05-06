//문자열을 받아 버튼생성에 필요한 형식을 반환한다.
function StrDp(dateOrigStr){
    //속성 정의
    this.dayArr      = ['일','월','화','수','목','금','토'];
    this.monthArr    = ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
    this.datePick    = new Date(dateOrigStr);//날짜 타입으로 변경
    this.dateStr     = dateOrigStr.replaceAll('-', '.');//날짜전체 yyyy.mm.dd 형식
    this.year        = this.datePick.getFullYear();//년
    this.yearStr     = this.datePick.getFullYear()+ '년';//년
    this.month       = this.datePick.getMonth() + 1;//월
    this.monRename   = this.monthArr[this.datePick.getMonth()];//1월, 2월...
    this.monthPad    = (this.datePick.getMonth() + 1)>9?(this.datePick.getMonth() + 1)+'':'0'+(this.datePick.getMonth() + 1) ;//01
    this.date        = this.datePick.getDate();//일
    this.dayName     = this.dayArr[this.datePick.getDay()];//요일
    this.dayRename   = dateStrToMove(this.datePick) === dateStrToMove(dateToStr(new Date()))? '오늘' : dateStrToMove(this.datePick) === dateStrToMove(dateToStr(new Date()), +1)? '내일' : this.dayArr[this.datePick.getDay()];//요일
}   
//날짜 타입을 넣으면 yyyy-mm-dd 타입으로 변환해준다.
function dateToStr(date){
    let year       = date.getFullYear();
    let month      = (date.getMonth()+1)>9?(date.getMonth()+1): '0'+(date.getMonth()+1);
    let dateNumStr = ((date.getDate())>9?(date.getDate()): '0'+(date.getDate()));
    return year + '-' + month + '-'+ dateNumStr;
};
//날짜 형식의 문자열을 넣으면 날짜 이동하여 yyyy-mm-dd 타입으로 반환해준다.
function dateStrToMove(dateStr, moveInt)
{
    let date = new Date(dateStr);
    if(moveInt === null || moveInt === undefined){
        date = new Date((date.setDate(date.getDate())));
    }
    else{
        date = new Date((date.setDate(date.getDate()+ Number(moveInt))));
    }
    return dateToStr(date);
};
$(document).ready(function(){
	let arr      = [];//좌석 선택 배열
	let sum      = 0; //선택 인원수
	let sel      = 0; //선택된 좌석수
	let maxCnt   = 8; // 최대 선택인원 수
	let modifyYn = false; //좌석 선택 여부

	//좌석 초기화 함수
	function initSeat(){

		//카운터 초기화
		$('span[id^=tk_now_]').html('0');

		sum = 0;
		//선택좌석 초기화
		seatSetter();
		
		arr = [];//좌석배열초기화
		//선택한 좌석을 초기화
		$('.tk-seat-click').removeClass('choiced');
		$('.tk-seat-click').css('background-image', 'url(/'+ window.location.pathname.split('/')[1] +  '/views/ticket/img/bg-seat-common.png)');

	}
	//초기화 버튼 클릭
	$('#seatMemberCntInit').on('click', function(e){
		initSeat();
	});

	//카운터가 마이너스가 클릭되었을때
	$('.tk-counter-group .tk-btn-minus').click(function(event){

		if(sum==sel&& modifyYn){
			if(confirm('선택을 취소하고 다시 선택하시겠습니까?')){
				initSeat();
				return 0;
			}
			else{
				return 0;
			}
		}
		let groupDiv = $(event.target).parents('div').attr('class').split(' ')[1];
		let nowCnt = $('#tk_now_'+groupDiv).html();
		

		//0보다 작을때 - 를 해주면 안된다.
		nowCnt = Number(nowCnt) !== 0 && Number(sum)    !== 0 ? Number(nowCnt)-1 : Number(nowCnt);
		sum    = Number(sum)-1;
		$('#tk_now_'+ groupDiv).html(nowCnt);

		if (sum < 0){
			sum    = 0;
			teraModal('관람하실 인원수를 선택해주세요');	  
		}
		//선택좌석쪽에 표시해준다.
		seatSetter();
	});
	
	//카운터가 플러스가 클릭되었을때
	$('.tk-counter-group .tk-btn-plus').click(function(event){
		let groupDiv = $(event.target).parents('div').attr('class').split(' ')[1];
		let nowCnt = $('#tk_now_'+groupDiv).html();
		
		//8보다 클때 + 를 해주면 안된다.
		nowCnt = Number(nowCnt) !== maxCnt && Number(sum)    !== maxCnt? Number(nowCnt)+1 : Number(nowCnt);
		sum    = Number(sum)+1;
		$('#tk_now_'+ groupDiv).html(nowCnt);
		
		if (sum > maxCnt){
			sum = maxCnt;
			teraModal('최대 인원수를 초과했습니다.');	  
		}
		
		//선택좌석쪽에 표시해준다.
		seatSetter();
	});
	//좌석 좌표 세팅하기
	let tkSeatClick = $('.tk-seat-click');

	//좌석에 마우스 올리고 내릴때
	tkSeatClick.on('mouseover', function(event){
		$(event.target).css('background-image', 'url(/' +window.location.pathname.split('/')[1] +  '/views/ticket/img/bg-seat-choice.png)');
		if((sum-sel)%2 == 0 && sum !== 0)
		{
			let overSeatY = $(event.target).attr('cord').replace(/[A-Z]/gi, '');
			let overSeatX = $(event.target).attr('cord').replace(/[0-9]/gi, '');
			let pareSeat = Number(overSeatY) === 12? 11 : Number(overSeatY) + 1;
			let pareElem = $('.tk-seat-click[cord=' + overSeatX + pareSeat +']');
			if(!pareElem.hasClass('choiced')){
				pareElem.css('background-image', 'url(/' +window.location.pathname.split('/')[1] +  '/views/ticket/img/bg-seat-choice.png)');
			}
		}
	});
	tkSeatClick.on('mouseout', function(event){
		if(!$(event.target).hasClass('choiced')){
			$(event.target).css('background-image', 'url(/' +window.location.pathname.split('/')[1] +  '/views/ticket/img/bg-seat-common.png)');
		}
		if((sum-sel)%2 == 0 && sum !== 0)
		{
			let overSeatY = $(event.target).attr('cord').replace(/[A-Z]/gi, '');
			let overSeatX = $(event.target).attr('cord').replace(/[0-9]/gi, '');
			let pareSeat = Number(overSeatY) === 12? 11 : Number(overSeatY) + 1;
			let pareElem = $('.tk-seat-click[cord=' + overSeatX + pareSeat +']');
			if(!pareElem.hasClass('choiced')){
				pareElem.css('background-image', 'url(/' +window.location.pathname.split('/')[1] +  '/views/ticket/img/bg-seat-common.png)');
			}
		}
	});

	//좌석을 클릭했을때
	tkSeatClick.click(function(e){
		//인원 증가도 안했는데 선택하려고할때
		if (sum <= 0 ) {
			teraModal('관람하실 인원을 먼저 선택해주세요.');
			return;
		}
		let overSeatY = $(e.target).attr('cord').replace(/[A-Z]/gi, '');
		let overSeatX = $(e.target).attr('cord').replace(/[0-9]/gi, '');
		let pareSeat = Number(overSeatY) === 12? 11 : Number(overSeatY) + 1;
		let pareElem = $('.tk-seat-click[cord=' + overSeatX + pareSeat +']');
		//선택되어 있는 좌석을 다시 클릭할때
		if($(e.target).hasClass('choiced'))
		{
			$(e.target).removeClass('choiced');
			if((sum-sel)%2 == 0 && sum !== 0)
			{
				sel --;
				pareElem.removeClass('choiced');
			}
			sel --;
			modifyYn = sel ===0? false: modifyYn; //좌석 선택 여부
		}
		else{
			if(sel !== sum)
			{
				modifyYn = true; //좌석 선택 여부
				$(e.target).addClass('choiced');
				if((sum-sel)%2 == 0 && sum !== 0)
				{
					sel ++;
					pareElem.addClass('choiced');
				}
				sel ++;
			}
			else{
				teraModal('좌석선택이 완료되었습니다.');
				return;
			}
		}
		seatSetter();
	});

	//선택좌석 세팅하는 함수
	let seatSetter = function(){
		//모든좌석 초기화
		for(let idx = 0; idx < 8; idx ++ )
		{
			$('.tk-choice-seat-now').eq(idx).html('-');
			$('.tk-choice-seat-now').eq(idx).removeClass('enabled');
			$('.tk-choice-seat-now').eq(idx).removeClass('choiced');
		}
		//선택좌석쪽에 사용가능한영역을 표시한다.
		for(let idx = 0; idx < sum; idx ++ )
		{
			$('.tk-choice-seat-now').eq(idx).addClass('enabled');
		}
		//선택한 좌석을 좌표를 가져온다
		arr = [];//좌석배열초기화
		$('.tk-seat-click').each((ele)=>{
			if($('.tk-seat-click').eq(ele).hasClass('choiced'))
			{
				arr = [...arr,$('.tk-seat-click').eq(ele).attr('cord')];
			}
		});
		//선택한 좌석 세팅
		for(let idx = 0; idx < arr.length; idx ++ )
		{
			$('.tk-choice-seat-now').eq(idx).html(arr[idx]);
			$('.tk-choice-seat-now').eq(idx).addClass('enabled');
			$('.tk-choice-seat-now').eq(idx).addClass('choiced');
		}
	};
	
	//약관필수동의 처리
	$('#tk_titleImg').click(function(){
		if($('#tk_titleImg').hasClass('checked'))
		{
			$('#tk_titleImg').removeClass('checked');
			$('#tk_next_page').removeClass('enabled');
		}
		else
		{
			$('#tk_titleImg').addClass('checked');
			$('#tk_next_page').addClass('enabled');
		}
	});
	
	$('.tk-previous-page').click(function(){
		location.href = '/'+ window.location.pathname.split('/')[1] +  '/ticket';
	});
		//예매버튼 클릭시
	$('#tk_next_page').click(function(){
		if($('#tk_next_page').hasClass('enabled')){
			let selCount = 0;
			let totCount = 0;
			let submitSign = false;

			$('.tk-choice-seat-now').each((idx, element)=>{
				console.log(element);
				if($(element).hasClass('enabled') && $(element).hasClass('choiced')){
					totCount++;
					selCount++;
				}
				else if($(element).hasClass('enabled')){
					totCount++;
				}
				console.log(`totCount : ${totCount}, selCount : ${selCount}`);
				
				if(totCount !== selCount || totCount ===0)
				{
					teraModal('좌석을 모두 선택후 예매 바랍니다.');
					submitSign = false;
				}
			});

			//만들기 전 삭제
			$('#ticketForm div.tk-my-seat input[type=hidden]').remove();

			let createInput = '';

			for(let idx = 0; idx < arr.length; idx++){
				createInput += '<input type="hidden" name="selectCord" value="'+ arr[idx] +'">';
			}
			let countSenior = Number($('#tk_now_senior').text());
			let countAdult  = Number($('#tk_now_adult').text());
			let countJunior = Number($('#tk_now_junior').text());

			console.log(`countAdult : ${countAdult}, countJunior : ${countJunior}, countSenior : ${countSenior}`);

			for(let idx = 0 ; idx < countSenior; idx++){
				createInput += '<input type="hidden" name="ticketDv"   value="경로">';
			}
			for(let idx = 0 ; idx < countAdult; idx++){
				createInput += '<input type="hidden" name="ticketDv"   value="성인">';
			}
			for(let idx = 0 ; idx < countJunior; idx++){
				createInput += '<input type="hidden" name="ticketDv"   value="청소년">';
			}
			$('#ticketForm div.tk-my-seat').append(createInput);
			
			$('#ticketForm').submit();
			// location.href = '/';
		}
	});
});