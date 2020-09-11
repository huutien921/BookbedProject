<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Error</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='${pageContext.request.contextPath }/resources/error/main.css'>
    <script src='${pageContext.request.contextPath }/resources/error/main.js'></script>
</head>
<body>
    <div class="text-center">
   <img src="${pageContext.request.contextPath }/resources/error/images/500.png" >
   <br>
    <a href="#" onclick="goBack()"> Back</a>
</div>
</body>
</html>