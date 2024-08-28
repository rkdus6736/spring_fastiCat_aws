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
<link rel="stylesheet" href="${path}/resources/css/customer/login.css">

<script src="https://kit.fontawesome.com/e99c5d1543.js"
	crossorigin="anonymous"></script>
<script type="${path}/resources/js/customer/main.js" defer></script>
<title>로그인 페이지</title>

</head>
<body>

	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="../../common/header.jsp"%>
		<!-- header 끝 -->
		
		<!--  서큐리티 - UserLoginFailureHandler 에서 넘긴 msg 받기 -->
		<c:if test="${msg != null }">
			<script type="text/javascript">
				alert("${msg}");
			</script>
		</c:if>

		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙 1 시작 -->
				<div id="section1">
					<h1 align="center">로그인</h1>
				</div>

				<!-- 상단 중앙 2 시작 -->
				<div id="section2">
					<div class="s2_inner">
						<div class="join">
							<form name="loginform" action="loginAction.do" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								
								<table>
									<tr>
										<th>* 아이디</th>
										<td><input type="text" class="input" name="userid"
											size="20" placeholder="공백없이 20자 이내로 작성" required autofocus>
										</td>
									</tr>

									<tr>
										<th>* 비밀번호</th>
										<td><input type="password" class="input" name="password"
											size="20" placeholder="공백없이 20자 이내로 작성" required></td>
									</tr>

									<tr>
										<td colspan="2" style="border-bottom: none"><br>
											<div align="right">
												<input class="inputButton" type="submit" value="로그인">
												<input class="inputButton" type="reset" value="초기화">
												<input class="inputButton" type="button" value="회원가입"
													onclick="window.location='${path}/join.do'"> 
											<a href="${path}/ad_dashboard.ad" style="color:white">관리자</a>
											</div></td>
									</tr>

								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../common/footer.jsp"%>
		<!-- footer 끝 -->

	</div>

</body>
</html>