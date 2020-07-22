<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
  $(document).ready(function(){
    var a = window.location.pathname;
   switch (a) {
     case "/user/account/profile":
       $('#profile').css('color','blue');
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
              <p class="name">${account.fullname}</p>
              <span class="position">Type login</span>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
 
 
      
    <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
      <div class="categories">
      
        <li><a id="1" href="${pageContext.request.contextPath}/user/account/surplus">So du cua toi </a></li>
        <li><a id="2" href="#">Danh sach giao dich </a></li>
        <li><a id="3" href="${pageContext.request.contextPath}/user/account/statusOrder">Dat cho cua toi</a></li>
        <li><a id="4" href="#">Khuyen mai </a></li>
        <li ><a id="profile" href="${pageContext.request.contextPath}/user/account/profile">Thay doi thong tin </a></li>
        <li>Dang xuat</li>
      </div>
    </div>


  </div>



