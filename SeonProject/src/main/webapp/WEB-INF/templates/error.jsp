<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Gardener - Gardening Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- 부트스와치...  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">



<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<style>
html, body {
    height: 100%
}

#wrap {
    min-height: 100%;
    position: relative;
    padding-bottom: 60px;
}

footer {
    position: relative; (absolute -> relative)
    transform: translatY(-100%);
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function deleteBoard(){
		//alert("삭제시작")
		var boardNoB=$('#boardNo').val()
		alert(boardNoB)
		$.ajax({
			url:'deleteBoard.do',
			type:'GET',
			data:{
				boardNo:boardNoB
			},
			datatype:'JSON',
			success:function(data){
				alert("글이 삭제 되었습니다.")
				location.href='boardlist.do'
			}
		})
	}
	
	function updateBoard(){
		alert("수정시작")
		var boardNo=$('#boardNo').val()
		location.href='boardUp.do?boardNo='+boardNo
	}
	
	
	function infoChallenge(){
		alert("도전시작")
		var boardNo=$('#boardNo').val()
		location.href='infoChallenge.do?boardNo='+boardNo
	}
	
</script>
</head>


<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrap">

		<!-- 에러 -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
	        <div class="container text-center">
	            <div class="row justify-content-center">
	                <div class="col-lg-6">
	                    <i class="bi bi-exclamation-triangle display-1 text-primary"></i>
	                    <!-- <h1 class="display-1">중복</h1> -->
	                    <h1 class="mb-4">이미 신청된 챌린지</h1>
	                    <p class="mb-4">이미 신청된 챌린지로 다른 챌린지를 선택하여 주십시오.^^</p>
	                    <a class="btn btn-primary py-3 px-4" href="boardlist.do">목록으로</a>
	                </div>
	            </div>
	        </div>
	    </div>
	    </div>




	<!-- Copyright Start -->
	<footer>
	<div class="container-fluid copyright py-4">
		<div class="container">
			<div class="row">
				<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
					&copy; <a class="border-bottom" href="#">Green House</a>, 문구문구.
				</div>
				<div class="col-md-6 text-center text-md-end">
					<!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
					함께하는 즐거움!
				</div>
			</div>
		</div>
	</div>
	</footer>
	<!-- Copyright End -->



	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/parallax/parallax.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>

</html>