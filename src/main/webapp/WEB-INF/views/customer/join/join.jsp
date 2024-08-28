<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customer/join.css">

<script src="https://kit.fontawesome.com/e99c5d1543.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/customer/main.js" defer></script>
<!-- join.js -->

<title>회원가입</title>

</head>
<body>

   <div class="wrap">
      <!-- header 시작 -->
	<%@ include file="../../common/header.jsp" %>
      <!-- header 끝 -->
      
      <!-- 컨텐츠 시작 -->
      <div id="container">
      	<div id="contents">
      		<!-- 상단 중앙 1 시작 -->
      		<div id="section1">
      			<h1 align="center"> 회원가입 </h1>
      		</div>
      		
      		<!-- 상단 중앙 2 시작 -->
      		<div id="section2">
      			<div class="s2_inner">
      				<div class="join">
      					<form name="joinform" action="joinAction.do" method="post"
      						onsubmit="return signInCheck()">
      						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      						
      						<!-- 2-1. 중복확인 -->
      						<input type="hidden" name="hiddenUserid" value="0">
      						<table>
								<tr>
									<th>* 아이디 </th>
									<td>
										<input type="text" class="input" name="userid" size="20" placeholder="공백없이 20자 이내로 작성" required autofocus>
										<input type="button" name="dubChk" value="중복확인" style="margin-left:10px" onclick="confirmId()" >
									</td>
								</tr>
								
								<tr>
									<th>* 비밀번호 </th>
									<td>
										<input type="password" class="input" name="password" size="20" placeholder="공백없이 20자 이내로 작성" required>
									</td>
								</tr>	
								
								<tr>
									<th>* 비밀번호 (확인)</th>
									<td>
										<input type="password" class="input" name="repassword" size="20" placeholder="비밀번호 확인" required>
									</td>
								</tr>		
								
								<tr>
									<th>* 이름 </th>
									<td>
										<input type="text" class="input" name="username" size="20" placeholder="이름 작성" required>
									</td>
								</tr>
								
								<tr>
									<th>* 생년월일 </th>
									<td>
										<input type="date" class="input" name="birthday" size="8" placeholder="-없이 생년월일 8자리" required>
									</td>
								</tr>								
								
								<tr>
									<th>* 주소 </th>
									<td>
										<input type="text" class="input" name="address" size="60" placeholder="주소 작성" required>
									</td>
								</tr>								
						
								<tr>
									<th> 연락처 </th>
									<td>
										<input type="text" class="input" name="hp1" size="3" style="width:50px">
										-
										<input type="text" class="input" name="hp2" size="4" style="width:70px">
										-
										<input type="text" class="input" name="hp3" size="4" style="width:70px">
									</td>
								</tr>								

								<tr>
									<th> * 이메일 </th>
									<td>
										<input type="text" class="input" name="email1" size="20" style="width:100px" required>
										@
										<input type="text" class="input" name="email2" size="20" style="width:100px" required>
										<select class="input" name="email3" style="width:100px" onchange="selectEmailChk()">
											<option value="0">직접입력</option>
											<option value="naver.com">네이버</option>
											<option value="google.com">구글</option>
											<option value="daum.net">다음</option>
											<option value="nate.com">네이트</option>
										</select>
									</td>
								</tr>								
							
								<tr>
									<td colspan="2" style="border-bottom: none">
										<br>
										<div align="right">
											<input class="inputButton" type="submit" value="회원가입">
											<input class="inputButton" type="reset" value="초기화">
											<input class="inputButton" type="button" value="가입취소" onclick="window.location='${path}/main.do'">
										</div>
									</td>
								</tr>
																																																			
      						</table>
      					</form>
      				</div>
      			</div>
      		</div>
 		</div>
      </div>
      <!-- 컨텐츠 끝 -->
      
      <script src="${path}/resources/js/customer/join.js" defer></script>
      
      <!-- footer 시작 -->
	<%@ include file="../../common/footer.jsp" %>
      <!-- footer 끝 -->
      
   </div>
   
</body>
</html>