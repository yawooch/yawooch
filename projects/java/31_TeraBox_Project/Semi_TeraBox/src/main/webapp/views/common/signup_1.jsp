<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
    <link rel="stylesheet" href="${path}/views/common/css/signup_1.css">
    
 <main>
    <section>
    <form class="cm-col-wrap" action="/member/agree" method="post">
    <div class="cm-member-wrap">
        <!-- 로고 -->
        <div class="cm-logo"><a href="https://megabox.co.kr/main" id="cm_logo">Megabox lifetheather</a>
        </div>
        <!-- 상단바 -->
        <div class="cm-col-wrap">
            <!--step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 
                단계 중 step1 본인인증 단계-->
            <div class="cm-step-member">
                <ol>
                    <li>
                        <p class="cm-step on">
                            <span>STEP1.본인인증</span>
                        </p>
                    </li>
                    <li>
                        <p class="cm-step">
                            <span>STEP2.약관동의</span>
                        </p>
                    </li>
                    <li>
                        <p class="cm-step">
                            <span>STEP3.정보입력</span>
                        </p>
                    </li>
                    <li>
                        <p class="cm-step">
                            <span>STEP4.가입완료</span>
                        </p>
                    </li>
                </ol>
            </div>
            <!-- "회원가입을 위한 가입확인 단계입니다."" 문구 -->
            <div class="cm-signtitle">
                <p>회원가입을 위한 가입확인 단계입니다.</p>
            </div>
            <!-- 이름, 주민번호, 휴대번호 입력창 -->
            <div class="cm-member-table-wrap">
                <table class="cm-member-table-form">
                    <colgroup>
                        <!-- col : col 은 column의 약자로 열을 합니다. 해당 열의 속성을 지정할 때 사용합니다. -->
                        <col> <!-- 왼쪽 -->
                        <col> <!-- 오른쪽 -->
                    </colgroup>
                    <tbody>
                        <!-- 이름 입력 폼 -->
                        <tr>
                            <th>이름</th>
                            <td colspan="3"><input type="text" class="cm-member-table-input1" name="cm_name" id="cm_name" autocomplete="off" required maxlength="20"></td> <!--required : 필수입력폼-->

                        </tr>
                        <!-- 주민번호 입력 폼 -->
                        <tr>
                            <th>주민번호</th>
                            <td class="cm-mti-left"><input type="text" class="cm-member-table-input2" name="cm_security1" id="cm_security1" autocomplete="off" required maxlength="6"></td>
                            <td class="cm-mti-middle">-</td>
                            <td class="cm-mti-right"><input type="password" class="cm-member-table-input2" name="cm_security2" id="cm_security2" autocomplete="off" required maxlength="7"></td>
                        </tr>
                        <!-- 휴대폰번호 입력 폼 -->
                        <tr>
                            <th>휴대폰번호</th>
                            <td colspan="3"><input type="tel" class="cm-member-table-input1" name="cm_phone" id="cm_phone" autocomplete="off" required maxlength="20" placeholder="-를 제외한 입력"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 하단 문구  -->
            <div class="cm-member-bottom-text">
                <ul style="list-style-type: disc">
                    <li>14세 미만 어린이는 보호자 인증을 추가로 완료한 후 가입이 가능합니다.</li>
                    <li>본인인증시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증이외의 용도로 이용 또는 저장되지 않습니다.</li>
                </ul>
            </div>
            <!-- 확인 버튼 -->
            <div class="cm-agree-btn-bottom">
                <button id="cm_btnagreebottom" type="submit" class="cm-button red" disabled>확인</button>
            </div>
        </div>
    </div>
    <script>
	    const formWrap = document.querySelector('.cm-col-wrap');
	    const nameForm = document.querySelector('#cm_name');
	    const mtiForm = document.querySelector('.cm-member-table-input2');
	    const phoneForm = document.querySelector('#cm_phone');
	    const loginButton = document.querySelector('#cm_btnagreebottom');
	    
	    nameForm.addEventListener('keyup', activeEvent);
	    mtiForm.addEventListener('keyup', activeEvent);
	    phoneForm.addEventListener('keyup', activeEvent);
	    
			
	    function activeEvent() {
	    	  switch(!(nameForm.value && mtiForm.value && phoneForm.value)){
	    	    case true : loginButton.disabled = true; break;
	    	    case false : loginButton.disabled = false; break;
	    	  }
	    	}
	    
	    
	    
// 	$('.cm-id-intput-area input').on('keyup', function(event){
// 		let userId = $('#user_id').val().trim();
// 		let userPw = $('#user_pw').val().trim();
// 		if(userId !== '' && userPw !== ''){
// 			$('#cm_btnlogin').attr('disabled', null);
// 		}
// 		else{
// 			$('#cm_btnlogin').attr('disabled', 'disabled');
// 		}

// 	});
    </script>
    
    </form>
    </section>
 </main>
 
 