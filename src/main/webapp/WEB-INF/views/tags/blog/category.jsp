<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="col-lg-4 sidebar ftco-animate bg-light py-md-5 fadeInUp ftco-animated">

  <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
    <div class="categories">
      <h3>Categories</h3>
      <c:forEach var="category" items="${categories}">
      <li><a href="${pageContext.request.contextPath }/blog/category/${category.id}">${category.name} <span>(${category.blogs.size()})</span></a></li>
    </c:forEach>
    </div>
  </div>

  <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
    <h3>New Blog</h3>
    <c:forEach var="blog" items="${blogs}">
      <div class="block-21 mb-4 d-flex">
        <a class="blog-img mr-4" style="background-image: url(${pageContext.request.contextPath}/uploads/images/blog/${blog.src});"></a>
        <div class="text">
          <h3 class="heading"><a href="${pageContext.request.contextPath}/blog/detail/${blog.id}">${blog.title}</a></h3>
          <div class="meta">
            <div><span class="icon-calendar"></span> <fmt:formatDate pattern="dd-MM-yyyy" value="${blog.created}" /></div>
            <div><span class="icon-person"></span> ${blog.account.fullname}</div>
           
          </div>
        </div>
      </div>
    </c:forEach>

  </div>
</div>