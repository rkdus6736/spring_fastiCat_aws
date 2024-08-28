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

    <title>국내공연 등록</title>


</head>

<body id="page-top">

			<!-- header 시작 -->
			<%@ include file="../ad_common/ad_header.jsp" %>
	     	<!-- header 끝 -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">국내공연 수정</h1>
                    </div>

    			<!-- 공연수정 성공 alert창 -->
                <c:if test="${updateCnt == 1}">
                  <script type="text/javascript">
                     setTimeout(function() {
                        alert("공연수정 성공!!");
                        window.location="${path}/ad_showEdit.adshow?showCategory=공연";
                     },1000); 
                  </script>
               </c:if>
               
               <c:if test="${updateCnt != 1}">
                  <script type="text/javascript">
                     setTimeout(function() {
                        alert("공연수정 실패!!");
                        window.location="${path}/ad_showModify.adshow?showCategory=공연&showNum=${hiddenShowNum}";
                     },1000); 
                  </script>
               </c:if>
                <!-- 공연수정 성공 alert창 종료 -->
               
               
                 </div> 
                <!-- /.container-fluid -->


            <!-- footer 시작 -->
			<%@ include file="../ad_common/ad_footer.jsp" %>
			<!-- footer 끝 -->

    <!-- Bootstrap core JavaScript-->
    <script src="${path}/admin/startbootstrap-admin/vendor/jquery/jquery.min.js"></script>
    <script src="${path}/admin/startbootstrap-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/admin/startbootstrap-admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path}/admin/startbootstrap-admin/js/sb-admin-2.min.js"></script>

</body>

</html>