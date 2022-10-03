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
	position: relative;
	(
	absolute
	->
	relative)
	transform
	:
	translatY(
	-100%
	);
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	
</script>
</head>


<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="wrap">

		<!-- 바디라인 -->
		<!-- Service Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
					style="max-width: 500px;">
					<p class="fs-5 fw-bold text-primary">함께하는 즐거움!</p>
					<h1 class="display-5 mb-5">챌린저스</h1>
				</div>
				<c:if test="${memberId!=null}">
					<div align="right">
						<a class="btn btn-primary py-3 px-4" href="boardWrite.do">등록</a>
					</div>
				</c:if>
				<br>

				<div class="row g-4">

					<!-- 게시글 -->
					<c:forEach var="board" items="${boardList}">
						<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
							<div class="service-item rounded h-100">

								<div class="service-text rounded p-5">
									<div class="btn-square rounded-circle mx-auto mb-3">
										<img class="img-fluid" src="img/icon/icon-3.png" alt="Icon">
									</div>
									<h4 class="mb-3">${board.plantType}</h4>
									<p class="mb-4">${board.title}</p>
									<p>작성자 : ${board.memberNickname}</p>
									<!-- <p>총 참가자수 : ${board.PCount}명</p> -->
									<span class="badge rounded-pill bg-warning">${board.PCount}명
										신청</span>

									<!-- 끝나는 날짜 substring으로 문자열나누기 -->
									<c:set var="num" value="${board.endDate}" />
									<c:set var="endDate" value="${fn:substring(num, 0, 10)}" />
									<p class="mb-4">
										<fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd" />
										~ ${endDate}
										
										<c:if test="${endDate>=now}">
											<span class="badge rounded-pill bg-success">신청중</span>
										</c:if>
										<c:if test="${endDate<=now}">
											<span class="badge rounded-pill bg-danger">종료</span>
										</c:if>
									</p>
									<a class="btn btn-sm"
										href="boardOne.do?boardNo=${board.boardNo}"><i
										class="fa fa-plus text-primary me-2"></i>신청하기</a>

								</div>
							</div>
						</div>
					</c:forEach>


				</div>



			</div>
			<!-- Service End -->
		</div>
	</div>






	<!-- Copyright Start -->
	<footer>
		<div class="container-fluid copyright py-4">
			<div class="container">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Green House</a>, 화분키우기의 재미를 함께 느껴보세요.
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