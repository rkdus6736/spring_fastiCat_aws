<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 상세페이지</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/normal_board/review_free_content.css"> 
<script src="https://kit.fontawesome.com/e3f7bcf3d6.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/request.js"></script>
<script type="text/javascript">
 $(function() {
	//댓글 목록 자동조회
	comment_list();
	
	//1.댓글쓰기 버튼 클릭(1)
	$('#btnCommentAdd').click(function() {
		comment_add();
	});

	//하트클릭
	heartClick();
	 
	//로그인안하면 하트, 댓글쓰기 안보임
	if(${sessionID == null}) { 
		$('#heart').css('display','none');
		$('.div_cmtAdd').css('display','none');
	}
	
	if(${heartChk != 0}) {
		$('#heart').addClass('filled');
	} 
	
	//사용자가 작성한 게시글인 경우 게시글 수정버튼/ 삭제버튼 & 댓글 삭제버튼 보이기
	if(${selWriter != 0}) {
		$('.btn_md').css('display','block');
	} 
	
	//수정
	$('#btn_mod').click(function() {
		location.href="${path}/boardUpdate.bc?board_category=${dto.board_category}&board_num=${dto.board_num}&pageNum=${pageNum}&${_csrf.parameterName}=${_csrf.token}";
	});
	
	//삭제 
	$('#btn_del').click(function() {
		if(confirm("삭제하시겠습니까?")) {
			location.href="${path}/boardDeleteAction.bc?board_category=${dto.board_category}&board_num=${dto.board_num}&${_csrf.parameterName}=${_csrf.token}";
		}
	});
	
	//목록으로 돌아가기(새로고침)
	$('#btn_back').click(function() {
		if(${myBoard == null}) {
			location.href="${path}/board.bc?board_category=${dto.board_category}&pageNum=${pageNum}";
		}	
		else {
			location.href="${path}/myBoardList.myp";
		}
	});	
	
}); 
 // 자동으로 댓글목록 호출
function comment_list() { //(8)
	//alert("${pageNum}");
	 let param = {
			"board_num": ${dto.board_num},
			"board_category": "${dto.board_category}",
			"pageNum": "${pageNum}"
	}  
	$.ajax({
		url:'${path}/comment_list.bc?${_csrf.parameterName}=${_csrf.token}', 
		type:'POST',
		data: param,
		success: function(result) { 
			$('#comment_list').html(result);
		},
		error: function() {
			alert('comment_list() 오류');
		}
	});
} 

//댓글쓰기 버튼 클릭
function comment_add() { 
	//alert("${sessionID}");
//alert($('#content').val());
	let param = {
			"board_num": ${dto.board_num}, 
			"board_category": "${dto.board_category}",
			"userID": "${sessionID}",
			"content": $('#content').val()
	}
	$.ajax({
		url: '${path}/comment_insert.bc?${_csrf.parameterName}=${_csrf.token}', 
		type: 'POST',
		data: param,
		success: function() { 			
			$('#content').val("");
			comment_list(); 	
		},
		error: function() {
			alert('comment_add() 오류');
		}
	});
} 

 //하트
function heartClick() {
	//좋아요 누르면 채워짐
	$('#heart').click(function() {
        $(this).toggleClass('filled');
        
	        if ($(this).hasClass('filled')) {
	        	let heart = 1;
	        	let plus = ${dto.board_heart+1};
	        	updateLike(heart, plus);
	        }
	        else {
	        	let heart = 0;
	        	let minus = ${dto.board_heart-1};
	        	updateLike(heart, minus);
	        }
    });
}

function updateLike(heart, count) {
	let param = {
			"board_num": ${dto.board_num},
			"board_category": "${dto.board_category}",
			"heart": heart,
			"board_heart": count
	}

	$.ajax({
		url: '${path}/heartClick.bc?${_csrf.parameterName}=${_csrf.token}',
		type: 'POST',
		data: param,
		success: function() {
			//alert('하트수정 성공');
			newLoad();
		},
		error: function() {
			alert('하트수정 실패');
		}
	});
}

function newLoad() { //새로고침
	let param = {
			"board_num": ${dto.board_num},
			"board_category": "${dto.board_category}",
		 	"pageNum": "${pageNum}"
	}

	$.ajax({
		url:'${path}/boardDetail.bc?${_csrf.parameterName}=${_csrf.token}',
		type:'POST',
		data: param,
		success: function(result) { 
			$('body').html(result);
		},
		error: function() {
			alert('새로고침 오류');
		}
	});
} 

</script>
</head>
<body>
	<!-- header 시작-->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- header 끝-->
	
    <form name="detailForm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <section>
        <div class="review_box">
          <div class="head">
                <div class="head_inner">
               		<span><img src="${path}/resources/images/orbit.png" width="60px" height="60px"></span>
                	<ul>
                    	<li class="writer"><span>${dto.board_writer}</span></li>
	                        <li class="boardInfo">
	                            <span class="review_catgry">
	                             <c:if test="${dto.board_category == 'review'}">
					   	  				공연후기
						    	</c:if>
						     	<c:if test="${dto.board_category != 'review'}">
						   	  			자유
						   		</c:if>
	                            </span>
	                            <span class="regDate">${dto.board_regDate}</span>
	                            <span class="views">조회수 ${dto.board_views}</span>
	                            <span><i id="board_heart" class="fa-regular fa-heart"></i>${dto.board_heart}</span>
	                        </li>
                     </ul>
                </div>
          </div>  
          
		  <div class="top_btn">	
		   	<div class="review_tit">${dto.board_title}</div> 
		   
			<div><i id="heart" class="fa-regular fa-heart"></i></div> 
		 	
		 	<div class="btn_center"> <!-- 게시글 수정/삭제 -->
                <button class="btn_md" id="btn_mod">수정</button> 
                <button class="btn_md" id="btn_del">삭제</button>     
            </div>
		 </div>	
		 
         <div class="content_box">
            <ul>
            	<c:if test="${dto.board_image != null}"> 
            		<li><img src="${dto.board_image}" class="boardImg"></li><br>
            	</c:if>
            	
                <li>
                    <div class="content_text">
                        <p>
                        	${dto.board_content}
                        </p>     
                    </div>
                </li> 
            </ul>
          </div>
        </div>
    </section>
    
   <!-- 댓글 목록  -->
    <div class="comment_section">
	    	<div>	
	        	<div id="comment_list">
	        	</div>
			</div>
		
			<div class="div_cmtAdd">	
		        <!-- 댓글작성 창 -->
		        <input type="hidden" name="sessionID" id="userID" value="${sessionID}"> <!-- **사용자 아이디(세션) -->
		        <textarea name="content" class="content" id="content" placeholder="댓글을 입력하세요" required></textarea>
		        
		        <div class="div_btn" align="right"> <!-- 댓글작성버튼 -->
		        	<input type="button" class="btnCommentAdd" id="btnCommentAdd" value="댓글 작성">
		        </div>
	    	</div>
    </div>
    </form>
    
    <!-- 목록으로 돌아가기 -->
    <div class="div_back">
    	 <div class="btn_back_box">
        	<button class="btn_back" id="btn_back">목록</button>   
    	</div>
    </div>
   
    
    <!-- footer 시작-->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- footer 끝-->
	
</body>
</html>