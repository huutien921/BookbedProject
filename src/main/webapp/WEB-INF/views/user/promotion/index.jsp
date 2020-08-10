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
                <!-- Modal -->
<div class="modal fade" id="promotionModal${promotion.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="promotionModalTitle"> <h5 class="heading mt-3"><i style="color: #DA70D6;" class="fas fa-gift"></i> Code: <span
                                    style="font-weight: bold; color: 	red;">${promotion.code}</span> </h5></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          ${promotion.description}
         <hr>
          <h6 ><i style="color: #DA70D6;" class="fas fa-star-of-david"></i> Giam:
            <span style="font-weight: bold;">${promotion.sales}</span><i class="fas fa-percent"></i>
        </h6>
        <h6 ><i style="color: blue;" class="far fa-calendar-alt"></i> Ngay bat dau:
            <span style="font-weight: bold;"> <fmt:formatDate pattern="dd-MM-yyyy" value="${promotion.startday}" /></span>
        </h6>
        <h6 ><i style="color: blue;" class="far fa-calendar-alt"></i> Ngay het han:
            <span style="font-weight: bold;"> <fmt:formatDate pattern="dd-MM-yyyy" value="${promotion.endday}" /></span>
        </h6>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Đồng ý</button>
        </div>
      </div>
    </div>
  </div>
                <div class="col-md-3 d-flex ftco-animate fadeInUp ftco-animated">
                    <div class="blog-entry align-self-stretch">
                        <a data-toggle="modal" data-target="#promotionModal${promotion.id}"class="block-20"
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