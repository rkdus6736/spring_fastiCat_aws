<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ad_setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ad_Header</title>

    <!-- Custom fonts for this template -->
    <link href="${path}/resources/css/admin/startbootstrap-admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${path}/resources/css/admin/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${path}/resources/css/admin/startbootstrap-admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
    
        <!-- Sidebar -->  <!-- 사이드바 색깔 변경 0617 bg-gradient-primary -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - FestiCat 관리자 로고 -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${path}/ad_dashboard.ad">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">FastiCat<br>관리자페이지</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - 현황조회 -->
            <li class="nav-item active">
                <a class="nav-link" href="${path}/ad_dashboard.ad">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>현황조회</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading">
                홈페이지관리
            </div>
            
            <!-- Nav Item - 메인관리 메뉴 -->
            <li class="nav-item">
                <a class="nav-link" href="${path}/ad_bannerEdit.adban">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>배너관리</span></a>
            </li>
            
            <!-- Nav Item - 국내공연 관리 -->
            <li class="nav-item">
                <a class="nav-link" href="${path}/ad_showEdit.adshow?showCategory=국내공연">
                    <i class="fas fa-fw fa-music"></i>
                    <span>국내공연 관리</span></a>
            </li>
            
            <!-- Nav Item - 국내페스티벌 관리 -->
            <li class="nav-item">
                <a class="nav-link" href="${path}/ad_showEdit.adshow?showCategory=페스티벌">
                    <i class="fas fa-fw fa-guitar"></i>
                    <span>국내페스티벌 관리</span></a>
            </li>
            
            <!-- Nav Item - 게시판 관리 메뉴 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>게시판 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">게시판관리</h6>
                        <a class="collapse-item" href="${path}/board.adbc?board_category=공연후기">공연후기</a>
                        <a class="collapse-item" href="${path}/board.adbc?board_category=자유">자유게시판</a>
                        <a class="collapse-item" href="${path}/ad_noticeEdit.adnot">공지사항</a>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading">
                사용자정보관리
            </div>
           
            
            <!-- Nav Item - 메인관리 메뉴 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-table"></i>
                    <span>회원관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원관리</h6>
                        <a class="collapse-item" href="${path}/ad_member.admember">가입회원관리</a>
                        <a class="collapse-item" href="${path}/ad_dropMember.admember">탈퇴회원관리</a>
                    </div>
                </div>
            </li>
            
            
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
            
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="검색..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <a href="${path }/main.do" class="d-flex align-items-center"><img
						src="${path }/resources/images/festicat.PNG" width="120px"
						height="40px" id="festicat"></a>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - 유저정보 -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.sessionID}님</span>
                                <img class="img-profile rounded-circle"
                                    src="${path}/resources/css/admin/startbootstrap-admin/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - 유저정보 -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                  	  로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->


</body>
</html>