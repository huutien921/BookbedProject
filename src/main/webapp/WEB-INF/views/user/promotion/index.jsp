<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/promotions" var="pagedLink">
    <c:param name="page" value="~" />
</c:url>
<section class="ftco-section">
    <div class="container">
        <div class="row d-flex">
            <c:forEach var="promotion" items="${pagedListHolder.pageList }">
                <div class="col-md-3 d-flex ftco-animate fadeInUp ftco-animated">
                    <div class="blog-entry align-self-stretch">
                        <a href="${pageContext.request.contextPath }/promotions/detail/${promotion.id}" class="block-20"
                            style="background-image: url('${pageContext.request.contextPath }/uploads/images/promotion/${promotion.src }');">
                        </a>

                        <div class="text mt-3">
                            <h5 class="heading mt-3"><i style="color: #DA70D6;" class="fas fa-gift"></i> Code: <span
                                    style="font-weight: bold; color: 	red;">${promotion.code}</span> </h5>
                            <h5 class="heading mt-3"><i style="color: #DA70D6;" class="fas fa-star-of-david"></i> Giam:
                                <span style="font-weight: bold;">${promotion.sales}</span><i class="fas fa-percent"></i>
                            </h5>
                            <div class="meta mb-3">
                                <div><i class="far fa-calendar-alt"></i>
                                    <fmt:formatDate pattern="dd-MM-yyyy" value="${promotion.startday}" />
                                </div>
                                <div><span style="font-weight: bold;">to</span></div>
                                <div><i class="far fa-calendar-alt"></i>
                                    <fmt:formatDate pattern="dd-MM-yyyy" value="${promotion.endday}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
      
        <div class="row mt-5">
            <div class="col text-center">
                <div class="block-27">
                  <tg:paging pagedListHolder="${pagedListHolder}"
        pagedLink="${pagedLink}" />
                  
                </div>
            </div>
        </div>
    </div>
</section>