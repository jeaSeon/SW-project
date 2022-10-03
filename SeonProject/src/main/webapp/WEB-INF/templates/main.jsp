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
$(document).ready(function() {
    var arr = [];
    var today = new Date();
    var week = new Array('일', '월', '화', '수', '목', '금', '토');
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();
    var hours = today.getHours();
    var minutes = today.getMinutes();
    var hours_al = new Array('02', '05', '08', '11', '14', '17', '20', '23');
    var korea = [ {'region' : '서울','nx' : 60,'ny' : 127}, 
        {'region' : '인천','nx' : 55,'ny' : 124}, 
        {'region' : '경기도','nx' : 60,'ny' : 121}, 
        {'region' : '강원도','nx' : 92,'ny' : 131}, 
        {'region' : '충청북도','nx' : 69,'ny' : 106}, 
        {'region' : '충청남도','nx' : 68,'ny' : 100},
        {'region' : '전라북도','nx' : 63,'ny' : 89}, 
        {'region' : '전라남도','nx' : 50,'ny' : 67}, 
        {'region' : '경상남도','nx' : 90,'ny' : 77}, 
        {'region' : '경상북도','nx' : 91,'ny' : 106}, 
        {'region' : '제주도','nx' : 52,'ny' : 38} ];

    /* $('.weather-date').html(
            month + "월 " + day + "일 "
                    + week[today.getDay()] + "요일"); */

    /* 동네예보 시간이 0200 0500 ... 3시간 단위로 23시까지 */
    for (var i = 0; i < hours_al.length; i++) {
        var h = hours_al[i] - hours;
        if (h == -1 || h == 0 || h == -2) {
            var now = hours_al[i];
        }
        if (hours == 00) {
            var now = hours_al[7];
        }
    }

    /* example
     * 9시 -> 09시 변경 필요
     */
    if (hours < 10) {
        hours = '0' + hours;
    }
    if (month < 10) {
        month = '0' + month;
    }
    if (day < 10) {
        day = '0' + day;
    }

    today = year + "" + month + "" + day;

    /* 좌표 */
    $.each(korea,function(j, k) {
                        var _nx = korea[j].nx, _ny = korea[j].ny, region = korea[j].region, 
                        apikey = "g5MqBFx6c8GYYucXuwkR1wmpH1JW3%2FKYd0oq3FxnraDfU4KasJ2zv%2Bm5F7TMKooDnE8PQFPiAG8GBgMWxySoyw%3D%3D", 
                        ForecastGribURL = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData";
                        ForecastGribURL += "?ServiceKey=" + apikey;
                        ForecastGribURL += "&base_date=" + today;
                        ForecastGribURL += "&base_time=" + now + "00";
                        ForecastGribURL += "&nx=" + _nx + "&ny=" + _ny;
                        arr.push({'url' : ForecastGribURL, 'region' : region});

                        $.ajax({
                                    url : arr[j].url,
                                    type : 'GET',
                                    success : function(data) {
                                        var $data = $(data).find("response>body>items>item");
                                        var cate = '';
                                        var temp = '';
                                        var sky = '';
                                        var rain = '';

                                        $.each($data,function(i,o) {
                                                            cate = $(o).find("category").text(); // 카테고리 목록    

                                                            if (cate == 'T3H') {
                                                                temp = $(this).find("fcstValue").text(); // 3시간 온도
                                                            }
                                                            if (cate == 'SKY') {
                                                                sky = $(this).find("fcstValue").text(); // 하늘상태
                                                            }
                                                            if (cate == 'PTY') {
                                                                rain = $(this).find("fcstValue").text(); // 강수형태
                                                            }
                                                        });

                                        $('.weather').append('<li class="list-group-item weather_li'+j+'"></li>');
                                        $('.weather_li' + j).addClass('in' + j);
                                        $('.in' + j).html(temp + " ℃"); //온도 
                                        $('.in' + j).prepend(arr[j].region + '&emsp;'); // 지역이름

                                        if (rain != 0) {
                                            switch (rain) {
                                            case '1':
                                                $('.in' + j).append(" / 비");
                                                $('.in' + j).prepend('<i class="fas fa-cloud-showers-heavy"></i>&emsp;');
                                                break;
                                            case '2':
                                                $('.in' + j).append(" / 비/눈");
                                                $('.in' + j).prepend('<i class="fas fa-cloud-rain"></i>&emsp;');
                                                break;
                                            case '3':
                                                $('.in' + j).append(" / 눈");
                                                $('.in' + j).prepend('<i class="fas fa-snowflake"></i>&emsp;');
                                                break;
                                            }
                                        } else {
                                            switch (sky) {
                                            case '1':
                                                $('.in' + j).append(" / 맑음");
                                                $('.in' + j).prepend('<i class="fas fa-sun"></i>&emsp;');
                                                break;
                                            case '2':
                                                $('.in' + j).append(" / 구름조금");
                                                $('.in' + j).prepend('<i class="fas fa-cloud-sun"></i>&emsp;');
                                                break;
                                            case '3':
                                                $('.in' + j).append(" / 구름많음");
                                                $('.in' + j).prepend('<i class="fas fa-cloud"></i>&emsp;');
                                                break;
                                            case '4':
                                                $('.in' + j).append(" / 흐림");
                                                $('.in' + j).prepend( '<i class="fas fa-smog"></i>&emsp;');
                                                break;
                                            }
                                        }//if 종료
                                    }//success func 종료
                                });
                    });
});


    
</script> 
    
    
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<div id="wrap">
	<div class="container-xxl py-5">
        <div class="container">
            <div class="row g-7 align-items-center">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                    <p class="fs-5 fw-bold text-primary">자연이 주는 위로, 반려식물</p>
                    <h1 class="display-5 mb-4">그린하우스에서 <br/> 마음의 정화를 <br/> 느껴보세요</h1>
                    <p class="mb-4">누구나 쉽게 기를 수 있고, <br/>
							        쳐다만 봐도 힐링이 되는 <br/>
							                   반려식물을 통해 마음을 정화해 보세요. <br/></p>
                    <a class="btn btn-primary py-3 px-4" href="boardlist.do">참여하기</a>
                </div>
                
       		 <!-- 
                <div class="col-lg-6">
                    <div class="row g-4 align-items-center">
                        <div class="col-md-6">
                            <div class="row g-4">
                                <div class="col-12 wow fadeIn" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeIn;">
                                    <div class="text-center rounded py-5 px-4" style="box-shadow: 0 0 45px rgba(0,0,0,.08);">
                                        <div class="btn-square bg-light rounded-circle mx-auto mb-4" style="width: 90px; height: 90px;">
                                            <i class="fa fa-check fa-3x text-primary"></i>
                                        </div>
                                        <h4 class="mb-0">정서안정</h4>
                                    </div>
                                </div>
                                <div class="col-12 wow fadeIn" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeIn;">
                                    <div class="text-center rounded py-5 px-4" style="box-shadow: 0 0 45px rgba(0,0,0,.08);">
                                        <div class="btn-square bg-light rounded-circle mx-auto mb-4" style="width: 90px; height: 90px;">
                                            <i class="fa fa-check fa-3x text-primary"></i>
                                        </div>
                                        <h4 class="mb-0">보람감</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 wow fadeIn" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeIn;">
                            <div class="text-center rounded py-5 px-4" style="box-shadow: 0 0 45px rgba(0,0,0,.08);">
                                <div class="btn-square bg-light rounded-circle mx-auto mb-4" style="width: 90px; height: 90px;">
                                    <i class="fa fa-check fa-3x text-primary"></i>
                                </div>
                                <h4 class="mb-0">행복함</h4>
                            </div>
                        </div>
                    </div>
                </div>
                 -->
            </div>
        </div>
    </div>

    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
        <!-- 
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-bold text-primary">식물을 함께 키워봐요</p>
                <h1 class="display-5 mb-5">식물키우기</h1>
            </div>
            <br/><br/> -->
            
            <!-- 
            <div>
          	<p class="fs-5 fw-bold text-primary">여기에 날씨 공공데이터 넣을 예정.</p>  
            </div>
            
            <div class="vis-weather">
                <h1>전국 날씨</h1>
                <ul class="list-group list-group-flush weather"
                    style="font-weight: 600;">
                     <li class="list-group-item weather"></li> 
                </ul>
			</div> -->
            
            
            <br/><br/>
            <div class="row wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                <!-- 
                    <ul class="list-inline rounded mb-5" id="portfolio-flters">
                        <li class="mx-2 active" data-filter="*">All</li>
                        <li class="mx-2" data-filter=".first">Complete Projects</li>
                        <li class="mx-2" data-filter=".second">Ongoing Projects</li>
                    </ul> -->
                </div>
            </div>
            <div class="row g-4 portfolio-container">
                <div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.1s">
                    <div class="portfolio-inner rounded">
                        <img class="img-fluid" src="img/1.jpg" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4"></h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="img/1.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <!-- <a class="btn btn-lg-square rounded-circle mx-2" href=""><i class="fa fa-link"></i></a>  -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded">
                        <img class="img-fluid" src="img/2.jpg" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4"></h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="img/2.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.5s">
                    <div class="portfolio-inner rounded">
                        <img class="img-fluid" src="img/3.jpg" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4"></h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="img/3.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp" data-wow-delay="0.1s">
                    <div class="portfolio-inner rounded">
                        <img class="img-fluid" src="img/4.jpg" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4"></h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="img/4.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded">
                        <img class="img-fluid" src="img/5.jpg" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4"></h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="img/5.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp" data-wow-delay="0.5s">
                    <div class="portfolio-inner rounded">
                        <img class="img-fluid" src="img/6.jpg" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4"></h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="img/6.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br/><br/><br/>
    </div>
    <!-- Projects End -->


    <!-- Footer Start
    <div class="container-fluid bg-dark text-light footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Our Office</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Services</h4>
                    <a class="btn btn-link" href="">Landscaping</a>
                    <a class="btn btn-link" href="">Pruning plants</a>
                    <a class="btn btn-link" href="">Urban Gardening</a>
                    <a class="btn btn-link" href="">Garden Maintenance</a>
                    <a class="btn btn-link" href="">Green Technology</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Quick Links</h4>
                    <a class="btn btn-link" href="">About Us</a>
                    <a class="btn btn-link" href="">Contact Us</a>
                    <a class="btn btn-link" href="">Our Services</a>
                    <a class="btn btn-link" href="">Terms & Condition</a>
                    <a class="btn btn-link" href="">Support</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Newsletter</h4>
                    <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                    <div class="position-relative w-100">
                        <input class="form-control bg-light border-light w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                        <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- Footer End -->
   


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