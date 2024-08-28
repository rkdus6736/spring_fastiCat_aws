<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>댓글</title> <!-- 댓글페이지 복사 -->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/customer/comment.css"> 
<script src="${path}/resources/js/request.js"></script>
<script type="text/javascript">

$(function() {
	
	$('.btn_delCmt').each(function() {
		$(this).click(function() {
			   let board_num = $(this).data('board_num');
	           let comment_num = $(this).data('comment_num');
	           
	           if (confirm("댓글을 삭제하시겠습니까?")) {
	               location.href = '${path}/comment_deleteAction.bc?board_category=${category}&board_num=' + board_num + '&comment_num=' + comment_num + '&pageNum=${pageNum}&${_csrf.parameterName}=${_csrf.token}';
	           }
		}); 
	});
	
	$('.btn_modCmt').each(function() {
		$(this).click(function() {
			
		  let param = {
				"pageNum":"${pageNum}",
				"comment_num":$(this).data('comment_num'),
				"board_category":"${category}"
			}
         
			$.ajax({
				url:'${path}/comment_update.bc?${_csrf.parameterName}=${_csrf.token}',
				type:'POST',
				data: param,
				dataType: 'html',
				success: function(result) { 
					$('#comment_list').html(result);
				},
				error: function() {
					alert('새로고침 오류');
				}
			});
		});  
	});

	
});

</script>
</head>
<body>
    <!-- 댓글 목록.. 댓글 작성 ..  -->
     
	    <div class="comment_list" id="comment_list" >
	    <form name="commentForm" method="post">
     	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
     	<!-- 시큐리티는 버튼이 input태그여야 함 -->
	        <c:forEach var="dto" items="${list}">
		        <div class="comment"> 
	                <div><span class="comment_num" style="display: none">${dto.comment_num}</span> 
	                    <span class="comment_img"><i class="fa-regular fa-circle-user"></i></span>
	                    <span class="comment_user" id="userID">${dto.userID}</span>
	                    <span class="comment_date">${dto.regDate}</span>
	                    <!-- 세션아이디가 댓글작성자 아이디와 같을때 -->
	                    <c:if test="${dto.userID == sessionID}" ><!-- 댓글 수정/삭제 -->
		                    <span class="left_btn"><input type="button" name="btn_modCmt" id="btn_modCmt" class="btn_cmt btn_modCmt" data-comment_num="${dto.comment_num}" value="수정"></span>
		                    <span><input type="button" name="btn_delCmt" id="btn_delCmt" class="btn_cmt btn_delCmt" data-comment_num="${dto.comment_num}" data-board_num="${dto.board_num}" value="삭제"></span>
	                	</c:if> 
	                </div>
	                <div><p class="comment_text">${dto.content}</p></div>
		        </div>
		   </c:forEach>
		    </form>
	    </div>
   
    
    
</body>
</html>