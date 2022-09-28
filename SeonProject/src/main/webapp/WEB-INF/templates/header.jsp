<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.seon.members.service.MembersVO" %>
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
</head>

<body>

<!-- 세션 -->
<%
   String memberId = (String) session.getAttribute("SessionMemberId");
   String memberNickname = (String) session.getAttribute("SessionMemberNickname");
   String memberGrade = (String) session.getAttribute("SessionMemberGrade");
   
   MembersVO sessionMember = (MembersVO) session.getAttribute("SessionMember");
%>

    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
    <!-- Spinner End -->





    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="main.do" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h1 class="m-0">Green House </h1>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="boardlist.do" class="nav-item nav-link">참여하기</a>
                  <a href="#" class="nav-item nav-link">식물검색</a>
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
            <!-- 
            <a href="login.do" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">로그인<i class="fa fa-arrow-right ms-3"></i></a> -->
            
            
            <!-- 여기부터어어 --> 
            <%
             if(memberId == null) {                
                %>      
			 <a href="login.do" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">로그인<i class="fa fa-arrow-right ms-3"></i></a>
                    <%
                } else if(memberGrade.equals("Admin")) {
                %>
                        <div class="nav-item dropdown">
		                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">관리페이지</a>
		                    <div class="dropdown-menu bg-light m-0">
		                        <a href="#" class="dropdown-item">회원관리</a>
		                        <a href="#" class="dropdown-item">참가관리</a>
		                    </div>
		                </div>
                  <a href="#" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">${SessionMemberId}님 반갑습니다.</a>
				  <a href="logout.do" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">LOGOUT</a>
                       <%   
                   } else {
                       %> 
                        <div class="nav-item dropdown">
		                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
		                    <div class="dropdown-menu bg-light m-0">
		                        <a href="#" class="dropdown-item">참가내역조회</a>
		                        <a href="#" class="dropdown-item">개인정보 조회</a>
		                    </div>
		                </div>
                                    
                           <a class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">${SessionMemberId}님 반갑습니다.</a>
 						   <a href="logout.do" class="btn btn-primary py-4 px-lg-4 rounded-0 d-none d-lg-block">LOGOUT</a>

                       <%
                          }
                       %>

        </div>
    </nav>
    <!-- Navbar End -->


   
  </body>

</html>