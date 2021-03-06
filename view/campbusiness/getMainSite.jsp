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
	
	<!-- JavaScript -->
	<script type="text/javascript">

		// ??????
		$(function() {
			//==> DOM Object GET 3?????? ?????? ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#confirm").on("click" , function() {
				$("form").attr("method" , "post").attr("action" , "/campBusiness/listMainSite").submit();
			});
			
			$("#update").on("click" , function() {
				alert("?????????????????? ???????????????.")
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateMainSiteView").submit();
			});
			
			$("#delete").on("click" , function() {
				if (confirm("'??????'??? ???????????? ????????? ????????? \n?????? ????????? ????????? ??????????????????.") == true){    
					$("form").attr("method" , "POST").attr("action" , "/campBusiness/deleteMainSite").submit();
				} else {
				    return;
				}
			});
		
		});		

</script>		
	    
</head>

<body>

	<!-- ToolBar -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />

	<!-- Page Start -->
	<form>	
	<div class="container">		
		
		<input type="hidden" name="campNo" value="${camp.campNo}">
		<input type="hidden" name="mainSiteNo" value="${mainSite.mainSiteNo}">

		<div class="page-header">
	       <h3 class=" text-info">???????????? ????????????</h3>
	    </div>
	    
		<div class="row">
		 	<div class="col-xs-4 control-label"><strong>???????????? ????????????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteNo}</div>
		</div>
						
		<hr/>
		   	
		<div class="row">
		 	<div class="col-xs-4 control-label"><strong>???????????? ????????????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteRegDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
		 	<div class="col-xs-4 control-label"><strong>???????????? ??????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteType}</div>
		</div>
		
		<hr/>
		
		<div class="row">
		 	<div class="col-xs-4 control-label"><strong>???????????? ??????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
		 	<div class="col-xs-4 control-label"><strong>???????????? ??????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteSize}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>???????????? ??????(????????????)</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteSection}</div>
		</div>
		
		<hr/>							
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>?????? ???????????????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteMinCapacity}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>?????? ???????????????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteMaxCapacity}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>???????????? ??????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteMinPrice}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>???????????? ??????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteAddPrice}</div>
		</div>
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>???????????? ??????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteParkingSize}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 control-label"><strong>???????????? ??????</strong></div>
			<div class="col-xs-8 col-md-4">${mainSite.mainSiteInfo}</div>
		</div>
		
		<hr/>
		
		<br> 
		<div class="row">			    
		    <div class="form-group">
		        <label for="mainSiteImg1" class="col-xs-4 control-label">???????????? ??????1</label>				
	            <div class="col-xs-8">
	                <img src="../uploadfiles/campimg/campbusiness/mainsite/${mainSite.mainSiteImg1}" />
	            </div>
		    </div>
		</div>
		
		<br> 
		<div class="row">			    
		    <div class="form-group">
		        <label for="mainSiteImg2" class="col-xs-4 control-label">???????????? ??????2</label>				
	            <div class="col-xs-8">
	                <img src="../uploadfiles/campimg/campbusiness/mainsite/${mainSite.mainSiteImg2}" />
	            </div>
		    </div>
		</div>
		
		<br> 
		<div class="row">			    
		    <div class="form-group">
		        <label for="mainSiteImg3" class="col-xs-4 control-label">???????????? ??????3</label>				
	            <div class="col-xs-8">
	                <img src="../uploadfiles/campimg/campbusiness/mainsite/${mainSite.mainSiteImg3}" />
	            </div>
		    </div>
		</div>		
	 							  		  
		<br>
		<br>	
		<div class="row">	
	        <div class="col-xs-2">
	            <button id="delete" type="button" class="btn btn-danger">??????</button>
	        </div>
	        
	        <div class="col-xs-1">
	           	<button id="update"type="button" class="btn btn-warning">??????</button>
	        </div>
	        
	        <div class="col-xs-1 col-xs-offset-7">
	            <button id="confirm" type="button" class="btn btn-primary">??????</button>
		    </div>										  		  	
		</div>
		
	</div>
		  
	</form>	  	

</body>

</html>