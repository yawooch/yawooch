<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
    <link rel="stylesheet" href="${path}/views/common/css/signup_3.css">
    <script src="${path}/views/js/jquery-3.7.1.js"></script>
    <script>
//     	$(document).ready(() => {
//     		$('#btnagreebottom').on('click',() => {
//     			let id = $('#id').val();
//     			let pwd1 = $('#pwd1').val();
//     			let pwd2 = $('#pwd2').val();
//     			let email = $('#email').val();
//     			$.ajax({
//     				type: 'post',
//     				url: '/member/enroll',
//     				data: {id,pwd1,pwd2,email},
//     				success: (data)=>{console.log(data)
//     					$('body').html(data);},
//     				error: (error)=>{console.log(`status: ${'${error.status}'}`)}
//     			})
//     		})
//     	})
    </script>
 <body>
    <section>
    <form action="/member/enroll" method="post">
        <div class="member-wrap">
        	<!-- <form method="post" action="signup_4.jsp"> -->
            <!-- 로고 -->
            <div class="logo"><a href="https://megabox.co.kr/main" id="logo">Megabox lifetheather</a>
            </div>
            <!-- 상단바 -->
            <div class="col-wrap">
                <!--step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 
                    단계 중 step3 본인인증 단계-->
                <div class="step-member">
                    <ol>
                        <li>
                            <p class="step">
                                <span>STEP1.본인인증</span>
                            </p>
                        </li>
                        <li>
                            <p class="step">
                                <span>STEP2.약관동의</span>
                            </p>
                        </li>
                        <li>
                            <p class="step on">
                                <span>STEP3.정보입력</span>
                            </p> 
                        </li>
                        <li>
                            <p class="step">
                                <span>STEP4.가입완료</span>
                            </p>
                        </li>
                    </ol>
                </div>
                <!-- "약관동의 및 정보활용동의" 문구 -->
                <div class="pageinfotextdiv">
                    <p class="page-info-text">
                        <strong>${member.memberName }님 안녕하세요</strong>
                        <span>회원정보를 입력해주세요.</span>
                    </p>
                </div>
                <!-- 회원정보 입력창 -->
                <div class="member-table-wrap">
                    <table class="member-table-form">
                        <!-- <caption></caption> -->
                        <colgroup>
                            <!-- col : col 은 column의 약자로 열을 합니다. 해당 열의 속성을 지정할 때 사용합니다. -->
                            <col class="colgroup-left"> <!-- 왼쪽 -->
                            <col> <!-- 오른쪽 -->
                        </colgroup>
                        <tbody>
                            <!-- 생년월일 -->
                            <tr>
                                <th>생년월일</th>
                                <td colspan="2">${member.birth }</td> <!--required : 필수입력폼-->

                            </tr>
                            <!-- 휴대폰번호  -->
                            <tr>
                                <th>휴대폰 번호</th>
                                <td colspan="2">${member.memPhone }</td>
                            </tr>
                            <!-- 아이디 입력 폼 -->
                            <tr>
                                <th>아이디</th>
                                <td><input type="text" class="member-table-input" name="MEMBER_ID" id="id" autocomplete="off" required maxlength="12" placeholder="영문, 숫자 조합(8~12자)">
                                	<div id="JoinInfoRegLoginPwdConfirm-error-text" class="strongId-message hide">아이디는 영문,숫자 조합 8자리 이상 12자리 이하 입니다.</div>
                                	 <div id="result"></div>
                                </td>
                                <td><button class="btn-doublechk" id="btn-doublechk">중복확인</button></td>
                                <!-- 아이디는 영문,숫자 조합 8자리 이상 12자리 이하 입니다. -->
                            </tr>
                            <!-- 비밀번호 입력 폼 -->
                            <tr>
                                <th>비밀번호</th>
                                <td colspan="2">
                                	<input type="password" class="member-table-input"  name="pwd1" id="pwd1" autocomplete="off" required maxlength="16" placeholder="영문, 숫자, 특수기호 중 2가지 이상 조합">
                                	<div id="JoinInfoRegLoginPwdConfirm-error-text" class="strongPassword-message hide">비밀번호는 영문,숫자,특수기호 중 2가지 이상 조합하여 10자리 이상 16자리 이하 입니다.</div>
	                                </td>
	                                <!-- 비밀번호는 영문, 숫자, 특수기호 중 2가지 이상 조합하여 10자리 이상 16자리 이하 입니다. -->
                            </tr>
                            <!-- 비밀번호확인 입력 폼 -->
                            <tr>
                                <th>비밀번호 확인</th>
                                <td colspan="2">
                                	<input type="password" class="member-table-input" name="PASSWORD" id="pwd2" autocomplete="off" required maxlength="16" placeholder="영문, 숫자, 특수기호 중 2가지 이상 조합">
                                	<div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>
                                </td>
                                <!-- 비밀번호는 영문, 숫자, 특수기호 중 2가지 이상 조합하여 10자리 이상 16자리 이하입니다. -->
                            </tr>
                            <!-- 이메일주소 -->
                            <tr>
                                <th>이메일 주소</th>
                                <td colspan="2">
                                	<input type="email" class="member-table-input" name="MEM_EMAIL" id="email" autocomplete="off" required maxlength="20" placeholder="이메일주소를 입력해 주세요">
                                	<div id="JoinInfoRegEmail-error-text " class="emailalert hide">올바른 이메일 형식으로 입력해주세요.</div>
                                </td>
                                <!-- 올바른 이메일 형식으로 입력해주세요. -->
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <!-- 마케팅 활용을 위한 개인정보 수집 이용 안내(선택) -->
                <div class="marketing-agree">
                    <p class="title">마케팅 활용을 위한 개인정보 수집 이용 안내</p>
                    <div class="content">
                        <dl>
                            <dt>수집목적</dt><dd>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</dd><dt>수집항목</dt><dd>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그 </dd><dt>보유기간</dt><dd>회원 탈퇴 시 혹은 이용 목적 달성 시 까지</dd><!--<dt>수집목적</dt>
                                                    <dd>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</dd>
                                                    <dt>수집항목</dt>
                                                    <dd>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그 </dd>
                                                    <dt>보유기간</dt>
                                                    <dd>회원 탈퇴 시 혹은 이용 목적 달성 시 까지</dd>-->
                        </dl>

                        <div class="radio-agree">
                            <input type="radio" id="agree" name="marketing_agree">
                            <label for="agree">동의<!--동의--></label>

                            <input type="radio" id="notagree" name="marketing_agree" class="ml20">
                            <label for="notagree">미동의<!--미동의--></label>
                        </div>
                        <p class="mt30">혜택 수신설정</p>
                        <div class="benefit-agree">
                            <input type="checkbox" id="push" class="check ml20">
                            <label for="push">알림<!--알림--></label>

                            <input type="checkbox" id="sms" class="check ml20">
                            <label for="sms">SMS</label>

                            <input type="checkbox" id="emailcheck" class="check ml20">
                            <label for="email">이메일<!--이메일--></label>
                        </div>
                        <p class="mt20">
                            ※  이벤트, 신규 서비스, 할인 혜택 등의 소식을 전해 드립니다.<br>(소멸포인트 및 공지성 안내 또는 거래정보와 관련된 내용은 수신 동의 여부와 상관없이 발송됩니다.)<!--※  이벤트, 신규 서비스, 할인 혜택 등의 소식을 전해 드립니다.<br />
                                                        (소멸포인트 및 공지성 안내 또는 거래정보와 관련된 내용은 수신 동의 여부와 상관없이 발송됩니다.)-->
                        </p>
                    </div>
                </div>
                <!-- 회원가입 버튼 -->
                <div class="agree-btn-bottom">
                    <button id="btnagreebottom" type="submit" class="button red" >회원가입</button>
                    <input type="hidden" name="memberName" value="${member.memberName}"/> 
    			    <input type="hidden" name="memSsn" value="${member.memSsn}"/> 
    			    <input type="hidden" name="memPhone" value="${member.memPhone}"/> 
                </div>
            </div>
        </div>
        <script>
    	// 아이디 중복 확인
    	$(document).ready(() => {
    		$('#btn-doublechk').on('click', () => {
    			let userId = $('#id').val().trim();
    			
    			if(userId === '') {
    				alert('아이디를 입력해 주세요.');
    			} else {
    				$.ajax({
    					type: 'GET',
    					url: '${ path }/member/idcheck',
    					dataType: 'json',
    					data : {
    						userId // userId: userId
    					},
    						
    					success: function(result) {
    			                   let elStrongIdMessage = document.querySelector('.strongId-message');
    			               console.log(result.duplicate);
    			               if (result.duplicate) {
    			            	   elStrongIdMessage.innerHTML = '이미 사용중인 아이디입니다';
    			            	   elStrongIdMessage.style.color = 'red';
    			 				  elStrongIdMessage.classList.remove('hide');
    			               } else {
    			            	   console.log('사용 가능한 아이디입니다.');
    			            	   elStrongIdMessage.innerHTML = '사용 가능한 아이디입니다.';
    			            	   elStrongIdMessage.style.color = 'green';
    			            	   elStrongIdMessage.classList.remove('hide');
    			                   
    			                }
    			            },
    					error: (error) => {
    						console.log(error);	
    					}
    				});
    			}

    			
    		});
    	});
    	
    
//     	function idCheck() {
        	   
//         	 //아이디를 입력받는input 요소 객체를 변수에 담아두기 
//         	 let $userId = $("#id input[name=MEMBER_ID]");
//         	 console.log($userId.val());
//          }


    	
    	
    	
    	
    	
// 			function validatePassword() {
// 				var newPassword = document.getElementById('pwd1').value;
// 				var confirmPassword = document.getElementById('pwd2').value;
// 				var resultDiv = document.getElementById('JoinInfoRegLoginPwdConfirm-error-text');
			
// 				var passwordRegex = /^(?=(.*[a-zA-Z])+)(?=(.*[\d])+)(?=(.*[\W_])+)[a-zA-Z\d\W_]{10,16}$/gi;
			
// 				if (passwordRegex.test(newPassword)) {
// 					if (newPassword === confirmPassword) {
// 						resultDiv.innerHTML = '비밀번호가 일치하며 유효합니다.';
// 						resultDiv.style.color = 'green';
// 					}else{
// 						resultDiv.innerHTML = '비밀번호가 일치하지 않습니다.';
// 						resultDiv.style.color = 'red';
// 					}
// 				}else{
// 					resultDiv.innerHTML = '비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.';
// 					resultDiv.style.color = 'red';
// 				}
// 			}
			
				
				let elInputId = document.querySelector('#id');
				let elStrongIdMessage = document.querySelector('.strongId-message');
				function strongId (str) {
				  return /^(?=(.*[a-zA-Z])+)(?=(.*[\d])+)[a-zA-Z\d]{8,12}$/.test(str);
				}
				
				
				elInputId.onkeyup = function () {

					elStrongIdMessage.innerHTML = '아이디는 영문,숫자 조합 8자리 이상 12자리 이하 입니다.';
					elStrongIdMessage.style.color = '#e81002';
					
					  // console.log(elInputPassword.value);
					  // 값을 입력한 경우
					  if (elInputId.value.length !== 0) {
					    if(strongId(elInputId.value)) {
					    	elStrongIdMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
					    }
					    else {
					    	elStrongIdMessage.classList.remove('hide'); // 실패 메시지가 보여야 함
					    }
					  }
					  // 값을 입력하지 않은 경우 (지웠을 때)
					  // 모든 메시지를 가린다.
					  else {
						  elStrongIdMessage.classList.add('hide');
					  }
					};
			// 1. 비밀번호 입력창 정보 가져오기
				let elInputPassword = document.querySelector('#pwd1'); // input#password
			// 2. 비밀번호 확인 입력창 정보 가져오기
				let elInputPasswordRetype = document.querySelector('#pwd2'); // input#password-retype
			// 3. 실패 메시지 정보 가져오기 (비밀번호 불일치)
				let elMismatchMessage = document.querySelector('.mismatch-message'); // div.mismatch-message.hide
			// 4. 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자, 특수문자 미사용)
				let elStrongPasswordMessage = document.querySelector('.strongPassword-message'); // div.strongPassword-message.hide
				
				function strongPassword (str) {
					  return /^(?=(.*[a-zA-Z])+)(?=(.*[\d])+)(?=(.*[\W_])+)[a-zA-Z\d\W_]{10,16}$/.test(str);
					}
				function isMatch (pwd1, pwd2) {
					  return pwd1 === pwd2;
					}
				elInputPassword.onkeyup = function () {

					  // console.log(elInputPassword.value);
					  // 값을 입력한 경우
					  if (elInputPassword.value.length !== 0) {
					    if(strongPassword(elInputPassword.value)) {
					      elStrongPasswordMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
					    }
					    else {
					      elStrongPasswordMessage.classList.remove('hide'); // 실패 메시지가 보여야 함
					    }
					  }
					  // 값을 입력하지 않은 경우 (지웠을 때)
					  // 모든 메시지를 가린다.
					  else {
					    elStrongPasswordMessage.classList.add('hide');
					  }
					};
					
					elInputPasswordRetype.onkeyup = function () {

						  // console.log(elInputPasswordRetype.value);
						  if (elInputPasswordRetype.value.length !== 0) {
						    if(isMatch(elInputPassword.value, elInputPasswordRetype.value)) {
						      elMismatchMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
						    }
						    else {
						      elMismatchMessage.classList.remove('hide'); // 실패 메시지가 보여야 함
						    }
						  }
						  else {
						    elMismatchMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
						  }
						};
						
						
				let elInputEmail = document.querySelector('#email');
				let elemailmismatch = document.querySelector('.emailalert');
				
				function emailalert (str) {
					  return emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(str);
					}
				
				elInputEmail.onkeyup = function () {

					  // console.log(elInputPassword.value);
					  // 값을 입력한 경우
					  if (elInputEmail.value.length !== 0) {
					    if(emailalert(elInputEmail.value)) {
					    	elemailmismatch.classList.add('hide'); // 실패 메시지가 가려져야 함
					    }
					    else {
					    	elemailmismatch.classList.remove('hide'); // 실패 메시지가 보여야 함
					    }
					  }
					  // 값을 입력하지 않은 경우 (지웠을 때)
					  // 모든 메시지를 가린다.
					  else {
						  elemailmismatch.classList.add('hide');
					  }
					};
					
				      let agreeAll = document.getElementById('agree');
					  let checkList = document.querySelectorAll('.check');
					  let check1 = document.getElementById('push');
					  let check2 = document.getElementById('sms');
					  let check3 = document.getElementById('emailcheck');
					  document.addEventListener('DOMContentLoaded', function () {
						  agreeAll.addEventListener('change', function () {
					      check1.checked = agreeAll.checked;
					      check2.checked = agreeAll.checked;
					      check3.checked = agreeAll.checked;
					    });
					    
// 					    checkList.forEach(function (check) {
// 					      check.addEventListener('change', function () {
// 					        if (check1.checked && check2.checked && check3.checked) {
// 					        	agreeAll.checked = true;
// 					        } else {
// 					        	agreeAll.checked = false;
// 					        }
// 					      });
// 					    });
					  });
					  
					  let notagreeAll = document.getElementById('notagree');
					  checkList = document.querySelectorAll('.check');
					  check1 = document.getElementById('push');
					  check2 = document.getElementById('sms');
					  check3 = document.getElementById('emailcheck');
					  document.addEventListener('DOMContentLoaded', function () {
						  notagreeAll.addEventListener('change', function () {
					      check1.checked = agreeAll.checked;
					      check2.checked = agreeAll.checked;
					      check3.checked = agreeAll.checked;
					    });
					    
// 						  checkList.forEach(function (check) {
// 					      check.addEventListener('change', function () {
// 					        if (check1.checked && check2.checked && check3.checked) {
// 					        	notagreeAll.checked = false;
// 					        } else {
// 					        	notagreeAll.checked = true;
// 					        }
// 					      });
// 					    });
					  });
</script>
        
       	
        </form>
</section>
</body>