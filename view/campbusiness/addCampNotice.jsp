<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="utf-8">

	<!-- Bootstrap, jQuery CDN -->
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<script src="/resources/lib/jquery/jquery.js"></script>
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  	<script src="/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
  	<link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css"></link>  	
  	
  	
  	<!-- ### headerCampBusiness resources Start ### -->
  	<script src="/resources/lib/jquery/jquery.js"></script>
    
    <!-- Favicons -->
    <meta name="msapplication-TileImage" content="/resources/images/favicons/ms-icon-144x144.png">    
    <meta name="msapplication-TileColor" content="#ffffff">  
    <meta name="theme-color" content="#ffffff">
   
    <!-- Stylesheets -->
    
    <!-- Default stylesheets-->
    <link href="/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template specific stylesheets-->
    <link href="/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="/resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">       
    
    <!-- Main stylesheet and color file-->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="/resources/css/colors/default.css" rel="stylesheet">  
  	<!-- ### headerCampBusiness resources End ### -->
	
	<!-- CSS -->
	<style>
	    body > div.container{
	        margin-top: 30px;
	    }
	    
	    .form-horizontal .control-label{
	        text-align: left;
	    }
	
	</style>

	<!-- JavaScript -->
	<script type="text/javascript">

		// 버튼
		$(function() {
			
			$("#save").on("click" , function() {
				alert("등록 되었습니다.");			
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/addCampNotice").submit();
			});
					
			$("#cancle").on("click" , function() {
				alert("취소 되었습니다.");
				window.history.back();
			});
		
		});	

</script>		

</head>

<body>

	<!-- ToolBar -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />

	<!-- Page Start -->
	<div class="container">

		<div class="page-header">
	       <h1 class=" text-info">공지사항 등록</h1>
	    </div>

		<!-- Form Start -->
		<form class="form-horizontal" >
		
		<input type="hidden" name="campNo" id="campNo" value="${campSession.campNo}">
		<input type="hidden" name="writer.id" id="writer.id" value="${campSession.user.id}">
		
		<div class="form-group">
			<label for="noticeTitle" class="col-sm-offset-1 col-sm-3 control-label">제목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="">
				</div>
		</div>
			
		<div class="form-group">
			<label for="noticeContent" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="noticeContent" name="noticeContent" value="">
				</div>
		</div>

		</form>
		<!-- Form End -->
		
		<br>
		<div class="row">
		    <div class="form-group">      
		        <div class="col-xs-1 col-xs-offset-1">
		            <button id="cancle" type="button" class="btn btn-danger">취소</button>
		        </div>
		        
		        <div class="col-xs-1 col-xs-offset-5">
		            <button id="save" type="button" class="btn btn-primary">저장</button>
		        </div>			
		    </div>
		</div>
		
		
 	</div>
	<!-- Page End -->

</body>

</html>