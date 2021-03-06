<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

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
  	
  	
  	<!-- ?????? Controller Start -->
  	<script type="text/javascript">  	
  			
		$(function() {
			
			const paymentNo = $("#paymentNo").val();
			const paymentRespond = $("#paymentRespond").val();
			
			if(paymentNo == null && paymentRespond != null){
				alert("????????? ?????????????????????."
						+"\n?????? : "+paymentRespond
						+"\n???????????? ???????????????.");				
			}			
					
			$("#pointContainer").hide();
			$("#chargeDiv").hide();
			$("#withdrawDiv").hide();
			$("#campContainer").hide();
			$("#auctionContainer").hide();
			$("#transferContainer").hide();
			
			$("#pointButtonContainer").hide();
			$("#campButtonContainer").hide();
			$("#pointPayButtonContainer").hide();
						
			const viewController = $("#viewController").val();
			const ctrlViewCode = viewController.charAt();
			
			console.log("ctrlViewCode : "+ctrlViewCode);

			if( viewController == "P1" ){
				$("#pointContainer").show();
				$("#chargeDiv").show();
				$("#pointButtonContainer").show();
			}
			
			if( viewController == "P2" ){
				$("#pointContainer").show();				
				$("#withdrawDiv").show();
				$("#pointButtonContainer").show();
			}
			
			if(ctrlViewCode == "R"){
				$("#campContainer").show();
				$("#campButtonContainer").show();
			}
			
			if(ctrlViewCode == "A"){
				$("#auctionContainer").show();
				$("#pointPayButtonContainer").show();
			}
			
			if(ctrlViewCode == "T"){
				$("#transferContainer").show();
				$("#pointPayButtonContainer").show();
			}
			
		});
		
	</script>
	<!-- ?????? Controller End -->
  	
  	
  	<!-- ?????? Start -->
  	<script type="text/javascript">  
  	
		$(function() {
			
			const viewController = $("#viewController").val();
			const ctrlViewCode = viewController.charAt();
	   
		    // ??????
		    $("#payment_confirm").on("click" , function() {
		    	
		    	if( ctrlViewCode == "P" ){
		    		window.location = "/";	
		    	}
		    	
				if( ctrlViewCode == "R" ){
					window.location = "/campGeneral/listMyReservation";	
		    	}
		    		 
			});	
		    
		    // ????????????
		    $("#payment_cancle").on("click" , function() {
		    	self.location ="/payment/readyRefund?paymentNo="+$("#paymentNo").val();
			});	
		    
			// ????????? ???????????? ??????
			$("#goGetRsv").on("click" , function() {
				self.location ="/campGeneral/getMyReservation?reservationNo="+$("#reservationNo").val();				
			});
		    
		});  			
	  		
	</script>		
  	<!-- ?????? End --> 
   	  	  	
  	
  	<!-- import ???????????? Start -->  	
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>  	
	<script type="text/javascript">		
		
	
			
	</script>	  	
  	<!-- import ???????????? End -->
  	
  	 	

	<style>
	    body > div.container{
	        margin-top: 50px;
	    }
	    
	    .form-horizontal .control-label{
	        text-align: left;
	    }
	
	</style>	


</head>

<body>
	
	<!-- header -->
	<jsp:include page="/view/common/header.jsp"/>
	<!-- header End -->
	
	
	<!-- ?????? Controller Start -->  	
  	<input type="hidden" id="viewController" name="viewController" value="${payment.paymentCode}">
  	<input type="hidden" id="paymentRespond" name="paymentRespond" value="${payment.paymentNotice}">
  	<input type="hidden" id="paymentNo" name="paymentNo" value="${payment.paymentNo}">
  	<!-- ?????? Controller End -->
	
	
	<!-- ??????????????? start-->
	<div id="pointContainer" class="container">	
				
		<!-- ??????????????? start-->
		<div id="chargeDiv" class="row">	
		
			<div class="row">
				<div class="page-header">
					<h3 class="text-info">????????? ????????????</h3>
				</div>					
			</div>
			
			<form id="chargeForm">		
				<div class="row">
					<label class="col-xs-2">?????? ????????? (P)</label>
					<div class="col-md-3 form-group">
						${user.havingPoint - payment.pointChargeTotal}
					</div>					
					<label class="col-xs-2 col-xs-offset-1">????????? ????????? (P)</label>
					<div class="col-md-3 form-group">
						${payment.pointChargeTotal}
					</div>	
					<label class="col-xs-2">?????? ????????? (P)</label>
					<div class="col-md-3 form-group">
						${user.havingPoint}
					</div>	
					<label class="col-xs-2 col-xs-offset-1">???????????? (???)</label>
					<div class="col-md-3 form-group">
						${payment.paymentPriceTotal}
					</div>							
				</div>			
			</form>	
		
		</div>
		<!-- ??????????????? end -->	
					
		
		<!-- ??????????????? start -->	
		<div id="withdrawDiv" class="row">
		
			<div class="row">
				<div class="page-header">
					<h4 class="text-info">????????? ????????????</h4>
				</div>
			</div>
			
			<form id="withdrawForm">
				
				
			</form>					
		</div>
		<!-- ??????????????? end -->			

	</div>
	<!-- ??????????????? end-->
			
			
	<!-- ?????? start-->
	<div id="campContainer" class="container">
		
		<div class="row">
			<div class="page-header">
				<h4 class="text-info">????????? ????????????</h4>
			</div>					
		</div>
		
		<form id="campForm">		
				<div class="row">	
					<div class="col-xs-3">	
						<div class="row">
							<div class="image" style="width: 200px; height: 150px; border-radius: 10px; display: flex; justify-content: center; align-items: center">
	                        	<img src="/uploadfiles/campimg/campbusiness/camp/${campReservation.camp.campImg1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'"  alt="????????? ???????????????" >
	                        </div>			
						</div>						
					</div>
					
					<div class="col-xs-9">					
						<div class="row">							
							<label class="col-xs-2">* ????????????</label>
							<div class="col-xs-3 form-group">
								${campReservation.reservationNo}
							</div>	
							<div class="col-xs-3 col-xs-offset-1 form-group">
					            <button id="goGetRsv" type="button" class="btn btn-info">??????????????????</button>
					        </div>						        								
						</div>					
					
						<div class="row">							
							<label class="col-xs-2">* ???????????????</label>
							<div class="col-md-3 form-group">
								${campReservation.reservationRegDate}
							</div>
							<label class="col-xs-2 col-xs-offset-1">* ????????????</label>
							<div class="col-md-3 form-group">
								????????????/????????????
							</div>							
						</div>
							
						<div class="row">
							<label class="col-xs-2">* ????????????</label>
							<div class="col-md-3 form-group">
								${campReservation.reservationUserName}
							</div>
							<label class="col-xs-2 col-xs-offset-1">* ??????????????????</label>
							<div class="col-md-3 form-group">
								${campReservation.totalPaymentPrice}
							</div>						
						</div>	
							
						<div class="row">
							<label class="col-xs-2">* ????????????</label>
							<div id="campName" data="${campReservation.camp.user.campName}" class="col-md-3 form-group">
								${campReservation.camp.user.campName}						
							</div>
							<label class="col-xs-2 col-xs-offset-1">* ??????????????????</label>
							<div class="col-md-3 form-group">
								${campReservation.mainSite.mainSiteType}
							</div>
						</div>		
												
						<div class="row">
							<label class="col-xs-2">* ???????????????</label>
							<div class="col-md-3 form-group">
								${campReservation.reservationStartDate}
							</div>
							<label class="col-xs-2 col-xs-offset-1">* ???????????????</label>
							<div class="col-md-3 form-group">
								${campReservation.reservationEndDate}
							</div>	
						</div>								
					</div>
				</div>
		</form>

	</div>
	<!-- ?????? end-->
	
	
	
	<!-- ?????? start -->
	<div id="auctionContainer" class="container">
		
		<div class="row">
			<div class="page-header">
				<h4 class="text-info">???????????? ??????</h4>
			</div>					
		</div>
		
		<form id="auctionForm">
		
		</form>
		
		?????? ??????
	

	</div>
	<!-- ?????? end -->
	
	
	
	<!-- ???????????? start -->
	<div id="transferContainer" class="container">
		
		<div class="row">
			<div class="page-header">
				<h4 class="text-info">???????????? ??????</h4>
			</div>					
		</div>
		
		<form id="transferForm">
		
		</form>
	
		???????????? ??????
	
	
	</div>
	<!-- ???????????? end -->
	
		
	<!-- ???????????? start -->	
	<div id="payformContainer" class="container">
		<div class="row">
			<div class="page-header">
				<h4 class="text-info">?????? ????????????</h4>
			</div>					
		</div>
		
		<form id="payResultForm">
			<input type="hidden" id="paymentNo" name="paymentNo" value="${payment.paymentNo}">
			<input type="hidden" id="reservationNo" name="reservationNo" value="${campReservation.reservationNo}">	
		
			<div class="row">
				<label class="col-xs-2">* ???????????????</label>
				<div class="col-md-10 form-group">
					${payment.paymentProduct}
				</div>
			<div class="row">
			</div>	
				<label class="col-xs-2">* ????????????</label>
				<div class="col-md-10 form-group">
					${payment.paymentReferenceNum}
				</div>
			</div>								
			<div class="row">
				<label class="col-xs-2">* ????????????</label>
				<div class="col-md-3 form-group">
					${payment.paymentNo}
				</div>
				<label class="col-xs-2 col-xs-offset-1">* ?????????ID</label>
				<div class="col-md-3 form-group">
					${payment.paymentSender}
				</div>	
			</div>	
			<div class="row">
				<label class="col-xs-2">* ?????? ??????</label>
				<div class="col-md-3 form-group">
					<c:if test="${payment.paymentMethodSecond eq 'point' && empty payment.paymentMethod}">
							????????? - ${payment.paymentPriceTotalSecond}[P] 
					</c:if>
					
					<c:if test="${ empty payment.paymentMethodSecond && !empty payment.paymentMethod}">
							<c:if test="${payment.paymentMethod eq 'card'}">
									????????????/????????????
							</c:if>
							<c:if test="${payment.paymentMethod eq 'samsung'}">
									????????????
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'trans'}">
									????????? ????????????
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'vbank'}">
									?????? ??????
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'phone'}">
									????????? ????????????
							</c:if>
									 - ${payment.paymentPriceTotal}(???)
					</c:if>	
					
					<c:if test="${ !empty payment.paymentMethodSecond && !empty payment.paymentMethod}">
							????????? - ${payment.paymentPriceTotalSecond}[P] &
							
							<c:if test="${payment.paymentMethod eq 'card'}">
									????????????/????????????
							</c:if>
							<c:if test="${payment.paymentMethod eq 'samsung'}">
									????????????
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'trans'}">
									????????? ????????????
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'vbank'}">
									?????? ??????
							</c:if>					
							<c:if test="${payment.paymentMethod eq 'phone'}">
									????????? ????????????
							</c:if>
									 - ${payment.paymentPriceTotal}(???)
					</c:if>					
				</div>							
				<label class="col-xs-2 col-xs-offset-1">* ????????????</label>
				<div class="col-md-3 form-group">					
					<c:if test="${payment.paymentMethodSecond eq 'point' && empty payment.paymentMethod}">
							????????? 
					</c:if>
					<c:if test="${payment.paymentMethodSecond eq 'point' && !empty payment.paymentMethod}">
							?????????/
					</c:if>
					<c:if test="${payment.paymentMethod eq 'card'}">
							????????????/????????????
					</c:if>
					<c:if test="${payment.paymentMethod eq 'samsung'}">
							????????????
					</c:if>					
					<c:if test="${payment.paymentMethod eq 'trans'}">
							????????? ????????????
					</c:if>					
					<c:if test="${payment.paymentMethod eq 'vbank'}">
							?????? ??????
					</c:if>					
					<c:if test="${payment.paymentMethod eq 'phone'}">
							????????? ????????????
					</c:if>	
				</div>			
			</div>					
		</form>	
	</div>
	<!-- ???????????? end -->
	
	
	<!-- #### ?????? #### start -->
	<div class="container">
		<hr>
	</div>
	<!-- #### ?????? #### end -->
	
	
	<!-- ??????????????? ?????? start -->
	<div id="pointChargeButtonContainer" class="container">
		<div class="row">
				
			<div class="col-xs-2 col-xs-offset-5">
	            <button id="payment_confirm" type="button" class="btn btn-primary">??????</button>
	        </div> 
	
		</div>
	</div>
	<!-- ??????????????? ?????? end -->
	


</body>

</html>