<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
       
<li class="nav-item active">
    <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
      
      <i class="fas fa-hotel"></i>
      <span><spring:message code="nav.partner.hotel" /></span>
    </a>
    <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <c:forEach var="hotel" items="${hotels}">
          <a class="collapse-item" href="${pageContext.request.contextPath }/hotelManager/detail/${hotel.id}">${hotel.name} 
          <!-- status -->
          <c:if test="${hotel.accountByIdAcEmployee == null and hotel.status == false }">
             <i class="fa fa-fw fa-hourglass"></i>
              
              </c:if>
              <c:if test="${hotel.accountByIdAcEmployee == null and hotel.status == true }">
             <i class="fa fa-fw fa-hourglass"></i>
              
              </c:if>
              <c:if test="${hotel.accountByIdAcEmployee != null and hotel.status == true }">
              <i class="fa fa-fw fa-check-square"></i>
              
              </c:if>
              
                      <c:if test="${hotel.accountByIdAcEmployee != null and hotel.status == false }">
              <i class="fa fa-fw fa-times"></i>
              
              </c:if>
          <!-- end status -->
          </a> 
        </c:forEach>
        
      </div>
    </div>
  </li>