//첫번째 배너는 가장 왼쪽에 있으면서 해당요소의 월을 표시한다.
//두번째 배너는 다음달 1일이 나타나면 해당요소의 월을 표시면서 따라다닌다..
function setYearMonBann(){
    let dateDivLeft = [0 , 70 , 140 , 210 , 280 , 350 , 420 , 490 , 560 , 630 , 700 , 770 , 840 , 910];
    let strBanner   = 0;//첫배너 위치값
    let firstDate   = ''; //다음달  첫번째 날
    let endBanner   = '';//마지막 배너 위치값
    let dateSubStr  = '';//날짜 잘라낼거다 년/월

    $('#formDeList .wrap button').each((idx, ele)=>{
        let dateData = $(ele).attr('date-data');
        let date = new Date(dateStrToMove(dateData));
        if(date.getDate() === 1)
        {
            endBanner = idx;
            firstDate = dateStrToMove(dateData);
        }
    });
    $('.date-list .year').eq(0).css('left', dateDivLeft[strBanner] + 'px');
    dateSubStr = $('#formDeList .wrap button').eq(strBanner).attr('date-data').split('.');
    $('.date-list .year').eq(0).text(dateSubStr[0]+ '.' + dateSubStr[1]);
    
    //'1일' 을 못찾았을때
    if(endBanner === 0 || endBanner === undefined || endBanner === '')
    {
        $('.date-list .year').eq(1).css('display', 'none');
    }else{
        $('.date-list .year').eq(1).css('display', 'block');
        $('.date-list .year').eq(1).css('left', dateDivLeft[endBanner] + 'px');
        dateSubStr = $('#formDeList .wrap button').eq(endBanner).attr('date-data').split('.');
        $('.date-list .year').eq(1).text(dateSubStr[0]+ '.' + dateSubStr[1]);
    }
}
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
//datepicker 기본 
let datePickerSet = {
    showOn: "button"
    , buttonImage: '/' + window.location.pathname.split('/')[1] + "/views/ticket/img/ico-calendar-w20.png"
    , buttonImageOnly: true
    , buttonText: "Select date"
    , dateFormat: 'yy-mm-dd'
    , prevText: '이전 달'
    , nextText: '다음 달'
    , monthNames:      ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
    , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
    , dayNames:        ['일', '월', '화', '수', '목', '금', '토']
    , dayNamesShort:   ['일', '월', '화', '수', '목', '금', '토']
    , dayNamesMin:     ['일', '월', '화', '수', '목', '금', '토']
    , showMonthAfterYear: true
    , yearSuffix: '년'
};
//ready 안에 있어야한다
let clickDateButton = function(event){
    let selectDate = dateStrToMove($(event.target).attr('date-data'));
    $('#datePicker').val(selectDate);
    //버튼세팅
    dateBtnCreate(dateStrToMove(selectDate));
    //배너 세팅
    setYearMonBann();
    //마지막에 함수를 다시 호출하지 않으면 이벤트가 삭제된 상태로 된다.
    $('#formDeList .wrap button').click(clickDateButton);
};
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
//예매 영화선택 화면 위쪽 날짜버튼 생성하는 함수
function dateBtnCreate(date)
{
    let tempDate = date;
    $('#formDeList .wrap *').remove();
    let createStr = '';

    //15일치만 버튼생성
    for(let idx = 0; idx < 15; idx ++){
        if(idx === 0){
            tempDate = dateStrToMove(tempDate);
        }
        else {
            tempDate = dateStrToMove(tempDate, 1);
        }
        let d = new StrDp(tempDate);
        let pickerVal = $('#datePicker').val();
        createStr += '<button class="'+ (pickerVal === dateToStr(d.datePick)? 'on':'') + ' ' + (d.dayName === '토'?'sat':d.dayName === '일'?'holi':'') +'" type="button" date-data="' + d.dateStr + '" month="'+ (d.datePick.getMonth()) +'">';
        createStr +=     '<span class="ir">'+ d.yearStr +' ' + d.monRename + '</span>';
        createStr +=     '<em style="pointer-events:none;">'+ d.date +'<span style="pointer-events:none;" class="ir">일</span></em>';
        createStr +=     '<span class="day-kr" style="pointer-events:none;display:inline-block">'+ d.dayRename +'</span>';
        createStr += '</button>';
    }
    $('#formDeList .wrap').append(createStr);
};
//영화선택시 발생하는 이벤트
function setMovieClickEvent (event){
        
    let targetEle = $(event.target);
    if(event.target.tagName == 'SPAN'){
        targetEle = $(event.target).parent();
    }

    let eventFlag = false;
    let btnOnCnt  = 0;

    //이미 선택된 영화를 다시 클릭했을때 
    if(targetEle.hasClass('on')){
        targetEle.removeClass('on');
        let emptyCnt = 0;

        let movieId = targetEle.attr('movie-no');
        $('#choiceMovieList div.bg div.wrap[movie-no=' + movieId + ']').parent().remove();
        $('#choiceMovieList').append('<div class="bg"></div>');
        
        $('#choiceMovieList div.bg').each((idx, ele)=>{
            if($(ele).html()==''){
                emptyCnt++;
            }
        });
        if(emptyCnt === 3){
            $('#choiceMovieList').hide();
            $('#choiceMovieNone').show();
        }
    }
    else{
        $('#mCSB_1_container li button').each((idx, ele)=>{
            if($(ele).hasClass('on'))
            {
                btnOnCnt++;
            }
        });
        
        if(btnOnCnt > 2){
            teraModal('영화선택은 3개 까지만 가능합니다.');
            eventFlag = true;
            return ;
        }else{
            targetEle.addClass('on');

            $('#choiceMovieNone').hide();
            $('#choiceMovieList').show();
            let emptyCnt = 0;
            let imgPath = targetEle.attr('img-path');
            // let imgPath = '/views/ticket/img/9jyGCFBkMW31zk7XRFD3PkdTOdnEvZXd_150.jpg';
            let movieId = targetEle.attr('movie-no');
            //영화 이미지 세팅 함수 시작
            // fnImage
            let createStr = '';
            createStr +='<div class="wrap" movie-no="'+ movieId +'"> <div class="img">';
            createStr +='<img src="'+ imgPath +'" alt="영화 제목" movie-no="'+ movieId +'"></div></div>';
            //삭제 버튼 이미지 제외
            // createStr +='<button type="button" class="del" onclick="fn_deleteMovieChoice(\'23077300\')">삭제</button> </div>';
            $('#choiceMovieList div.bg').each((idx, ele)=>{
                if($(ele).html()===''|| $(ele).html()===' ' ){
                    emptyCnt ++;
                }
            });
            $('#choiceMovieList div.bg').eq(btnOnCnt).append(createStr);
        }
    }
}
//극장을 선택했을 때 발생하는이벤트
function setCinemaClickEvent(event){
    let targetEle = $(event.target);

    let eventFlag = false;
    let btnOnCnt  = 0;

    //이미 선택된 영화관을 다시 클릭했을때 
    if(targetEle.hasClass('on')){
        targetEle.removeClass('on');
        let emptyCnt = 0;

        let theaterId = targetEle.attr('brch-no');
        $('#choiceBrchList div.bg div.wrap[brch-no=' + theaterId + ']').parent().remove();
        $('#choiceBrchList').append('<div class="bg"></div>');
        
        $('#choiceBrchList div.bg').each((idx, ele)=>{
            if($(ele).html() == '' ){
                emptyCnt = emptyCnt +1;
            }
        });
        if(emptyCnt === 3){
            $('#choiceBrchNone').show();
            $('#choiceBrchList').hide();
        }
    }
    else{
        $('#mCSB_4_container li button').each((idx, ele)=>{
            if($(ele).hasClass('on'))
            {
                btnOnCnt++;
            }
        });
        
        if(btnOnCnt > 2){
            teraModal('영화관 선택은 3개 까지만 가능합니다.');
            eventFlag = true;
            return ;
        }else{
            targetEle.addClass('on');

            $('#choiceBrchNone').hide();
            $('#choiceBrchList').show();
            let emptyCnt = 0;
            let theaterId = targetEle.attr('brch-no');
            // let imgPath = '/views/ticket/img/9jyGCFBkMW31zk7XRFD3PkdTOdnEvZXd_150.jpg';
            let theaterName = targetEle.attr('brch-nm');
            //영화 이미지 세팅 함수 시작
            // fnImage
            let createStr = '';
            createStr +='<div class="wrap" brch-no="'+ theaterId +'"><p class="txt">'+ theaterName +'</p></div>';
            //삭제 버튼 이미지 제외
            // createStr +='<button type="button" class="del" onclick="fn_deleteMovieChoice(\'23077300\')">삭제</button> </div>';
            $('#choiceBrchList div.bg').each((idx, ele)=>{
                if($(ele).html()===''|| $(ele).html()===' ' ){
                    emptyCnt ++;
                }
            });
            $('#choiceBrchList div.bg').eq(btnOnCnt).append(createStr);

            //상영시간표 정보를가져오는 ajax
            getTimeTablesAjax(true);
        }
    }
};
//상영 시간표를선택했을 때 발생하는이벤트
function setTmtableClickEvent(event) {
    let thisTarget = $(event.target).parents('button');

    let movieNo  = thisTarget.attr('rpst-movie-no');//영화번호
    let cinemaId = thisTarget.attr('brch-no');//극장아이디
    let scrnNo   = thisTarget.attr('play-schdl-no');//상영번호

    let createInput  = '';
    $('#selectMovieForm *').remove();

    createInput  += '<input type="hidden" name="movieNo"  value="'+ movieNo +'"/>';
    createInput  += '<input type="hidden" name="cinemaId" value="'+ cinemaId +'"/>';
    createInput  += '<input type="hidden" name="scrnNo" value="'+ scrnNo +'"/>';

    $('#selectMovieForm').append(createInput);

    $('#selectMovieForm').submit();
}
//영화 정보를 가져오는 ajax
function getMovieListAjax(){
    let selectDate = $('#datePicker').val();

    let movieAgeArr = ['age-all', 'age-12', 'age-15', 'age-19'];
    $('#mCSB_1_container ul').remove();
    let createEle = '<ul>';
    
    $.ajax({
        type : 'POST',
        url : '/' + window.location.pathname.split('/')[1] + '/ticket/movielist.ajax',
        data : {
            selectDate
        },
        success:function(movies){

            movies.forEach(movie => {
                let ageIdx = 4;
                if((movie.grade).indexOf('전체')!==-1){
                    ageIdx = 0;
                }
                if((movie.grade).indexOf('12')!==-1){
                    ageIdx = 1;
                }
                if((movie.grade).indexOf('15')!==-1){
                    ageIdx = 2;
                }
                if((movie.grade).indexOf('청소년')!==-1){
                    ageIdx = 3;
                }
                createEle +='<li> <button type="button" class="btn" movie-nm="'+ movie.korName +'" movie-no="' + movie.no + '" img-path="'+ movie.poster +'" ><span class="movie-grade small '+ movieAgeArr[ageIdx] +'"> ' + movie.grade + '</span><i class="iconset ico-heart-small">보고싶어 설정안함</i><span class="txt">' + movie.korName + '</span></button> </li>';
            });
            createEle += '</ul>';
            $('#mCSB_1_container').append(createEle);
            $('#mCSB_1_container li button').click(setMovieClickEvent);
            $(".content").mCustomScrollbar();
        },
        error: function(error){
            console.log(`status : ${error.status}`);
        }
    });
}
//극장정보를 가져오는 ajax
function getCinemaListAjax(){
    $.ajax({
        type : 'POST',
        url :  '/' + window.location.pathname.split('/')[1] + '/ticket/cinema.ajax',
            success:function(cinemas){
                $('#mCSB_4_container ul').remove();
                let createEle = '<ul>';

                cinemas.forEach(cinema => {
                    createEle +='<li> <button id="btn" type="button" brch-no="'+ cinema.cinemaId +'" brch-nm="'+ cinema.cinemaName +'"              area-cd-nm="서울" >'+ cinema.cinemaName +'</button> </li>';
                });
                createEle += '</ul>';
                $('#mCSB_4_container').append(createEle);
                $('#mCSB_4_container li button').click(setCinemaClickEvent);
                $(".content").mCustomScrollbar();
            },
            error: function(error){
                console.log(`status : ${error.status}`);
        }
    });
}
//상영시간표 정보를 가져오는 ajax
function getTimeTablesAjax(condition){
    let movieArr = [];
    let cinemaArr = [];
    let ajaxprocess = 'N';
    //초기세팅시에는 선택한 데이터를 보내지 않는다.
    if(condition)
    {
    
        $('#choiceMovieList div.bg').each((idx, ele)=>{
            let emptyValue = $(ele).children('div.wrap').attr('movie-no');
            if($(ele).html() != '' && emptyValue != undefined){
                movieArr = [...movieArr, emptyValue];
            }
        });
        $('#choiceBrchList div.bg').each((idx, ele)=>{
            let emptyValue = $(ele).children('div.wrap').attr('brch-no');
            if($(ele).html() != '' && emptyValue != undefined){
                cinemaArr = [...cinemaArr, emptyValue];
            }
        });
        if(movieArr.length === 0){
            teraModal('영화를 선택해주세요')
            return ;
        }
        ajaxprocess = 'Y'
    }
    $.ajax({
        type : 'POST',
        url : '/' + window.location.pathname.split('/')[1] + '/ticket/timetable.ajax',
        data : {
            'ajaxprocess' : ajaxprocess ,
            'movieArr' : movieArr ,
            'cinemaArr' : cinemaArr
        },
        dataType: 'json',
        traditional: true,
        success:function(tmtables){

            $('#mCSB_17_container ul').remove();
            let createEle = '<ul>';
            let selectDate = $('#datePicker').val();
            selectDate = selectDate.replaceAll('-', '').replace(/^20/gi, '');

            tmtables.forEach(tmtable => {
                createEle += '<li><button type="button" class="btn" id="'+ (selectDate + tmtable.scrnStrDttm.replace(':', '')) +'" rpst-movie-no="'+ tmtable.movieNo +'" brch-no="'+ tmtable.cinemaId +'" theab-no="03" play-schdl-no="'+ tmtable.scrnNo +'">';
                createEle += '    <div class="legend">';
                if(tmtable.scrnStrDttm.split(':')[0]<=16){
                    createEle += '        <i class="iconset ico-sun" title="조조">조조</i>';
                }
                if(tmtable.scrnStrDttm.split(':')[0]>=21){
                    createEle += '        <i class="iconset ico-moon" title="심야">심야</i>';
                }
                createEle += '    </div>';
                createEle += '    <span class="time">';
                createEle += '        <strong title="상영 시작">'+ tmtable.scrnStrDttm +'</strong>';
                createEle += '        <em title="상영 종료">~'+ tmtable.scrnEndDttm +'</em>';
                createEle += '    </span>';
                createEle += '    <span class="title">';
                createEle += '        <strong title="'+ tmtable.mvKorName +'">'+ tmtable.mvKorName +'</strong>';
                createEle += '        <em>2D</em>';
                createEle += '    </span>';
                createEle += '    <div class="info">';
                createEle += '        <span class="theater" title="극장">'+ tmtable.theaterName +'</span>';
                createEle += '        <span class="seat">';
                createEle += '            <strong class="now" title="잔여 좌석">오옹?</strong>';
                createEle += '            <span>/</span>';
                createEle += '            <em class="all" title="전체 좌석">오옹?</em>';
                createEle += '        </span>';
                createEle += '    </div>';
                createEle += '</button></li>';
            });
            createEle += '</ul>';
            $('#mCSB_17_container').append(createEle);
            $('#mCSB_17_container li button').click(setTmtableClickEvent);
            $(".content").mCustomScrollbar();
        },
        error: function(error){
            console.log(`status : ${error.status}`);
        }
    });
}

/************************************************************* */
// READY !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
/************************************************************* */

//문서 로드 후 
$(document).ready(function(){
    //날짜 선택 라이브러리 설정시작
    $('#datePicker').datepicker(datePickerSet);
    // $('#datePicker').val(dateToStr(new Date()));// datePicker 부분 날짜오늘로 초기화
    // dateBtnCreate(dateStrToMove(dateToStr(new Date()))); // 날짜 버튼 생성
    $('#datePicker').val('2024-01-28');// datePicker 부분 날짜오늘로 초기화
    dateBtnCreate(dateStrToMove('2024-01-28')); // 테스트용 날짜 버튼 생성
    //상단 년월 배너 세팅해준다.
    setYearMonBann();
    
    //영화 목록을 불러온다.
    getMovieListAjax();
    //영화관 목록을 불러온다.
    getCinemaListAjax();
    //상영시간표를 불러온다.
    getTimeTablesAjax(false);

    //스크롤바 시작
    $(".content").mCustomScrollbar();
    
    //시간 버튼 - 뒤/앞으로 이동
    $('[class$=-time]').click(function(event){
        let direction = -1;//앞으로/뒤로 방향값
        let leftSize = Number($('.wrap .view').css('left').replace('px', ''));
        let clssName = $(event.target).attr('class');
        //next / prev 클래스에따라 방향 전환
        if(clssName.indexOf('next') !== -1){
            direction = -1;
        }
        else {direction = +1;} 
        leftSize = leftSize + 35 * direction;
        $('.wrap .view').animate({left: leftSize + 'px'});
    });
    //날짜 버튼- 앞/뒤로 이동 (animate부분 일단 stop)
    $('[class$=-date]').click(function(event){
        let direction = -1;//앞으로/뒤로 방향값
        // let leftSize = Number($('.wrap .view').css('left').replace('px', ''));
        // let leftSizeChng = 0;
        let clssName = $(event.target).attr('class');
        //next / prev 클래스에따라 방향 전환
        if(clssName.indexOf('next') !== -1){
            direction = 1;
        }
        else {direction = -1;} 
        // leftSizeChng = leftSize + 70 * direction;
        // $('#formDeList .wrap').animate({left: leftSizeChng + 'px'});
        
        let dateDataVal = $('#formDeList .wrap button').attr('date-data');
        dateBtnCreate(dateStrToMove(dateDataVal, direction));
        //배너 세팅
        setYearMonBann();
        // $('#datePicker').val(datePickerVal);
        // //이동하는 척하고 다시 돌려보낸다
        // $('.wrap .view').css('left', leftSize + 'px');
    });

    //datepicker 로 날짜 선택했을때
    $('#datePicker').on('change',function(event){
        let date = $(event.target).val();
        //날짜 버튼을 생성한다.
        dateBtnCreate(date);
        setYearMonBann();
        getMovieListAjax();
    });
    $('#formDeList .wrap button').click(clickDateButton);

    //*****************************************
    // 영화 선택 시작
    //*****************************************
    $('#mCSB_1_container li button').click(setMovieClickEvent);
    //*****************************************
    // 영화관 선택 시작
    //*****************************************
    $('#mCSB_4_container li button').click(setCinemaClickEvent);
    //*****************************************
    // 시간표 선택 시작
    //*****************************************
    $('#mCSB_17_container *').click(setTmtableClickEvent);
});
