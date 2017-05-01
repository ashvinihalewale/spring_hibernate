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
				<table border="0" width="100%">
					<tr>
                       <form action="questions.php" method="get">
						<td width="13%">
							<select class="w3-input w3-border" name="asm"  style="width: 130px;">
							<option>Please Select</option>
							<option value="8" >Core Java</option>
							<option value="1" >Hibernate</option>
							<option value="2" >Spring MVC</option>
							<option value="3" >Struts 2</option>
							<option value="4" >Mybatis</option>
							<option value="5" >MySql</option>
							<option value="6" selected>Web Services</option>
							<option value="7" >Servlet & JSP</option>
						  </select>	
						  
						</td>
						<td><button class="w3-btn w3-blue" type="submit"><i class="fa fa-search"></i></button></td>
                       </form>
						<td width="12%" align="right">
							<button class="w3-button w3-blue" onclick="location.href='adduser'" style="display:none;" id="trash"><i class="fa fa-trash"></i></button>
							<button class="w3-button w3-black" onclick="location.href='adduser'">+ Add</button>
						</td>
					</tr>
				</table>

				<table border="1" class="w3-table w3-white">
				<tr class="w3-theme-l1">
					<td width="25px;"><input type="checkbox" class="w3-check"/></td>
					<td>Name</td>
					<td>Email</td>
					<td>Mobile</td>	
					<td>User Type</td>	
					<td></td>
				</tr>	
				<c:forEach var="u" items="${users}" varStatus="sno">
				   <tr>
	   					<td><input type="checkbox" name="trashInput" value="${u.id}" class="w3-check check"/></td>
					   	<td>${u.fullName}</td> 
					   	<td> ${u.email}</td> 
					   	<td> ${u.mobile}</td> 
					   	<td> ${u.userType.name}</td> 
					   	<td id="userop${u.id}">
					   		<a href="edituser/${u.id}">Edit</a>&nbsp;
					   		<a href="deleteuser/${u.id}">Delete</a>
					   	</td> 
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6">
						<div class="w3-right">
							<div class="w3-bar w3-border">
							  <a href="#" class="w3-bar-item w3-button">&laquo;</a>
							  <a href="#" class="w3-bar-item w3-button w3-green">1</a>
							  <a href="#" class="w3-bar-item w3-button">2</a>
							  <a href="#" class="w3-bar-item w3-button">3</a>
							  <a href="#" class="w3-bar-item w3-button">4</a>
							  <a href="#" class="w3-bar-item w3-button">&raquo;</a>
							</div>
						</div>
					</td>
				</tr>
			</table>				
		</div>
	</div>
  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

  <!-- End page content -->
</div>


<script>

$(document).ready(function()
{
	 var checked = [];
	$(".check").change(function() {
	    if(this.checked)
	    {
	    	$("input[name='trashInput']:checked").each(function(i){
	        	checked[i] = $(this).val();
		    });
	    	console.log("L"+checked.length)
	    	$("#trash").show();
	    	//$("#trash").css("display", "block");
	    }
	    else
	    {
	    	console.log("Un"+checked)

	    	if(checked.length  <= 0)
	    	{
		    	$("#trash").hide();
	    	}
	    }
	    console.log("Val" +checked);
	});
	
   
});

	
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
