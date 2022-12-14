<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pid.members.service.MembersVO"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<title>PetInDelight</title>
<style>
.btn{
   background-color: #FFA500;
   color: white;
}
.btn:hover{
   background-color: #FFA500;
   color: white;
}
#wrap{
  display: flex;
  justify-content: center;
  align-items:center;
/*   min-height: 100vh; */
}
.lab{
   display: flex;
}
html {
height: 100%;
}
body {
margin: 0;
height: 100%;
 background-image: url("${pageContext.request.contextPath}/resource/img/main.png");
 background-repeat: no-repeat;
 background-size: cover; 
}
.a {
min-height: 100%;
}

#test{
    opacity:0.8;
     background-size: contain;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="a">
<!-- 	<div id="test" class="img_cover _imgCover"	 
	 style="height: 1124px; background-image: url(&quot;https://modo-phinf.pstatic.net/20200618_47/1592466572876zOu1F_JPEG/mosaXY5Iik.jpeg&quot;);">     
 -->
<div align="center">
   <img src="${pageContext.request.contextPath}/resource/img/petindelight.png" style="width:300px; opacity:1;"><br>
   <h2 style="color:black" >????????? ??????????????? ??????</h2>
     <p style="color:black" >Pet In Delight?????? ?????????????????? ????????? ????????? ???????????????.</p><br/>
    <!-- <img src="${pageContext.request.contextPath}/resource/img/2.png" height="50%" width="100%"> <br><br> --> 
     <p style="color:black">
     <span>
     Pet In Delight??? ????????? ????????? ???????????????.<br>
     ?????? Pet In Delight??? ???????????? ??????????????? ?????? ?????????????????? ????????? ???????????????.<br>
     "??????????????? ?????? ?????? ??? ??????" Pet In Delight??? ???????????????.
     </span>
     </p>     
</div>
<br>
<div>
   <div id="wrap">
      <div>
         <label  style="color:black" for="datepicker1">?????????</label><br>
         <input type="text" class="datepicker" id="datepicker1" autocomplete="off">
      </div>
      &nbsp;
      <div>
         <label></label><br>
         <label>~</label>
      </div>
      &nbsp;
      <div>
         &nbsp;<label style="color:black" for="datepicker2">????????????</label><br>
         <input type="text" class="datepicker" id="datepicker2" autocomplete="off">
      </div>
      &nbsp;
      <div>
         <label style="color:black" for="animalcnt">?????? ???</label><br>
         <select id="animalcnt" class="form-control input-sm">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
         </select>
         <!-- <input type="text" id="animalcnt"> -->
      </div>
      &nbsp;
      <div>
         <br>
         <input type="button" class="btn" id="reserveSearch" value="??????">
      </div>
   </div>
   <br/><br/><br/>
</div> 
</div> 
 <div class="container" style="width: 100%">
      <div>      
         <div id = "showRoom">
         </div>      
      </div>
   </div>


<script>
$.datepicker.setDefaults({
     dateFormat: 'yy-mm-dd',
     prevText: '?????? ???',
     nextText: '?????? ???',
     monthNames: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
     monthNamesShort: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
     dayNames: ['???', '???', '???', '???', '???', '???', '???'],
     dayNamesShort: ['???', '???', '???', '???', '???', '???', '???'],
     dayNamesMin: ['???', '???', '???', '???', '???', '???', '???'],
     showMonthAfterYear: true,
     yearSuffix: '???'
   });
   
   
$(document).ready(function(){       
    $( "#datepicker1,#datepicker2" ).datepicker({
         changeMonth: true,
         changeYear: true,
         showMonthAfterYear: true
     });
    /* ?????? ??? ????????? ?????? ????????? ???, ?????? ??? ??????*/
    $('#datepicker1').datepicker("option", "minDate", 0);
    $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val());
    $('#datepicker1').datepicker("option", "onClose", function (selectedDate){
        $("#datepicker2").datepicker( "option", "minDate", selectedDate );
        });
    
    /* ?????? ??? ????????? ?????? ?????????, ?????? */
    $('#datepicker2').datepicker();
    $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
    $('#datepicker2').datepicker("option", "onClose", function (selectedDate){
        $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
       });
});

   
  /* $(function(){
    $('#datepicker1').datepicker({
       minDate: 0,
       onClose: function(){
          $('#datepicker2').datepicker({
             minDate: new Date($('#datepicker1').val()+1)
          })
       }
    });
  }); */
  
  /* datePickerSet($('#datepicker1'), $('#datepicker2'), true);
  
   function datePickerSet(sDate, eDate, flag){
      var sDay = sDate.val();
      var eDay = eDate.val();
      
      
     
      if( flag && !isValidStr(sDay) && !isValidStr(eDay) ){
         var sdp = sDate.datePicker().data("datepicker");
         sdp.selectDate(new Date(sDay.replace(/-/g, "-")));
      
         var edp = eDate.datepicker().data("datepicker");
         edp.selectDate(new Date(eDay.replace(/-/g, "-")));
      }
      
      if (!isValidStr(eDay)) {
            sDate.datepicker("refresh",{
               
               maxDate: new Date(eDay.replace(/-/g, "-"))
            }).val();
        }
        sDate.datepicker({
           minDate: 0,
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
                alert("start")
            }
        }).val();
        
        /* new Date(sDay.replace(/-/g,"-")) */
        
        /* if (!isValidStr(sDay)) {
           alert(new Date(sDay.replace(/-/g,"-")));
           alert(sDay)
            eDate.datepicker("refresh",{
                minDate: "20220925"
            }).val();
        }
        alert('test')
        eDate.datepicker({
           minDate: 0,
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
                alert('end')
            }
        }).val();
      
     
      function isValidStr(str) {
         if (str == null || str == undefined || str == "")
            return true;
         else
            return false;
      }
     
   } */ 
   
   $("#reserveSearch").click(function() {
      if($('#datepicker1').val() == ""){
         alert("?????? ????????? ?????? ???????????? .")
      } else if($('#datepicker2').val() ==""){
         alert("?????? ????????? ????????? ?????????.")
      } else if($('#animalcnt').val() == "") {
         alert("???????????? ????????? ????????? .")
      } else {   
         var sendDate = {
               reserveStartDatee : $('#datepicker1').val(),
               reserveEndDatee : $('#datepicker2').val(),
               count : $('#animalcnt').val()
         } 
         $.ajax({
            url: "searchRoom.do",
            type: "POST",
            data: sendDate,
            success: function(data){
               $('#showRoom').html(data);
               $('#showRoom').focus();
            }
         });
      }
      
      
            
   });
</script>
</div>
<div id="footer" class="footer" align="center">
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>  
</html>