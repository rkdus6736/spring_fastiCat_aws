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

    <title>배너 수정</title>


<script> /* 이미지 미리보기 */
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('imgPreview');
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
</script>


</head>


<body id="page-top">

		<!-- header 시작 -->
		<%@ include file="../ad_common/ad_header.jsp" %>
		<!-- header 끝 -->


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">배너 수정</h1>
                    </div>
					
					<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between align-items-center">
   							<h6 class="m-0 font-weight-bold text-primary">배너 수정</h6>
						</div>

                        <div class="card-body">
                            <div class="table-responsive">
                            	<form name="ad_bannerModify" action="ad_bannerModifyAction.adban?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	                               
	                                
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <!-- hidden : 직접 input 태그에서 입력받지 못한 값들을 전달할 때 사용 -->
			                           <input type="hidden" name="hiddenPageNum" value="${pageNum}">
			                           <input type="hidden" name="hiddenBannerNo" value="${dto.bannerNo}">
			                           <input type="hidden" name="hiddenBannerImg" value="${dto.bannerImg}"> 
	                                    
	                                    <tr>
	                                    	<th> * 배너번호 </th>
	                                    	<td>${dto.bannerNo}</td>
	                                    </tr>
	                                    
	                                    <tr>
				                            <th> * 배너분류 </th>
				                            <td>                                 
			                                <select class="input" name="bannerArea" id="bannerArea" required>
			                                    <option <c:if test="${dto.bannerArea == '메인배너1'}">selected</c:if> value="메인배너1">메인배너1</option>
			                                    <option <c:if test="${dto.bannerArea == '메인배너2'}">selected</c:if> value="메인배너2">메인배너2</option>
			                                    <option <c:if test="${dto.bannerArea == '메인배너3'}">selected</c:if> value="메인배너3">메인배너3</option>
			                                    <option <c:if test="${dto.bannerArea == '메인배너4'}">selected</c:if> value="메인배너4">메인배너4</option>
			                                    <option <c:if test="${dto.bannerArea == '메인배너5'}">selected</c:if> value="메인배너5">메인배너5</option>
			                                </select>
			                                </td>
		                           		</tr>
		                           		<tr>
			                           		<td><strong> * 사용여부</strong></td>
						                    <td>
						                        <label><input type="radio" name="bannerStatus" value="사용함" checked> 사용함</label>
						                        <label><input type="radio" name="bannerStatus" value="사용안함"> 사용안함</label>
						                    </td>
		                           		<tr>
										    <th> * 이미지 등록 (1160*586 권장) </th>
										    <td>
										        <div style="display: flex; align-items: center;">
										            <!-- 기존 이미지 미리보기 -->
										            <div style="margin-right: 20px;">
										                	기존이미지: <br>
										                <img src="${dto.bannerImg}" width="200px" height="100px" alt="현재 이미지">
										            </div>
										            <!-- 파일 입력 및 변경할 이미지 미리보기 -->
										            <div>
										                <input type="file" class="input" name="bannerImg" id="bannerImg" accept="image/*" onchange="previewImage(event)">
										            </div>
										            <div>
										                	변경 이미지 : <br>
										                <img src="#" width="200px" height="100px" id="imgPreview" class="img-preview" alt="이미지 미리보기">
										            </div>
										        </div>
										    </td>
										</tr>

			                           
			                            <tr>
			                              <td colspan="2">
			                                 <br>
			                                 <div align="right">
			                                    <input class="btn btn-primary inputButton" type="submit" value="배너수정">
			                                    <input class="btn btn-secondary inputButton" type="button" value="배너목록" onclick="window.location='ad_bannerEdit.adban'">
			                                 </div>
			                              </td>
			                           </tr>
	                                </table>
	                        	</form>
                            </div>
                        </div>
                    </div>
					
                </div>
                <!-- /.container-fluid -->


            <!-- footer 시작 -->
			<%@ include file="../ad_common/ad_footer.jsp" %>
			<!-- footer 끝 -->
       

</body>

</html>