<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>국내공연_k-pop</title> 
<link rel="stylesheet" type="text/css" href="${path}/resources/css/category_board.css/category.css">
<script src="https://kit.fontawesome.com/e3f7bcf3d6.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/request.js"></script>
<script type="text/javascript">
$(function() {
	$('.link_conctInfo').each(function(){
	      let showNo = $(this).data('show_no');
	     $(this).attr('href','${path}/showInfo.pf?showNum='+ showNo +'&pageNum=${paging.pageNum}&showCategory=${showCategory}');
	});
	
	$('.nonList').css({'font-size':'30px',
					   'font-weight':'bold',
						'margin': '50px'		   
					  });
});
</script>   
</head>
<body>
    <!-- header 시작-->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- header 끝-->
	
	<section>
	
		<!-- 컨텐츠 정렬 -->
		<c:if test="${fn:length(list) > 0}">
			<c:set var="totalSize" value="${fn:length(list)}"/>
			<c:set var="rows" value="${totalSize / 4}" />
			<c:if test="${totalSize % 4 != 0}">
			    <c:set var="rows" value="${rows + 1}" />
			</c:if>
			
		    
		        <!-- 콘텐츠 시작 -->
		        <div class="nav_title" align="center">
		        	<span>
		        		<c:if test="${showCategory == 'festival'}">
		        			페스티벌
		        		</c:if>
		        		<c:if test="${showCategory != 'festival'}">
		        			공연
		        		</c:if>
		        	</span>
		        </div>
		
		        <hr class="hr_line">
		        <div class="catgry_tab"> 
		            <div class="photo_container">
		                <c:forEach var="rowIndex" begin="0" end="${rows - 1}">
		    				<ul class="photo_list">
						        <!-- 열 반복 -->
						        <c:forEach var="colIndex" begin="0" end="3">
						            <c:set var="itemIndex" value="${rowIndex * 4 + colIndex}" />
						             <c:choose>
						                <c:when test="${itemIndex < totalSize}">
						                    <li class="photo_box">
						                        <div class="photo">
						                            <a class="link_conctInfo" data-show_no="${list[itemIndex].showNum}" data-show_category="${list[itemIndex].showCategory}">
						                            	<img src="${list[itemIndex].showImage}"></a>
						                        </div>
						                        <div>${list[itemIndex].showName}</div>
						                    </li>
						                </c:when>
						                
						                <c:otherwise>
						                    <li class="photo_box">
						                        <div class="photo">
						                            <img class="no-data">
						                        </div>
						                        <div></div>
						                    </li>
						                </c:otherwise>
						            </c:choose>
						        </c:forEach>
				    		</ul>
						</c:forEach>
					</div>
				</div>
			</c:if>
			
			<c:if test="${fn:length(list) == 0}">
				<div align="center" class="nonList">페이지 준비중 입니다.</div>
	 		<!-- 콘텐츠 끝 -->
	 		</c:if>
	 	<hr class="hr_line">
	 		
	 		<!-- 페이징 처리 -->	
			<div class="btnNum" align="center">
		        <div>
		        	<!-- 이전 버튼 활성화 -->
					<c:if test="${paging.startPage > 3}"> <!-- 시작페이지가 4부터 시작할때 이전버튼이 보임-->
						<a class="prev" href="${path}/showList.pf?showCategory=${showCategory}&pageNum=${paging.prev}"> << </a>
					</c:if>
		        </div>
		        
		        <div>
		        	<!-- 페이지 번호 처리 -->
					<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						<a href="${path}/showList.pf?showCategory=${showCategory}&pageNum=${num}">${num}</a>
					</c:forEach>
		        </div>
		        
		        <div>
		        	<!-- 다음 버튼 활성화 -->	
					<c:if test="${paging.endPage < paging.pageCount}"> <!-- 마지막페이지가 전체페이지수()보다 작을때 다음버튼이 보임-->
						<a class="next"  href="${path}/showList.pf?showCategory=${showCategory}&pageNum=${paging.next}"> >> </a>
					</c:if>
		        </div>
		    </div> <!-- 페이징 처리 끝-->
		    
       
        
       
	  	
    </section>

    <!-- footer 시작-->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- footer 끝-->

</body>
</html>