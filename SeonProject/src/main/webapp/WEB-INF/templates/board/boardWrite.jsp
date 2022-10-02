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
    
<style type="text/css">

#title{
    width:820px;
}

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
    
    <!-- 바디라인 -->
    <!-- Service Start -->
    

    <div class="container-xxl py-5">
        <div class="container">
                <p class="fs-5 fw-bold text-primary">함께하는 즐거움!</p>
                <h1 class="display-5 mb-5">챌린저스 등록</h1>

	        

	        <input id="wdate" value="${board.wdate}" name="wdate"  type="hidden" />
	        
	        
	        <form class="myform" enctype="multipart/form-data" id="insert">
	         <c:if test="${board != null}">
        		<input name="boardNo" value="${board.boardNo}" type="hidden" />
        		
        	</c:if>
	        
	        <!-- 테이블 -->
	        <table class="table">
	            <tr>
	                <th style="padding:13px 0 0 15px;">제목</th>
	                <td><input name="title" type="text" value="${board.title }"/></td>
	            </tr>
	            
	           
	            <tr>
	            	<th style="padding:13px 0 0 15px;">기간</th>
	            	<td><input type="radio" name="endDate" value="7">1주 &nbsp&nbsp
						<input type="radio" name="endDate" value="14">2주 &nbsp&nbsp
	            		<input type="radio" name="endDate" value="28">4주</td>
	            </tr>
	            
	            <tr>
	                <th style="padding:13px 0 0 15px">분류</th>
	                <td>
	                        <select  id="plantType" name="plantType">
	                            <option value="채소">채소</option>
	                            <option value="다육이">다육이</option>
	                        </select>
	                </td>
	            </tr>
	            
	            <tr>
	                <th style="padding:13px 0 0 15px;">내용</th>
	                <td><textarea name="content" maxlength="140" rows="10" cols="100" style="height: 300px;">${board.content }</textarea>
	                </td>
	            </tr>
	            
	            <!-- 파일업로드 -->
	            <tr>
	                <th style="padding:13px 0 0 15px;">파일첨부</th>
	                <td><input type="file" id="file" name="file"></td>
	            </tr>         
	        </table>
	        </form>
	        
	        <c:if test="${board.boardNo ==null}">
		        <div align="right">
	            	<input type="submit" form="insert" class="btn btn-primary py-3 px-4" value="등록" formaction="upload_ok.do" formmethod="post"/>
	            </div>
            </c:if>
            
            <c:if test="${board.memberId ==sessionMember.memberId}">
		        <div align="right">
	            	<input type="submit" form="insert" class="btn btn-primary py-3 px-4" value="수정" formaction="boardUpdate.do" formmethod="post"/>
	            </div>
            </c:if>
        </div>
    </div>
    </div>
    <!-- Service End -->

    

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