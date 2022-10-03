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
	
	
</script>
</head>


<body>
	<jsp:include page="../header.jsp"></jsp:include>

<div id="wrap">
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5 align-items-end">
				<div class="col-lg-3 col-md-5 wow fadeInUp" data-wow-delay="0.1s"
					style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
				</div>

				<div class="col-lg-6 col-md-7 wow fadeInUp" data-wow-delay="0.3s"
					style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

					<input id="boardNo" name="boardNo" value="${board.boardNo}"
						type="hidden" />
					<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
						style="max-width: 500px;">
						<p class="fs-5 fw-bold text-primary">함께하는 즐거움!</p>
						<h1 class="display-5 mb-5">챌린저스</h1>
					</div>
					
					<div class="container text-center">
			            <div class="row justify-content-center">
			                <div class="col-lg-6">
			                    <!-- <i class="bi bi-exclamation-triangle display-1 text-primary"></i>
			                     <h1 class="display-1">중복</h1> -->
			                    <h1 class="mb-4">신청완료</h1>
			                </div>
			            </div>
			        </div>

					<div class="row g-5 align-items-end">
						<div class="col-lg-12 col-md-7 wow fadeInUp">
							<!-- <p class="text-primary mb-4">${board.boardNo}번글</p> -->

							<table class="table table-hover">
								<tbody>

									<tr>
										<th scope="row">아이디</th>
										<td>${sessionMember.memberId}</td>
									</tr>

									<tr>
										<th scope="row">닉네임</th>
										<td>${sessionMember.memberNickname}</td>
									</tr>

									<tr>
										<th scope="row"></th>
										<td></td>
									</tr>

									<tr>
										<th scope="row">제목</th>
										<td>${board.title}</td>

									</tr>
									<tr>
										<th scope="row">분류</th>
										<td>${board.plantType}</td>
									</tr>

									<tr>
										<th scope="row">기간</th>
										<td><c:set var="num" value="${board.endDate }" /> <c:set
												var="endDate" value="${fn:substring(num, 0, 10)}" />
											<p class="card-subtitle text-muted">
												<fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd" />
												~ ${endDate}  
										
									<c:if test="${endDate>=now}">
										<span class="badge rounded-pill bg-success">신청중</span>
									</c:if>
									<c:if test="${endDate<=now}">
										<span class="badge rounded-pill bg-danger">종료</span>
									</c:if>
									
									</p>
									</td>
									</tr>

									<tr>
										<th scope="row"></th>
										<td></td>
									</tr>

								</tbody>
							</table>
							
							<p class="text-primary mb-4">신청이 완료되었습니다 ^^<br/>
			                    				참가자분들의 도전을 응원합니다 ^^</p>

							<c:if test="${sessionMember!=null }">
								<div align="right">
									<a class="btn btn-primary py-3 px-4" href="boardlist.do">목록으로</a>
								</div>
								<br />
							</c:if>

						</div>
						
					<div class="col-lg-12 col-md-7 wow fadeInUp">
                    <div class="row g-5">
                        <div class="col-12 col-sm-6 col-lg-12">
                            <div class="border-start ps-4">
                                <!-- <i class="fa fa-award fa-3x text-primary mb-3"></i> -->
                                <i class="fa fa-users fa-3x text-primary mb-3"></i>
                                <h4 class="mb-3">자연이 주는 위로, 반려식물의 장점</h4>
                                <span>누구나 쉽게 기를 수 있습니다.<br/>
						                              인테리어에 탁월한 효과가 있습니다.<br/>
						                               쳐다만 봐도 힐링이 됩니다.<br/>
						                               집 안의 화학물질과 오염물질을 흡수합니다.<br/>
						                               피부를 정화해줍니다.<br/></span>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-lg-12">
                            <div class="border-start ps-4">
                                <h4 class="mb-3">식물키우기 관리 스케쥴</h4>
                                <span>원예, 홈가드닝 전문가부터 반려식물 초보까지 <br/>
						                                식물 인테리어를 사랑하는 가드너라면<br/>
						                                함께 식물 키우기에 동참해보세요.<br/></span>
                            </div>
                        </div>
                    </div>
                </div>
					</div>


					<!-- 
                    <h1 class="display-1 text-primary mb-0">25</h1>
                    <p class="text-primary mb-4">Year of Experience</p>
                    <h1 class="display-5 mb-4">We Make Your Home Like A Garden</h1>
                    <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                    <a class="btn btn-primary py-3 px-4" href="">Explore More</a> -->

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