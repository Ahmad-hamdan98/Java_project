<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!-- c:out ; c:forEach etc. --> 
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
 
  <!DOCTYPE html>  
<html>
  
<head>  

  <title>Bootstrap Case</title>  
  <meta charset="utf-8 "> 
  <meta name="viewport" content="width=device-width, initial-scale=1">  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/css/ShowAll.css">
</head>

<style>

body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

 
 .bg-image {
 	background-image: url("images/test.jpg");

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
  
  position: absolute;
      left: 0px;
      top: 0px;
      z-index: -1;
      width: 100%;
      height: 100%;
      -webkit-filter: blur(10px); /* Safari 6.0 - 9.0 */
      filter: blur(10px);
  	
 }
 
</style> 
<body>
<div class="bg-image"></div>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Online Garage</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/profile">Profile</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/about">About Us</a>
        </li>
      </ul>
      <%-- <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> --%>
      <c:choose>
    	<c:when test="${user.id!=Null}">  
    		<li class="nav-item d-flex">
    		<form id="logoutForm" method="POST" action="/logout">
			    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			    <input type="submit" value="Logout!"  class="btn btn-outline-danger"/>
			</form>
			</li>
    	</c:when>
    	<c:otherwise>
      		<li><a class="btn btn-outline-success" href="/signup">Sign Up</a></li>  
      		<li><a class="btn btn-outline-primary" href="/login"> Login</a></li>  
   		</c:otherwise>
    	</c:choose> 
    </div>
  </div>
</nav>


   
<div class="container"> 
    
	<h1>Welcome ${user.firstName}</h1>  
  	<div>
  		<a href="/addcar" class="btn btn-secondary">Add New Car</a>
	  	<a href="/makeorder" class="btn btn-secondary"> Make Order</a>
  	</div>

  	
<%--    </C:CHOOSE> 
      <C:CHOOSE>
    	<C:WHEN TEST="${USER.EMAIL EQ('CAR@ADMIN.COM')}"> 
    	<P> <A HREF="/SHOWORDERS" CLASS="BTN BTN-SECONDARY">SHOW ORDERS</A>
  		<A HREF="/ADDPART" CLASS="BTN BTN-SECONDARY">ADD NEW PARTS</A></P>
   </C:WHEN>
  </C:CHOOSE>   --%>
  
<hr>
     <div class="cards">
     	<c:forEach var="part" items="${allparts}">
	     <div class="card" style="width: 18rem;">
			 <div class="card-body">
			    <h3 class="card-title">${part.partName}</h3>
			  	<img src="${part.image}" class="card-img-top" alt="part_img">
			    <h5 class="card-title">$${part.price}.00</h5>
			    <h5 class="card-title">${part.amount} in stock</h5>
			    <a href="/neworder/${part.id }" class="btn btn-primary">Add to cart</a>
			 </div>
		</div>
	</c:forEach>
     </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>  
</html> 