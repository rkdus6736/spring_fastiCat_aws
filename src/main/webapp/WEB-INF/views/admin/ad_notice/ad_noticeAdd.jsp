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

    <title>공지사항 등록</title>


</head>

<body id="page-top">

			<!-- header 시작 -->
			<%@ include file="../ad_common/ad_header.jsp" %>
	     	<!-- header 끝 -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">공지사항 등록</h1>
                    </div>
				
				
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between align-items-center">
   							<h6 class="m-0 font-weight-bold text-primary">공지사항 등록</h6>
						</div>

                        <div class="card-body">
                          <form name="ad_noticeAdd" action="${path}/ad_noticeAddAction.adnot?${_csrf.parameterName}=${_csrf.token}" method="post" >
                            
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                   
                                   <tr>
		                              <th> * 작성자 </th>
		                              <td>
		                                 <input type="text" class="input" name="N_Writer" id="N_Writer" value="${sessionScope.sessionID}" size="20" placeholder="작성자 작성" required >
		                              </td>
		                           </tr>
                                   <tr>
		                              <th> * 제목 </th>
		                              <td>
		                                 <input type="text" class="input" name="N_Title" id="N_Title" size="50" placeholder="공지사항 제목 작성" required autofocus>
		                              </td>
		                           </tr>
		                           <tr>
		                              <th> * 내용 </th>
		                              <td>
		                                 <textarea rows="5" cols="77" name="N_Content" id="N_Content" placeholder="공지사항 내용 작성" required></textarea>
		                              </td>
		                           </tr>
		                           
		                           <tr>
		                              <td colspan="2">
		                                 <br>
		                                 <div align="right">
		                                    <input type="submit" class="btn btn-primary inputButton"  value="공지사항 등록">
		                                    <input type="reset" class="btn btn-danger inputButton"  value="초기화">
		                                    <input type="button" class="btn btn-secondary inputButton"  value="공지사항 목록" onclick="window.location='ad_noticeEdit.adnot'">
		                                 </div>
		                              </td>
		                           </tr>
                                </table>
                              </div>
                           </form>
                        </div>
                    </div>
		        </div> 
                <!-- /.container-fluid -->


            <!-- footer 시작 -->
			<%@ include file="../ad_common/ad_footer.jsp" %>
			<!-- footer 끝 -->


</body>

</html>