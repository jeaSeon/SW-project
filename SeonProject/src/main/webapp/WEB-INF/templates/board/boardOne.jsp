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
	<jsp:include page="../header.jsp"></jsp:include>

	<div id="wrap">
	



	<!-- 게시글 조회 -->
	<!-- 부트 카드  
	<input id="boardNo" name="boardNo" value="${board.boardNo}" type="hidden" />
	
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-bold text-primary">함께하는 즐거움!</p>
                <h1 class="display-5 mb-5">챌린저스</h1>
            </div>
            
            <div class="col-lg-12 col-md-7 wow fadeInUp" data-wow-delay="0.3s">
			<div class="row g-5 align-items-end">
				<div class="col-lg-12 col-md-7 wow fadeInUp">
					<p class="text-primary mb-4">${board.boardNo}번글</p>

					<div class="card mb-3">
						<h2 class="card-header">${board.title}</h2>
						<div>
						<div class="card-body">
							<h5 class="card-title"><b>${board.plantType}</b></h5>
							<h6 class="card-subtitle text-muted">작성자 : ${board.memberNickname} 님 </h6><br/>
							
							<c:set var="num" value="${board.endDate }" />
							<c:set var="endDate" value="${fn:substring(num, 0, 10)}" />
							<h6 class="card-subtitle text-muted">
								<fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd" /> ~ ${endDate}  // 옆에 진행중 이런 뱃지 넣을 예정</h6><br/>
								
						</div>	--> 
						
						<!--  
						<svg xmlns="http://www.w3.org/2000/svg"
							class="d-block user-select-none" width="100%" height="200"
							aria-label="Placeholder: Image cap" focusable="false" role="img"
							preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180"
							style="font-size: 1.125rem; text-anchor: middle">
						    <rect width="100%" height="100%" fill="#868e96"></rect>
						    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
						  </svg>-->
						  
						  <!--  
						<div class="card-body">
							<h5 class="card-text">${board.content}</h5>
							<c:set var="image" value="${board.boardPicturePath }"/>     
			         		<c:if test="${fn:contains(image, '.')}">
				         		<div style="display:flex; justify-content:left; align-items:left;">         	
				        			<img src ="img/upload/${board.boardPicturePath}" width="300px", height="300px">
				       			</div>
			       			</c:if>
						</div><hr>
						
						<ul class="list-group list-group-flush">
							<li class="list-group-item">챌린저스 사항들 <br/>
							뭐... 출석률 80% 이상이면 A혜택<br/>
							출석률 50% 이상이면 B혜택<br/>
							출석률 30% 면 C혜택</li>
						</ul>
						<div class="card-footer text-muted">행복한 도전을 응원합니다~!</div>
					</div>
					

				</div>
				<c:if test="${memberId!=null }">
					<div align="right">
						<a class="btn btn-primary py-3 px-4" href="">신청하기</a>
					</div><br/>
				</c:if>
					
					<c:if test="${board.memberId==memberId}">
					<div align="right">
						<input type="button" class="btn btn-primary py-3 px-4" onclick="deleteBoard()" value="삭제하기">
						<input type="button" class="btn btn-primary py-3 px-4" onclick="updateBoard()" value="수정하기">
					</div>
					</c:if>

				</div>

			</div>
		</div>
	</div>
	</div>
	-->

					<!-- 얘 댓글로 쓰면 괜찮을 것 같음. 
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Card title</h4>
							<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="card-link">Card link</a> <a href="#"
								class="card-link">Another link</a>
						</div>
					</div>
					-->
					




	<!-- 테이블 예	-->
    <div class="container-xxl py-5">
     <div class="container">
     <input id="boardNo" name="boardNo" value="${board.boardNo}" type="hidden" />
     <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-bold text-primary">함께하는 즐거움!</p>
                <h1 class="display-5 mb-5">챌린저스</h1>
     </div>
     
     
	        <div class="row g-5 align-items-end">
	          <div class="col-lg-12 col-md-7 wow fadeInUp" >
				<p class="text-primary mb-4">${board.boardNo}번글</p>
				
			    <table class="table table-hover">
				  <tbody>
	
				    <tr>
				     <th scope="row" style="width: 100px">제목</th>
				     <td>${board.title}</td>
				     
				    </tr>
				    <tr>
				      <th scope="row" style="width: 100px">분류</th>
				      <td>${board.plantType}</td>
				    </tr>
				    <tr>
				      <th scope="row" style="width: 100px">작성자</th>
				      <td> ${board.memberNickname} </td>
				    </tr>
				    <tr>
				      <th scope="row" style="width: 100px">기간</th>
				      <td><c:set var="num" value="${board.endDate }" />
							<c:set var="endDate" value="${fn:substring(num, 0, 10)}" />
							<p class="card-subtitle text-muted">
								<fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd" /> ~ ${endDate}  // 옆에 진행중 이런 뱃지 넣을 예정</p></td>
				    </tr>
				    <tr>
				      <th scope="row" style="width: 100px">내용</th>
				      <td width=300 height=350> ${board.content}
				      <c:set var="image" value="${board.boardPicturePath }"/>     
			         		<c:if test="${fn:contains(image, '.')}">
				         		<div style="display:flex; justify-content:left; align-items:left;">         	
				        			<img src ="img/upload/${board.boardPicturePath}" width="300px", height="300px">
				       			</div>
			       			</c:if>
			       		</td>
				    </tr>
				    
				  </tbody>
				</table>
				
				
				<c:if test="${memberId!=null }">
					<div align="right">
						<input type="button" class="btn btn-primary py-3 px-4" onclick="infoChallenge()" value="신청하기">
					</div><br/>
				</c:if>
					
					<c:if test="${board.memberId==memberId}">
					<div align="right">
						<input type="button" class="btn btn-primary py-3 px-4" onclick="deleteBoard()" value="삭제하기">
						<input type="button" class="btn btn-primary py-3 px-4" onclick="updateBoard()" value="수정하기">
					</div>
					</c:if>
				
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