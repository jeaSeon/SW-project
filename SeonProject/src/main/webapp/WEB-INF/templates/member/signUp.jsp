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
function memberId_check() {
	var id = $('#memberId').val();
	if(id == ""){
		alert("아이디를 입력해주세요.")
	}else{
		$.ajax({
			url: 'memberId_check.do',
			type: 'POST',
			data: {memberId:id},
			datatype: 'JSON',
			success: function (data) {
				if(data == 0){
					alert("사용할 수 있는 아이디입니다.");
					$('#id_check').html('사용할 수 있는 아이디입니다.');
	    	      	$('#id_check').attr('color', '#199894b3');  
				} else {
					alert("중복된 아이디가 존재합니다.");
					$('#id_check').html('중복된 아이디가 존재합니다.');
	    	      	$('#id_check').attr('color', '#FF0000');  
				}
			}
		})
	}
	}
	
function memberNickname_check() {
	var nickname = $('#memberNickname').val();
	if(nickname == ""){
		alert("닉네임을 입력해주세요.")
	} else {
		$.ajax({
			url: 'memberNickname_check.do',
			type: 'POST',
			data: {memberNickname:nickname},
			datatype: 'JSON',
			success: function (data) {
				if(data == 0){
					alert("사용할 수 있는 닉네임입니다.");
					$('#nickname_check').html('사용할 수 있는 닉네임 입니다.');
	    	      	$('#nickname_check').attr('color', '#199894b3');  
				} else {
					alert("중복된 닉네임이 존재합니다.");
					$('#nickname_check').html('중복된 닉네임이 존재합니다.');
	    	      	$('#nickname_check').attr('color', '#FF0000');  
				}
			}
		})
	}
}

function signUpMember() {		
	var id = $('#memberId').val();
	var password = $('#memberPassword').val();
	var name = $('#memberName').val();
	var nickname = $('#memberNickname').val();
	if(id==""){
		alert("아이디를 입력해주세요")
	} else if(password ==""){
		alert("비밀번호를 입력해주세요")
	} else if(name == "") {
		alert("이름을 입력해주세요")
	} else if(nickname==""){
		alert("닉네임을 입력해주세요")
	} else {
		$.ajax({
			url: 'signUpMember.do',
			type: 'POST',
			data: {
				memberId:id,
				memberPassword:password,
				memberName:name,
				memberNickname:nickname
			},
			datatype: 'JSON',
			success: function (data) {
				if(data == "id"){
					alert("아이디 중복체크가 필요합니다.");
				} else if(data == "nick") {
					alert("닉네임 중복체크가 필요합니다.");
				} else if(data == "ok") {
					alert("회원 가입 성공!");
					location='login.do'
				}
			}
		})		
	}
}
    
</script> 
</head>


<body>
<jsp:include page="../header.jsp"></jsp:include>

	
    

     <div id="wrap">
        <!-- Quote Start 
        data-image-src="img/carousel-2.jpg"-->
    <!--    <div class="container-fluid quote my-5 py-5" data-parallax="scroll" >-->
      <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="bg-white rounded p-4 p-sm-5 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="display-5 text-center mb-5">회원가입</h1>
                        <div class="row g-3">
                            <div class="col-12 text-center">
                                <div class="form-floating">
                                    <input type="text" class="form-control bg-light border-0" id="memberId" name="memberId" >
                                    <label for="memberId">아이디</label>
                                    <input type="button" class="btn" onclick="memberId_check()" value="아이디 중복 체크"/><span></span><font id="id_check" size="2"></font>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="form-floating">
                                    <input type="text" class="form-control bg-light border-0" id="memberPassword" name="memberPassword">
                                    <label for="memberPassword">비밀번호</label>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="form-floating">
                                    <input type="text" class="form-control bg-light border-0" id="memberName" name="memberName">
                                    <label for="memberName">이름</label>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="form-floating">
                                    <input type="text" class="form-control bg-light border-0" id="memberNickname" name="memberNickname">
                                    <label for="memberNickname">닉네임</label>
                                    <input type="button" class="btn" onclick="memberNickname_check()" value="닉네임 중복 체크"/><font id="nickname_check" size="2"></font>
                                </div>
                            </div>
                           <!-- 
                            <div class="col-12">
                                <div class="form-floating">
                                    <textarea class="form-control bg-light border-0" placeholder="Leave a message here" id="message" style="height: 100px"></textarea>
                                    <label for="message">Message</label>
                                </div>
                            </div> -->
                            <div class="col-12 text-center">
                                <input class="btn btn-primary py-3 px-4" type="button"  onclick="signUpMember()" value="회원가입"/>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
 	</div>
              <!-- </div>
 		Quote End -->
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