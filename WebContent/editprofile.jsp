<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>
       RMS
    </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $("#flip4").click(function(){
        $("#panel4").slideToggle("fast");
    });
});
</script>




<script type="text/javascript">
<!--
var image1=new Image()
image1.src="Images/cover.jpg"
var image2=new Image()
image2.src="Images/cover1.jpg"
var image3=new Image()
image3.src="Images/cover2.jpg"
//-->
</script>
<link href="main.css" rel="stylesheet" type="text/css" />
<link href='bootstrap-3.3.6-dist/css/bootstrap.css' rel='stylesheet'>
<style> 
#flip1 {
    text-align: right;
    background-color: black;
    color:white;
    font-family: "Comic Sans MS", cursive, sans-serif;
    padding-right: 0%;
}

#flip4 {
    text-align: center;
    background-color: black;
    color:white;
    font-family: "Comic Sans MS", cursive, sans-serif;
    font-size: 24px;
}

#panel2{
    width:85%;
    height:713px;
	float:right;
    background-color: black;
    color:white;
    font-size: 20px;
    font-family: "Comic Sans MS", cursive, sans-serif;
   
}

#panel4 {
    left:86%;
    right:1%;
    display: none;
    width:13%;
    height:70px;
    z-index:10;
    position:absolute;
    background-color: #4CAF50;
    border: 1px solid white;
    text-align: center;
}

</style>

</head>
<body style="overflow:hidden;">
<div class="container-fluid" >
    <div class="row" style="padding-top: 2%; height:80px; background-color:black;">
        <div class="col-sm-10" style="color:white; font-size: 30px; font-family: 'Comic Sans MS', cursive, sans-serif;"> Railway Management System </div>
        <%
            HttpSession s=request.getSession(false);
            if(s!=null)
        {%>
            <div class="col-sm-2" id="flip4"><span class="glyphicon glyphicon-user"></span> <%= s.getAttribute("username") %></div>
        <% } %>
    </div>
</div>

<div class="row" >
<div class="col-sm-12" style="background-color:white; height=2px;">
</div>
</div>


<!-- Logout Page -->
<div id="panel4">
    <div id="nav" style="padding-top: 10px;">
        <ul>
            <li><a href="editprofile.jsp"><span class="glyphicon glyphicon-edit"></span> Edit Profile </a></li>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
           
        </ul>
    </div>
</div>

<div style="margin:0%; float:left; width:15%; height:800px; background-color:green; z-index:100px;">
    <% if(s==null){%>
    <div style="padding-left:15px; padding-top: 10px;" class="col-sm-2"> 
            <button type="button" onclick="window.location.href=('admin.jsp')" class="btn btn-default">
                <span class="glyphicon glyphicon-user"></span> Admin Panel
            </button>
    </div>
    <%}%>
    <div id="nav" style="padding-top: 50px;">
        <ul>
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home </a></li>
            <li><a href="mytransactions.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> My Transactions </a></li>
            <li><a href="checkSheduleCustomer.jsp"><span class="glyphicon glyphicon-flash"></span> Train Shedule </a></li>
            <li><a href="cancelbooking.jsp"><span class="glyphicon glyphicon-remove"></span> Cancel Booking </a></li>
            <li><a href="cancellastbooking.jsp"><span class="glyphicon glyphicon-remove"></span> Cancel Last Booking </a></li>
            <li><a href="feedback.jsp"><span class="glyphicon glyphicon-file"></span> Feedback </a></li>
        </ul>
    </div>
</div>


<!-- Registration Page -->
<div id="panel2">
<div style="margin-top:10px; margin-left:10px; margin-right:20px; background:black;">
<h2><center> Update Profile</center></h2>
<form id="RegForm" role="form" class="form-horizontal" action="UserController?id=userupdate" method="post">
	
<fieldset>
      <legend style="color:white;"></legend>
    <div class="form-group">
        <label class="control-label col-sm-2" style="color:white;" for="email">Email:</label>
        <div class="col-sm-3">
            <label class="control-label col-sm-2" style="color:white;" ><%out.println(s.getAttribute("email"));%></label>
        </div>
        <span class="col-sm-1" id="RegEmailMsg" style="color:white;"></span>

        <label class="control-label col-sm-2" style="color:white;" >Username:</label>
        <div class="col-sm-3">
            <label class="control-label col-sm-2" style="color:white;" ><%out.println(s.getAttribute("username"));%></label>
        </div>
		 <span class="col-sm-1" id="RegEmailMsg" style="color:white;"></span>
    </div>

    <div class="form-group">
		<label class="control-label col-sm-2" style="color:white;">Password:</label>
        <div class="col-sm-3">
            <input type="password" class="form-control" placeholder="Enter Password" name="password" required>
        </div>
		<span class="col-sm-1" id="RegEmailMsg" style="color:white;"></span>
        <label class="control-label col-sm-2" style="color:white" >Name:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="RegName" placeholder="Enter name" name="name" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
    </div>
    <div class="form-group">
		<label class="control-label col-sm-2" style="color:white" for="mobile">Gender:</label>
        <div class="col-sm-3">
            <select type="text" class="form-control" name="gender">
            <option> Male </option>
            <option> Female </option>
            </select>
        </div>
		<span class="col-sm-1" style="color:red;"></span>
		<label class="control-label col-sm-2" style="color:white" for="mobile">DOB:</label>
        <div class="col-sm-3">
            <input type="date" class="form-control" placeholder="select DOB" name="DOB" required>
        </div> 
		<!--<span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> -->
    </div>
	</fieldset>
	<br/>
	<fieldset>
      <legend style="color:white;">Contact Details</legend>
    
    <div class="form-group"> 
		<label class="control-label col-sm-2" style="color:white" for="mobile">Mobile:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="RegMbl" placeholder="Enter Mobile" name="mobile" pattern="[0-9]*" title="Enter Numbers Only" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
		<label class="control-label col-sm-2" style="color:white" for="mobile">PIN:</label>
		<div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter PIN" name="pin" pattern="[0-9]*" title="Enter Numbers Only" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
    </div> 

	<div class="form-group"> 
		<label class="control-label col-sm-2" style="color:white">City:</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter City" name="city" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
		<label class="control-label col-sm-2" style="color:white">State:</label>
		<div class="col-sm-3">
            <input type="text" class="form-control" placeholder="Enter State" name="state" pattern="[a-zA-Z\s]+" title="Enter Alphabets Only" required>
        </div>
        <span class="col-sm-1" id="RegMblMsg" style="color:red;"></span> 
    </div> 
	</fieldset>
	<br/>
	<div class="form-group">
		<div class="col-sm-offset-5 col-sm-7">
           <input type="submit" class="button" value="Update Profile"/>
           <input type="reset" class="button" value="Reset" />
        </div>
	</div>
	</div>
</div>
</div>
</form>

</div>
</div>



<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script src='js/bootstrap.js'></script>
</div>
</body>
</html>
