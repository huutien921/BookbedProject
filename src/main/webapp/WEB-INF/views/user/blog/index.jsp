<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/blog" var="pagedLink">
    <c:param name="page" value="~" />
</c:url>
<section class="hero-wrap hero-wrap-2 js-fullheight"
    style="background-image: url(&quot;${pageContext.request.contextPath}/uploads/images/slide/bg_1.jpg&quot;); height: 204px; background-position: 50% 350px;"
    data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center"
            style="height: 204px;">
            <div class="col-md-9 ftco-animate pb-5 text-center fadeInUp ftco-animated">
                <h1 class="mb-3 bread">Blog</h1>
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/home/index">Home <i
                                class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
                            class="ion-ios-arrow-forward"></i></span></p>
            </div>
        </div>
    </div>
</section>
<section class="ftco-section">
    <div class="container">
        <div class="row d-flex">
            <c:forEach var="blog" items="${pagedListHolder.pageList }">
                <div class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
                    <div class="blog-entry">
                        <a href="${pageContext.request.contextPath }/blog/detail/${blog.id}" class="block-20"
                            style="background-image: url('${pageContext.request.contextPath }/uploads/images/blog/${blog.src}');">
                        </a>
                        <div class="text mt-3 float-right d-block">
                            <div class="d-flex align-items-center mb-4 topp">
                                <div class="one">
                                    <span class="day"><fmt:formatDate pattern="dd" value="${blog.created}" /></span>
                                </div>
                                <div class="two">
                                    <span class="yr"><fmt:formatDate pattern="yyyy" value="${blog.created}" /></span>
                                    <span class="mos"><fmt:formatDate pattern="MMMM" value="${blog.created}" /></span></span>
                                </div>
                            </div>
                            <h3 class="heading"><a href="${pageContext.request.contextPath}/blog/detail/${blog.id}">${blog.title}</a></h3>
                            <p>
                          <c:set var="string" value="${fn:substringBefore( fn:substringAfter(blog.content, '<p>')  , '</p>')}"/>  
                        <c:if test="${fn:length(string) < 90}">
                        ${string}
                        </c:if>
                        <c:if test="${fn:length(string) > 90}">
                         ${fn:trim(fn:substring(string, 0, 90))}...
                         </c:if>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="row mt-5">
            <div class="col text-center">
                <div class="block-27">
                    <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
                </div>
            </div>
        </div>
    </div>
</section>