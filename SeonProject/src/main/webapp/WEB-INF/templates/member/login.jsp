<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function loginMember() {
		var id = $('#memberId').val();
		var pw = $('#memberPassword').val();
		if(id == "") {
			alert("아이디를 입력해주세요.")
		} else if(pw == ""){
			alert("비밀번호를 입력해주세요.")
		} else {
			$.ajax({
				url: 'loginMember.do',
				type: 'POST',
				data: {
					memberId:id,
					memberPassword:pw
					},
				datatype: 'JSON',
				success: function (data) {
					if(data == 1){
						alert(id + "님 로그인성공!");
						location="main.do";
					} else {
						alert("아이디나 비밀번호를 확인해 주세요.");
					}
				}
			})
		}		
	}
    
</script> 
</head>


<body>

<!-- 세션 -->
<%
   String memberId = (String) session.getAttribute("SessionMemberId");
   String memberNickname = (String) session.getAttribute("SessionMemberNickname");

%>

    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
    <!-- Spinner End -->





    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="main.do" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h1 class="m-0">Green House</h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="index.html" class="nav-item nav-link">참여하기</a>
                  <!--  <a href="about.html" class="nav-item nav-link">About</a>
                <a href="service.html" class="nav-item nav-link">Services</a>
                <a href="project.html" class="nav-item nav-link active">Projects</a>
             
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="feature.html" class="dropdown-item">Features</a>
                        <a href="quote.html" class="dropdown-item">Free Quote</a>
                        <a href="team.html" class="dropdown-item">Our Team</a>
                        <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                        <a href="404.html" class="dropdown-item">404 Page</a>
                    </div>
                </div> -->
            </div>
            <a href="login.do" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">로그인<i class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center py-5">
            <h1 class="display-3 text-white mb-4 animated slideInDown">Green House</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                <!-- 
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Pages</a></li> -->
                    <li class="breadcrumb-item active" aria-current="page">그린하우스에서 함께하는 즐거움을 느껴보세요.</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
        <!-- Quote Start 
        data-image-src="img/carousel-2.jpg"-->
    <!--    <div class="container-fluid quote my-5 py-5" data-parallax="scroll" >-->
      <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="bg-white rounded p-4 p-sm-5 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="display-5 text-center mb-5">로그인</h1>
                        <div class="row g-3">
                            <div class="col-12 text-center">
                                <div class="form-floating">
                                    <input type="text" class="form-control bg-light border-0" id="memberId" name="memberId" >
                                    <label for="memberId">아이디</label>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="form-floating">
                                    <input type="email" class="form-control bg-light border-0" id="memberPassword" name="memberPassword">
                                    <label for="memberPassword">비밀번호</label>
                                </div>
                            </div>
                           <!-- 
                            <div class="col-12">
                                <div class="form-floating">
                                    <textarea class="form-control bg-light border-0" placeholder="Leave a message here" id="message" style="height: 100px"></textarea>
                                    <label for="message">Message</label>
                                </div>
                            </div> -->
                            <br/><br/>
                            <div class="col-12 text-center">
                                <input class="btn btn-primary py-3 px-4" type="button"  onclick="loginMember()" value="로그인"/>
                                <input class="btn btn-primary py-3 px-4" type="button"  onclick="location.href='signUp.do'" value="회원가입"/>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
 	</div>
              <!-- </div>
 		Quote End -->
    

    <!-- Copyright Start -->
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
    <!-- Copyright End -->



    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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