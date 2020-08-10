<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tag" uri="tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<section class="hero-wrap hero-wrap-2 js-fullheight"
  style="background-image: url(&quot;${pageContext.request.contextPath}/uploads/images/blog/${blog.src}&quot;); height: 204px; background-position: 50% 233.5px;"
  data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center" style="height: 204px;">
      <div class="col-md-9 ftco-animate pb-5 text-center fadeInUp ftco-animated">
        <h1 class="mb-3 bread">${blog.title}</h1>
        <p class="breadcrumbs"><span class="icon-person"> ${blog.account.fullname}</span></p>
      </div>
    </div>
  </div>
</section>
<section class="ftco-section ftco-no-pt ftco-no-pb">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 order-md-last ftco-animate py-md-5 mt-md-5 fadeInUp ftco-animated">
        ${blog.content}


        <div class="about-author d-flex p-4 bg-light">
          <c:if test="${about !=null}">
          <div class="bio mr-5">
            <a href="${pageContext.request.contextPath}/blog/about-us" >
            <img src="${pageContext.request.contextPath}/uploads/images/blog/${about.src}" alt="Image book bed" class="img-fluid mb-4">
          </a>
          </div>
          <div class="desc">
           <a href="${pageContext.request.contextPath}/blog/about-us" ><h3>${about.title}</h3></a>
            <p>       <c:set var="string" value="${fn:substringBefore( fn:substringAfter(about.content, '<p>')  , '</p>')}"/>  
            <c:if test="${fn:length(string) < 250}">
            ${string}
            </c:if>
            <c:if test="${fn:length(string) > 250 }">
             ${fn:trim(fn:substring(string, 0, 250))}...
             </c:if></p>
          </div>
        </c:if>
        </div>
     

      

      </div> <!-- .col-md-8 -->
      <tag:blog />

    </div>
  </div>
</section>