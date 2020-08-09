<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script>
  $(document).ready(function(){
    var a = window.location.pathname;
   switch (a) {
     case "/user/account/profile":
       $('#profile').css('color','blue');
       break;
       case "/user/account/surplus":
       $('#surplus').css('color','blue');
       break;
       case "/user/account/purchase/list":
       $('#purchase').css('color','blue');
       break;
       case "/user/account/statusOrder":
       $('#statusOrder').css('color','blue');
       break;
       case "/user/account/editEmailNotification":
       $('#editEmailNotification').css('color','blue');
       break;
    
   
     default:
       break;
   }
  })
</script>

<div class="col-lg-4 sidebar ftco-animate bg-light py-md-5 fadeInUp ftco-animated">
  <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
    <div class="item">
      <div class="testimony-wrap py-4">
        <div class="text">
              <div class="d-flex align-items-center">
              
            <div class="user-img2" id="user-img2"  style="background-image: url('${pageContext.request.contextPath}/uploads/images/user/${account.avatar}') ;">
            
            </div>
            <div id="loadImage" style="display: none;">
              <i class="fa fa-spinner fa-spin fa-2x fa-fw" ></i>
            </div>
            <div class="pl-3">
              <p class="name">${account.fullname == null ?account.username : account.fullname}
              </p>
              <span class="position">Type login</span>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
 
 
      
    <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
      <div class="categories">
      
        <li><a id="surplus" href="${pageContext.request.contextPath}/user/account/surplus"> <i class="fas fa-credit-card"></i> <spring:message code="tag.account.surplus" /> </a></li>
        <li><a id="purchase" href="${pageContext.request.contextPath}/user/account/purchase/list"> <i class="fas fa-clipboard-list"></i> <spring:message code="tag.account.purchase" /></a></li>
        <li><a id="statusOrder" href="${pageContext.request.contextPath}/user/account/statusOrder"  target="_blank"> <i class="fas fa-list-alt"></i> <spring:message code="tag.account.booked" /></a></li>
        <li><a id="editEmailNotification" href="${pageContext.request.contextPath}/user/account/editEmailNotification"><i class="far fa-envelope"></i> <spring:message code="tag.account.promotion" /> </a></li>
        <li ><a id="profile" href="${pageContext.request.contextPath}/user/account/profile"><i class="fas fa-user-cog"></i> <spring:message code="tag.account.change" /> </a></li>
        <li><a  href="${pageContext.request.contextPath}/account/logout"><i class="fas fa-power-off"></i> <spring:message code="tag.account.logout" /></a> </li>
      </div>
    </div>


  </div>



