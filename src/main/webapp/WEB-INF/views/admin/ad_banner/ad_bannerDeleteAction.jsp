<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ad_common/ad_setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>배너 삭제</title>


</head>

<body id="page-top">

			<!-- header 시작 -->
			<%@ include file="../ad_common/ad_header.jsp" %>
	     	<!-- header 끝 -->


                <!-- Begin Page Content -->

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">배너 삭제</h1>
                    </div>
					
					
				<!-- 배너 삭제 성공 alert창 -->
                <c:if test="${deleteCnt == 1}">
	                <script type="text/javascript">
	                	setTimeout(function(){
	                		alert('배너삭제 성공!!');
	                		window.location="${path}/ad_bannerEdit.adban";
	                	}, 1000);
	                </script>
                </c:if>
                
                <c:if test="${deleteCnt != 1}">
	                <script type="text/javascript">
	                	setTimeout(function(){
	                		alert('배너삭제 실패!!');
	                		window.location="${path}/ad_bannerEdit.adban";
	                	}, 1000);
	                </script>
                </c:if>
                <!-- 배너 삭제 성공 alert창 종료 -->	
                <!-- /.container-fluid -->


			<!-- footer 시작 -->
			<%@ include file="../ad_common/ad_footer.jsp" %>
			<!-- footer 끝 -->


</body>

</html>