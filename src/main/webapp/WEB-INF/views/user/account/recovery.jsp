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
	function validationForm() {
		var username = $('#username').val();
		if (username == '') {
			$('#username').css("border", "1px solid red");
			$('#usernameStatus').css("color", "red");
			$('#usernameStatus').html('<spring:message code="login.username.required" />');
			return false;
		}
		return true;


	}
	$(document).ready(() => {
		$('#btCheckMail').on('click', () => {
			if (validationForm()) {
				$.ajax({
					dataType: "text",
					contentType: "application/json",
					type: 'GET',
					url: '${pageContext.request.contextPath}/api/login/check/email/recovery',
					data: {
						email: $('#email').val()
					},
					success: function (result) {
						$('#loadEmail').css("display", "none");
						$('#formEmail').hide();
						$('#message').show();
						$('#emailResult').html(result)

					},
					error: function (err) {

						$('#loadEmail').css("display", "none");
						$('#email').css("border", "1px solid red");
						if (err.responseText == "matches") {
							$('#emailError').html('<spring:message code="recovery.error.email.matches" />');
						} else if (err.responseText == "not_found") {
							$('#emailError').html('<spring:message code="recovery.error.email.incorrect" /> <a href="${pageContext.request.contextPath }/account/register" style="font-weight: bold;"> <spring:message code="link.here" /></a>');
						} else {
							$('#emailError').html('<spring:message code="error.500" />');
						}

					}

				});
			}
		})

	})
</script>

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
						<h5 style="font-weight: bold;">
							<spring:message code="recovery.title" />
						</h5>
						<span style="color: black;font-size: 14px ;">
							<spring:message code="recovery.content" /></span>
						<div class="form-group">
							<label for="email">Email</label>
							<input type="text" class="form-control" id="email">
							<small id="emailError" style="color: red;">

							</small>
						</div>


						<div class="text-center">

							<button type="button" class="btn btn-primary" id="btCheckMail"><i
									class="fa fa-spinner fa-spin fa-1x fa-fw" style="display: none;" id="loadEmail"></i>
								<spring:message code="button.confirm" /></button>
							<br>
							<spring:message code="login.have.account" /> <a
								href="${pageContext.request.contextPath}/account/login">
								<spring:message code="login.login" /></a>
						</div>

					</form>
				</div>
				<!-- end -->

				<div style="background: #ffffff; padding: 44px 40px 50px 40px;border-radius: 4px;display: none;"
					id="message">
					<h5 style="font-weight: bold;">
						<spring:message code="recovery.success.title" />
					</h5>
					<span style="color: black;font-size: 14px ;">
						<spring:message code="recovery.success.content" /> <span style="font-weight: bold;"
							id="emailResult"></span></span>
					<br>
					<br>
					<a href="${pageContext.request.contextPath}/account/login">
						<spring:message code="recovery.backLogin" /></a>
				</div>
				<!-- end -->



			</div>
		</div>
	</div>
</div>