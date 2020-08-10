<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
		$('#password').css("border","");
		$('#re-password').css("border","");
		$('#re-passwordStatus').html("");
		$('#passwordStatus').html("");
	}
    //validation form change password
	function validationForm(){
   
        var password = $('#password').val();
         var rePassword = $('#re-password').val();
		 var result = 0 ;
         switch ('')
		{
		 
		    case password : {
		    	 $('#password').css("border","1px solid red");
				 $('#passwordStatus').css("color","red");
				 $('#passwordStatus').html('<spring:message code="account.password.required" />');
		    	result++;
		    }
		    case rePassword : {
		    	 $('#re-password').css("border","1px solid red");
				 $('#re-passwordStatus').css("color","red");
				 $('#re-passwordStatus').html('<spring:message code="account.password.required" />');
		  
		    	result ++ ;
		    }
		   
		   
    }
	if (result > 0) {
		return false;
	}
    
    if (!password.match(/^(?=.*[\d])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*])[\w!@#$%^&*]{8,}$/)) {
		$('#password').css("border","1px solid red");
		$('#passwordStatus').css("color","red");
		$('#passwordStatus').html('<spring:message code="account.newPassword.matches" />');
      return false;
    }
    if (password != rePassword) {
		$('#re-passwordStatus').css("color","red");
	  $('#re-password').css("border","1px solid red");
	  $('#re-passwordStatus').html('<spring:message code="account.rePassword.matches" />');
	  $('#checkOk').css("display","none");
      return false;
    }
    return true ;
  }
  function getDataForm(){
      dataForm ={
        newPassword : $('#password').val(),
        rePassword : $('#re-password').val(),
		token : $('#token').val(),
      }
      return dataForm;
    }
	function GetURLParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++){
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}
$(document).ready(()=>{
	$('#token').val(GetURLParameter('token'));
	$('#btRecovery').on('click',()=>{
		resetForm();
		if (validationForm()) {
			var dataResult = JSON.stringify(getDataForm());
			$.ajax({
        dataType: "json",
        contentType: "application/json",
        type: 'POST',
        url: '${pageContext.request.contextPath}/api/login/recovery',
        data: dataResult,
        success: function (result) {
		window.location.replace("${pageContext.request.contextPath}/account/login");
        },
        error: function (jqXHR) {
			
			$('#messageRecoveryTitle').html('<spring:message code="error.title" />');
			$('#messageRecoveryBody').html('<spring:message code="error.500" />');
			$('#messageRegisterBt').html('<a href="${pageContext.request.contextPath}/account/recovery"><spring:message code="link.retry" /></a>');
			$('#messageRegister').modal('show');
			//window.location.replace("${pageContext.request.contextPath}/account/register");
        }

      });
		}
	})
})

</script>
<!-- modal -->
<!-- modal -->
<div class="modal fade" id="messageRecovery" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" >
        <h5 class="modal-title"style="text-align: center;"  id="messageRecoveryTitle"></h5>
       
      </div>
      <div class="modal-body" id="messageRecoveryBody">
	  
      </div>
      <div class="modal-footer" style="text-align: center;"   id="messageRecoveryBt">
    
      </div>
    </div>
  </div>
</div>
<!-- end modal -->
<div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath }/uploads/images/slide/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-5 text  ftco-animate"
				data-scrollax=" properties: { translateY: '70%' }">
		
				<div style="background: hsl(0, 0%, 100%); padding: 44px 40px 50px 40px;border-radius : 4px;" id="formUsername">
					<h5 style="font-weight: bold;"><spring:message code="recovery.title" /></h5>
						<span style="color: black;font-size: 14px ;"><spring:message code="account.newPassword.matches" /></span>
					<form>
				
					<div class="form-group">
					  <label for="password"><spring:message code="account.password" /></label>
					  <input type="password" class="form-control" id="password">
					  <small id="passwordStatus" >
					</small>
					</div>
					<div class="form-group">
						<label for="re-password"><spring:message code="account.rePassword" /></label><i class="fa fa-check" id="checkOk" style="color:cyan ;display: none;" aria-hidden="true"></i>
						<input type="password" class="form-control"  id="re-password">
						<small id="re-passwordStatus" >
						</small>  
					</div>
					<input type="hidden" id="token" value="token"/>

			<div class="text-center">
				
				<button type="button" id="btRecovery" class="btn btn-primary"><spring:message code="button.update" /></button>
				<br>
				<spring:message code="login.have.account" /> <a  href="${pageContext.request.contextPath}/account/login"><spring:message code="login.login" /></a>
			</div>
					
				  </form></div>
				
				
		
			</div>
		</div>
	</div>
	</div>