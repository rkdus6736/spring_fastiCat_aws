<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 아이디/비밀번호 찾기</title>

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">관리자 아이디/비밀번호 찾기</h1>
                                    </div>
                                    <form class="user">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="아이디를 입력하세요...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="이메일을 입력하세요...">
                                        </div>
                                        
                                        <a href="../ad_main/ad_dashboard.jsp" class="btn btn-primary btn-user btn-block">
                                            아이디 찾기
                                        </a>
                                        <hr>
                                    </form>
                                    <div class="py-3 d-flex justify-content-between align-items-center">
                                        <a class="small" href="ad_login.jsp">로그인하기</a>
                                   		<a class="small" href="../ad_join/ad_join.jsp">회원가입</a>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../startbootstrap-admin/vendor/jquery/jquery.min.js"></script>
    <script src="../startbootstrap-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../startbootstrap-admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../startbootstrap-admin/js/sb-admin-2.min.js"></script>

</body>

</html>