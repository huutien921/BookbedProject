<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<style>
	a {
		color: #0770cd;
		text-decoration: none;
		background-color: transparent;
		-webkit-text-decoration-skip: objects;
	}

	a:hover {
		color: #0770cd;
		text-decoration: underline;
	}
</style>
<script>
	//validation form change password
	function validationForm() {
		var username = $('#username').val();
		var password = $('#password').val();
		var rePassword = $('#re-password').val();
		var result = 0;
		switch ('') {
			case username: {
				$('#username').css("border", "1px solid red");
				$('#usernameStatus').css("color", "red");
				$('#usernameStatus').html('<spring:message code="login.username.required" />');
				result++;
			}
			case password: {
				$('#password').css("border", "1px solid red");
				$('#passwordStatus').css("color", "red");
				$('#passwordStatus').html('<spring:message code="login.password.required" />');
				result++;
			}
			case rePassword: {
				$('#re-password').css("border", "1px solid red");
				result++;
			}


		}
		if (result > 0) {
			return false;
		}

		if (!password.match(/^(?=.*[\d])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*])[\w!@#$%^&*]{8,}$/)) {
			$('#password').css("border", "1px solid red");
			$('#passwordStatus').css("color", "red");
			$('#passwordStatus').html('<spring:message code="account.newPassword.matches" />');
			return false;
		}
		if (password != rePassword) {
			$('#re-passwordStatus').css("color", "red");
			$('#re-password').css("border", "1px solid red");
			$('#re-passwordStatus').html('<spring:message code="account.rePassword.matches" />');
			$('#checkOk').css("display", "none");
			return false;
		}
		return true;
	}
	//get data from form register
	function getDataFormRegister() {
		dataForm = {
			username: $('#username').val(),
			password: $('#password').val(),
			rePassword: $('#re-password').val()
		}
		return dataForm;
	}

	$(document).ready(function () {
		$('#re-password').on('change', function () {
			var rePass = $('#re-password').val();
			var newPass = $('#password').val();

			if (rePass == newPass) {
				$('#checkOk').css("display", "");
			} else {
				$('#checkOk').css("display", "none");
			}
		})
		//check username
		$('#username').on('change', function () {
			$.ajax({
				dataType: "text",
				contentType: "application/json",
				type: 'GET',
				url: '${pageContext.request.contextPath}/api/login/check/username',
				data: {
					username: $(this).val()
				},
				success: function (result) {
				
					$('#checkOkUsername').css("display", "");
					$('#usernameStatus').html("");
				},
				error: function (err) {
					$('#checkOkUsername').css("display", "none");
					$('#usernameStatus').css("color", "red");
					$('#username').css("border", "1px solid red");
					if (err.responseText == "matches") {

						$('#usernameStatus').html('<spring:message code="account.username.matches" />')
					} else if (err.responseText == "exist") {

						$('#usernameStatus').html('<spring:message code="account.username.exist" />');
					} else {

						$('#usernameStatus').html('<spring:message code="error.500" />')
					}

				}

			});


		})
		$('#username').on('change', function () {
			$('#usernameStatus').html("");
			$('#username').css("border", "")
		})
		$('#password').on('change', function () {
			$('#passwordStatus').html("");
			$('#password').css("border", "")
		})
		$('#re-password').on('change', function () {
			$('#re-passwordStatus').html("");
			$('#re-password').css("border", "")
		})
		//register
		$('#btRegister').on('click', function () {
			if (validationForm()) {
				var dataResult = JSON.stringify(getDataFormRegister());

				$.ajax({
					dataType: "json",
					contentType: "application/json",
					type: 'POST',
					url: '${pageContext.request.contextPath}/api/login/register',
					data: dataResult,
					success: function (result) {
						$('#messageRegister').modal('show');
						$('#messageRegisterTitle').html('<spring:message code="register.success.title" />');
						$('#messageRegisterBody').html('<spring:message code="register.success.content" />');
						$('#messageRegisterBt').html('<a href="${pageContext.request.contextPath}/account/login?username=' + result.username + '"><spring:message code="login.login" /></a>');

					},
					error: function (jqXHR) {

						$('#messageRegisterTitle').html('<spring:message code="register.error.title" />');
						$('#messageRegisterBody').html('<spring:message code="error.500" />');
						$('#messageRegisterBt').html('<a href="${pageContext.request.contextPath}/account/register"><spring:message code="link.retry" /></a>');
						$('#messageRegister').modal('show');
						//window.location.replace("${pageContext.request.contextPath}/account/register");
					}

				});
			}
		})
		//back bt
		$('#btBack').on('click', function () {

			$('#formUsername').hide();
			$('#formEmail').show();
		})
	
		//check mail
		$('#btCheckMail').on('click', function () {
			$('#loadEmail').css("display", "");
			$('#email').css("border", "");
			$('#emailError').html("");
			$.ajax({
				dataType: "text",
				contentType: "application/json",
				type: 'GET',
				url: '${pageContext.request.contextPath}/api/login/check/email',
				data: {
					email: $('#email').val()
				},
				success: function (result) {
					$('#loadEmail').css("display", "none");
					$('#formEmail').hide();
					$('#formUsername').show();

				},
				error: function (err) {

					$('#loadEmail').css("display", "none");
					$('#email').css("border", "1px solid red");
					if (err.responseText == "matches") {
						$('#emailError').html('<spring:message code="recovery.error.email.matches" />');
					} else if (err.responseText == "exist") {
						$('#emailError').html('<spring:message code="register.error.email.exist" /><a href="${pageContext.request.contextPath}/account/recovery "> <spring:message code="link.here" /></a>');
					} else {
						$('#emailError').html('<spring:message code="error.500" />');
					}

				}

			});


		})

	})

</script>
<!-- modal -->
<div class="modal fade" id="messageRegister" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="text-align: center;" id="messageRegisterTitle"></h5>

			</div>
			<div class="modal-body" id="messageRegisterBody">

			</div>
			<div class="modal-footer" style="text-align: center;" id="messageRegisterBt">

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
		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-5 text  ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
				<!-- confirm email -->
				<div style="background: #ffffff; padding: 44px 40px 50px 40px;border-radius: 4px;" id="formEmail">
					<form>
						<div class="form-group">
							<label for="email">Email</label>
							<input type="text" class="form-control" id="email">
							<small id="emailError" style="color: red;">

							</small>
						</div>


						<div class="text-center">

							<button type="button" class="btn btn-primary" id="btCheckMail"><i
									class="fa fa-spinner fa-spin fa-1x fa-fw" style="display: none;" id="loadEmail"></i>
								<spring:message code="button.start" /></button>
							<br>
							<spring:message code="login.have.account" /> <a
								href="${pageContext.request.contextPath}/account/login">
								<spring:message code="login.login" /></a>
						</div>
					</form>
				</div>

			
		
			<!-- end -->
			<div style="background: hsl(0, 0%, 100%); padding: 44px 40px 50px 40px;border-radius : 4px; display: none;"
				id="formUsername">
				<button type="button" class="btn btn-info" id="btBack"> <i class="fa fa-backward"></i> Back
				</button>
				<form>
					<div class="form-group">
						<label for="username"><spring:message code="account.username" /></label><i class="fa fa-check" id="checkOkUsername"
							style="color:cyan ;display: none;" aria-hidden="true"></i>
						<input type="text" class="form-control" id="username"  >
						<small id="usernameStatus">
						</small>
					</div>
					<div class="form-group">
						<label for="password"><spring:message code="account.password" /></label>
						<input type="password" class="form-control" id="password"
							>
						<small id="passwordStatus">
						</small>
					</div>
					<div class="form-group">
						<label for="re-password"><spring:message code="account.rePassword" /></label><i class="fa fa-check" id="checkOk"
							style="color:cyan ;display: none;" aria-hidden="true"></i>
						<input type="password" class="form-control"  id="re-password"
							>
						<small id="re-passwordStatus">
						</small>
					</div>

					<div class="text-center">

						<button type="button" id="btRegister" class="btn btn-primary"><spring:message code="login.register" /></button>
						<br>
						<spring:message code="login.have.account" /> <a style="color: #0770cd;"
							href="${pageContext.request.contextPath}/account/login">
							<spring:message code="login.login" /></a>
					</div>

				</form>
			</div>

		</div>

		</div>
	</div>
</div>
</div>