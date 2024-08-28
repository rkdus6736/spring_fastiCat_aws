<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ad_Footer</title>
</head>
<body>

          <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Fasticat admin 2024</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">정말 로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="${path}/logout.do">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap core JavaScript-->
    <script src="${path}/resources/css/admin/startbootstrap-admin/vendor/jquery/jquery.min.js"></script>
    <script src="${path}/resources/css/admin/startbootstrap-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/resources/css/admin/startbootstrap-admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path}/resources/css/admin/startbootstrap-admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${path}/resources/css/admin/startbootstrap-admin/vendor/chart.js/Chart.min.js"></script>
    
    <!-- Page level custom scripts -->
    <script src="${path}/resources/css/admin/startbootstrap-admin/js/demo/chart-area-demo.js"></script>
    <script src="${path}/resources/css/admin/startbootstrap-admin/js/demo/chart-pie-demo.js"></script>
    
    <!-- Page level plugins -->
    <script src="${path}/resources/css/admin/startbootstrap-admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${path}/resources/css/admin/startbootstrap-admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    
    <!-- Page level custom scripts -->
    <script src="${path}/resources/css/admin/startbootstrap-admin/js/demo/datatables-demo.js"></script>



</body>

</html>