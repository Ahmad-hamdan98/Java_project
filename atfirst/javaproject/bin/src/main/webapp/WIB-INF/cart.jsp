 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!-- c:out ; c:forEach etc. --> 
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome</h1>

<a href="/aproof/${user.id}">accept</a>




</body>
</html>