<!-- 2024/07/17/11:04 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.spring.ict03_fastiCat.dto.AdminBannerDTO"%>
<!DOCTYPE html>
<html>
<head>
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/main.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customer/search.css">
<link rel="stylesheet" href="${path}/resources/css/calender/style.css">

<script src="https://kit.fontawesome.com/e99c5d1543.js"
	crossorigin="anonymous"></script>
<!-- (3-3-2). 자바스크립트 소스 추가 -->
<!-- defer : 모든 html 파일을 로딩할때까지 html이 브라우저에 표시가 안되는 것을 방지 -->

<script src="${path}/resources/js/customer/main.js" defer></script>
<title>main</title>
<script>
//공연예매 성공/실패
	let cnt = ${reservCnt};
	if(cnt == 1) {
    	alert('공연예매가 완료되었습니다.');
    	location.href="${path}/main.do";
    }
    else if(cnt != 1 && cnt != null){
    	alert('공연예매에 실패하였습니다.');
    	location.href="${path}/main.do";
    } 
</script>
</head>
<body>
	
	<div class="wrap">
		<!-- header 시작 -->
		<%@include file="header.jsp"%>
		<!-- header 끝 -->
		
		
		
		<!--  서큐리티 - UserLoginFailureHandler 에서 넘긴 msg 받기 -->
		<c:if test="${msg != null }">
			<script type="text/javascript">
				alert("${msg}");
			</script>
		</c:if>
		
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<br>
		<%
			int activeBannerCount = 0;
			List<AdminBannerDTO> banners = (List<AdminBannerDTO>) request.getAttribute("bannerList");
			for (AdminBannerDTO dto : banners) {
				if ("사용함".equals(dto.getBannerStatus())) {
					activeBannerCount++;
				}
			}
		%>


		<!-- 컨텐츠 시작 -->
		<div align="center">
			<div class="slide_section">
				<input type="radio" name="slide" id="slide01" checked>
				<%
					for (int i = 2; i <= activeBannerCount; i++) {
				%>
				<input type="radio" name="slide" id="slide0<%=i%>">
				<%
					}
				%>


				<div class="slidewrap">
					<ul class="slidelist">
						<!-- 배너 슬라이드 영역 -->
						<c:forEach var="dto" items="${bannerList}">
							<c:if test="${dto.bannerStatus == '사용함'}">
								<li class="slideitem"><a>
										<div class="textbox"></div> <img src="${dto.bannerImg}"
										width="1160" height="586">
								</a></li>
							</c:if>
						</c:forEach>

						<!-- 좌,우 슬라이드 버튼 -->
						<div class="slide-control">
							<%
								for (int i = 1; i <= activeBannerCount; i++) {
							%>
							<div>
								<label for="slide0<%=(i == 1 ? activeBannerCount : i - 1)%>"
									class="left"></label> <label
									for="slide0<%=(i == activeBannerCount ? 1 : i + 1)%>"
									class="right"></label>
							</div>
							<%
								}
							%>
						</div>
					</ul>
					<!-- 페이징 -->
					<ul class="slide-pagelist">
						<%
							for (int i = 1; i <= activeBannerCount; i++) {
						%>
						<li><label for="slide0<%=i%>"></label></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		<div class="calendar-container">
			<div class="calendar-header">
				<button id="prevBtn">◀</button>
				<span id="currentMonth"></span>
				<button id="nextBtn">▶</button>
			</div>
			<div id="calendarDates"></div>
		</div>
		
		<!-- footer 시작 -->
		<%@include file="footer.jsp"%>
		<!-- footer 끝 -->

	</div>
	
	<!-- 자동 슬라이드 전환 스크립트 -->
    <script>
        let currentSlide = 1;
        const totalSlides = <%= activeBannerCount %>;
		
     	// 현재 슬라이드 화면표시하기 위해 라디오 버튼 체크 활성화
        function showSlide(slideIndex) {
            document.getElementById('slide0' + slideIndex).checked = true;
        }
		// 현재 current수가 total이면 다시 첫번째슬라이드로
        function nextSlide() {
            currentSlide = currentSlide >= totalSlides ? 1 : currentSlide + 1;
            showSlide(currentSlide);
        }

        // 4초마다 슬라이드 전환
        setInterval(nextSlide, 4000);
        
        //shows
        var shows = [
	        <c:forEach var="item" items="${list}" varStatus="status">
	            {
	                "showNum": "${item.showNum}",
	                "showName": "<c:out value='${fn:escapeXml(item.showName)}'/>",
	                "curCapacity": "${item.curCapacity}",
	                "maxCapacity": "${item.maxCapacity}",
	                "showDay": "<c:out value='${item.showDay}'/>", // 날짜 처리 필요
	                "show": "<c:out value='${item.show}'/>"
	            }
	            <c:if test="${!status.last}">,</c:if>
	        </c:forEach>
	    ];
	    
	    let path = "<c:out value='${path}'/>";
	    
    </script>
	
	<script src="${path}/resources/js/calender/calendar.js"></script>
</body>
</html>
