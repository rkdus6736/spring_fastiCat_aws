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
<script src="${path}/resources/js/customer/join.js" defer></script>

<title>ID 중복확인</title>

</head>
<body onload="idConfirmFoucs()">

   <div class="wrap">
      <!-- 컨텐츠 시작 -->
      <div id="container">
      	<div id="contents">
      		<!-- 상단 중앙 1 시작 -->
      		<div id="section1">
      			<h1 align="center"> ID 중복확인 </h1>
      		</div>
      		
      		<!-- 상단 중앙 2 시작 -->
      		<div id="section2">
      			<div class="s2_inner">
      				<div class="join">
      					<form name="confirmform" action="idConfirmAction.do" method="post"
      						onsubmit="return idConfirmCheck()">
      						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      					
      						<%
      						String userid = (String)request.getAttribute("strId");
      						int selectCnt = (int)request.getAttribute("selectCnt");
      						
      						// id 중복일 때
      						if(selectCnt == 1){
      						%>
	      						<table align="center" width="500px">
									<tr>
										<th colspan="2" align="center">
											<span> <%=userid%>는 사용할 수 없습니다. </span>
										</th>
									</tr>	
									
									<tr>	
										<th align="center">* 아이디 </th>
										<td>
											<input type="text" class="input" name="userid" size="20" placeholder="공백없이 20자 이내로 작성" required autofocus>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" style="border-bottom: none">
											<br>
											<div align="right">
												<input class="inputButton" type="submit" value="확인">
												<input class="inputButton" type="reset" value="초기화">
											</div>
										</td>
									</tr>
	      						</table>
      						<%
      						// id 중복 아닐 때
      						} 
      						else{
      						%>
	      						<table align="center" width="500px">
										<tr>
											<th colspan="2" align="center">
												<span> <%=userid%>는 사용할 수 있습니다. </span>
											</th>
										</tr>	
										
										<tr>
											<td colspan="2" style="border-bottom: none">
												<br>
												<div align="right">
													<input class="inputButton" type="button" value="확인" onclick="setUserid('<%=userid%>')">
												</div>
											</td>
										</tr>
	      						</table>
      						<%	
      						}
      						%>
      					</form>
      				</div>
      			</div>
      		</div>
 		</div>
      </div>
      <!-- 컨텐츠 끝 -->
   </div>
</body>
</html>