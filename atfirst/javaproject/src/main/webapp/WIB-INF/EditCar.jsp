<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Edit Your Car</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
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
       <li class="nav-item">
          <a class="nav-link" href="/mycart">My Cart</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/about">About Us</a>
        </li>
      </ul>
      <ul class="navbar-nav mb-2 mb-lg-0">
    	<li class="nav-item d-flex">
    		<form id="logoutForm" method="POST" action="/logout">
			    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			    <input type="submit" value="Logout!"  class="btn btn-outline-danger"/>
			</form>
		</li>
		</ul>
    </div>
  </div>
</nav>
 <div class="row">
   <div class="col-lg-6 mx-auto">
     <div class="bg-white rounded-lg shadow-lg p-4">
	  
	   <form:form action="/editcar/${car.id}" method="post" modelAttribute="car">
	   	<form:input type="hidden" path="user" value="${user.id}"/>
	      <input type="hidden" name="_method" value="put">

        	<div class="tab-content">
          	<div class="tab-pane fade show active">          
              <div class="form-group">
                <form:label path="cartype">Type</form:label>
                <form:input path="cartype" placeholder="Car Type" class="form-control" /> 
                <form:errors path="cartype" class="red"/>               
              </div>
              <br>
              
              <div class="form-group">
                <form:label path="model">Model</form:label>
                <form:input type="number" min="1990" max="2022" path="model" class="form-control" />
                <form:errors path="model" class="red"/>
              </div>
              <br>
              
              <div class="form-group">
                <form:label path="carcolor">Color</form:label>
                <form:input type="text" path="carcolor" placeholder="Car Color" class="form-control" />
                <form:errors path="carcolor" class="red"/>
              </div>
              <br>
              
              <div class="form-group">
                <form:label path="description">Description</form:label>
                <form:input type="textarea" rows="5" path="description" placeholder="Description for Car" class="form-control" />
                <form:errors path="description" class="red"/>
              </div> 
              <br>              
           </div>
         </div>
         
       <input type="submit"  class="btn btn-primary" value="Save" > 
     </form:form>
<%--      <form:form action="/home" method="get" modelAttribute="car"> --%>
<!-- 		<input type="submit" class="btn btn-primary" value="Cancel"/> -->
<%-- 	</form:form> --%>
   </div>
  </div>
 </div>
 
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
