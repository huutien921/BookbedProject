<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style>
a {
  color: #0770cd;
  text-decoration: none;
  background-color: transparent;
  -webkit-text-decoration-skip: objects; }
a:hover {
    color: #0770cd;
    text-decoration: underline; }
</style>
<script>
	// reset form
	function resetForm(){
		$('#username').css("border","");
		$('#password').css("border","");
		$('#usernameStatus').html("");
		$('#passwordStatus').html("");
	}
	// validate form after submit
	function validateForm(){
		var username = $('#username').val();
		var password = $('#password').val();
		var result = 0;
		switch ('')
		{
		    case username : {
		    	 $('#username').css("border","1px solid red");
				 $('#usernameStatus').css("color","red");
				 $('#usernameStatus').html('<spring:message code="login.username.required" />');
		        result++;
		    }
		    case password : {
		    	 $('#password').css("border","1px solid red");
				 $('#passwordStatus').css("color","red");
				 $('#passwordStatus').html('<spring:message code="login.password.required" /><br>');
		    	result++;
		    }
		  
		   
		   
	}
	if (result > 0) {
		return false
	}
	return true ;
	}
	$(document).ready(function(){
		var msg = '${msg}';
		if (msg=='failed') {
			$('#messageLoginBody').html('<spring:message code="login.error" />');	
			$('#msg').modal('show');
		
		}else if(msg=='logout'){
			$('#messageLoginBody').html('<spring:message code="login.logout" />');	
			$('#msg').modal('show');
		}

		$('#login').on('click',()=>{
			resetForm();
			if (validateForm()) {
				
				$('form').submit();
			}
		})

	});
</script>
<!-- modal -->
<div class="modal fade" id="msg" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
   
      <div class="modal-body" id="messageLoginBody">
	  
      </div>
      <div class="modal-footer" >
		<button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="button.modal.close" /></button>
      </div>
    </div>
  </div>
</div>
<!-- end modal -->
<div class="hero-wrap js-fullheight"
	style="background-image: url('${pageContext.request.contextPath }/uploads/images/slide/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-4 text  ftco-animate"
				data-scrollax=" properties: { translateY: '70%' }">
				<div style="background: #ffffff;padding: 44px 40px 50px 40px;border-radius: 4px;">
					<form action="${pageContext.request.contextPath }/login/process" method="POST">
					<div class="form-group">
					  <label for="Username"><spring:message code="account.username" /></label>
					  <input type="text" class="form-control" id="username" name="username" value="${username}" >
					  <small id="usernameStatus" >
					</small>
					</div>
					<div class="form-group">
					  <label for="Password"><spring:message code="account.password" /></label>
					  <input type="password" class="form-control" id="password" name="password" >
					  <small id="passwordStatus" >
					</small>
					  <a href="${pageContext.request.contextPath }/account/recovery" style="font-size: 13px; " ><spring:message code="login.forgotPassword" /></a>
					</div>
					<div class="form-check">
					  <input type="checkbox" class="form-check-input" name="remember-me" id="exampleCheck1">
					  <label class="form-check-label" for="exampleCheck1"><spring:message code="login.rememberMe" /></label>
					</div>
			<div class="text-center">

				<button type="button" id="login" class="btn btn-primary"><spring:message code="button.login" /></button>
				<br>
				<spring:message code="login.have.account" /> <a style="font-weight: bold;"   href="${pageContext.request.contextPath}/account/register"><spring:message code="login.register" /></a>
			</div>
					
				  </form></div>
				
				
		
			</div>
		</div>
	</div>
</div>