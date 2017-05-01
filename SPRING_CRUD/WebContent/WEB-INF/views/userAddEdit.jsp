<!DOCTYPE html>
<html>
	<title>KAP : Questions</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="staticImport.jsp"></jsp:include>
	<style>
	html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
	</style>
<body class="w3-light-grey">
	<!-- Top container -->
	<%@ include file="genericImport.jsp" %>
	<jsp:include page="topMenu.jsp"></jsp:include>
	
	<!-- Sidebar/menu -->
	<jsp:include page="leftMenu.jsp"></jsp:include>
	
	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left:240px;margin-top:43px;">
	
	  <!--- Header -->
	  <header class="w3-container" style="padding-top:22px">
	    <h5><b><i class="fa fa-users"></i> Users</b></h5><hr style="border: 1px solid;"/>
	  </header>
	<div class="w3-container">
		<div class="w3-row" style="min-height:450px;">
				
	  <form:form cssClass="w3-container w3-white parsley" action="${pageContext.request.contextPath}/user/saveuser" method="post" modelAttribute="user" data-parsley-validate="">
		  <p>      
			  <label class="w3-text-blue"><b>Full Name</b></label>
			  <form:input path="fullName" class="w3-input w3-border" required=""/>
		 </p>
		  <p>      
			  <label class="w3-text-blue"><b>Email</b></label>
			  <form:input path="email" class="w3-input w3-border"/>
		  </p>      
		  <p>      
			  <label class="w3-text-blue"><b>Mobile</b></label>
			  <form:input path="mobile" class="w3-input w3-border"/>
		  </p>      
		  <p>      
			  <label class="w3-text-blue"><b>Password</b></label>
			  <form:input path="password" class="w3-input w3-border"/>
		  </p>      
		  <p>      
			  <label class="w3-text-blue"><b>User Types</b></label>
  			 <form:select path="userType.id" cssClass="w3-input w3-border"  items="${userTypes}" itemValue="id"  itemLabel="name" ></form:select>
		  </p>      
		  <p>      
		  	<button class="w3-btn w3-blue" type="submit">Save</button>
		  </p>
		</form:form>
							
		</div>
	</div>
  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>
  <!-- End page content -->
</div>


<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
    if (mySidebar.style.display === 'block') {
        mySidebar.style.display = 'none';
        overlayBg.style.display = "none";
    } else {
        mySidebar.style.display = 'block';
        overlayBg.style.display = "block";
    }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
}


</script>

</body>
</html>
