<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!-- c:out ; c:forEach etc. --> 
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Cart</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/cart.css"/>
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
		
<section class="h-100 h-custom" >
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
          <div class="card-body p-0">
            <div class="row g-0">
              <div class="col-lg-8">
                <div class="p-5">
                  <div class="d-flex justify-content-between align-items-center mb-5">
                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                  
                  </div>
    <c:forEach var="i" items="${order.parts}" > 
   
   
                  <hr class="my-4">
                  <div class="row mb-4 d-flex justify-content-between align-items-center">
                    <div class="col-md-2 col-lg-2 col-xl-2">
                      <img
                        src="${i.image }"
                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h6 class="text-muted"> ${i.partName}</h6>
                      <h6 class="text-black mb-0">${i.description}</h6>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                      <button class="btn px-2"
                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">-
                        <i class="fas fa-minus"></i>
                      </button>
                      <input id="form1" min="0" name="quantity" value="1" type="number"
                        class="form-control form-control-sm" />
                      <button class="btn px-2"
                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">+
                        <i class="fas fa-plus"></i>
                      </button>
                    </div>
                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                      <h6 class="mb-0">$${i.price }.00</h6>
                    </div>
                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                      <a href="#" class="text-muted">X<i class="fas fa-times"></i></a>
                    </div>
                  </div>
 </c:forEach>

                  <hr class="my-4">
                  <div class="pt-5">
                    <h6 class="mb-0"><a href="/home" class="text-body"><i
                        class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                  </div>
                </div>
              </div>
              
              
              
              
              
              <div class="col-lg-4 bg-grey">
                <div class="p-5">
                  <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                  <hr class="my-4">
                 <c:forEach var="i" items="${order.parts}" >
                 <div class="d-flex justify-content-between mb-5">
                    <h5 class="text-uppercase">${i.partName} price</h5>
                    <h5>$${i.price}.00</h5>
                  </div> 
                   </c:forEach>
                    <hr class="my-4">
                  <div class="d-flex justify-content-between mb-5">
                    <h5 class="text-uppercase">Total price</h5>
                    <h5>$${sum}.00</h5>
                  </div>
                  <hr class="my-4">
 				<form:form action="/confirmorder" method="post" modelAttribute="order">
					<input type="submit" class="btn btn-primary"  value="Agree"/>
				</form:form> 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>