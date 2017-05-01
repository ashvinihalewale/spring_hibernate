

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
	<jsp:include page="topMenu.jsp"></jsp:include>
	
	<!-- Sidebar/menu -->
	<jsp:include page="leftMenu.jsp"></jsp:include>
	
	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:240px;margin-top:43px;">

  <!--- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b><i class="fa fa-dashboard"></i> Dashboard</b></h5><hr style="border: 1px solid;"/>
  </header>
  

  <!-- End page content -->
</div>
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
     <form class="w3-container w3-card-4" action="questionSave.php" method="post" data-parsley-validate="" id="question">
		  <h3 class="w3-text-blue">Question Form</h3><hr>
		  <p>      
		  <label class="w3-text-blue"><b>Question</b></label>
		  <input class="w3-input w3-border" name="question" type="text" required=""  maxlength="500"></p>
		  <p>      
		  <label class="w3-text-blue"><b>Answer</b></label>
		  <textarea class="w3-input w3-border" name="answer" row="10" required="" maxlength="1500">
		  
		  </textarea>
		  </p>      
		  
		  <p>      
		  <label class="w3-text-blue"><b>Subject</b></label>
		  <select class="w3-input w3-border" name="subject" required="" min="1">
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
		  </p>
		  <p>      
		  <label class="w3-text-blue"><b>Priority</b></label>
		  <select class="w3-input w3-border" name="priority" required="" min="1">
			<option value="0">Please Select</option>
			<option value="1" selected>High</option>
			<option value="2">Medium</option>
			<option value="3">Low</option>
		  </select>
		  </p>		  
		  <p>      
		  <button class="w3-btn w3-blue" type="submit">Save</button> &nbsp; <a href="#"onclick="document.getElementById('id01').style.display='none'" class="w3-btn w3-red">X</a></p>
		</form>
    </div>
  </div>

  <jsp:include page="footer.jsp"></jsp:include>

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

  $('#question').parsley();

</script>

</body>
</html>
