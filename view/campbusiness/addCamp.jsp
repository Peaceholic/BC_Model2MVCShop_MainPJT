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
	
	<!-- CSS -->
	<style>
		.form-horizontal .control-label{
    		text-align: left;
		}
    </style>

	<!-- JavaScript -->
	<script type="text/javascript">

		// ??????
		$(function() {
			
			//???????????? ??????????????? ????????????	
			document.getElementById('campRegDate').value = new Date().toISOString().substring(0, 10);
			
			var addCampTempSave = $("#addCampTempSave").val();			
			if(addCampTempSave != 3){
				alert("???????????? ????????? ????????? ????????????.\n????????? ???????????????.");
			}
			
			
			$("#save").on("click" , function() {
				alert("?????????????????? ?????? ???????????????.");
				$("#addCampTempSave").val("3");
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateCamp").attr("enctype","multipart/form-data").submit();
			});
			
			$("#tempsave").on("click" , function() {
				alert("???????????? ???????????????.");
				$("#addCampTempSave").val("2");			
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateCamp").attr("enctype","multipart/form-data").submit();
			});
			
			$("#cancle").on("click" , function() {
				alert("?????? ???????????????.");
				window.history.back();			
			});
			
			$("#resetform").on("click" , function() {
				alert("????????? ???????????????.");				
				$("form")[0].reset();				
			});
		
		});			 

	</script>		

</head>

<body>

	<!-- ToolBar -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />

	<!-- Page Start -->
	<div class="container">
		<div class="row">
		 
	<div class="page-header">
       <h1 class=" text-info">????????? ??????</h1>
    </div>		    
		   
   	<!-- Form Start -->
	<form class="form-horizontal">
	
		<div class="row">
			
			<input type="hidden" name="campTempSave" id="addCampTempSave" value="${camp.campTempSave}">
			
			<div class="form-group">
				<label for="saveStatus" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????</label>	
					<c:if test="${ empty campSession.campTempSave || campSession.campTempSave != '3' }">	
						<div class="col-xs-8 col-md-4"> ????????? ???????????????. ????????? ???????????????</div>
					</c:if>
			</div>
		
			<div class="form-group">
				<label for="campNo" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="campNo" name="campNo" value="${camp.campNo}" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="campRegDate" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="campRegDate" name="campRegDate" value="" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="user.id" class="col-sm-offset-1 col-sm-3 control-label">???????????????ID</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="user.id" name="user.id" value="${camp.user.id}" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="user.campName" class="col-sm-offset-1 col-sm-3 control-label">????????? ??????</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="user.campName" name="user.campName" value="${campSession.user.campName}" readonly>
					</div>
			</div>
	
			<div class="form-group">
				<label for="user.campCall" class="col-sm-offset-1 col-sm-3 control-label">????????? ????????????</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="user.campCall" name="user.campCall" value="${campSession.user.campCall}" readonly>
					</div>
			</div>
			
			<div class="form-group">
				<label for="user.addr" class="col-sm-offset-1 col-sm-3 control-label">????????? ??????</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="user.addr" name="user.addr" value="${campSession.user.addr}" readonly>
					</div>
			</div>
		
			<div class="form-group">
				<label for="campTheme1" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????1</label>
				<div class="col-sm-5">
					<select name="campTheme1" class="form-control" >
						<option value="???" selected="selected">???</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????????????????">??????????????????</option>	
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="campTheme2" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????2</label>
				<div class="col-sm-5">
					<select name="campTheme2" class="form-control" >
						<option value="???">???</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????" selected="selected">??????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????????????????">??????????????????</option>	
					</select>
				</div>
			</div>
	
			<div class="form-group">
				<label for="campNature1" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????1</label>
				<div class="col-sm-5">
					<select name="campNature1" class="form-control" >
						<option value="??????" selected="selected">??????</option>
						<option value="??????">??????</option>
						<option value="???">???</option>
						<option value="??????">??????</option>
						<option value="???">???</option>
						<option value="???">???</option>
						<option value="??????">??????</option>
						<option value="???">???</option>
					</select>
				</div>
			</div>
	
			<div class="form-group">
				<label for="campNature2" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????2</label>
				<div class="col-sm-5">
					<select name="campNature2" class="form-control" >
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="???">???</option>
						<option value="??????">??????</option>
						<option value="???" selected="selected">???</option>
						<option value="???">???</option>
						<option value="??????">??????</option>
						<option value="???">???</option>
					</select>
				</div>
			</div>	
	
			<div class="form-group">
				<label for="campOperation1" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????1</label>
				<div class="col-sm-5">
					<select name="campOperation1" class="form-control" >
						<option value="??????" selected="selected">??????</option>
						<option value="???">??? (3???~5???)</option>
						<option value="??????">?????? (6???~8???)</option>
						<option value="??????">?????? (9???~11???)</option>
						<option value="??????">?????? (12???~2???)</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="campOperation2" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????2</label>
				<div class="col-sm-5">
					<select name="campOperation2" class="form-control" >
						<option value="??????">??????</option>
						<option value="???">??? (3???~5???)</option>
						<option value="??????">?????? (6???~8???)</option>
						<option value="??????">?????? (9???~11???)</option>
						<option value="??????">?????? (12???~2???)</option>
						<option value="??????" selected="selected">??????</option>
						<option value="??????">??????</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="campMapFile" class="col-sm-offset-1 col-sm-3 control-label">????????? ???????????????</label>				
					<div class="col-sm-5">
						<input type="file"  id="campMapFile" name="campMapFile">	
					</div>
			</div> 
					
			<div class="form-group">
				<label for="campImgFile1" class="col-sm-offset-1 col-sm-3 control-label">????????? ???????????????(1/5)</label>				
					<div class="col-sm-4">
						<input type="file"  id="campImgFile1" name="campImgFile1">	
					</div>
			</div>
			
			<div class="form-group">
				<label for="campImgFile2" class="col-sm-offset-1 col-sm-3 control-label">????????? ???????????????(2/5)</label>				
					<div class="col-sm-5">
						<input type="file"  id="campImgFile2" name="campImgFile2">	
					</div>
			</div>
			
			<div class="form-group">
				<label for="campImgFile3" class="col-sm-offset-1 col-sm-3 control-label">????????? ???????????????(3/5)</label>				
					<div class="col-sm-5">
						<input type="file"  id="campImgFile3" name="campImgFile3">	
					</div>
			</div>
	
			<div class="form-group">
				<label for="campImgFile4" class="col-sm-offset-1 col-sm-3 control-label">????????? ???????????????(4/5)</label>				
					<div class="col-sm-5">
						<input type="file"  id="campImgFile4" name="campImgFile4">		
					</div>
			</div>	
	
			<div class="form-group">
				<label for="campImgFile5" class="col-sm-offset-1 col-sm-3 control-label">????????? ???????????????(5/5)</label>				
					<div class="col-sm-5">
						<input type="file"  id="campImgFile5" name="campImgFile5">
					</div>
			</div> 	
				
		    </div>
		    
			<div class="row">
				<div class="form-group">        
			        <label for="campSummery" class="col-sm-offset-1 col-sm-3 control-label">????????? ????????????</label>
				</div> 		   
			</div>
			
			<div class="row">
				<div class="col-sm-8 col-xs-offset-1">
			    	<textarea class="form-control" id="campSummery" rows="3" name="campSummery"></textarea>
			    </div> 		   
			</div>
				
			<div class="row">
				<br>
				<div class="form-group">        
			       <label for="campDetail" class="col-sm-offset-1 col-sm-3 control-label">????????? ????????????</label>
				</div> 		   
			</div>
			
			<div class="row">
				<div class="col-sm-8 col-xs-offset-1">
			    	<textarea class="form-control" id="campDetail" rows="6" name="campDetail"></textarea>	
			    </div> 		   
			</div>
			
	   	</form>
	    <!-- Form End -->	    

		<br>
		<br>
		
		<div class="row">
			<div class="form-group">		
				<div class="col-xs-1 col-xs-offset-1">
					<button id="cancle" type="button" class="btn btn-danger">??????</button>
				</div>
				
				<div class="col-xs-1 col-xs-offset-1">
					<button id="tempsave" type="button" class="btn btn-info">????????????</button>
				</div>
										
				<div class="col-xs-1 col-xs-offset-4">
					<button id="save" type="button" class="btn btn-primary">??????</button>
				</div>			
			</div>
		</div> 			
		  
		</div>
	</div>
</body>

</html>