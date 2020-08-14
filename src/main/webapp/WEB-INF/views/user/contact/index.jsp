<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
  $(document).ready(()=>{
    setTimeout(function(){
		$('.alert.alert-success').hide();
	}, 10000);
  })
</script>
<section class="ftco-section contact-section bg-light">
  <div class="container">
    <div class="row block-9">
      <div class="col-md-6  d-flex">
        <img style="max-block-size: 80%;"
          src="${pageContext.request.contextPath}/resources/user/images/customer-service.png" />
      </div>
      <div class="col-md-6 order-md-last  d-flex">

        <form:form method="POST" action="${pageContext.request.contextPath}/contact/save" modelAttribute="contact"
          class="bg-white p-5 contact-form">
          <c:if test="${message == 'success' }">

            <div class="alert alert-success alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <h4>
                <i class="icon fa fa-check"></i>
                <spring:message code="message.success" />
              </h4>
              <spring:message code="contact.message.success" />
            </div>
          </c:if>
          <c:if test="${message == 'failed' }">

            <div class="alert alert-warning alert-dismissible">
              <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">&times;</button>
              <h4>
                <i class="icon fa fa-check"></i><spring:message code="message.error" />
              </h4>
          
              <spring:message code="error.500" />
            </div>
          </c:if>
          <div class="form-group">
            <label for="name">
              <spring:message code="account.fullname" /></label>
            <form:input path="name" class="form-control" />
            <small style="color: red;">
              <form:errors path="name"></form:errors>
            </small>
          </div>
          <div class="form-group">
            <label for="email">
              <spring:message code="contact.email" /></label>
            <form:input path="email" class="form-control" />
            <small style="color: red;">
              <form:errors path="email"></form:errors>
            </small>
          </div>
          <div class="form-group">
            <label for="contactType">
              <spring:message code="contact.department" /> </label>
            <form:select path="contactType" class="form-control" items="${contactTypes }" itemLabel="name"
              itemValue="id"></form:select>
          </div>
          <div class="form-group">
            <label for="title">
              <spring:message code="contact.title" /></label>
            <form:input path="title" class="form-control" />
            <small style="color: red;">
              <form:errors path="title"></form:errors>
            </small>
          </div>

          <div class="form-group">
            <label for="content">
              <spring:message code="contact.content" /></label>
            <form:textarea path="content" cols="30" rows="7" class="form-control"></form:textarea>
            <small style="color: red;">
              <form:errors path="content"></form:errors>
            </small>
          </div>
          <div class="form-group">
            <input type="submit" value='<spring:message code="contact.button.send" />' class="btn btn-primary py-3 px-5">
          </div>
        </form:form>

      </div>

    </div>
  </div>
</section>